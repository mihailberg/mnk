/**
 * (c) 2012 Copyright Art. Lebedev | http://www.artlebedev.ru/
 * @author Oleg Korovin (madcow@design.ru)
 */


if(!this.als){
	var als = {};
}

(function(){
// Если класс Метро уже определен, то выходим
if(als.Metro) return;


/**
 * Класс Метро.
 * @param {Object} params параметры объекта.
 * @constructor
 */
als.Metro = function(params){
	// инициализируем данные

	// Элемент в котором будет создаваться карта
	this.node = $(params.node);

	// Будущий контейнер карты
	this.box = null;

	// Будущий имаджмап
	this.map = null;
		
	// Имя города
	this.city = params.city || 'spb';

	// Данные данного города
	this.cityData = {};

	// Массив объектов станций
	this.stations = [];
	
	// Массив объектов веток метро
	this.branches = [];
	
	// Массив цветов для веток метро
	this.colors = [];

};



/**
 * Данные
 */
als.Metro.data = {

	// Дефолтный путь к папке с файлами виджета
	dir			: 'metro',


	// Кеш данных для разных городов
	cityData	: {},

	/**
	 * Получение пути к файлу текущего города
	 * @param {String} city Имя города
	 * @param {String} file Имя файла
	 * @return {String} путь к файлу
	 */
	path	: function(city,file){
		return this.dir + '/' + city + '/' + file;
	},

	/**
	 * Путь к файлу с данными метро
	 * @param {String} city Имя города
	 */
	url			: function(city){
		return '/nd/global/metro/' + city + '/data.js?'+Math.random();
	}
};


/**
 * Методы объектов метро
 */
als.Metro.prototype = {

	/**
	 * Создание карты в контейнере
	 * @param {function} fCallback
	 */
	show : function(fCallback){ 
		$('.metro_preloader').show();
		var self = this;
		
		//var city_name = $('input[name=location_trigger][value=location_metro]').attr('rel');
		var city_name = 'moscow';
		// Если поменяли город
		//if (city_name != self.city) self.deselect();
		self.city = city_name;
		// Загружаем данные города
		self.load(function(){
			// сохраняем данные данного города
			self.cityData = als.Metro.data.cityData[self.city];
			
			// Подготавливаем контейнер
			self.prepareBox();

			// Создаем массив станций
			self.makeStations();

			// Создаем массив веток
			self.makeBranches();

			// Создаем связки станций и веток
			self.linkStationsAndBranches();

			// Инициализируем поиск
			self.initSearch();
			
			if(fCallback) fCallback();
			$('.metrobox').removeClass('closed').addClass('opened');
			$('.als_metro_circle_triggers').toggle( self.city == 'moscow');
		});

		return self;
	},


	/**
	 * Уничтожение карты
	 * @return {als.Metro} объект карты
	 */
	hide			: function(){
		this.node.html('');
		$('.metro_selected_title, .metro_selected, .als_metro_deselect').hide();
		$('.metrobox').removeClass('opened').addClass('closed');
		$('.als_metro_toggle_scheme').html('Показать схему метро');
		$('.als_metro_circle_triggers').hide();
		return this;
	},


	/**
	 * Добавление обработчика событий карты
	 * @param {String} name Имя события
	 * @param {function} func функция обработчик
	 */
	addEventListener	: function(name,func){
		// stationchange
		// mapchange
		this.node.bind(name,func);
	},


	/**
	 * Удаление обработчика событий карты
	 * @param {String} name Имя события
	 * @param {function} func функция обработчик
	 */
	removeEventListener	: function(name,func){
		this.node.unbind(name,func);
	},


	/**
	 * Получение списка текущих выделенных станций
	 * @return {Array} объект карты
	 */
	getCurrentList	: function(){
		var	self = this;
		var list = [];
		self.eachStation(function(i,station){
			
			if(station.selected){
				list.push(station.getData());
			}
		});

		return list;
	},

	/**
	 * Задание списка выделеных станций или не выделенных
	 * @param {Array} list массив id выделенных станций
	 * @param {Boolean} inv флаг инвертирования выделения
	 */
	setSelectedStations	: function(list,inv){
		var	self = this;
		list = list || [];
		//alert('setSelectedStations');
		self.eachStation(function(i,station){
			station.stateChange((inv||0)*1 - _check(station.id));
		});
		self.eachBranch(function(i,branch){
			branch.setState();
		});

		self.checkFade();

		function _check(id){
			for(var i=0;i<list.length;i++){
				if(list[i] == id){
					return true;
				}
			}
			return false;
		};
	},
	
	/**
	 * Изменения состояния списка выделеных станций или не выделенных
	 * @param {Array} list массив id выделенных станций
	 */
	 toggleSelectedStations	: function(list, fCallback){
	 		var	self = this;
	 		list = list || [];
	 		//alert('setSelectedStations');
	 		self.eachStation(function(i,station){
	 			if(_check(station.id))
	 				station.stateChange(!station.selected);
	 		});
	 		self.eachBranch(function(i,branch){
	 			branch.setState();
	 		});
	 
	 		self.checkFade();
	 
	 		function _check(id){
	 			for(var i=0;i<list.length;i++){
	 				if(list[i] == id){
	 					return true;
	 				}
	 			}
	 			return false;
	 		};
	 		
	 		if (fCallback) fCallback();
	 	},

	/**
	 * Установка состояния конкретной станции
	 * @param {Number} id Id станции
	 * @param {Boolean} b флаг вкл/выкл. Если не задан, то станция переключается
	 */
	toggleStation	: function(id,b){
		var	self = this;
		var station = self.getStationById(id);

		if(arguments.length < 2){
			b = !station.selected;
		}
		station.stateChange(!!b);
		
		self.eachBranch(function(i,branch){
			branch.setState();
		});
		self.checkFade();
		//self.node.trigger('mapchange');
	},


	/**
	 * Подготовка контейнера карты
	 */
	prepareBox		: function(){
		var
			self = this,

			// Путь к картинке со схемой метро
			src = '/nd/global/'+self.path('metro.gif'),

			// Имя класса для контейнера карты
			classname = 'als_metro als_metro_'+self.city,

			// Имя имаджмапа
			mapname = 'als_metro_branches_' + self.city
		;

		// Наполняем контейнер дефолтным кодом
		self.node.html(
			'<div class="' + classname + '">'+
				'<img src="' + src + '" usemap="#' + mapname + '" />'+
				'<div class="als_metro_fade"></div>'+
				'<map id="' + mapname + '" name="' + mapname + '"></map>'+
				'<div class="als_metro_actions">'+
				'</div>'+
				'<div class="als_metro_search">'+
					'Поиск по названию<br/>'+
					'<input />'+
				'</div>'+
			'</div>'+
//			'<div class="als_metro_controls_box">'+
//				'<div class="ex_location_params_block" style="width:260px;margin:0;padding-bottom:10px;z-index:22">'+
//					'<label><input name="goby" type="checkbox"> не более&nbsp; </label>'+
//					'<select name="foot_min">'+
//						'<option value="1">1 мин.</option>'+
//						'<option value="2">2 мин.</option>'+
//						'<option value="5">5 мин.</option>'+
//						'<option value="10">10 мин.</option>'+
//						'<option value="15">15 мин.</option>'+
//						'<option value="30" selected="selected">30 мин.</option>'+
//						'<option value="60">1 час.</option>'+
//					'</select>'+
//					'<select name="only_foot">'+
//						'<option value="1">пешком</option>'+
//						'<option value="-2">на машине</option>'+
//					'</select>'+
//				'</div>'+
//				(this.city != 'moscow' ? '' :
//					'<span class="als_metro_wrapper"><span class="pseudo als_metro_select_inside">Выделить станции внутри кольца</span></span>'+
//					'<span class="als_metro_wrapper"><span class="pseudo als_metro_select_circle">Выделить кольцевые станции</span></span>'
//				) +
//				'<span class="pseudo als_metro_deselect" style="margin-top: 6px;">Снять выделение</span>'+
			'</div>'
		);
//		var 
//			$Block = $('.metrobox.ex_location_type[rel=location_metro]'),
//			$ControlsBoxContent = $(''+
//			(this.city === 'moscow'?'<span class="als_metro_wrapper"><span class="pseudo als_metro_select_inside">Выделить станции внутри кольца</span></span><span class="als_metro_wrapper"><span class="pseudo als_metro_select_circle">Выделить кольцевые станции</span></span>':'')+'')
//		;
		$('.als_metro_circle_triggers').toggle(this.city == 'moscow');
//		if ($Block.find('.als_metro_controls_box').length === 0){
//			$Block.append('<div class="als_metro_controls_box" style="width:'+(this.city === 'moscow'?'900px':'800px')+'"></div>')
//		}
		
//		$Block.find('.als_metro_controls_box').empty().html($ControlsBoxContent);
			
		
		

		// Инициализируем контейнер
		self.box = self.node.find('.als_metro');

		// Инициализируем имаджмап
		self.map = self.box.find('map');

		// Инициализируем фэйд
		self.fade = self.box.find('.als_metro_fade');

		// Инициализируем кнопки
		self.initActionButtons();

	},

	/**
	 * Инициализация доп. кнопок управления выделением
	 */
	initActionButtons	: function(){
		var self = this;

		$('.als_metro_deselect').click(function(){
			self.deselect();
			$('.als_metro_select_inside, .als_metro_select_circle').parent('span').removeClass('active');
		});

		$('.als_metro_select_inside').click(function(){
			var $Wrapper = $(this).parent('span');
			self.toggleSelectedStations(self.cityData.inside, function(){$Wrapper.toggleClass('active')});
			self.triggerAll();
		});
		$('.als_metro_select_circle').click(function(){
			var $Wrapper = $(this).parent('span');
			self.toggleSelectedStations(self.cityData.circle, function(){$Wrapper.toggleClass('active')});
			self.triggerAll();
		});
	},


	/**
	 * Инициализация поиска по станциям
	 */
	initSearch	: function(){
		var self = this;

		//self.filter = self.box.find('.als_metro_search input');
		self.filter = self.box.parent().find('.als_metro_search input');
		
		var m = $.map(self.stations,function(item){
			return {
				value	:item.id,
				label	:item.name
			};
		}).sort(function(a, b){
			if (a.label < b.label) return -1;
			if (a.label > b.label) return 1;
			return 0;
		});

		self.filter.autocomplete({
			minLength: 0,
			source: m,

			focus: function( event, ui ) {
				self.filter.val( ui.item.label );
				return false;
			},
			select: function( event, ui ) {
				self.filter.val('');
				self.getStationById(ui.item.value).toggle(true);
				self.node.trigger('mapchange');
				return false;
			}
		}).data( "autocomplete" )._renderItem = function( ul, item ) {
			return $( "<li></li>" )
				.data( "item.autocomplete", item )
				.append( "<a>" + item.label + "</a>" )
				.appendTo( ul );
		};
	},


	/**
	 * Вызов события изменения состояния для всех станций и веток
	 */
	triggerAll	: function(){
		var self = this;
		self.eachStation(function(i,station){
			station.triggerStateChange();
		});
		self.eachBranch(function(i,branch){
			branch.triggerStateChange();
		});
		self.node.trigger('mapchange');
	},


	/**
	 * Создание станций карты
	 */
	makeStations	: function(){
		var
			self = this,
			list = self.cityData.stations
		;
		self.stations = [];

		$.each(list,function(i,val){

			// Создаем объект станции
			var station = new als.Metro.Station(self.city,val);

			// Добавляем его в список станций объекта карты
			self.stations.push(station);

			// Добавляем сканцию в контейнер карты
			self.appendStation(station);

			//
			station.onStateChange(function(){
				self.node.trigger('stationchange',[station.getData()]);
			});

			// Добавляем обработчик для проверки показа фейда
			station.onStateChange(function(){
				self.checkFade();
			});
		});

		self.stations.sort(function(a, b){
//			if (a.name < b.name) return -1;
//			if (a.name > b.name) return 1;
			if (a.name < b.name) return -1;
			if (a.name > b.name) return 1;
			//console.log(self.cityData);
			return 0;
		});

		// проверяем  фейд
		self.checkFade();
	},


	/**
	 * Снятие выделения со всех станций
	 */
	deselect 	: function(){
		var self = this;
		$('.als_metro_station_active').removeClass('als_metro_station_active');
		$('.als_metro_fade, .metro_selected, .metro_selected_title, .als_metro_deselect').hide();
		$('.metro_selected').height(0);
		
		self.setSelectedStations(null);
		self.node.trigger('mapchange');
//		self.eachStation(function(i,station){
//			station.toggle(false);
//		});
//		self.eachBranch(function(i,branch){
//			branch.toggle(false);
//		});
//
//		self.node.trigger('mapchange');
		
	},


	/**
	 * Проверка состояния затемнения карты
	 */
	checkFade	: function(){
		var
			self = this,
			flag = false
		;
		self.eachStation(function(i,station){
			if(station.selected){
				flag = true;
			}
		});
		self.fade.toggle(flag);
		$('.metro_selected_title').toggle(flag);
	},
	

	/**
	 * Добавление станции в контейнер карты
	 * @param {} station
	 */
	appendStation	: function(station){
		var self = this;
		self.box.append(station.node);

		station.node.bind('mapchange',function(){
			self.node.trigger('mapchange');
		});
	},


	/**
	 * Создание веток карты
	 */
	makeBranches	: function(){
		var
			self = this,
			list = self.cityData.branches
		;

		self.branches = [];

		$.each(list,function(i,val){
	
			// Создаем объект ветки метро
			var branch = new als.Metro.Branch(self.city,val);

			//self.addStationsToBranch(branch);

			// Добавляем его в список веток объекта карты
			self.branches.push(branch);

			// Добавляем ветку в контейнер карты
			self.appendBranch(branch);
		});
	},



	/**
	 * Связывание станций и веток
	 */
	linkStationsAndBranches	: function(){
		var self = this;

		self.eachStation(function(i,station){
			// Перебираем массив связи станций и веток
			$.each(station.branch_ids,function(i,val){
				var branch = self.getBranchById(val);

				station.addBranch(branch);
				branch.addStation(station);
			});
		});
	},


	/**
	 * Добавление станции в контейнер карты
	 * @param {als.Metro.Branch} branch
	 */
	appendBranch	: function(branch){
		var self = this;
		self.box.append(branch.node);
		self.box.append(branch.img_node);
		self.map.append(branch.areas);

		branch.node.bind('mapchange',function(){
			self.node.trigger('mapchange');
		});
	},


	/**
	 * Получение станции по её id
	 * @param {Number} id
	 * @return {als.Metro.Station} станция
	 */
	getStationById	: function(id){
		var
			self = this,
			res = null
		;

		self.eachStation(function(i,station){
			if(station.id == id){
				res = station;
			}
		});

		return res;
	},


	/**
	 * Получение станции по её id
	 * @param {Number} id
	 * @return {als.Metro.Station} станция
	 */
	getBranchById	: function(id){
		var
			self = this,
			res = null
		;

		self.eachBranch(function(i,branch){
			if(branch.id == id){
				res = branch;
			}
		});

		return res;
	},


	/**
	 * Перебор всех веток
	 * @param {Function} func Функция выполняемая для каждой ветки
	 */
	eachBranch		: function(func){
		$.each(this.branches,func);
	},

	/**
	 * Перебор всех станций
	 * @param {Function} func Функция выполняемая для каждой станции
	 */
	eachStation		: function(func){
		$.each(this.stations,func);
	},


	/**
	 * Получение пути к файлу текущего города
	 * @param {String} file Имя файла
	 * @return {String} путь к файлу
	 */
	path	: function(file){
		return als.Metro.data.dir + '/' + this.city + '/' + file;
	},


	/**
	 * Загрузка данных
	 * @param {Function} callback

	load: function(callback){
		var self = this;
		if(!als.Metro.data.cityData[self.city]){
			//console.log(als.Metro.data.url(self.city));
			$.getJSON("data.js", function(data) {
				//console.dir(data)
				als.Metro.data.cityData[self.city] = data;
				if(callback) callback();
			});
		} else {
			if(callback) callback();
		};
	}*/

    load:function (callback) {
        var self = this;
        if (!als.Metro.data.cityData[self.city]) {
            //console.log(als.Metro.data.url(self.city));
            $.getJSON("/metro/moscow/data.php?table=" + window.table, function (data) {
                //console.dir(data)
                als.Metro.data.cityData[self.city] = data;
                if (callback) callback();
            });
        } else {
            if (callback) callback();
        }
        ;
    }
};




/**
 * Класс станции метро
 * @param {Object} params параметры станции.
 * @constructor
 */
als.Metro.Station = function(city,params){
	this.city = city;
	this.selected = false;
	this.branches = [];
	$.extend(this,params);
	this.makeNode();
};

als.Metro.Station.prototype = {


	/**
	 * Создание элемента для станции
	 */
	makeNode	: function(){
		var self = this;

		// создаем элемент
		self.node = $('<div class="als_metro_station"></div>');

		// прописываем свойства элемента
		self.node
			.attr('title',self.name)

			// Добавляем обработчики событий
			.bind('statechange',function(){
				self.stateChange();
			})
			.click(function(){
//				self.toggle();
				self.click();
			})

			// добавляем в data ссылку на объект для обратной связи
			.data('Obj',self)
		;

		// добавляем в элемент лейблы
		$.each(self.labels,function(i,val){
			self.node.append(self.makeLabelNode(val, self.branch_ids[0],i==0));
		});

	},

	/**
	 * Создание лейбла для станции
	 * @return {jQuery} элемент лейбла
	 */
	makeLabelNode	: function(params, branch_id, isTextLabel){
		var self = this;
		var color = '';

		// создаем элемент
		var node = $('<div class="als_metro_station_label '+(isTextLabel?'':'als_metro_station_point')+'"></div>');

		// прописываем свойства элемента
		node
			.css({
				'left'		  : params[0] + 'px',
				'top'		  : params[1] + 'px',
				'width'		  : params[2] + 'px',
				'height'	  : params[3] + 'px', 
				'border-color': self.colorByBranchId(branch_id),

				'backgroundPosition': '-' + params[0] + 'px -' + params[1] + 'px'
			})
		;

		return node;
	},
	
	colorByBranchId	: function(id){
		var color = '';
		$.each(als.Metro.data.cityData[this.city].branches, function(i, branch){
			if (branch.id == id) color = branch.color;
		});
		return color;
	},


	/**
	 * Добавление ссылки на ветку в список веток станции
	 * @param {als.Metro.Branch} branch
	 */
	addBranch		: function(branch){
		this.branches.push(branch);
	},

	/**
	 * Перебор всех веток станци
	 * @param {Function} func Функция выполняемая для каждой ветки
	 */
	eachBranch		: function(func){
		$.each(this.branches,func);
	},
	
	/**
	 * Функция обработки клика на станцию
	 */
	click	: function(){
		var self = this;

//		self.selected = !self.selected;
//		self.stateChange();
//		self.triggerStateChange();

		self.toggle();

		self.eachBranch(function(i,branch){

		//	console.dir(self.branches)
			branch.setState();
		});

		self.node.trigger('mapchange');
	},


	/**
	 * Установка состояния станции в зависимости от состояния ее веток
	 */
	setStateByBranches	: function(){
		var self = this;
		self.selected = false;

		self.eachBranch(function(i,branch){
			if(branch.selected){
				self.selected = true;
			}
		});
		
		self.stateChange();
		self.triggerStateChange();
	},

	/**
	 * Установка ховера на данную станцию
	 * @param {Boolean} b флаг значения ховера вкл/выкл
	 */
	hover	: function(b){
		var self = this;
		self.node.toggleClass('als_metro_station_hover',!!b);
	},


	/**
	 * Функция изменения состояния станции
	 * Если не задан параметр то переключает значение
	 * @param {Boolean} b новое значение состояния
	 */
	toggle	: function(b){
		var self = this;
		var background = self.node.children().css('backgroundImage')
		if( background.indexOf("metro_t_grey.png") != -1) {
			return false;
		}
		//console.log(self.node.children().css('backgroundImage'));
		if(arguments.length){
			self.selected = !!b;
		} else {
			self.selected = !self.selected;
		};
		self.triggerStateChange();
	},

	/**
	 * Функция добавления события на изменение состояния станции
	 * @param {Function} func обработчик события
	 */
	onStateChange	: function(func){
		var self = this;
		self.node.bind('statechange',func);
		return this;
	},

	/**
	 * Функция удаления события на изменение состояния станции
	 * @param {Function} func обработчик события
	 */
	unbindStateChange	: function(func){
		var self = this;
		self.node.unbind('statechange',func);
		return this;
	},


	/**
	 * Обработчик события изменения состояния станции
	 * Меняет выделение станции в зависимости от значения флага объекта станции
	 */
	stateChange	: function(b){
		var self = this;
		if(arguments.length){
			self.selected = !!b;
		}
		self.node.toggleClass('als_metro_station_active',self.selected);
	},

	/**
	 * Запуск события изменения
	 */
	triggerStateChange	: function(){
		this.node.trigger('statechange',[this.getData()]);
	},


	/**
	 * Получение объекта с данными данной станции
	 * @return {Object}
	 */
	getData		: function(){
		return {
			id		: this.id,
			name	: this.name
		};
	}
};





/**
 * Класс ветки метро
 * @param {Object} params параметры ветки.
 * @constructor
 */
als.Metro.Branch = function(city,params){
	this.city = city;
	this.areas = null;
	this.selected = false;
	this.stations = [];
	$.extend(this,params);

	this.makeNodes();
};


als.Metro.Branch.prototype = {

	/**
	 * Создание элементов для ветки
	 */
	makeNodes		: function(){
		var self = this;

		// создаем элемент
		self.node = $('<div class="als_metro_branch"></div>');

		// прописываем свойства элемента
		self.node
			.attr('title',self.name)
			
			// Добавляем обработчики событий
			.bind('statechange',function(){
				self.stateChange();
			})
			.click(function(){
				self.clickBranchLabel();
//				self.toggle();
//				self.stationsStateChange();
			})
//			.hover(function(){
//				self.img_node
//					.toggleClass('als_metro_branch_img_hover',true)
//				;
//				
//				self.hoverStations(true);
//			},function(){
//				self.img_node
//					.toggleClass('als_metro_branch_img_hover',false)
//				;
//			})

			// добавляем в data ссылку на объект для обратной связи
			.data('Obj',self)
		;
		

		// добавляем в элемент лейблы
		$.each(self.labels,function(i,val){
			self.node.append(self.makeLabelNode(val));
		});

		// создаем элемент с картинкой ветки
		//self.img_node = $('<div class="als_metro_branch_img"><div class="als_metro_branch_img_h"></div></div>');

		// прописываем свойства элемента
//		self.img_node
//			.css({
//				'backgroundImage': 'url("'+ als.Metro.data.path(self.city,'branches/'+self.id+'.png') +'")'
//			})
//			.find('.als_metro_branch_img_h')
//				.css({
//					'backgroundImage': 'url("'+ als.Metro.data.path(self.city,'branches/'+self.id+'_h.png') +'")'
//				})
//		;

		// создаем блоки AREA 		
		self.makeAreas();
	},
	
	clickBranchLabel : function(){
		if (this.city !== 'moscow') { this.click(); }
		else {
			var s_name = this.s_name;
			myMetro.eachBranch(function(i,branch){
				if (branch.s_name == s_name) {
					branch.toggle();
				}
			});
			
			myMetro.eachStation(function(i,station){
				station.setStateByBranches();
			});
			
			myMetro.node.trigger('mapchange');

		}
	},

	/**
	 * Создание лейбла для ветки
	 * @return {jQuery} элемент лейбла
	 */
	makeLabelNode	: function(params){
		return;
		var self = this;

		// создаем элемент
		var node = $('<div class="als_metro_branch_label"></div>');

		// прописываем свойства элемента
		node
			.css({
				'left'		: params[0] + 'px',
				'top'		: params[1] + 'px',
				'width'		: params[2] + 'px',
				'height'	: params[3] + 'px',

				'backgroundPosition': '-' + params[0] + 'px -' + params[1] + 'px'
			})
		;

		return node;
	},

	
	/**
	 * Создание элементов AREA для данной ветки
	 */
	makeAreas		: function(){
		var self = this;

		// создаем элементы
		var code = '';
		$.each(self.coords, function(i,val){
			code += '<area href="#" shape="poly" coords="' + val + '"/>';
		});
		self.areas = $('<div>'+code+'</div>').find('area');

		// прописываем свойства элементов
		self.areas
			.attr('title',self.name)

			// Добавляем обработчики событий
			.bind('statechange',function(){
				self.stateChange();
			})
			.click(function(e){
				e.preventDefault();

				self.click();
//				self.toggle();
//				self.stationsStateChange();
			})
//			.hover(function(){
//				self.img_node
//					.toggleClass('als_metro_branch_img_hover',true)
//				;
//
//				self.node.toggleClass('als_metro_branch_hover',true);
//			},function(){
//				self.img_node
//					.toggleClass('als_metro_branch_img_hover',false)	
//				;
//				self.node.toggleClass('als_metro_branch_hover',false);
//
//			})
			.each(function(){
				$(this).data('Obj',self);
			})
		;
	},


	/**
	 * Добавление станции к ветке
	 * @param {als.Metro.Station} station
	 */
	addStation		: function(station){
		var self = this;

		// Добавляем станцию в список
		self.stations.push(station);

		// Добавляем к станции ссылку на данную ветку
		//station.addBranch(self);

		// добавляем обработчик на изменение состояния станции
		/*
		station.onStateChange(function(){

//			console.dir(self)

			self.selected = self.checkSelected();
			self.stateChange();
			//console.log(this.className)
			//self.toggle(self.checkSelected());
		});/**/
	},


	/**
	 * Перебор всех станций ветки
	 * @param {Function} func Функция выполняемая для каждой станции
	 */
	eachStation		: function(func){
		$.each(this.stations,func);
	},


	/**
	 * Установление ховера на станции данной ветки
	 * @param {Boolean} b флаг вкл/выкл
	 */
	hoverStations	: function(b){
		var self = this;
		self.eachStation(function(i,station){
			station.hover(b);
		});
	},


	/**
	 * Клик по ветке
	 */
	click			: function(){
		var self = this;
//		self.selected = !self.checkSelected();
//		self.stateChange();
//		self.triggerStateChange();
//
		self.toggle();

		self.eachStation(function(i,station){
			//station.toggle(self.selected);
			station.setStateByBranches();
		});

		self.node.trigger('mapchange');
	},


	/**
	 * Функция изменения состояния ветки
	 * Если не задан параметр то переключает значение
	 * @param {Boolean} b новое значение состояния
	 */
	toggle	: function(b){
		var self = this;
		if(arguments.length){
			self.selected = !!b;
		} else {
			self.selected = !self.checkSelected();
		};
		self.triggerStateChange();
		//console.log('branch toggle');
	},

	/**
	 * Функция добавления события на изменение состояния ветки
	 * @param {Function} func обработчик события
	 */
	onStateChange	: function(func){
		var self = this;
		self.node.bind('statechange',func);
		return this;
	},


	/**
	 * Функция удаления события на изменение состояния ветки
	 * @param {Function} func обработчик события
	 */
	unbindStateChange	: function(func){
		var self = this;
		self.node.unbind('statechange',func);
		return this;
	},

	/**
	 * Обработчик события изменения состояния ветки
	 * Меняет выделение ветки в зависимости от значения флага объекта ветки
	 */
	stateChange	: function(b){
		var self = this;
		
		if(arguments.length){
			self.selected = !!b;
		}
		//self.node.toggleClass('als_metro_branch_active',self.selected);
		//self.img_node.toggleClass('als_metro_branch_img_active',self.selected);

		//self.stationsStateChange();
//		self.eachStation(function(i,station){
//			station.toggle(self.selected);
//		});
	},


	/**
	 * Проверка и установка текущего состояния ветки
	 */
	setState	: function(){
		var self = this;
		self.selected = self.checkSelected();
		self.stateChange();
	},


	/**
	 * Меняет выделение станций ветки в зависимости от значения флага объекта ветки
	 */
	stationsStateChange	: function(){
		var self = this;
		self.eachStation(function(i,station){
			//station.toggle(self.selected);
			station.stateChange(self.selected);
		});

		self.eachStation(function(i,station){
			station.triggerStateChange();
		});
	},


	/**
	 * Проверка выделенности ветки
	 * Ветка выделена, если выделены все ее станции
	 * @return {Boolean} 
	 */
	checkSelected : function(){
		var
			self = this,
			res = true
		;

		self.eachStation(function(i,station){
			if(!station.selected){
				res = false;
			}
		});
		return res;
	},


	/**
	 * Запуск события изменения
	 */
	triggerStateChange	: function(){
		this.node.trigger('statechange',[this.getData()]);
	},
	

	/**
	 * Получение объекта с данными данной ветки
	 * @return {Object}
	 */
	getData		: function(){
		return {
			id		: this.id,
			name	: this.name
		};
	}

};


})();
