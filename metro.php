<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Демонстрационная версия CMS</title>
<link href="/metro/css/metro-map.css" rel="stylesheet" type="text/css"/>
<script language="JavaScript" type="text/javascript" src="/metro/js/metro.js"></script>

</head>
<body>


<table class="full-search">
		<tbody><tr><td class="tdname">Тип сделки</td>
		<td>
		<select name="deal" id="srub" class="tab-se1">
			<option value="1">Продажа</option>
			<option value="2">Аренда</option>
		</select>
		</td></tr>
		<tr><td class="tdname">Тип недвижимости</td>
		<td>
		<select name="tip" class="tab-se1" id="tip1f">

		<option value="0">Все</option><option value="1">Коттеджи</option><option value="41">Комната(ы)</option><option value="42">Квартиры</option><option value="43">Дома</option><option value="46">Земельный участок</option><option value="48">Коттеджный поселок</option></select>
		</td></tr>
		<tr><td class="tdname">Регион</td>
		<td>
		<select id="region_full" class="tab-se1" name="region"><option value="">Выберите регион</option><option value="2">Санкт-Петербург и область</option></select>
		</td></tr>

		<tr><td class="tdname">Город</td>
		<td>
		<select id="city_full" class="tab-se1" name="city">
			<option value="0">Выберите город</option>
		</select>
		</td></tr>

		<tr><td class="tdname metrose">Ближ. станция метро</td>
		<td class="metrose">
			<ul id="metro-list"></ul>
			<a href="javascript://" class="add-station">Выбрать метро</a>
		</td></tr>

		<tr><td class="tdname">Комнат в квартире</td>
		<td>
			<input id="rm1" name="rm[]" value="1" type="checkbox">
			<label class="checkbox" for="rm1">1</label>
			<input id="rm2" name="rm[]" value="2" type="checkbox">
			<label class="checkbox" for="rm2">2</label>
			<input id="rm3" name="rm[]" value="3" type="checkbox">
			<label class="checkbox" for="rm3">3</label>

			<input id="rm4" name="rm[]" value="4" type="checkbox">
			<label class="checkbox" for="rm4">4</label>
			<input id="rm5" name="rm[]" value="5" type="checkbox">
			<label class="checkbox" for="rm5">4+</label>
		</td></tr>

		<tr><td class="tdname">Площадь от (кв.м)</td>
		<td>
			<input type="text" name="pl1" value="" class="inputbox Imin">
		</td></tr>
		<tr><td class="tdname">Площадь до (кв.м)</td>
		<td>
			<input type="text" name="pl2" value="" class="inputbox Imin">
		</td></tr>


		<tr><td class="tdname">Цена от (млн.руб)</td>
		<td>
			<input type="text" name="cen1" value="" class="inputbox Imin">
		</td></tr>
		<tr><td class="tdname">Цена до (млн.руб)</td>
		<td>
			<input type="text" name="cen2" value="" class="inputbox Imin">
		</td></tr>

		<tr><td class="tdname">	<input class="tab-but" value="Найти" type="submit"></td>
		<td>
		</td></tr>

	</tbody></table>

<div id="metrowindow" class="popup png24" style="display: block;"><div class="btn btn-close"></div>

<div id="metromap-pop" name="metromap">

<img usemap="#metroMap" id="metroimage" src="/metro/img/metro-map-rus1.gif" alt="" border="0/" height="804" width="607" class="op-no">

<!-- Sokol'nicheskaya red -->
<div id="pp40" class="pp" style="display: none;" onclick="metro.checkStation(40); return false;"></div>
<div id="pp39" class="pp" style="display: none;" onclick="metro.checkStation(39); return false;"></div>
<div id="pp38" class="pp" style="display: none;" onclick="metro.checkStation(38); return false;"></div>

<div id="pp37" class="pp" style="display: none;" onclick="metro.checkStation(37); return false;"></div>
<div id="pp36" class="pp" style="display: none;" onclick="metro.checkStation(36); return false;"></div>
<div id="pp35" class="pp pp-b" style="display: none;" onclick="metro.checkStation(35); return false;"></div>
<div id="pp34" class="pp" style="display: none;" onclick="metro.checkStation(34); return false;"></div>
<div id="pp33" class="pp" style="display: none;" onclick="metro.checkStation(33); return false;"><span class="pp"></span></div>
<div id="pp32" class="pp" style="display: none;" onclick="metro.checkStation(32); return false;"><span class="pp"></span></div>
<div id="pp31" class="pp" style="display: none;" onclick="metro.checkStation(31); return false;"></div>
<div id="pp30" class="pp pp-b" style="display: none;" onclick="metro.checkStation(30); return false;"><span class="pp"></span></div>
<div id="pp29" class="pp" style="display: none;" onclick="metro.checkStation(29); return false;"></div>
<div id="pp28" class="pp pp-b" style="display: none;" onclick="metro.checkStation(28); return false;"></div>
<div id="pp27" class="pp" style="display: none;" onclick="metro.checkStation(27); return false;"></div>
<div id="pp26" class="pp" style="display: none;" onclick="metro.checkStation(26); return false;"></div>
<div id="pp157" class="pp" style="display: none;" onclick="metro.checkStation(157); return false;"></div>
<div id="pp25" class="pp" style="display: none;" onclick="metro.checkStation(25); return false;"></div>
<div id="pp24" class="pp" style="display: none;" onclick="metro.checkStation(24); return false;"></div>
<div id="pp23" class="pp pp-b" style="display: none;" onclick="metro.checkStation(23); return false;"></div>

<!-- Zamoskvoreckaya GREEN -->
<div id="pp1" class="pp" style="display: none;" onclick="metro.checkStation(1); return false;"></div>
<div id="pp2" class="pp" style="display: none;" onclick="metro.checkStation(2); return false;"></div>
<div id="pp3" class="pp" style="display: none;" onclick="metro.checkStation(3); return false;"></div>
<div id="pp4" class="pp" style="display: none;" onclick="metro.checkStation(4); return false;"></div>
<div id="pp5" class="pp" style="display: none;" onclick="metro.checkStation(5); return false;"></div>
<div id="pp6" class="pp" style="display: none;" onclick="metro.checkStation(6); return false;"></div>
<div id="pp7" class="pp pp-b" style="display: none;" onclick="metro.checkStation(7); return false;"></div>
<div id="pp8" class="pp" style="display: none;" onclick="metro.checkStation(8); return false;"></div>
<div id="pp9" class="pp pp-b" style="display: none;" onclick="metro.checkStation(9); return false;"></div>
<div id="pp10" class="pp" style="display: none;" onclick="metro.checkStation(10); return false;"><span class="pp"></span></div>
<div id="pp11" class="pp" style="display: none;" onclick="metro.checkStation(11); return false;"></div>
<div id="pp12" class="pp pp-b" style="display: none;" onclick="metro.checkStation(12); return false;"></div>
<div id="pp13" class="pp" style="display: none;" onclick="metro.checkStation(13); return false;"></div>
<div id="pp14" class="pp" style="display: none;" onclick="metro.checkStation(14); return false;"></div>
<div id="pp15" class="pp pp-b" style="display: none;" onclick="metro.checkStation(15); return false;"></div>
<div id="pp18" class="pp" style="display: none;" onclick="metro.checkStation(18); return false;"></div>

