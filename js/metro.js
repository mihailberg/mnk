$(function () {
    metro.extendLines(metro.lines);
    $('.reset-btn').click(function () {
        metro.resetAll();
    });

    ma = $('#metro_all');
    ms = $('#metro_selected');


    var center = {};

    $('#addStationButton').click(function () {
        var sub = ma.val();
        for (var i in sub) {
            metro.checkStation(sub[i]);
        }
    });
    $('#removeStationButton').click(function () {
        var sub = ms.val();
        for (var i in sub) {
            metro.checkStation(sub[i]);
        }
    });

/*    metro_selected*/

    fillMetroAllSelect = function () {
        for (var l in metro.lines) {
            for (var s in metro.lines[l].stations) {
                ma.append('<option value="' + metro.lines[l].stations[s].id + '">' + metro.lines[l].stations[s].name + '</option>');
            }
        }
    }
    fillMetroAllSelect();

});

var metro = {
    lines:{
        1:{
            name:'Сокольническая',
            stations:[
                {id:40, name:'Улица Подбельского', coords:[496, 0, 594, 8]},
                {id:39, name:'Черкизовская', coords:[495, 10, 565, 19]},
                {id:38, name:'Преображенская площадь', coords:[496, 20, 589, 28]},
                {id:37, name:'Сокольники', coords:[495, 40, 557, 49]},
                {id:36, name:'Красносельская', coords:[496, 050, 574, 58]},
                {id:35, name:'Комсомольская', coords:[391, 208, 470, 219]},
                {id:34, name:'Красные ворота', coords:[378, 222, 456, 231]},
                {id:33, name:'Чистые пруды', coords:[369, 246, 460, 255]},
                {id:32, name:'Лубянка', coords:[289, 271, 339, 280]},
                {id:31, name:'Охотный ряд', coords:[240, 305, 303, 316]},
                {id:30, name:'Библиотека имени В.И. Ленина', coords:[240, 359, 346, 367]},
                {id:29, name:'Кропоткинская', coords:[215, 385, 290, 394]},
                {id:28, name:'Парк культуры', coords:[138, 396, 210, 409]},
                {id:27, name:'Фрунзенская', coords:[034, 555, 101, 562]},
                {id:26, name:'Спортивная', coords:[040, 565, 102, 573]},
                {id:157, name:'Воробъевы горы', coords:[024, 574, 101, 583]},
                {id:25, name:'Университет', coords:[040, 585, 102, 593]},
                {id:24, name:'Проспект Вернадского', coords:[19, 595, 101, 604]},
                {id:23, name:'Юго-Западная', coords:[031, 605, 104, 615]},
            ]
        },
        2:{name:'Замоскворецкая', stations:[
            {id:1, name:'Речной вокзал', coords:[133, 010, 207, 021]},
            {id:2, name:'Водный стадион', coords:[127, 20, 207, 29]},
            {id:3, name:'Войковская', coords:[142, 31, 207, 39]},
            {id:4, name:'Сокол', coords:[172, 40, 204, 49]},
            {id:5, name:'Аэропорт', coords:[157, 050, 205, 057]},
            {id:6, name:'Динамо', coords:[164, 61, 205, 69]},
            {id:7, name:'Белорусская', coords:[169, 186, 242, 201]},
            {id:8, name:'Маяковская', coords:[235, 215, 300, 224]},
            {id:9, name:'Тверская', coords:[232, 240, 290, 255]},
            {id:10, name:'Театральная', coords:[248, 314, 315, 326]},
            {id:11, name:'Новокузнецкая', coords:[338, 339, 412, 360]},
            {id:12, name:'Павелецкая', coords:[390, 400, 455, 411]},
            {id:13, name:'Автозаводская', coords:[396, 441, 477, 451]},
            {id:14, name:'Коломенская', coords:[397, 451, 466, 458]},
            {id:15, name:'Каширская', coords:[394, 461, 460, 472]},
            {id:18, name:'Кантемировская', coords:[323, 574, 404, 583]},
            {id:19, name:'Царицыно', coords:[353, 585, 405, 594]},
            {id:20, name:'Орехово', coords:[355, 595, 404, 604]},
            {id:21, name:'Домодедовская', coords:[324, 605, 404, 614]},
            {id:22, name:'Красногвардейская', coords:[309, 620, 403, 630]},
        ]},
        3:{name:'Арбатско-Покровская', stations:[
            {id:41, name:'Щелковская', coords:[515, 108, 580, 118]},
            {id:42, name:'Первомайская', coords:[515, 119, 588, 127]},
            {id:43, name:'Измайловская', coords:[515, 129, 585, 136]},
            {id:44, name:'Партизанская', coords:[515, 139, 585, 148]},
            {id:45, name:'Семеновская', coords:[515, 159, 579, 167]},
            {id:46, name:'Электрозаводская', coords:[515, 169, 606, 176]},
            {id:47, name:'Бауманская', coords:[515, 179, 581, 187]},
            {id:48, name:'Курская', coords:[425, 265, 479, 276]},
            {id:49, name:'Площадь революции', coords:[313, 324, 415, 331]},
            {id:159, name:'Арбатская (ап)', coords:[188, 369, 243, 376]},
            {id:160, name:'Смоленская (ап)', coords:[127, 342, 187, 350]},
            {id:52, name:'Киевская', coords:[161, 318, 196, 337]},
            {id:171, name:'Парк победы', coords:[053, 326, 119, 336]},
            {id:170, name:'Мякининская', coords:[023, 157, 92, 165]},
            {id:169, name:'Славянский бульвар', coords:[015, 283, 077, 298]},
            {id:168, name:'Строгино', coords:[023, 167, 69, 175]},
            {id:167, name:'Волокаламская', coords:[022, 147, 104, 155]},
            {id:166, name:'Митино', coords:[023, 137, 057, 144]},
            {id:62, name:'Крылатское', coords:[023, 177, 85, 185]},
            {id:61, name:'Молодежная', coords:[023, 187, 88, 195]},
            {id:60, name:'Кунцевская', coords:[021, 210, 87, 222]},
        ]},

        4:{name:'Филевская', stations:[
            {id:60, name:'Кунцевская', coords:[021, 210, 87, 222]},
            {id:59, name:'Пионерская', coords:[037, 227, 99, 235]},
            {id:58, name:'Филевский парк', coords:[48, 237, 126, 245]},
            {id:57, name:'Багратионовская', coords:[58, 247, 145, 255]},
            {id:56, name:'Фили', coords:[67, 256, 99, 265]},
            {id:55, name:'Кутузовская', coords:[78, 267, 144, 275]},
            {id:54, name:'Студенческая', coords:[87, 277, 157, 285]},
            {id:52, name:'Киевская', coords:[161, 318, 196, 337]},
            {id:161, name:'Смоленская (ф)', coords:[197, 328, 258, 336]},
            {id:158, name:'Арбатская (ф)', coords:[212, 343, 267, 351]},
            {id:53, name:'Александровский сад', coords:[132, 357, 237, 367]},
            {id:163, name:'Международная', coords:[134, 287, 214, 296]},
            {id:162, name:'Выставочная', coords:[134, 298, 205, 306]},
        ]},
        5:{name:'Кольцевая', stations:[
            {id:48, name:'Курская', coords:[425, 265, 479, 276]},
            {id:35, name:'Комсомольская', coords:[391, 208, 470, 219]},
            {id:136, name:'Проспект Мира', coords:[357, 183, 429, 192]},
            {id:134, name:'Новослободская', coords:[193, 173, 281, 184]},
            {id:7, name:'Белорусская', coords:[169, 186, 242, 201]},
            {id:133, name:'Краснопресненская', coords:[107, 219, 203, 228]},
            {id:52, name:'Киевская', coords:[161, 318, 196, 337]},
            {id:28, name:'Парк культуры', coords:[138, 396, 210, 409]},
            {id:100, name:'Октябрьская', coords:[190, 429, 257, 439]},
            {id:132, name:'Добрынинская', coords:[294, 435, 370, 445]},
            {id:12, name:'Павелецкая', coords:[390, 400, 455, 411]},
            {id:75, name:'Таганская', coords:[419, 358, 481, 368]},
        ]},
        6:{name:'Калужско-Рижская', stations:[
            {id:89, name:'Новоясеневская', coords:[114, 615, 208, 624]},
            {id:90, name:'Ясенево', coords:[160, 605, 205, 613]},
            {id:91, name:'Теплый стан', coords:[145, 595, 205, 603]},
            {id:92, name:'Коньково', coords:[156, 585, 205, 595]},
            {id:93, name:'Беляево', coords:[162, 575, 205, 585]},
            {id:94, name:'Калужская', coords:[149, 565, 205, 575]},
            {id:95, name:'Новые черемушки', coords:[123, 545, 206, 554]},
            {id:96, name:'Профсоюзная', coords:[138, 535, 205, 543]},
            {id:97, name:'Академическая', coords:[128, 525, 205, 533]},
            {id:98, name:'Ленинский проспект', coords:[134, 505, 205, 514]},
            {id:99, name:'Шаболовская', coords:[135, 495, 205, 504]},
            {id:100, name:'Октябрьская', coords:[190, 429, 257, 439]},
            {id:88, name:'Третьяковская', coords:[262, 350, 337, 358]},
            {id:74, name:'Китай-город', coords:[360, 298, 425, 308]},
            {id:103, name:'Тургеневская', coords:[357, 257, 428, 264]},
            {id:102, name:'Сухаревская', coords:[303, 209, 367, 217]},
            {id:136, name:'Проспект Мира', coords:[357, 183, 429, 192]},
            {id:104, name:'Рижская', coords:[395, 071, 448, 80]},
            {id:105, name:'Алексеевская', coords:[395, 060, 464, 070]},
            {id:106, name:'ВДНХ', coords:[395, 050, 432, 060]},
            {id:107, name:'Ботанический сад', coords:[395, 040, 478, 050]},
            {id:108, name:'Свиблово', coords:[395, 030, 444, 040]},
            {id:109, name:'Бабушкинская', coords:[395, 020, 473, 030]},
            {id:110, name:'Медведково', coords:[395, 010, 457, 020]},
        ]},
        7:{name:'Таганско-Краснопресненская', stations:[
            {id:63, name:'Планерная', coords:[132, 89, 191, 97]},
            {id:64, name:'Сходненская', coords:[123, 99, 191, 107]},
            {id:65, name:'Тушинская', coords:[134, 109, 191, 117]},
            {id:66, name:'Щукинская', coords:[129, 119, 191, 127]},
            {id:67, name:'Октябрьское поле', coords:[103, 129, 191, 137]},
            {id:68, name:'Полежаевская', coords:[118, 139, 191, 147]},
            {id:69, name:'Беговая', coords:[146, 149, 191, 157]},
            {id:70, name:'Улица 1905 года', coords:[115, 159, 191, 167]},
            {id:71, name:'Баррикадная', coords:[125, 208, 194, 217]},
            {id:72, name:'Пушкинская', coords:[174, 252, 237, 263]},
            {id:73, name:'Кузнецкий мост', coords:[254, 262, 331, 270]},
            {id:74, name:'Китай-город', coords:[360, 298, 425, 308]},
            {id:75, name:'Таганская', coords:[419, 358, 481, 368]},
            {id:76, name:'Пролетарская', coords:[460, 400, 538, 410]},
            {id:77, name:'Волгоградский проспект', coords:[495, 555, 589, 565]},
            {id:78, name:'Текстильщики', coords:[495, 575, 565, 583]},
            {id:79, name:'Кузьминки', coords:[495, 585, 550, 593]},
            {id:80, name:'Рязанский проспект', coords:[495, 595, 595, 605]},
            {id:81, name:'Выхино', coords:[495, 615, 540, 624]},
            /*Underkonstruction {id: 165, name: 'Пронская', coords: [495, 625, 550, 632]}, */
        ]},
        8:{name:'Калининская', stations:[
            {id:82, name:'Новогиреево', coords:[515, 219, 576, 227]},
            {id:83, name:'Перово', coords:[515, 229, 555, 237]},
            {id:84, name:'Шоссе энтузиастов', coords:[515, 239, 605, 248]},
            {id:85, name:'Авиамоторная', coords:[515, 259, 588, 267]},
            {id:86, name:'Площадь Ильича', coords:[460, 310, 548, 322]},
            {id:87, name:'Марксистская', coords:[422, 345, 500, 355]},
            {id:88, name:'Третьяковская', coords:[262, 350, 337, 358]},
            /*Underkonstruction {id: 173, name: 'Новокосино', coords: [515, 209, 573, 217]}*/
        ]},
        9:{name:'Серпуховско-Тимирязевская', stations:[
            {id:172, name:'Бульвар Дмитрия Донского', coords:[238, 640, 308, 657]},
            {id:156, name:'Аннино', coords:[263, 624, 304, 633]},
            {id:155, name:'Улица академика Янгеля', coords:[242, 605, 304, 613]},
            {id:130, name:'Пражская', coords:[250, 595, 304, 603]},
            {id:129, name:'Южная', coords:[265, 585, 304, 593]},
            {id:128, name:'Чертановская', coords:[235, 575, 304, 583]},
            {id:127, name:'Севастопольская', coords:[220, 542, 304, 552]},
            {id:126, name:'Нахимовский проспект', coords:[221, 527, 304, 539]},
            {id:125, name:'Нагорная', coords:[254, 517, 304, 525]},
            {id:124, name:'Нагатинская', coords:[239, 507, 304, 515]},
            {id:123, name:'Тульская', coords:[257, 497, 304, 505]},
            {id:122, name:'Серпуховская', coords:[294, 447, 378, 458]},
            {id:121, name:'Полянка', coords:[296, 419, 345, 427]},
            {id:120, name:'Боровицкая', coords:[247, 368, 310, 378]},
            {id:119, name:'Чеховская', coords:[241, 253, 300, 261]},
            {id:118, name:'Цветной бульвар', coords:[252, 190, 300, 207]},
            {id:117, name:'Менделеевская', coords:[204, 162, 281, 170]},
            {id:116, name:'Савеловская', coords:[216, 139, 280, 147]},
            {id:115, name:'Дмитровская', coords:[212, 129, 280, 137]},
            {id:114, name:'Тимирязевская', coords:[205, 119, 280, 127]},
            {id:113, name:'Петровско-разумовская', coords:[239, 79, 305, 96]},
            {id:112, name:'Владыкино', coords:[322, 40, 379, 48]},
            {id:111, name:'Отрадное', coords:[322, 030, 375, 38]},
            {id:131, name:'Бибирево', coords:[322, 20, 372, 28]},
            {id:135, name:'Алтуфьево', coords:[322, 010, 374, 020]},
        ]},
        10:{name:'Люблинская', stations:[
            {id:175, name:'Трубная', coords:[302, 192, 354, 202]},
            {id:174, name:'Сретенский бульвар', coords:[359, 240, 445, 249]},
            {id:137, name:'Чкаловская', coords:[427, 278, 493, 287]},
            {id:138, name:'Римская', coords:[461, 324, 512, 332]},
            {id:139, name:'Крестьянская застава', coords:[460, 387, 572, 396]},
            {id:140, name:'Дубровка', coords:[413, 525, 464, 533]},
            {id:144, name:'Кожуховская', coords:[413, 535, 485, 543]},
            {id:141, name:'Печатники', coords:[413, 545, 466, 553]},
            {id:142, name:'Волжская', coords:[413, 555, 473, 563]},
            {id:143, name:'Люблино', coords:[413, 565, 458, 573]},
            {id:145, name:'Братиславская', coords:[413, 575, 489, 583]},
            {id:146, name:'Марьино', coords:[413, 585, 460, 593]}
            /*
             {id: 177, name: 'Марьина роща', coords: [322, 139, 403, 146]}
             {id: 176, name: 'Достоевская', coords: [320, 159, 398, 170]}
             {id: 197, name: 'Площадь Суворова', coords: [321, 172, 422, 181]}
             */
        ]},
        11:{name:'Каховская линия', stations:[
            {id:17, name:'Каховская', coords:[307, 542, 376, 552]},
            {id:164, name:'Варшавская', coords:[371, 487, 443, 494]},
            {id:15, name:'Каширская', coords:[394, 461, 460, 472]}
        ]},
        12:{name:'Бутовская', stations:[
            {id:182, name:'Бунинская аллея', coords:[295, 705, 381, 713]},
            {id:181, name:'Улица Горчакова', coords:[295, 695, 378, 703]},
            {id:180, name:'Бульвар Адмирала Ушакова', coords:[295, 685, 403, 693]},
            {id:179, name:'Улица Скобелевская', coords:[295, 675, 395, 683]},
            {id:178, name:'Улица Старокачаловская', coords:[295, 658, 415, 667]},
        ]}
    },
    selected:{
        1:[],
        2:[],
        3:[],
        4:[],
        5:[],
        6:[],
        7:[],
        8:[],
        9:[],
        10:[],
        11:[],
        12:[]
    },

    getStationName:function (id, lineId) {
        for (var i = this.lines[lineId].stations.length - 1; i >= 0; i--) {
            if (this.lines[lineId].stations[i].id == id) return this.lines[lineId].stations[i].name;
        }
    },
    //перезаписываем массив станций метро
    extendLines:function (newLines) {
        if (newLines) {
            this.lines = newLines;
        }
    },

    element:{
        add:function (id, lineId, stnam) {
            var r = $('#metro_all [value="' + id + '"]');

            $('#metro_all [value="' + id + '"]').remove();
            $('#metro_selected').append('<option value="' + id + '" selected="selected">' + stnam + '</option>');
        },

        remove:function (id) {
            var r = $('#metro_selected [value="' + id + '"]');
            //console.log(r);
            r.remove();
            $('#metro_all').append('<option value="' + id + '" >' + metro._getStationName(id) + '</option>');
        }

    },

    checkStation:function (id) {

        var elem = document.getElementById('pp' + id);
        var showLines = [];
        var lineId, name;

        //Add
        if (elem.style.display == 'none') {

            elem.style.display = 'block';

            document.getElementById("metroimage").className = 'op';

            //заносим станцию в список выбранных
            for (var i = this._getSize(this.lines); i > 0; i--)
                //станции
                for (var j = this.lines[i].stations.length - 1; j >= 0; j--) {

                    if (this.lines[i].stations[j] && this.lines[i].stations[j].id == id) {
                        lineId = i;
                        name = this.lines[i].stations[j].name;
                        this.selected[i].push(id);
                    }
                }

                this.element.add(id, lineId, name);
            //}
        //Del
        } else {//удаление станции
            var removeLines = [];
            var lid;

            elem.style.display = 'none';

            //удаляем станцию из выбранных и смотрим, не была ли эта линия выбрана целиком
            for (var i = this._getSize(this.selected); i > 0; i--) {
                this.selected[i] = $.map(this.selected[i], function (el, ind) {
                    if (el != id) return el; else lid = i
                });
                if (lid && this.selected[i].length + 1 == this.lines[i].stations.length) removeLines.push(i);
                lid = undefined;
            }
            this.element.remove(id);

            if (this._isClear()) document.getElementById("metroimage").className = 'op-no';

        }

    },

    resetAll:function () {
        /*
         this.selected = [];
         */
        $("#metroimage").attr('class', 'op-no');
        $('div.pp').hide();
        $('#metro-list').empty();
        $('#metro_all').empty();
        $('#metro_selected').empty();
        fillMetroAllSelect();

    },

    _getSize:function (obj) {
        var size = 0, key;
        for (key in obj) {
            if (obj.hasOwnProperty(key)) size++;
        }
        return size;
    },

    _getStationName:function (id) {
        for (var i = this._getSize(this.lines); i > 0; i--)
            for (var j = this.lines[i].stations.length - 1; j >= 0; j--)
                if (this.lines[i].stations[j].id == id)
                    return this.lines[i].stations[j].name;

        return false;
    },

    _isClear:function () {
        var s = 0;
        for (var i = this._getSize(this.selected); i > 0; i--)
            s += this.selected[i].length;

        return !s;
    }
}


