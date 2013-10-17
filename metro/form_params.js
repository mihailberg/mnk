var FormPostManager = {
	
	url : 'http://www.cian.ru/cat.php',
	
	skip_params    :  ['location_trigger', 'rent_payfor', 'rent_period', 'sell_payfor'],
	replace_params : [
						{
							name    : 'rent_minprice',
							replace : 'minprice'
						},
						{
							name    : 'rent_maxprice',
							replace : 'maxprice'
						},
						{
							name: 'rent_currency',
							replace: 'currency'
						},
						{
							name    : 'sell_minprice',
							replace : 'minprice'
						},
						{
							name    : 'sell_maxprice',
							replace : 'maxprice'
						},
						{
							name: 'sell_currency',
							replace: 'currency'
						}
					 ],
					 
	prefixes    :  ['rf_', 'rh_', 'rc_', 'sf_', 'sh_','sc_'],				 

	
	post : function(params, deal_type_prefix, object_type_prefix){
		var method = 'get';

		var prefix = deal_type_prefix+object_type_prefix;
		
		var form = document.createElement("form");
			form.setAttribute("method", method);
			form.setAttribute("action", this.url);
			form.setAttribute('accept-charset', 'windows-1251');
		
		$.each(params, function(name, value){
			if ($.isArray(value)){
				$.each(value, function (i, item){
					name = prefixExists(name)?name.substring(3):name;
					var hiddenField = makeInput(name+'['+i+']', item);
					form.appendChild(hiddenField);    
				});	
			} else {
				if (name == 'type_select'){
					if (value == 'house') n = 'suburbian';
					else if (value == 'flat') n = 'flats';
					else if (value == 'commercial') n = 'offices';					
					var hiddenField = makeInput(n, 'yes');
					form.appendChild(hiddenField);    
				} else if (name == 'minprice' || name == 'maxprice'){
						//name = replaceIfNeed(name);
						value = value.replace(/\s/g, "");
					var hiddenField = makeInput(name, value);
						form.appendChild(hiddenField);    
				} else {
					var name = prefixExists(name)?name.substring(3):name;
						//name = replaceIfNeed(name);
					if (value != '' && $.inArray(name,  FormPostManager.skip_params) == -1){
						var hiddenField = makeInput(name, value);
						form.appendChild(hiddenField);    
					}
				}
			}
		});

		// Мы в айфрейме
//		if (top != self){
//			parent.document.body.appendChild(form);
//		} 	
		//window.open ('http://cian.ru/cat.php?'+$(form).serialize());
		document.body.appendChild(form);
		form.submit();
		
		function prefixExists(str){
			return ($.inArray(str.substr(0, 3), FormPostManager.prefixes)>-1?true:false);
		}
		
		function replaceIfNeed(name){
			var result = name;
			$.each(FormPostManager.replace_params, function(i, item){
				if (item.name == name) result = item.replace;
			});
			return result;
		}
		
		function makeInput(name, value){
			var hiddenField = document.createElement("input");
		        hiddenField.setAttribute("type", "hidden");
		        hiddenField.setAttribute("name", name);
		        hiddenField.setAttribute("value", value);
		    return hiddenField;    
		}
		 
	}
	
	
}

$(function(){

	$('.sf_submit').on('click', function(e){
		return;
		e.preventDefault();
		var 
			deal_type   	 = $('.extended_form_deal_trigger_active').attr('rel'),
			object_type 	 = $('.sf_object_type_select_button_active').find('input').val(),
 			location_trigger = $('input[name=location_trigger]:checked').val()
 		;	
		
		$(':input[value=""]').prop('disabled', true);
		if ($('input[name=minprice]').val() == "" && $('input[name=maxprice]').val() =="" ){
			$('input[name=currency]').prop('disabled', true);
		}
		// Блокируем ненужные параметры, чтобы их не было в строке
		// сначала не относящиеся к выбранному типу сделки
		$('.ex_params[rel!='+deal_type+'] :input[value]').prop('disabled', true);
		// затем не относящиеся к выбранному типу недвижимости
		//$('.ex_object_params[rel!='+object_type+'] :input, sf_object_params[rel!='+object_type+'] :input').prop('disabled', true);
		$('.ex_object_params[rel!='+object_type+'], .sf_object_params[rel!='+object_type+']').find(':input').prop('disabled', true);
		$('input[name^='+(deal_type == 'rent'?'sell_':'rent_')+']').prop('disabled', true);

		// Деактивируем параметры формы, не принадлежащие активированной вкладке в блоке "Расположение"
		$('.ex_location_type[rel!='+location_trigger+']').find('input').prop('disabled', true);
		// Другие
		$('input[type=hidden][name=price_type]').prop('disabled', ($('input[type=hidden][name=rent_maxprice]').val() === '0'));
		$('form#extended_search_form_act :input[value=0]').prop('disabled', true);
		var query_string = $('form#extended_search_form_act :input[value]').serialize();
		// Отправляем строку с параметрами в менеджер отправки, также добавляем префиксы типа сделки и типа объекта (первые буквы)
		FormPostManager.post($.deparam(query_string, false), deal_type.substr(0,1), object_type.substr(0,1));




	});
	
	
});

/*********** ФУНКЦИЯ ОТОБРАЖЕНИЯ РАЙОНОВ НА КАРТЕ С List_with_filter.js *********/

function ToggleDistrictOnMapFromListFilter(name, checked){
	//console.log('name='+name+' checked='+checked);
	
//	$('.map_info_list_districts ul li').each(function(){
//		var 
//			districtName = $(this).find('span').html()
//			districtChecked = $(this).hasClass('selected');
//		;
//		
//		
//		
//	});

	if (checked) _checkDistrictOnMap(name);
	else _unCheckDistrictOnMap(name);
	
	function _checkDistrictOnMap(dname){
		$('.map_info_list_districts ul li').each(function(){
			if ($(this).find('span').html() == dname && !$(this).hasClass('selected')) $(this).click();
		});
	}
	
	function _unCheckDistrictOnMap(dname){
		$('.map_info_list_districts ul li').each(function(){
			if ($(this).find('span').html() == dname && $(this).hasClass('selected')) $(this).click();
		});
	}
	
}

function ResetForm(){
	alert(1);
}