<div id="pp19" class="pp" style="display: none;" onclick="metro.checkStation(19); return false;"></div>
<div id="pp20" class="pp" style="display: none;" onclick="metro.checkStation(20); return false;"></div>
<div id="pp21" class="pp" style="display: none;" onclick="metro.checkStation(21); return false;"></div>
<div id="pp22" class="pp pp-b" style="display: none;" onclick="metro.checkStation(22); return false;"></div>

<!-- Arbatsko - pokrovskaya -->
<div id="pp41" class="pp" style="display: none;" onclick="metro.checkStation(41); return false;"></div>
<div id="pp42" class="pp" style="display: none;" onclick="metro.checkStation(42); return false;"></div>
<div id="pp43" class="pp" style="display: none;" onclick="metro.checkStation(43); return false;"></div>
<div id="pp44" class="pp" style="display: none;" onclick="metro.checkStation(44); return false;"></div>
<div id="pp45" class="pp" style="display: none;" onclick="metro.checkStation(45); return false;"></div>
<div id="pp46" class="pp" style="display: none;" onclick="metro.checkStation(46); return false;"></div>
<div id="pp47" class="pp" style="display: none;" onclick="metro.checkStation(47); return false;"></div>
<div id="pp48" class="pp pp-b" style="display: none;" onclick="metro.checkStation(48); return false;"></div>
<div id="pp49" class="pp" style="display: none;" onclick="metro.checkStation(49); return false;"></div>
<div id="pp159" class="pp" style="display: none;" onclick="metro.checkStation(159); return false;"></div>
<div id="pp160" class="pp" style="display: none;" onclick="metro.checkStation(160); return false;"></div>

<div id="pp52" class="pp pp-b" style="display: none;" onclick="metro.checkStation(52); return false;"><span class="pp"></span></div>
<div id="pp171" class="pp" style="display: none;" onclick="metro.checkStation(171); return false;"></div>
<div id="pp169" class="pp" style="display: none;" onclick="metro.checkStation(169); return false;"></div>
<div id="pp61" class="pp" style="display: none;" onclick="metro.checkStation(61); return false;"></div>
<div id="pp62" class="pp" style="display: none;" onclick="metro.checkStation(62); return false;"></div>
<div id="pp168" class="pp" style="display: none;" onclick="metro.checkStation(168); return false;"></div>
<div id="pp170" class="pp" style="display: none;" onclick="metro.checkStation(170); return false;"></div>
<div id="pp167" class="pp" style="display: none;" onclick="metro.checkStation(167); return false;"></div>
<div id="pp166" class="pp" style="display: none;" onclick="metro.checkStation(166); return false;"></div>

<!-- Filevskaya light-blue -->
<div id="pp60" class="pp pp-b" style="display: none;" onclick="metro.checkStation(60); return false;"></div>
<div id="pp59" class="pp" style="display: none;" onclick="metro.checkStation(59); return false;"></div>
<div id="pp58" class="pp" style="display: none;" onclick="metro.checkStation(58); return false;"></div>
<div id="pp57" class="pp" style="display: none;" onclick="metro.checkStation(57); return false;"></div>
<div id="pp56" class="pp" style="display: none;" onclick="metro.checkStation(56); return false;"></div>
<div id="pp55" class="pp" style="display: none;" onclick="metro.checkStation(55); return false;"></div>

<div id="pp54" class="pp" style="display: none;" onclick="metro.checkStation(54); return false;"></div>
<div id="pp163" class="pp" style="display: none;" onclick="metro.checkStation(163); return false;"></div>
<div id="pp162" class="pp" style="display: none;" onclick="metro.checkStation(162); return false;"></div>
<div id="pp161" class="pp" style="display: none;" onclick="metro.checkStation(161); return false;"></div>
<div id="pp158" class="pp" style="display: none;" onclick="metro.checkStation(158); return false;"></div>
<div id="pp53" class="pp pp-b" style="display: none;" onclick="metro.checkStation(53); return false;"></div>

<!-- Kol'tsevaya BROWN -->
<div id="pp132" class="pp" style="display: none;" onclick="metro.checkStation(132); return false;"></div>
<div id="pp133" class="pp" style="display: none;" onclick="metro.checkStation(133); return false;"><span class="pp"></span></div>
<div id="pp134" class="pp" style="display: none;" onclick="metro.checkStation(134); return false;"></div>

<!-- Kaluzhsko-rizhskaya ORANGE -->
<div id="pp110" class="pp" style="display: none;" onclick="metro.checkStation(110); return false;"></div>
<div id="pp109" class="pp" style="display: none;" onclick="metro.checkStation(109); return false;"></div>
<div id="pp108" class="pp" style="display: none;" onclick="metro.checkStation(108); return false;"></div>
<div id="pp107" class="pp" style="display: none;" onclick="metro.checkStation(107); return false;"></div>

<div id="pp106" class="pp" style="display: none;" onclick="metro.checkStation(106); return false;"></div>
<div id="pp105" class="pp" style="display: none;" onclick="metro.checkStation(105); return false;"></div>
<div id="pp104" class="pp" style="display: none;" onclick="metro.checkStation(104); return false;"></div>
<div id="pp136" class="pp pp-b" style="display: none;" onclick="metro.checkStation(136); return false;"></div>
<div id="pp102" class="pp" style="display: none;" onclick="metro.checkStation(102); return false;"></div>
<div id="pp103" class="pp" style="display: none;" onclick="metro.checkStation(103); return false;"><span class="pp"></span></div>
<div id="pp100" class="pp pp-b" style="display: none;" onclick="metro.checkStation(100); return false;"></div>
<div id="pp99" class="pp" style="display: none;" onclick="metro.checkStation(99); return false;"></div>
<div id="pp98" class="pp" style="display: none;" onclick="metro.checkStation(98); return false;"></div>
<div id="pp97" class="pp" style="display: none;" onclick="metro.checkStation(97); return false;"></div>
<div id="pp96" class="pp" style="display: none;" onclick="metro.checkStation(96); return false;"></div>
<div id="pp95" class="pp" style="display: none;" onclick="metro.checkStation(95); return false;"></div>
<div id="pp94" class="pp" style="display: none;" onclick="metro.checkStation(94); return false;"></div>
<div id="pp93" class="pp" style="display: none;" onclick="metro.checkStation(93); return false;"></div>
<div id="pp92" class="pp" style="display: none;" onclick="metro.checkStation(92); return false;"></div>
<div id="pp91" class="pp" style="display: none;" onclick="metro.checkStation(91); return false;"></div>
<div id="pp90" class="pp" style="display: none;" onclick="metro.checkStation(90); return false;"></div>