var linesEng = {
    1:{
        name:'Sokolnicheskaya',
        stations:[
            {id:40, name:'Ul.Podbelskogo', coords:[496, 000, 570, 8]},
            {id:39, name:'Cherkizovskaya', coords:[495, 10, 573, 17]},
            {id:38, name:'Preobrazhenskaya ploshad', coords:[496, 20, 584, 28]},
            {id:37, name:'Sokolniki', coords:[495, 40, 544, 48]},
            {id:36, name:'Krasnoselskaya', coords:[496, 50, 574, 58]},
            {id:35, name:'Komsomolskaya', coords:[391, 208, 470, 216]},
            {id:34, name:'Krasniye vorota', coords:[378, 222, 456, 231]},
            {id:33, name:'Chistyie prudi', coords:[359, 240, 445, 249]},
            {id:32, name:'Lubyanka', coords:[289, 269, 339, 277]},
            {id:31, name:'Okhotniy ryad', coords:[235, 305, 303, 314]},
            {id:30, name:'Biblioteka Lenina', coords:[240, 358, 321, 367]},
            {id:29, name:'Kropotkinskaya', coords:[215, 385, 290, 394]},
            {id:28, name:'Park kultury', coords:[144, 396, 210, 409]},
            {id:27, name:'Frunzenskaya', coords:[034, 555, 101, 562]},
            {id:26, name:'Sportivnaya', coords:[040, 565, 102, 573]},
            {id:157, name:'Vorobyevy gory', coords:[024, 574, 101, 583]},
            {id:25, name:'Universitet', coords:[046, 585, 102, 593]},
            {id:24, name:'Prospekt Vernadskogo', coords:[036, 595, 101, 608]},
            {id:23, name:'Yugo-zapadnaya', coords:[021, 612, 104, 625]},
        ]},
    2:{name:'Zamoskvoretskaya', stations:[
        {id:1, name:'Rechnoi vokzal', coords:[133, 010, 207, 021]},
        {id:2, name:'Vodny stadion', coords:[137, 020, 207, 031]},
        {id:3, name:'Voikovskaya', coords:[142, 031, 207, 041]},
        {id:4, name:'Sokol', coords:[172, 040, 204, 046]},
        {id:5, name:'Aeroport', coords:[157, 050, 205, 057]},
        {id:6, name:'Dinamo', coords:[168, 59, 205, 67]},
        {id:7, name:'Belorusskaya', coords:[169, 186, 242, 201]},
        {id:8, name:'Mayakovskaya', coords:[235, 215, 307, 224]},
        {id:9, name:'Tverskaya', coords:[232, 240, 290, 255]},
        {id:10, name:'Teatralnaya', coords:[250, 314, 315, 326]},
        {id:11, name:'Novokuznetskaya', coords:[338, 339, 412, 360]},
        {id:12, name:'Paveletskaya', coords:[330, 400, 400, 411]},
        {id:13, name:'Avtozavodskaya', coords:[396, 441, 477, 451]},
        {id:14, name:'Kolomenskaya', coords:[397, 451, 466, 458]},
        {id:18, name:'Kantemirovskaya', coords:[323, 574, 404, 583]},
        {id:15, name:'Kashirskaya', coords:[394, 461, 460, 472]},
        {id:19, name:'Tsaritsino', coords:[353, 585, 405, 592]},
        {id:20, name:'Orekhovo', coords:[355, 595, 404, 602]},
        {id:21, name:'Domodedovskaya', coords:[324, 605, 404, 612]},
        {id:22, name:'Krasnogvardeiskaya', coords:[306, 620, 403, 627]},
    ]},
    3:{name:'Arbatsko - pokrovskaya', stations:[
        {id:41, name:'Shchelkovskaya', coords:[515, 108, 594, 118]},
        {id:42, name:'Pervomaiskaya', coords:[515, 119, 588, 127]},
        {id:43, name:'Izmailovskaya', coords:[515, 129, 585, 136]},
        {id:44, name:'Partizanskaya', coords:[515, 139, 575, 153]},
        {id:45, name:'Semyonovskaya', coords:[515, 159, 591, 167]},
        {id:46, name:'Elektrozavodskaya', coords:[515, 169, 606, 176]},
        {id:47, name:'Baumanskaya', coords:[515, 179, 581, 187]},
        {id:48, name:'Kurskaya', coords:[425, 265, 479, 276]},
        {id:49, name:'Ploshcad revolutsii', coords:[313, 324, 415, 331]},
        {id:159, name:'Arbatskaya (ap)', coords:[182, 369, 243, 376]},
        {id:160, name:'Smolenskaya (ap)', coords:[124, 342, 187, 350]},
        {id:52, name:'Kievskaya', coords:[165, 318, 196, 337]},
        {id:171, name:'Park pobedy / Victory park', coords:[053, 326, 119, 340]},
        {id:170, name:'Myakininskaya', coords:[23, 157, 92, 165]},
        {id:169, name:'Slavyanskiy bulvar', coords:[015, 283, 077, 298]},
        {id:168, name:'Strogino', coords:[23, 167, 69, 175]},
        {id:167, name:'Volokolamskaya', coords:[022, 147, 104, 155]},
        {id:166, name:'Mitino', coords:[023, 137, 057, 144]},
        {id:62, name:'Krylatskoye', coords:[23, 177, 85, 185]},
        {id:61, name:'Molodyozhnaya', coords:[23, 187, 98, 195]},
        {id:60, name:'Kuntsevskaya', coords:[21, 210, 95, 222]},
    ]},
    4:{name:'Filevskaya', stations:[
        {id:60, name:'Kuntsevskaya', coords:[21, 210, 95, 222]},
        {id:59, name:'Pionerskaya', coords:[037, 227, 99, 235]},
        {id:58, name:'Filyovsky park', coords:[48, 237, 121, 245]},
        {id:57, name:'Bagrationovskaya', coords:[58, 247, 145, 255]},
        {id:56, name:'Fili', coords:[067, 256, 90, 265]},
        {id:55, name:'Kutuzovskaya', coords:[78, 267, 148, 275]},
        {id:54, name:'Studencheskaya', coords:[87, 277, 165, 285]},
        {id:52, name:'Kievskaya', coords:[165, 318, 196, 337]},
        {id:161, name:'Smolenskaya (f', coords:[197, 328, 262, 336]},
        {id:158, name:'Arbatskaya (f)', coords:[212, 343, 273, 351]},
        {id:53, name:'Alexsandrovsky sad', coords:[138, 357, 237, 367]},
        {id:163, name:'Mezhdunarodnaya', coords:[134, 287, 220, 296]},
        {id:162, name:'Vystavochnaya', coords:[134, 298, 206, 306]},
    ]},
    5:{name:'Koltsevaya', stations:[
        {id:48, name:'Kurskaya', coords:[425, 265, 479, 276]},
        {id:35, name:'Komsomolskaya', coords:[391, 208, 470, 216]},
        {id:136, name:'Prospekt mira', coords:[357, 183, 429, 192]},
        {id:134, name:'Novoslobodskaya', coords:[193, 173, 281, 184]},
        {id:7, name:'Belorusskaya', coords:[169, 186, 242, 201]},
        {id:133, name:'Krasnopresnenskaya', coords:[101, 219, 203, 228]},
        {id:52, name:'Kievskaya', coords:[165, 318, 196, 337]},
        {id:28, name:'Park kultury', coords:[144, 396, 210, 409]},
        {id:100, name:'Oktyaborskaya', coords:[185, 426, 257, 439]},
        {id:132, name:'Dobryninskaya', coords:[294, 435, 370, 445]},
        {id:12, name:'Paveletskaya', coords:[330, 400, 400, 411]},
        {id:75, name:'Taganskaya', coords:[419, 358, 481, 368]},
    ]},
    6:{name:'Kaluzhsko-rizhskaya', stations:[
        {id:89, name:'Novoyasenevskaya', coords:[114, 615, 208, 628]},
        {id:90, name:'Yasenevo', coords:[155, 605, 205, 613]},
        {id:91, name:'Teply stan', coords:[145, 595, 205, 603]},
        {id:92, name:'Konkovo', coords:[158, 585, 205, 595]},
        {id:93, name:'Belyaevo', coords:[158, 575, 205, 585]},
        {id:94, name:'Kaluzhskaya', coords:[139, 565, 205, 575]},
        {id:95, name:'Novye cheremushki', coords:[143, 545, 206, 558]},
        {id:96, name:'Profsoyuznaya', coords:[130, 535, 205, 543]},
        {id:97, name:'Akademicheskaya', coords:[123, 525, 205, 533]},
        {id:98, name:'Leninsky prospekt', coords:[156, 505, 205, 519]},
        {id:99, name:'Shabolovskaya', coords:[129, 495, 205, 509]},
        {id:100, name:'Oktyaborskaya', coords:[185, 426, 257, 439]},
        {id:88, name:'Tretyakovskaya', coords:[256, 350, 337, 358]},
        {id:74, name:'Kitai gorod', coords:[360, 298, 419, 308]},
        {id:103, name:'Turgenevskaya', coords:[357, 257, 434, 264]},
        {id:102, name:'Sukharevskaya', coords:[292, 209, 367, 215]},
        {id:136, name:'Prospekt mira', coords:[357, 183, 429, 192]},
        {id:104, name:'Rizhskaya', coords:[395, 71, 448, 80]},
        {id:105, name:'Alexeevskaya', coords:[395, 060, 464, 070]},
        {id:106, name:'VDNKH', coords:[395, 050, 432, 060]},
        {id:107, name:'Botanichesky sad', coords:[395, 040, 478, 050]},
        {id:108, name:'Sviblovo', coords:[395, 030, 444, 040]},
        {id:109, name:'Babushkinskaya', coords:[395, 020, 473, 030]},
        {id:110, name:'Medvedkovo', coords:[395, 010, 457, 020]},
    ]},
    7:{name:'Tagansko-Krasnopresnenskaya', stations:[
        {id:63, name:'Planernaya', coords:[132, 89, 191, 97]},
        {id:64, name:'Skhodnenskaya', coords:[117, 99, 191, 107]},
        {id:65, name:'Tushinskaya', coords:[129, 109, 191, 117]},
        {id:66, name:'Shchukinskaya', coords:[119, 119, 191, 127]},
        {id:67, name:'Oktyabrskoe pole', coords:[103, 129, 191, 137]},
        {id:68, name:'Polezhaevskaya', coords:[108, 139, 191, 147]},
        {id:69, name:'Begovaya', coords:[141, 149, 191, 157]},
        {id:70, name:'Ul.1905 goda', coords:[130, 159, 191, 167]},
        {id:71, name:'Barrikadnaya', coords:[125, 208, 194, 217]},
        {id:72, name:'Pushkinskaya', coords:[169, 252, 237, 263]},
        {id:73, name:'Kuznetsky most', coords:[254, 262, 331, 270]},
        {id:74, name:'Kitai gorod', coords:[360, 298, 419, 308]},
        {id:75, name:'Taganskaya', coords:[419, 358, 481, 368]},
        {id:76, name:'Proletarskaya', coords:[460, 400, 538, 410]},
        {id:77, name:'Volgogradsky prospekt', coords:[495, 555, 565, 569]},
        {id:78, name:'Tekstilshchiki', coords:[495, 575, 565, 583]},
        {id:79, name:'Kuzminki', coords:[495, 585, 540, 593]},
        {id:80, name:'Ryazansky prospekt', coords:[495, 595, 550, 610]},
        {id:81, name:'Vykhino', coords:[495, 615, 540, 622]},
        /*Underkonstruction {id: 165, name: 'Pronskaya', coords: [495, 625, 550, 632]}*/
    ]},
    8:{name:'Kalininskaya', stations:[
        {id:82, name:'Novogireevo', coords:[515, 219, 576, 227]},
        {id:83, name:'Perovo', coords:[515, 229, 555, 237]},
        {id:84, name:'Shosse entuziastov', coords:[515, 239, 575, 253]},
        {id:85, name:'Aviamotornaya', coords:[515, 259, 588, 267]},
        {id:86, name:'Ploshcad Ilyicha', coords:[460, 310, 548, 322]},
        {id:87, name:'Marksistskaya', coords:[422, 345, 500, 355]},
        {id:88, name:'Tretyakovskaya', coords:[256, 350, 337, 358]},
        /*Underkonstruction {id: 173, name: 'Novokosino', coords: [515, 209, 573, 217]}*/
    ]},
    9:{name:'Serpuhovsko-timiryazevskaya', stations:[
        {id:172, name:'Bulvar Dm.Donskogo', coords:[238, 645, 308, 657]},
        {id:156, name:'Annino', coords:[273, 624, 304, 633]},
        {id:155, name:'Ul. Akademika Yangelya', coords:[242, 585, 304, 613]},
        {id:130, name:'Prazhskaya', coords:[245, 585, 304, 603]},
        {id:129, name:'Yuzhnaya', coords:[255, 585, 304, 593]},
        {id:128, name:'Chertanovskaya', coords:[225, 575, 304, 583]},
        {id:127, name:'Sevastopolskaya', coords:[220, 542, 304, 552]},
        {id:126, name:'Nakhimovsky prospekt', coords:[241, 527, 304, 539]},
        {id:125, name:'Nagornaya', coords:[250, 517, 304, 525]},
        {id:124, name:'Nagatinskaya', coords:[239, 507, 304, 515]},
        {id:123, name:'Tulskaya', coords:[257, 497, 304, 505]},
        {id:122, name:'Serpukhovskaya', coords:[294, 447, 378, 458]},
        {id:121, name:'Polyanka', coords:[296, 419, 345, 427]},
        {id:120, name:'Borovitskaya', coords:[247, 368, 316, 378]},
        {id:119, name:'Chekhovskaya', coords:[241, 251, 314, 261]},
        {id:118, name:'Tsvetnoi Bulvar', coords:[252, 190, 300, 207]},
        {id:117, name:'Mendeleyevskaya', coords:[196, 159, 281, 170]},
        {id:116, name:'Savyolovskaya', coords:[202, 139, 280, 147]},
        {id:115, name:'Dmitrovskaya', coords:[212, 129, 280, 137]},
        {id:114, name:'Timiryazevskaya', coords:[199, 119, 280, 127]},
        {id:113, name:'Petrovsko-Razumovskaya', coords:[233, 79, 305, 96]},
        {id:112, name:'Vladykino', coords:[322, 040, 375, 48]},
        {id:111, name:'Otradnoe', coords:[322, 030, 375, 38]},
        {id:131, name:'Bibirevo', coords:[322, 020, 367, 28]},
        {id:135, name:'Altufyevo', coords:[322, 010, 374, 012]},
    ]},
    10:{name:'Lublinskaya', stations:[
        {id:175, name:'Trubnaya', coords:[302, 192, 354, 202]},
        {id:174, name:'Sretensky bulvar', coords:[369, 246, 455, 255]},
        {id:137, name:'Chkalovskaya', coords:[427, 278, 501, 287]},
        {id:138, name:'Rimskaya', coords:[461, 324, 512, 332]},
        {id:139, name:'Krestianskaya zastava', coords:[460, 387, 572, 396]},
        {id:140, name:'Dubrovka', coords:[413, 525, 464, 533]},
        {id:144, name:'Kozhukhovskaya', coords:[413, 535, 495, 543]},
        {id:141, name:'Pechatniki', coords:[413, 545, 466, 553]},
        {id:142, name:'Volzhskaya', coords:[413, 555, 473, 563]},
        {id:143, name:'Lyublino', coords:[413, 565, 458, 573]},
        {id:145, name:'Bratislavskaya', coords:[413, 575, 489, 583]},
        {id:146, name:'Maryino', coords:[413, 585, 456, 593]},
        /*Underkonstruction {id: 177, name: 'Maryina roshcha', coords: [322, 139, 403, 146]}*/
        /*Underkonstruction {id: 176, name: 'Dostoyevskaya', coords: [320, 159, 398, 170]}*/
        /*Underkonstruction {id: 197, name: 'Ploshcad Suvorova', coords: [321, 172, 422, 181]}*/
    ]},

    11:{name:'Kakhovskaya', stations:[
        {id:17, name:'Kakhovskaya', coords:[307, 542, 376, 552]},
        {id:164, name:'Varshavskaya', coords:[371, 487, 443, 494]},
        {id:15, name:'Kashirskaya', coords:[394, 461, 460, 472]}
    ]},
    12:{name:'Butovskaya', stations:[
        {id:182, name:'Buninskaya alleya', coords:[295, 705, 381, 713]},
        {id:181, name:'Ul.Gorchakova', coords:[295, 695, 368, 703]},
        {id:180, name:'Bulvar admirala Ushakova', coords:[295, 685, 423, 693]},
        {id:179, name:'Skobelevskaya', coords:[295, 675, 380, 683]},
        {id:178, name:'Ul.Starokochalovskaya', coords:[295, 658, 408, 667]},
    ]}
}