<div id="pp89" class="pp" style="display: none;" onclick="metro.checkStation(89); return false;"></div>

<!-- Tagansko-Krasnopresnenskaya violet -->
<div id="pp63" class="pp" style="display: none;" onclick="metro.checkStation(63); return false;"></div>
<div id="pp64" class="pp" style="display: none;" onclick="metro.checkStation(64); return false;"></div>
<div id="pp65" class="pp" style="display: none;" onclick="metro.checkStation(65); return false;"></div>
<div id="pp66" class="pp" style="display: none;" onclick="metro.checkStation(66); return false;"></div>
<div id="pp67" class="pp" style="display: none;" onclick="metro.checkStation(67); return false;"></div>
<div id="pp68" class="pp" style="display: none;" onclick="metro.checkStation(68); return false;"></div>
<div id="pp69" class="pp" style="display: none;" onclick="metro.checkStation(69); return false;"></div>
<div id="pp70" class="pp" style="display: none;" onclick="metro.checkStation(70); return false;"></div>
<div id="pp71" class="pp" style="display: none;" onclick="metro.checkStation(71); return false;"></div>
<div id="pp72" class="pp" style="display: none;" onclick="metro.checkStation(72); return false;"></div>
<div id="pp73" class="pp" style="display: none;" onclick="metro.checkStation(73); return false;"></div>
<div id="pp74" class="pp pp-b" style="display: none;" onclick="metro.checkStation(74); return false;"></div>
<div id="pp75" class="pp" style="display: none;" onclick="metro.checkStation(75); return false;"></div>
<div id="pp76" class="pp" style="display: none;" onclick="metro.checkStation(76); return false;"></div>

<div id="pp77" class="pp" style="display: none;" onclick="metro.checkStation(77); return false;"></div>
<div id="pp78" class="pp" style="display: none;" onclick="metro.checkStation(78); return false;"></div>
<div id="pp79" class="pp" style="display: none;" onclick="metro.checkStation(79); return false;"></div>
<div id="pp80" class="pp" style="display: none;" onclick="metro.checkStation(80); return false;"></div>
<div id="pp81" class="pp" style="display: none;" onclick="metro.checkStation(81); return false;"></div>
<!--  Underkonstruction
<div id="pp165" class="pp" style="display: none;"  onclick="metro.checkStation(165); return false;" ></div>
-->

<!-- Kalininskaya YELLOW -->

<!--  Underkonstruction
<div id="pp173" class="pp" style="display: none;"  onclick="metro.checkStation(173); return false;" ></div>
-->
<div id="pp82" class="pp" style="display: none;" onclick="metro.checkStation(82); return false;"></div>
<div id="pp83" class="pp" style="display: none;" onclick="metro.checkStation(83); return false;"></div>
<div id="pp84" class="pp" style="display: none;" onclick="metro.checkStation(84); return false;"></div>
<div id="pp85" class="pp" style="display: none;" onclick="metro.checkStation(85); return false;"></div>
<div id="pp86" class="pp" style="display: none;" onclick="metro.checkStation(86); return false;"></div>
<div id="pp87" class="pp" style="display: none;" onclick="metro.checkStation(87); return false;"></div>
<div id="pp88" class="pp" style="display: none;" onclick="metro.checkStation(88); return false;"><span class="pp"></span></div>

<!-- Serpuhovsko-timiryazevskaya GREY -->
<div id="pp135" class="pp" style="display: none;" onclick="metro.checkStation(135); return false;"></div>
<div id="pp131" class="pp" style="display: none;" onclick="metro.checkStation(131); return false;"></div>
<div id="pp111" class="pp" style="display: none;" onclick="metro.checkStation(111); return false;"></div>
<div id="pp112" class="pp" style="display: none;" onclick="metro.checkStation(112); return false;"></div>
<div id="pp113" class="pp" style="display: none;" onclick="metro.checkStation(113); return false;"></div>
<div id="pp114" class="pp" style="display: none;" onclick="metro.checkStation(114); return false;"></div>
<div id="pp115" class="pp" style="display: none;" onclick="metro.checkStation(115); return false;"></div>
<div id="pp116" class="pp" style="display: none;" onclick="metro.checkStation(116); return false;"></div>
<div id="pp117" class="pp" style="display: none;" onclick="metro.checkStation(117); return false;"></div>
<div id="pp118" class="pp" style="display: none;" onclick="metro.checkStation(118); return false;"></div>
<div id="pp119" class="pp" style="display: none;" onclick="metro.checkStation(119); return false;"></div>
<div id="pp120" class="pp" style="display: none;" onclick="metro.checkStation(120); return false;"></div>
<div id="pp121" class="pp" style="display: none;" onclick="metro.checkStation(121); return false;"></div>
<div id="pp122" class="pp" style="display: none;" onclick="metro.checkStation(122); return false;"></div>
<div id="pp123" class="pp" style="display: none;" onclick="metro.checkStation(123); return false;"></div>

<div id="pp124" class="pp" style="display: none;" onclick="metro.checkStation(124); return false;"></div>
<div id="pp125" class="pp" style="display: none;" onclick="metro.checkStation(125); return false;"></div>
<div id="pp126" class="pp" style="display: none;" onclick="metro.checkStation(126); return false;"></div>
<div id="pp127" class="pp" style="display: none;" onclick="metro.checkStation(127); return false;"></div>
<div id="pp128" class="pp" style="display: none;" onclick="metro.checkStation(128); return false;"></div>
<div id="pp129" class="pp" style="display: none;" onclick="metro.checkStation(129); return false;"></div>
<div id="pp130" class="pp" style="display: none;" onclick="metro.checkStation(130); return false;"></div>
<div id="pp155" class="pp" style="display: none;" onclick="metro.checkStation(155); return false;"></div>
<div id="pp156" class="pp" style="display: none;" onclick="metro.checkStation(156); return false;"></div>
<div id="pp172" class="pp" style="display: none;" onclick="metro.checkStation(172); return false;"><span class="pp"></span></div>

<!-- Lublinskaya LIGHT GREEN   -->

<!--  Underkonstruction
<div id="pp177" class="pp" style="display: none;"  onclick="metro.checkStation(177); return false;" ></div>
<div id="pp176" class="pp" style="display: none;"  onclick="metro.checkStation(176); return false;" ></div>
<div id="pp246" class="pp" style="display: none;"  onclick="metro.checkStation(246); return false;" ></div>
-->
<div id="pp175" class="pp" style="display: none;" onclick="metro.checkStation(175); return false;"></div>
<div id="pp174" class="pp" style="display: none;" onclick="metro.checkStation(174); return false;"></div>
<div id="pp137" class="pp" style="display: none;" onclick="metro.checkStation(137); return false;"></div>

<div id="pp138" class="pp" style="display: none;" onclick="metro.checkStation(138); return false;"></div>
<div id="pp139" class="pp" style="display: none;" onclick="metro.checkStation(139); return false;"></div>
<div id="pp140" class="pp" style="display: none;" onclick="metro.checkStation(140); return false;"></div>
<div id="pp144" class="pp" style="display: none;" onclick="metro.checkStation(144); return false;"></div>
<div id="pp141" class="pp" style="display: none;" onclick="metro.checkStation(141); return false;"></div>
<div id="pp142" class="pp" style="display: none;" onclick="metro.checkStation(142); return false;"></div>
<div id="pp143" class="pp" style="display: none;" onclick="metro.checkStation(143); return false;"></div>
<div id="pp145" class="pp" style="display: none;" onclick="metro.checkStation(145); return false;"></div>
<div id="pp146" class="pp" style="display: none;" onclick="metro.checkStation(146); return false;"></div>

<!-- Kakhovskaya -->
<div id="pp17" class="pp" style="display: none;" onclick="metro.checkStation(17); return false;"></div>
<div id="pp164" class="pp" style="display: none;" onclick="metro.checkStation(164); return false;"></div>

<!-- Butovskaya -->
<div id="pp178" class="pp" style="display: none;" onclick="metro.checkStation(178); return false;"></div>
<div id="pp179" class="pp" style="display: none;" onclick="metro.checkStation(179); return false;"></div>

<div id="pp180" class="pp" style="display: none;" onclick="metro.checkStation(180); return false;"></div>
<div id="pp181" class="pp" style="display: none;" onclick="metro.checkStation(181); return false;"></div>
<div id="pp182" class="pp" style="display: none;" onclick="metro.checkStation(182); return false;"></div>

<!-- All on line-->
<div id="pp1001" class="pp pp-z" style="display: none;"></div>
<div id="pp2001" class="pp" style="display: none;"></div>
<div id="pp1002" class="pp pp-z" style="display: none;"></div>
<div id="pp2002" class="pp" style="display: none;"></div>
<div id="pp1003" class="pp pp-z" style="display: none;"></div>
<div id="pp2003" class="pp" style="display: none;"></div>
<div id="pp1004" class="pp pp-z" style="display: none;"></div>
<div id="pp2004" class="pp" style="display: none;"></div>
<div id="pp1005" class="pp pp-z" style="display: none;"></div>
<div id="pp2005" class="pp" style="display: none;"></div>
<div id="pp1006" class="pp pp-z" style="display: none;"></div>
<div id="pp2006" class="pp" style="display: none;"></div>

<div id="pp1007" class="pp pp-z" style="display: none;"></div>
<div id="pp2007" class="pp" style="display: none;"><span class="pp"></span></div>
<div id="pp1008" class="pp pp-z" style="display: none;"></div>
<div id="pp2008" class="pp" style="display: none;"></div>
<div id="pp1009" class="pp pp-z" style="display: none;"></div>
<div id="pp2009" class="pp" style="display: none;"></div>
<div id="pp1010" class="pp pp-z" style="display: none;"></div>
<div id="pp2010" class="pp" style="display: none;"><span class="pp"></span></div>
<div id="pp1011" class="pp pp-z" style="display: none;"></div>
<div id="pp2011" class="pp" style="display: none;"></div>
<div id="pp1012" class="pp pp-z" style="display: none;"></div>
<div id="pp2012" class="pp" style="display: none;"></div>

</div>

<map name="metroMap">
  <!--
  <area  shape="rect" coords="098, 642, 110, 654" onclick="metro.checkStation(194); return false;" title="Боровское шоссе" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="098, 595, 110, 607" onclick="metro.checkStation(191); return false;" title="Вострякова" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="345, 134, 357, 146" onclick="metro.checkStation(187); return false;" title="Выставочный центр" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="098, 564, 110, 576" onclick="metro.checkStation(189); return false;" title="Никулинская" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="098, 658, 110, 670" onclick="metro.checkStation(195); return false;" title="Новопеределкино" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="098, 579, 110, 591" onclick="metro.checkStation(190); return false;" title="Олимпийская деревня" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="098, 626, 110, 638" onclick="metro.checkStation(193); return false;" title="Солнцево" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="269, 135, 281, 147" onclick="metro.checkStation(183); return false;" title="Тимиирязевская (лм)" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="098, 611, 110, 623" onclick="metro.checkStation(192); return false;" title="Терешково" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="305, 134, 317, 146" onclick="metro.checkStation(185); return false;" title="Телецентр" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="098, 545, 110, 557" onclick="metro.checkStation(196); return false;" title="Юго-Западная (лм)" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="324, 134, 336, 146" onclick="metro.checkStation(186); return false;" title="улица Академика Королева" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="288, 134, 300, 146" onclick="metro.checkStation(184); return false;" title="улица Милашенкова" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="311, 670, 323, 682" onclick="metro.checkStation(179); return false;" title="улица Скобелевская" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="365, 134, 377, 146" onclick="metro.checkStation(188); return false;" title="улица Эзенштейна" href="javascript: void(0);" alt="" />
  -->

  <!-- Sokol'nicheskaya red -->
  <area shape="rect" coords="496, 000, 594, 008" onclick="metro.checkStation(40); return false;" title="Улица Подбельского" href="javascript: void(0);" alt="">
  <area shape="rect" coords="495, 010, 565, 019" onclick="metro.checkStation(39); return false;" title="Черкизовская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="496, 020, 589, 028" onclick="metro.checkStation(38); return false;" title="Преображенская площадь" href="javascript: void(0);" alt="">
  <area shape="rect" coords="495, 040, 557, 049" onclick="metro.checkStation(37); return false;" title="Сокольники" href="javascript: void(0);" alt="">
  <area shape="rect" coords="496, 050, 574, 058" onclick="metro.checkStation(36); return false;" title="Красносельская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="391, 208, 470, 219" onclick="metro.checkStation(35); return false;" title="Комсомольская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="378, 222, 456, 231" onclick="metro.checkStation(34); return false;" title="Красные ворота" href="javascript: void(0);" alt="">
  <area shape="rect" coords="359, 240, 427, 249" onclick="metro.checkStation(33); return false;" title="Чистые пруды" href="javascript: void(0);" alt="">

  <area shape="rect" coords="289, 271, 339, 280" onclick="metro.checkStation(32); return false;" title="Лубянка" href="javascript: void(0);" alt="">
  <area shape="rect" coords="240, 305, 303, 316" onclick="metro.checkStation(31); return false;" title="Охотный ряд" href="javascript: void(0);" alt="">
  <area shape="rect" coords="240, 359, 346, 367" onclick="metro.checkStation(30); return false;" title="Библиотека имени В.И. Ленина" href="javascript: void(0);" alt="">
  <area shape="rect" coords="215, 385, 290, 394" onclick="metro.checkStation(29); return false;" title="Кропоткинская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="138, 396, 210, 409" onclick="metro.checkStation(28); return false;" title="Парк культуры" href="javascript: void(0);" alt="">
  <area shape="rect" coords="034, 555, 101, 562" onclick="metro.checkStation(27); return false;" title="Фрунзенская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="040, 565, 102, 573" onclick="metro.checkStation(26); return false;" title="Спортивная" href="javascript: void(0);" alt="">
  <area shape="rect" coords="024, 574, 101, 583" onclick="metro.checkStation(157); return false;" title="Воробъевы горы" href="javascript: void(0);" alt="">
  <area shape="rect" coords="040, 585, 102, 593" onclick="metro.checkStation(25); return false;" title="Университет" href="javascript: void(0);" alt="">

  <area shape="rect" coords="019, 595, 101, 604" onclick="metro.checkStation(24); return false;" title="Проспект Вернадского" href="javascript: void(0);" alt="">
  <area shape="rect" coords="031, 612, 104, 625" onclick="metro.checkStation(23); return false;" title="Юго-Западная" href="javascript: void(0);" alt="">

  <!-- Zamoskvoreckaya GREEN -->
  <area shape="rect" coords="133, 010, 207, 021" onclick="metro.checkStation(1); return false;" title="Речной вокзал" href="javascript: void(0);" alt="">
  <area shape="rect" coords="127, 020, 207, 029" onclick="metro.checkStation(2); return false;" title="Водный стадион" href="javascript: void(0);" alt="">
  <area shape="rect" coords="142, 031, 207, 039" onclick="metro.checkStation(3); return false;" title="Войковская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="172, 040, 204, 049" onclick="metro.checkStation(4); return false;" title="Сокол" href="javascript: void(0);" alt="">
  <area shape="rect" coords="157, 050, 205, 057" onclick="metro.checkStation(5); return false;" title="Аэропорт" href="javascript: void(0);" alt="">

  <area shape="rect" coords="164, 061, 205, 069" onclick="metro.checkStation(6); return false;" title="Динамо" href="javascript: void(0);" alt="">
  <area shape="rect" coords="169, 186, 242, 201" onclick="metro.checkStation(7); return false;" title="Белорусская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="235, 215, 300, 224" onclick="metro.checkStation(8); return false;" title="Маяковская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="232, 240, 290, 255" onclick="metro.checkStation(9); return false;" title="Тверская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="248, 314, 315, 326" onclick="metro.checkStation(10); return false;" title="Театральная" href="javascript: void(0);" alt="">
  <area shape="rect" coords="338, 339, 404, 360" onclick="metro.checkStation(11); return false;" title="Новокузнецкая" href="javascript: void(0);" alt="">
  <area shape="rect" coords="390, 400, 451, 411" onclick="metro.checkStation(12); return false;" title="Павелецкая" href="javascript: void(0);" alt="">
  <area shape="rect" coords="396, 441, 471, 451" onclick="metro.checkStation(13); return false;" title="Автозаводская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="397, 451, 466, 458" onclick="metro.checkStation(14); return false;" title="Коломенская" href="javascript: void(0);" alt="">

  <area shape="rect" coords="394, 461, 454, 472" onclick="metro.checkStation(15); return false;" title="Каширская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="323, 574, 404, 583" onclick="metro.checkStation(18); return false;" title="Кантемировская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="353, 585, 405, 594" onclick="metro.checkStation(19); return false;" title="Царицыно" href="javascript: void(0);" alt="">
  <area shape="rect" coords="355, 595, 404, 604" onclick="metro.checkStation(20); return false;" title="Орехово" href="javascript: void(0);" alt="">
  <area shape="rect" coords="331, 605, 404, 614" onclick="metro.checkStation(21); return false;" title="Домодедовская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="309, 620, 403, 630" onclick="metro.checkStation(22); return false;" title="Красногвардейская" href="javascript: void(0);" alt="">

  <!-- Arbatsko - pokrovskaya -->
  <area shape="rect" coords="023, 137, 057, 144" onclick="metro.checkStation(166); return false;" title="Митино" href="javascript: void(0);" alt="">

  <area shape="rect" coords="023, 157, 092, 165" onclick="metro.checkStation(170); return false;" title="Мякининская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="022, 147, 104, 155" onclick="metro.checkStation(167); return false;" title="Волокаламская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="023, 167, 069, 175" onclick="metro.checkStation(168); return false;" title="Строгино" href="javascript: void(0);" alt="">
  <area shape="rect" coords="023, 177, 085, 185" onclick="metro.checkStation(62); return false;" title="Крылатское" href="javascript: void(0);" alt="">
  <area shape="rect" coords="023, 187, 088, 195" onclick="metro.checkStation(61); return false;" title="Молодежная" href="javascript: void(0);" alt="">
  <area shape="rect" coords="015, 283, 077, 298" onclick="metro.checkStation(169); return false;" title="Славянский бульвар" href="javascript: void(0);" alt="">
  <area shape="rect" coords="053, 326, 119, 336" onclick="metro.checkStation(171); return false;" title="Парк победы" href="javascript: void(0);" alt="">
  <area shape="rect" coords="161, 318, 196, 337" onclick="metro.checkStation(52); return false;" title="Киевская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="127, 342, 187, 350" onclick="metro.checkStation(160); return false;" title="Смоленская (ап)" href="javascript: void(0);" alt="">

  <area shape="rect" coords="188, 369, 243, 376" onclick="metro.checkStation(159); return false;" title="Арбатская (ап)" href="javascript: void(0);" alt="">
  <area shape="rect" coords="313, 324, 415, 331" onclick="metro.checkStation(49); return false;" title="Площадь революции" href="javascript: void(0);" alt="">
  <area shape="rect" coords="425, 265, 474, 276" onclick="metro.checkStation(48); return false;" title="Курская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="515, 179, 581, 187" onclick="metro.checkStation(47); return false;" title="Бауманская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="515, 169, 606, 176" onclick="metro.checkStation(46); return false;" title="Электрозаводская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="515, 159, 579, 167" onclick="metro.checkStation(45); return false;" title="Семеновская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="515, 139, 585, 148" onclick="metro.checkStation(44); return false;" title="Партизанская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="515, 129, 585, 136" onclick="metro.checkStation(43); return false;" title="Измайловская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="515, 119, 588, 127" onclick="metro.checkStation(42); return false;" title="Первомайская" href="javascript: void(0);" alt="">

  <area shape="rect" coords="515, 108, 580, 118" onclick="metro.checkStation(41); return false;" title="Щелковская" href="javascript: void(0);" alt="">

  <!-- Filevskaya light-blue -->
  <area shape="rect" coords="021, 210, 087, 222" onclick="metro.checkStation(60); return false;" title="Кунцевская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="037, 227, 099, 235" onclick="metro.checkStation(59); return false;" title="Пионерская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="048, 237, 126, 245" onclick="metro.checkStation(58); return false;" title="Филевский парк" href="javascript: void(0);" alt="">
  <area shape="rect" coords="058, 247, 145, 255" onclick="metro.checkStation(57); return false;" title="Багратионовская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="067, 256, 099, 265" onclick="metro.checkStation(56); return false;" title="Фили" href="javascript: void(0);" alt="">
  <area shape="rect" coords="078, 267, 144, 275" onclick="metro.checkStation(55); return false;" title="Кутузовская" href="javascript: void(0);" alt="">

  <area shape="rect" coords="087, 277, 157, 285" onclick="metro.checkStation(54); return false;" title="Студенческая" href="javascript: void(0);" alt="">
  <area shape="rect" coords="134, 287, 214, 296" onclick="metro.checkStation(163); return false;" title="Международная" href="javascript: void(0);" alt="">
  <area shape="rect" coords="134, 298, 205, 306" onclick="metro.checkStation(162); return false;" title="Выставочная" href="javascript: void(0);" alt="">
  <area shape="rect" coords="197, 328, 258, 336" onclick="metro.checkStation(161); return false;" title="Смоленская (ф)" href="javascript: void(0);" alt="">
  <area shape="rect" coords="212, 343, 267, 351" onclick="metro.checkStation(158); return false;" title="Арбатская (ф)" href="javascript: void(0);" alt="">
  <area shape="rect" coords="132, 357, 237, 367" onclick="metro.checkStation(53); return false;" title="Александровский сад" href="javascript: void(0);" alt="">

  <!-- Kol'tsevaya BROWN -->
  <area shape="rect" coords="294, 435, 370, 445" onclick="metro.checkStation(132); return false;" title="Добрынинская" href="javascript: void(0);" alt="">

  <area shape="rect" coords="107, 219, 203, 228" onclick="metro.checkStation(133); return false;" title="Краснопресненская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="193, 173, 281, 184" onclick="metro.checkStation(134); return false;" title="Новослободская" href="javascript: void(0);" alt="">

  <!-- Kaluzhsko-rizhskaya -->
  <area shape="rect" coords="395, 010, 457, 020" onclick="metro.checkStation(110); return false;" title="Медведково" href="javascript: void(0);" alt="">
  <area shape="rect" coords="395, 020, 466, 030" onclick="metro.checkStation(109); return false;" title="Бабушкинская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="395, 030, 444, 040" onclick="metro.checkStation(108); return false;" title="Свиблово" href="javascript: void(0);" alt="">
  <area shape="rect" coords="395, 040, 478, 050" onclick="metro.checkStation(107); return false;" title="Ботанический сад" href="javascript: void(0);" alt="">
  <area shape="rect" coords="395, 050, 432, 060" onclick="metro.checkStation(106); return false;" title="ВДНХ" href="javascript: void(0);" alt="">

  <area shape="rect" coords="395, 060, 464, 070" onclick="metro.checkStation(105); return false;" title="Алексеевская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="395, 071, 442, 080" onclick="metro.checkStation(104); return false;" title="Рижская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="357, 183, 432, 192" onclick="metro.checkStation(136); return false;" title="Проспект Мира" href="javascript: void(0);" alt="">
  <area shape="rect" coords="303, 209, 367, 217" onclick="metro.checkStation(102); return false;" title="Сухаревская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="357, 257, 428, 264" onclick="metro.checkStation(103); return false;" title="Тургеневская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="360, 298, 425, 308" onclick="metro.checkStation(74); return false;" title="Китай-город" href="javascript: void(0);" alt="">
  <area shape="rect" coords="190, 429, 257, 439" onclick="metro.checkStation(100); return false;" title="Октябрьская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="135, 495, 205, 504" onclick="metro.checkStation(99); return false;" title="Шаболовская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="134, 505, 205, 514" onclick="metro.checkStation(98); return false;" title="Ленинский проспект" href="javascript: void(0);" alt="">

  <area shape="rect" coords="128, 525, 205, 533" onclick="metro.checkStation(97); return false;" title="Академическая" href="javascript: void(0);" alt="">
  <area shape="rect" coords="138, 535, 205, 543" onclick="metro.checkStation(96); return false;" title="Профсоюзная" href="javascript: void(0);" alt="">
  <area shape="rect" coords="123, 545, 206, 554" onclick="metro.checkStation(95); return false;" title="Новые черемушки" href="javascript: void(0);" alt="">
  <area shape="rect" coords="149, 565, 205, 575" onclick="metro.checkStation(94); return false;" title="Калужская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="162, 575, 205, 585" onclick="metro.checkStation(93); return false;" title="Беляево" href="javascript: void(0);" alt="">
  <area shape="rect" coords="156, 585, 205, 595" onclick="metro.checkStation(92); return false;" title="Коньково" href="javascript: void(0);" alt="">
  <area shape="rect" coords="145, 595, 205, 603" onclick="metro.checkStation(91); return false;" title="Теплый стан" href="javascript: void(0);" alt="">
  <area shape="rect" coords="160, 605, 205, 613" onclick="metro.checkStation(90); return false;" title="Ясенево" href="javascript: void(0);" alt="">
  <area shape="rect" coords="125, 615, 208, 624" onclick="metro.checkStation(89); return false;" title="Новоясеневская" href="javascript: void(0);" alt="">

  <!-- Tagansko-Krasnopresnenskaya violet -->
  <area shape="rect" coords="132, 089, 191, 097" onclick="metro.checkStation(63); return false;" title="Планерная" href="javascript: void(0);" alt="">
  <area shape="rect" coords="123, 099, 191, 107" onclick="metro.checkStation(64); return false;" title="Сходненская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="134, 109, 191, 117" onclick="metro.checkStation(65); return false;" title="Тушинская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="129, 119, 191, 127" onclick="metro.checkStation(66); return false;" title="Щукинская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="103, 129, 191, 137" onclick="metro.checkStation(67); return false;" title="Октябрьское поле" href="javascript: void(0);" alt="">
  <area shape="rect" coords="118, 139, 191, 147" onclick="metro.checkStation(68); return false;" title="Полежаевская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="146, 149, 191, 157" onclick="metro.checkStation(69); return false;" title="Беговая" href="javascript: void(0);" alt="">

  <area shape="rect" coords="115, 159, 191, 167" onclick="metro.checkStation(70); return false;" title="Улица 1905 года" href="javascript: void(0);" alt="">
  <area shape="rect" coords="125, 208, 194, 217" onclick="metro.checkStation(71); return false;" title="Баррикадная" href="javascript: void(0);" alt="">
  <area shape="rect" coords="174, 252, 237, 263" onclick="metro.checkStation(72); return false;" title="Пушкинская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="254, 262, 331, 270" onclick="metro.checkStation(73); return false;" title="Кузнецкий мост" href="javascript: void(0);" alt="">
  <area shape="rect" coords="419, 358, 475, 368" onclick="metro.checkStation(75); return false;" title="Таганская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="460, 400, 538, 410" onclick="metro.checkStation(76); return false;" title="Пролетарская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="495, 555, 589, 565" onclick="metro.checkStation(77); return false;" title="Волгоградский проспект" href="javascript: void(0);" alt="">
  <area shape="rect" coords="495, 575, 565, 583" onclick="metro.checkStation(78); return false;" title="Текстильщики" href="javascript: void(0);" alt="">
  <area shape="rect" coords="495, 585, 550, 593" onclick="metro.checkStation(79); return false;" title="Кузьминки" href="javascript: void(0);" alt="">

  <area shape="rect" coords="495, 595, 595, 605" onclick="metro.checkStation(80); return false;" title="Рязанский проспект" href="javascript: void(0);" alt="">
  <area shape="rect" coords="495, 615, 540, 624" onclick="metro.checkStation(81); return false;" title="Выхино" href="javascript: void(0);" alt="">
  <!--  Underkonstruction
  <area  shape="rect" coords="495, 625, 550, 632" onclick="metro.checkStation(165); return false;" title="Pronskaya" href="javascript: void(0);" alt="" />
  -->

  <!-- Kalininskaya YELLOW -->

  <!--  Underkonstruction
  <area  shape="rect" coords="515, 209, 573, 217" onclick="metro.checkStation(173); return false;" title="Novokosino" href="javascript: void(0);" alt="" />
  -->
  <area shape="rect" coords="515, 219, 576, 227" onclick="metro.checkStation(82); return false;" title="Новогиреево" href="javascript: void(0);" alt="">
  <area shape="rect" coords="515, 229, 555, 237" onclick="metro.checkStation(83); return false;" title="Перово" href="javascript: void(0);" alt="">
  <area shape="rect" coords="515, 239, 605, 248" onclick="metro.checkStation(84); return false;" title="Шоссе энтузиастов" href="javascript: void(0);" alt="">

  <area shape="rect" coords="515, 259, 588, 267" onclick="metro.checkStation(85); return false;" title="Авиамоторная" href="javascript: void(0);" alt="">
  <area shape="rect" coords="460, 310, 548, 322" onclick="metro.checkStation(86); return false;" title="Площадь Ильича" href="javascript: void(0);" alt="">
  <area shape="rect" coords="422, 345, 500, 355" onclick="metro.checkStation(87); return false;" title="Марксистская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="262, 350, 337, 358" onclick="metro.checkStation(88); return false;" title="Третьяковская" href="javascript: void(0);" alt="">

  <!-- Serpuhovsko-timiryazevskaya GREY -->
  <area shape="rect" coords="322, 010, 374, 020" onclick="metro.checkStation(135); return false;" title="Алтуфьево" href="javascript: void(0);" alt="">
  <area shape="rect" coords="322, 020, 372, 028" onclick="metro.checkStation(131); return false;" title="Бибирево" href="javascript: void(0);" alt="">
  <area shape="rect" coords="322, 030, 375, 038" onclick="metro.checkStation(111); return false;" title="Отрадное" href="javascript: void(0);" alt="">

  <area shape="rect" coords="322, 040, 379, 048" onclick="metro.checkStation(112); return false;" title="Владыкино" href="javascript: void(0);" alt="">
  <area shape="rect" coords="239, 079, 305, 096" onclick="metro.checkStation(113); return false;" title="Петровско-разумовская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="205, 119, 280, 127" onclick="metro.checkStation(114); return false;" title="Тимирязевская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="212, 129, 280, 137" onclick="metro.checkStation(115); return false;" title="Дмитровская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="216, 139, 280, 147" onclick="metro.checkStation(116); return false;" title="Савеловская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="204, 162, 281, 170" onclick="metro.checkStation(117); return false;" title="Менделеевская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="252, 190, 300, 207" onclick="metro.checkStation(118); return false;" title="Цветной бульвар" href="javascript: void(0);" alt="">
  <area shape="rect" coords="241, 253, 300, 261" onclick="metro.checkStation(119); return false;" title="Чеховская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="247, 368, 310, 378" onclick="metro.checkStation(120); return false;" title="Боровицкая" href="javascript: void(0);" alt="">

  <area shape="rect" coords="296, 419, 345, 427" onclick="metro.checkStation(121); return false;" title="Полянка" href="javascript: void(0);" alt="">
  <area shape="rect" coords="294, 447, 378, 458" onclick="metro.checkStation(122); return false;" title="Серпуховская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="257, 497, 304, 505" onclick="metro.checkStation(123); return false;" title="Тульская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="239, 507, 304, 515" onclick="metro.checkStation(124); return false;" title="Нагатинская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="254, 517, 304, 525" onclick="metro.checkStation(125); return false;" title="Нагорная" href="javascript: void(0);" alt="">
  <area shape="rect" coords="221, 527, 304, 539" onclick="metro.checkStation(126); return false;" title="Нахимовский проспект" href="javascript: void(0);" alt="">
  <area shape="rect" coords="220, 542, 304, 552" onclick="metro.checkStation(127); return false;" title="Севастопольская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="235, 575, 304, 583" onclick="metro.checkStation(128); return false;" title="Чертановская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="265, 585, 304, 593" onclick="metro.checkStation(129); return false;" title="Южная" href="javascript: void(0);" alt="">

  <area shape="rect" coords="250, 595, 304, 603" onclick="metro.checkStation(130); return false;" title="Пражская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="242, 605, 304, 613" onclick="metro.checkStation(155); return false;" title="Улица академика Янгеля" href="javascript: void(0);" alt="">
  <area shape="rect" coords="263, 624, 304, 633" onclick="metro.checkStation(156); return false;" title="Аннино" href="javascript: void(0);" alt="">
  <area shape="rect" coords="238, 640, 308, 657" onclick="metro.checkStation(172); return false;" title="Бульвар Дмитрия Донского" href="javascript: void(0);" alt="">

  <!-- Lublinskaya light green  -->

  <!--  Underkonstruction
  <area  shape="rect" coords="322, 139, 403, 146" onclick="metro.checkStation(177); return false;" title="Maryina roshcha" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="320, 159, 398, 170" onclick="metro.checkStation(176); return false;" title="Dostoyevskaya" href="javascript: void(0);" alt="" />
  <area  shape="rect" coords="321, 172, 422, 181" onclick="metro.checkStation(197); return false;" title="Ploshcad Suvorova" href="javascript: void(0);" alt="" />
  -->
  <area shape="rect" coords="302, 192, 348, 202" onclick="metro.checkStation(175); return false;" title="Трубная" href="javascript: void(0);" alt="">
  <area shape="rect" coords="369, 246, 460, 255" onclick="metro.checkStation(174); return false;" title="Сретенский бульвар" href="javascript: void(0);" alt="">

  <area shape="rect" coords="427, 278, 493, 287" onclick="metro.checkStation(137); return false;" title="Чкаловская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="461, 324, 512, 332" onclick="metro.checkStation(138); return false;" title="Римская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="460, 387, 572, 396" onclick="metro.checkStation(139); return false;" title="Крестьянская застава" href="javascript: void(0);" alt="">
  <area shape="rect" coords="413, 525, 464, 533" onclick="metro.checkStation(140); return false;" title="Дубровка" href="javascript: void(0);" alt="">
  <area shape="rect" coords="413, 535, 485, 543" onclick="metro.checkStation(144); return false;" title="Кожуховская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="413, 545, 466, 553" onclick="metro.checkStation(141); return false;" title="Печатники" href="javascript: void(0);" alt="">
  <area shape="rect" coords="413, 555, 463, 563" onclick="metro.checkStation(142); return false;" title="Волжская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="413, 565, 458, 573" onclick="metro.checkStation(143); return false;" title="Люблино" href="javascript: void(0);" alt="">
  <area shape="rect" coords="413, 575, 489, 583" onclick="metro.checkStation(145); return false;" title="Братиславская" href="javascript: void(0);" alt="">

  <area shape="rect" coords="413, 585, 460, 593" onclick="metro.checkStation(146); return false;" title="Марьино" href="javascript: void(0);" alt="">

  <!-- Kakhovskaya -->
  <area shape="rect" coords="307, 542, 366, 552" onclick="metro.checkStation(17); return false;" title="Каховская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="371, 487, 432, 494" onclick="metro.checkStation(164); return false;" title="Варшавская" href="javascript: void(0);" alt="">

  <!-- Butovskaya -->
  <area shape="rect" coords="295, 658, 415, 667" onclick="metro.checkStation(178); return false;" title="Улица Старокачаловская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="295, 675, 395, 683" onclick="metro.checkStation(179); return false;" title="Улица Скобелевская" href="javascript: void(0);" alt="">
  <area shape="rect" coords="295, 685, 403, 693" onclick="metro.checkStation(180); return false;" title="Бульвар Адмирала Ушакова" href="javascript: void(0);" alt="">

  <area shape="rect" coords="295, 695, 378, 703" onclick="metro.checkStation(181); return false;" title="Улица Горчакова" href="javascript: void(0);" alt="">
  <area shape="rect" coords="295, 705, 381, 713" onclick="metro.checkStation(182); return false;" title="Бунинская аллея" href="javascript: void(0);" alt="">

  <!-- All stations on the line -->
  <area shape="rect" id="m1" coords="037, 763, 118, 769" onclick="metro.checkLine(this); " title="Сокольническая" href="javascript: void(0);" alt="">
  <area shape="rect" id="m2" coords="037, 773, 126, 781" onclick="metro.checkLine(this); " title="Замоскворецкая" href="javascript: void(0);" alt="">
  <area shape="rect" id="m3" coords="037, 783, 145, 791" onclick="metro.checkLine(this); " title="Арбатско-покровская" href="javascript: void(0);" alt="">
  <area shape="rect" id="m4" coords="037, 795, 093, 802" onclick="metro.checkLine(this); " title="Филевская" href="javascript: void(0);" alt="">
  <area shape="rect" id="m5" coords="148, 762, 209, 770" onclick="metro.checkLine(this); " title="Кольцевая" href="javascript: void(0);" alt="">

  <area shape="rect" id="m6" coords="149, 772, 248, 781" onclick="metro.checkLine(this); " title="Калужско-рижская" href="javascript: void(0);" alt="">
  <area shape="rect" id="m7" coords="149, 784, 289, 792" onclick="metro.checkLine(this); " title="Таганско-краснопресненская" href="javascript: void(0);" alt="">
  <area shape="rect" id="m8" coords="148, 795, 213, 803" onclick="metro.checkLine(this); " title="Калининская" href="javascript: void(0);" alt="">
  <area shape="rect" id="m9" coords="293, 762, 434, 770" onclick="metro.checkLine(this); " title="Серпуховско-тимирязевская" href="javascript: void(0);" alt="">
  <area shape="rect" id="m10" coords="293, 773, 358, 780" onclick="metro.checkLine(this); " title="Люблинская" href="javascript: void(0);" alt="">
  <area shape="rect" id="m11" coords="292, 785, 358, 792" onclick="metro.checkLine(this); " title="Каховская" href="javascript: void(0);" alt="">
  <area shape="rect" id="m12" coords="293, 796, 353, 802" onclick="metro.checkLine(this); " title="Бутовская" href="javascript: void(0);" alt="">

</map>
      <div class="btn btn-select">
        <input value="" class="search-submit select-submit" type="submit">

        <a href="javascript: void(0);" class="reset-btn"><span class="dashed-b17">Сброс</span></a>
      </div>

</div>
</body>
</html>