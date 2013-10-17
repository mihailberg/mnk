/* 
Database: `s536`
Date: 2012-02-25 21:05
*/


DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
`commentID` int(11) NOT NULL AUTO_INCREMENT,
`title` varchar(255) NOT NULL,
`landID` int(11) NOT NULL,
`comment` text NOT NULL,
`approved` tinyint(2) NOT NULL DEFAULT '0',
primary key(commentID)
);

INSERT INTO `comment` (commentID, title, landID, comment, approved)
VALUES ('1', 'Тестовый коммент', '156', '', '1');
INSERT INTO `comment` (commentID, title, landID, comment, approved)
VALUES ('2', 'asdasd', '156', 'asdas', '1');
INSERT INTO `comment` (commentID, title, landID, comment, approved)
VALUES ('6', 'ASDASDAS', '156', 'DASDASD', '0');


DROP TABLE IF EXISTS `highway`;

CREATE TABLE `highway` (
`highwayID` int(11) NOT NULL AUTO_INCREMENT,
`title` varchar(200) NOT NULL,
primary key(highwayID)
);

INSERT INTO `highway` (highwayID, title)
VALUES ('1', 'Выберите значене');
INSERT INTO `highway` (highwayID, title)
VALUES ('14', 'Каширское');
INSERT INTO `highway` (highwayID, title)
VALUES ('3', 'Симферопольское');
INSERT INTO `highway` (highwayID, title)
VALUES ('4', 'Киевское');
INSERT INTO `highway` (highwayID, title)
VALUES ('5', 'Калужское');
INSERT INTO `highway` (highwayID, title)
VALUES ('6', 'Минское');
INSERT INTO `highway` (highwayID, title)
VALUES ('7', 'Новорижское');
INSERT INTO `highway` (highwayID, title)
VALUES ('8', 'Ленинградское');
INSERT INTO `highway` (highwayID, title)
VALUES ('9', 'Дмитровское');
INSERT INTO `highway` (highwayID, title)
VALUES ('10', 'Рублево-Успенсоке');
INSERT INTO `highway` (highwayID, title)
VALUES ('11', 'Можайское');
INSERT INTO `highway` (highwayID, title)
VALUES ('12', 'Ярославское');
INSERT INTO `highway` (highwayID, title)
VALUES ('13', 'Пятницкое');
INSERT INTO `highway` (highwayID, title)
VALUES ('15', 'Новорязанское');
INSERT INTO `highway` (highwayID, title)
VALUES ('16', 'Горьковское');
INSERT INTO `highway` (highwayID, title)
VALUES ('17', 'Егорьевское');


DROP TABLE IF EXISTS `land`;

CREATE TABLE `land` (
`landID` int(11) unsigned NOT NULL AUTO_INCREMENT,
`location_view` tinyint(4) NOT NULL DEFAULT '0',
`location_direction` tinyint(4) NOT NULL DEFAULT '0',
`location_square` float(5,2) NOT NULL DEFAULT '0.00',
`region_centerID` int(11) NOT NULL DEFAULT '0',
`location_mkad_remoteness` float(5,2) NOT NULL DEFAULT '0.00',
`location_region_center_remoteness` float(5,2) NOT NULL DEFAULT '0.00',
`communication_gas` tinyint(4) NOT NULL DEFAULT '0',
`communication_electricity` tinyint(4) NOT NULL DEFAULT '0',
`communication_water` tinyint(4) NOT NULL DEFAULT '0',
`communication_sewage` tinyint(4) NOT NULL DEFAULT '0',
`communication_road` tinyint(4) NOT NULL DEFAULT '0',
`communication_fence` tinyint(4) NOT NULL DEFAULT '0',
`infrastructure_region_center_remoteness` float(5,2) NOT NULL DEFAULT '0.00',
`infrastructure_shop` float(5,2) NOT NULL DEFAULT '0.00',
`infrastructure_garbage` float(5,2) NOT NULL DEFAULT '0.00',
`infrastructure_clinic` float(5,2) NOT NULL DEFAULT '0.00',
`transport_bus_station` varchar(200) NOT NULL,
`transport_bus_station_remotness` float(5,2) NOT NULL DEFAULT '0.00',
`transport_train_station` varchar(200) NOT NULL,
`transport_train_station_remotness` float(5,2) NOT NULL DEFAULT '0.00',
`ecology_forest` float(5,2) NOT NULL DEFAULT '0.00',
`ecology_water` float(5,2) NOT NULL DEFAULT '0.00',
`landscape_smooth` tinyint(1) NOT NULL DEFAULT '0',
`landscape_elevation` tinyint(1) NOT NULL DEFAULT '0',
`landscape_lowland` tinyint(1) NOT NULL DEFAULT '0',
`landscape_trees` tinyint(1) NOT NULL DEFAULT '0',
`landscape_fruit_garden` tinyint(1) NOT NULL DEFAULT '0',
`landscape_design` tinyint(1) NOT NULL DEFAULT '0',
`landscape_pool` tinyint(1) NOT NULL DEFAULT '0',
`documents` text NOT NULL,
`buildings_house` tinyint(1) NOT NULL DEFAULT '0',
`buildings_bath` tinyint(1) NOT NULL DEFAULT '0',
`buildings_arbor` tinyint(1) NOT NULL DEFAULT '0',
`buildings_supply` tinyint(1) NOT NULL DEFAULT '0',
`buildings_garage` tinyint(1) NOT NULL DEFAULT '0',
`buildings_foundation` tinyint(1) NOT NULL DEFAULT '0',
`comment` text NOT NULL,
`image_1` varchar(200) NOT NULL,
`image_2` varchar(200) NOT NULL,
`image_3` varchar(200) NOT NULL,
`image_4` varchar(200) NOT NULL,
`image_5` varchar(200) NOT NULL,
`image_6` varchar(200) NOT NULL,
`image_7` varchar(200) NOT NULL,
`image_8` varchar(200) NOT NULL,
`image_9` varchar(200) NOT NULL,
`image_10` varchar(200) NOT NULL,
`owner_price` double(15,2) NOT NULL DEFAULT '0.00',
`owner_contacts` text NOT NULL,
`owner_state` tinyint(4) NOT NULL DEFAULT '0',
`owner_advertisement` text NOT NULL,
`userID` int(11) NOT NULL DEFAULT '0',
`latitude` varchar(20),
`longitude` varchar(20),
primary key(landID)
);

INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('48', '1', '6', '26.00', '15', '97.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '1', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Дом в КП “Рузские просторы”', '/_files/129909070843.gif', '/_files/129909066434.jpg', '/_files/129909066498.jpg', '/_files/129909066484.jpg', '/_files/129909046446.jpg', '', '', '', '', '', '13700000.00', '', '0', '<p>
	Продаётся готовый дом в 2 этажа площадью 153,3 кв.м. в 97 км от МКАД по Минскому шоссе. Дом выполнен из клееного бруса 190 х180, кровля из мягкой битумной черепицы, окна- деревянные стеклопакеты. На первом этаже: котельная, кухня, гостиная, с/ у, парная, душевая, кабинет, веранда; на втором этаже: 3 спальни, с/у, балкон. В дом заведены все необходимые коммуникации: газ, электричество (0,5 кВт на сотку), водопровод, канализация. Дом под ключ. Участок 26,02 соток прилегает к лесу, огорожен забором, есть калитка в лес.</p>
', '4', '55.756870	', '36.101750');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('49', '1', '6', '26.73', '15', '97.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Дом 210 кв.м в КП “Рузские просторы”', '/_files/129909304578.gif', '/_files/129909304589.jpg', '/_files/129909304567.jpg', '/_files/129909304517.jpg', '/_files/129909304557.jpg', '', '', '', '', '', '11200000.00', '', '0', '<p>
	Шикарный дом в 2 этажа площадью 210 кв.м в коттеджном посёлке &laquo;Рузские просторы&raquo; в 97 км от МКАД по Минскому шоссе. Красивейший дом под чистовую отделку, кровля из мягкой битумной черепицы, стены представляют собой трёхслойную конструкцию: газобетонные блоки, утеплитель- минеральные плиты, штукатурная облицовка снаружи, окна- двухслойный стеклопакет. На первом этаже: тех. помещение, с/у , кабинет , веранда, гостиная, столовая , кухня, кладовая, гараж; на втором этаже: холл, 2 с/у , 2спальни. Участок 26,73 сотки огорожен забором, граничит с лесным массивом.</p>
', '4', '55.756870', '36.101745');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('46', '1', '6', '26.48', '15', '97.00', '9.00', '0', '0', '0', '0', '0', '4', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '1', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Дом из лиственицы в КП “Рузские просторы”', '/_files/129907580547.gif', '/_files/129907580566.jpg', '/_files/129907580578.jpg', '/_files/129907580542.jpg', '/_files/129907580559.jpg', '/_files/129907580594.jpg', '/_files/129907580573.jpg', '/_files/129907580543.jpg', '/_files/129907580534.jpg', '/_files/129907580549.jpg', '18200000.00', '', '3', '<p>
	Продаётся обустроенный двухэтажный дом 293 кв.м. на участке 26,48 соток в коттеджном посёлке &laquo;Рузские просторы&raquo;. Дом выполнен из лиственницы, материал стен- бревно,диаметром 210 мм, кровля из мягкой битумной черепицы, окна- двухкамерный стеклопакет. На первом этаже: прихожая, котельная, кабинет, каминная, столовая, сауна, просторная кухня, терраса, с/у; на втором: три спальни, гардеробная, 2 с/у, коридор. Дом продается полностью под ключ, полностью готов к проживанию. Участок огорожен забором, расположен в красивейшей местности рядом с лесом.</p>
', '4', '55.756873', '36.101761');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('47', '1', '6', '25.00', '15', '97.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '1', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Коттежд на берегу рузского водохранилища', '/_files/129907691473.gif', '/_files/129907691424.jpg', '/_files/129907691425.jpg', '/_files/129907691490.jpg', '/_files/129907691409.jpg', '/_files/129907691498.jpg', '', '', '', '', '10400000.00', '', '3', '', '4', '55.756872	', '36.101758');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('50', '1', '10', '45.00', '0', '14.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Кирпичный коттедж площадью 476 кв.м. расположен в 14 км от МКАД по Минскому и в 23 км по Рублёво-Успенскому ш.', '/_files/131227751838.gif', '/_files/130735071774.jpg', '/_files/130735071768.jpg', '/_files/129909354728.jpg', '/_files/129909354704.jpg', '/_files/129909354703.jpg', '/_files/129909354738.jpg', '/_files/129909354744.jpg', '/_files/129909354727.jpg', '/_files/129909354797.jpg', '115000000.00', '', '0', '<p>
	Цена:&nbsp;3 700 000$.<br />
	&nbsp;</p>
<p>
	Кирпичный коттедж площадью 476 кв.м. расположен в 14 км от МКАД по Минскому и в 23 км по Рублёво-Успенскому ш., на 1-ом Успенском ш. в коттеджном поселке между Юдино и Лапино. Фундамент дома- ленточный ж/б, кровля- катепал, окна- двухкамерные стеклопакеты. Заведены все центральные коммуникации. В доме имеется цоколь с котельной, постирочной, с/у, сауной, комнатой отдыха, бильярдной. На первом этаже гардероб, кухня- столовая, каминный зал, гараж на 2 авто, кладовые, гостиная; на втором этаже: 3 спальни, лоджия, гардероб, балкон. Участок лесной с вековыми соснами площадью 45 соток, находится в угловой части посёлка, на участке выполнен ландшафтный дизайн, имеются 2 беседки, вольер, гостевой дом из оцилиндрованного бревна площадью 102 кв.м., а также бассейн 105 кв.м. Участок оборудован видеокамерами, дом имеет сигнализацию, выведенную на дом охраны, оборудован авт. системой полива.Коттедж продаётся полностью под ключ с мебелью.</p>
', '4', '55.682811', '37.150183');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('51', '1', '10', '55.00', '0', '9.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Два дома с участком в престижнейшем поселке 9 км по Рублево-Успенскому шоссе', '/_files/129909430381.gif', '/_files/130735089257.jpg', '/_files/130735089287.jpg', '/_files/130735089265.jpg', '/_files/130735089249.jpg', '/_files/129909430352.jpg', '/_files/129909430357.jpg', '/_files/129909430303.jpg', '/_files/129909430314.jpg', '/_files/129909430352.jpg', '434000000.00', '', '0', '<p>
	Деревянный дом -&nbsp;6 500 000$</p>
<p>
	Каменный -&nbsp;9 500 000$</p>
<p>
	Вместе цена лота 14 000 000$<br />
	&nbsp;</p>
<p>
	Два дома с участком в престижнейшем поселке. 9 км по Рублево-Успенскому ш. На 9-м километре Рублёво-Успенского шоссе в окружении лесопарковой зоны Пионерского лесничества расположился один из самых престижных посёлков VIP класс. В посёлок можно проехать через Академические дачи - д. Жуковка или через посёлок Усово. Для жителей создана прогулочная зона отдыха с каскадом прудов. Участок 55 соток, полностью лесной с ландшафтным дизайном. На участке 2 дома. Деревянный дом из калиброванного бруса-ангарской сосны 660 кв.м. с мебелировкой. В доме все инженерные коммуникации. Кирпичный дом 1749 кв.м. год постройки 2008 в стиле модерн (подвал+3 этажа), с зимним садом из гнутого стекла, медной крышей. В доме 6 спален, бассейн, гараж, стеклянный лифт и пр. (дом под внутреннюю отделку). Электричество 120 кВт, газ. Деревянный дом общей площадью 663,3 кв.м. - 1 этаж - 275,00 кв.м. - 2 этаж - 288,30 кв. м - 3 этаж - 100,00 кв.м. Деревянный дом выполнен из оцилиндрованного бревна Красноярской сосны (Северный лес) D-37 см. Фундамент - сваи буронабивные, ростверк, монолитная плита. Межвенцевой утеплитель, джутовое волокно. Окна-стеклопакет тройной, энергосберегающее стекло. Внутренние двери - массив. На первом этаже расположены: кухня, гостиная-столовая, 2 спальни, 4 санузла, кладовая, банный комплекс с комнатой отдыха. Лестница на второй этаж изготовлена из дубового массива - дуб беленый. На втором этаже - холл (обои шелковые), 4 большие спальни, каждая со своим санузлом и гардеробной. Сантехника в санузлах производитель Jacob Delafon Франция, Villeroy and Boch Германия, душевые кабины Grohe Германия. В санузлах полы с подогревом. Отделка стен: обои шелковые, комбинированная отделка с кедром. Оборудование гардеробных итальянское. Третий этаж одна большая комната площадь -100 кв.м. (библиотека-кинозал) с санузлом и гардеробной. Кровля - натуральная глиняная черепица, водостоки медные. Покраска - наружные стены фасада льняное масло, внутренние стены воск. Инженерия: -электрика - цельнометаллические трубы Cosmos (Италия), кабели с силовыми медными жилами с ПВХ изоляцией, не распространяющей горение. - котел- фирма DeDietrich. - бойлер фирмы DeDietrich. - трубы водоснабжения, отопления, теплый пол - трубы фирмы Rehau (Германия) - мощность электрическая 35 кВт. - газ - централизованный. - канализация - централизованная. - водоснабжение - централизованное и дополнительно индивидуальная скважина глубиной 117м., озоновая система очистки. Вы можете приобрести два дома на 55 сотках. По документам участок разбит на 2 части: 22 сотки отведено под деревянный дом и 33 сотки под кирпичный. Возможна продажа домов по отдельности:</p>
', '4', '55.739264', '37.253308');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('146', '4', '14', '10.00', '0', '90.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Низкие цены, скоростное Новокаширское шоссе, отличные природные характеристики.', '/_files/130736690191.gif', '/_files/130736690165.JPG', '/_files/130736690148.JPG', '/_files/130736690101.JPG', '/_files/130736690114.JPG', '/_files/130736690185.JPG', '/_files/130736690149.JPG', '/_files/130736690194.jpg', '/_files/130736690125.png', '/_files/130736775650.gif', '30000.00', '', '0', '<p align=\"center\">
	<strong>Семьям с детьми скида на земельный участок до 10%</strong></p>
<p>
	&nbsp;</p>
<p>
	Цена 300 000 руб</p>
<p>
	&nbsp;</p>
<p>
	Представляем Вашему вниманию дачный поселок , расположенный в 90 км к югу от Москвы по Новокаширскому ш. в экологически чиcтом Ясногорском районе Тульской области в окружении березового леса.</p>
<p>
	&nbsp;</p>
<p>
	Поселок расположен в границах сельского поселения Иваньково, в двух километрах от деревни Климовское. Это одно из наиболее экологически чистых мест в пределах досягаемости москвичей, так как здесь полностью отсутствуют какие-либо предприятия.</p>
<p>
	В 10 км от поселка протекает река Ока, вокруг поселка много небольших прудов, где можно ловить рыбу.</p>
<p>
	&nbsp;</p>
<p>
	Низкие цены, скоростное Новокаширское шоссе, отличные природные характеристики, 25% территории отведено под инфраструктуру отдыха, экологическая сертификация.</p>
<p>
	Поселок предусматривает зоны участков &quot;без подряда&quot; и &quot;с подрядом&quot; на дом . Это позволит удовлетворить требования и тех кто хочет построить дом по своему усмотрению и тех, кто хочет жить в воссозданой атмосфере деревни 60-х - 80-х годов двадцатого века.</p>
<p>
	&nbsp;</p>
<p>
	Вы можно приобрести как небольшой участок размером в <strong>10 соток</strong>, так и сформировать большой, в <strong>40 соток</strong> и более, чтобы обустроить дачу для большой дружной семьи.</p>
<p>
	<strong>Цены</strong></p>
<p>
	Стоимость земли в поселке варьируется от 30 до 60 тысяч рублей за сотку в зависимости от местоположения участка и условий приобретения.</p>
<p>
	<strong>Общественные зоны</strong></p>
<p>
	Предусмотрено строительство двух универсальных спортивных площадок и двух прудов. Пруды с карасем. Для общественных зон разработан проект ландшафтной планировки, что сделает эти места приятными для отдыха и общения. Также предусмотрено строительство двух детских площадок.</p>
<p>
	<strong>Мини-зоопарк</strong></p>
<p>
	Для наших маленьких жителей, помимо детских площадок в поселке построен мини-зоопарк, где они смогут наблюдать за жизнью курочек и уток. Продукцию мини-зоопарка (свежие яйца) можно приобрести в мини-маркете.</p>
<p>
	<strong>Электричество</strong></p>
<p>
	В пакет коммуникаций в поселке входит 7кВт электричества на домовладение с возможностью увеличения. Электричество проводится по границе участка с заводом в щиток.</p>
<p>
	<strong>Водоснабжение</strong></p>
<p>
	Проектом предусмотрено централизованное водоснабжение от артезианских скважин.</p>
<p>
	<strong>Газ</strong></p>
<p>
	Получено разрешение от Тулаоблгаз о выделении мощности для 291 жилых строений дачного поселка и технические условия на присоединение. Ведется проектирование и согласование акта выбора участка для строительства газопровода.</p>
<p>
	<strong>Канализация</strong></p>
<p>
	Осуществляется с помощью Локальных Очистных Сооружений (ЛОС) типа ТОПАС-6 (8)</p>
<p>
	<strong>Дороги</strong></p>
<p>
	Дороги в щебне проводятся по границе каждого участка. Уплотнение осуществляется грунтовым виброкатком, что позволяет постоянно поддерживать полотно дороги в исправном состоянии.</p>
<p>
	<strong>Забор</strong></p>
<p>
	Деревянный забор по фронту участка и металлический забор на участках граничащих с лесом. Высота забора 1,5 м. Для ограждения участков можно воспользоваться нашими предложениями, а также сделать это самостоятельно, согласовав внешний вид с нашими дизайнерами.</p>
<p>
	<strong>Коммунальные услуги</strong></p>
<p>
	Коммунальные услуги включают услуги электрика, сантехника, газовщика, уборку территории, вывоз мусора, чистку дорог зимой и летом, поддержание состояния инженерных сетей и дорог, охрану поселка.</p>
<p>
	На территории поселка предусмотрено строительство небольшого православного храма. Охотхозяйство Иваньковское расположено в непосредственной близости, и, получив лицензию, охотники могут вдоволь нашагаться по окружающим холмам и перелескам в поисках трофеев. Здесь водятся бобры (в больших количествах), лоси, кабаны, лисицы, зайцы и другая живность.</p>
', '4', '54.740281', '37.951670');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('54', '1', '6', '6.00', '0', '12.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Готовый мини-отель под ключ в 12 км от МКАД, Можайскому или Минскому шоссе', '/_files/129915718487.gif', '/_files/129915718402.jpg', '/_files/129915718413.jpg', '/_files/129915718465.jpg', '/_files/129915718409.jpg', '/_files/129915718438.jpg', '/_files/129915718416.jpg', '/_files/129915725254.jpg', '/_files/129915718452.jpg', '/_files/129915718482.jpg', '7500000.00', '', '0', 'У дома предусмотрено 4 отдельных, изолированных входа и въездная группа на 2 машины. Каждая часть имеет свой коридор, сан. узел,  кухню и жилую комнату. На каждую часть проведен отдельный счетчик электроэнергии. 

12 км. от МКАД, Можайское – Минское ш.  ст. Пионерская 15 мин. пешком, ст. Перхушково 5 мин. пешком.

2-х этажный жилой дом «под ключ»  200 кв.м.,  2010 год постройки.
Участок 6 соток, возможно приоретение соседнего участка тоже 6 соток. Стародачное, полностью жилое место. В основном люди живут круглогодично. Развитая инфраструктура жилые комплексы Дубки и Гусарская баллада находятся на противоположной стороне Можайского ш. от въезда в поселок,  г. Одинцово 2 км.


Готовый бизнес
Дом, возможно, приобрести как целиком, так и на две семьи. Или использовать его в дальнейшем для сдачи в аренду, как 4 однокомнатные квартиры, а  это 30 000 руб. с одной части в месяц!

 Коммуникации:
Электричество 15 Квт, 
Газ- магистраль, 
Септик Топаз 20, 
Вода – скважина.', '4', '55.653282', '37.228374');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('53', '1', '6', '26.00', '15', '29.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Кирпичный коттежд в охраняемом коттеджном поселке  Зеленая роща', '/_files/129909500980.gif', '/_files/129909500980.jpg', '/_files/129909500916.jpg', '/_files/129909500957.jpg', '/_files/129909500992.jpg', '/_files/129909500968.jpg', '/_files/129909500967.jpg', '/_files/129909500991.jpg', '/_files/129909500999.jpg', '/_files/129909500953.jpg', '26500000.00', '', '0', '     Продам обжитой кирпичный коттежд в охраняемом коттеджном поселке  «Зеленая роща». 30 км от МКАД по Минскому, Киевскому, Боровскому ш. ИЖС. Участок 26 соток, граничащий с лесом. Площадь коттеджа 300 м2. Центральное водоснабжение и канализация, газовое отопление, электричество. Большой подвал, гараж, автоматические ворота.  1 этаж: прихожая, гостиная с выходом на веранду, столовая, санузел, техпомещение. 2 этаж: зал, три спальни, санузел. 3 этаж: однообъемная мансарда. На участке отапливаемая баня из бревна 5Х6 (используется, также как домик для гостей) : прихожая, санузел, комната отдыха с выходом на веранду, душевая, парилка, чердак.
Хорошие соседи. Душевное место: лес, грибы, ягоды, рыбалка. Рядом большая современная детская площадка. На территории к/п есть водоем с пляжем, ресторан где пекут свежий хлеб, магазины. Возможен торг. Собственник.', '4', '55.580556', '36.878056');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('55', '1', '8', '2.00', '0', '23.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Cовременный таунхаус рядом с тремя озерами. 
', '/_files/130306296526.gif', '/_files/130709461355.jpg', '/_files/130709130003.jpg', '/_files/130709130078.jpg', '/_files/130709130087.jpg', '/_files/130709130020.jpg', '/_files/130709130025.jpg', '/_files/131980932851.jpg', '/_files/131980932840.jpg', '/_files/131980932864.jpg', '5040000.00', '', '0', '<p>
	Предлагаем Вам последние 3 секции таунхауса, две секции по 150 м.кв. и одна секция 120 м.кв. Об объекте: Современный 3 &ndash; этажный таунхаус, состоящий из 19 секций в 25 км от МКАДа по Ленинградскому, Дмитровскому или Рогачёвскому шоссе. Дмитровский район, Габовское с/п, д. Рыбаки. Ближайший населённый пункт гор. Лобня., назначение - земли населённых пунктов. На первом этаже (50 м.кв. или 40 м.кв.) &ndash; входная группа, лестничный блок, помещение свободной планировки. На втором (50 м.кв. или 40 м.кв.) и третем этажах(50 м.кв. или 40 м.кв.) &ndash; санузел, лестничный блок, Помещение свободной планировки. Потолки высотой 3 м., Крыша &ndash; эксплуатируемая мембранного типа. Все коммуникации внутри каждой секции. Инфраструктура: Рядом с вашим будущим домом расположены: супермаркет, ресторан и кафе. Окружение: В 20 метрах от объекта смешанный лес, в 400 м. красивейший сосновый бор. Три больших красивых озера, где можно купаться и рыбачить. До ближайшего озера Круглое - 1 км. Условия приобретения: Стоимость за кв. м. - 42 000 руб. с учетом земельного участка. Подробнее о таунхаусах <a href=\"http://elitka.info/th\">здесь</a></p>
', '4', '56.061590', '37.361755');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('56', '1', '10', '24.00', '0', '16.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', '3-х уровневый дом Премиум Класса общей площадью 580 кв.м. на участке 24 сотки.
', '/_files/130675260502.gif', '/_files/129915861695.jpg', '/_files/129915861619.jpg', '/_files/129915861673.jpg', '/_files/129915861640.jpg', '/_files/129915861666.jpg', '/_files/129915861675.jpg', '/_files/129915861673.jpg', '/_files/129915861637.jpg', '/_files/129915861671.jpg', '75000000.00', '', '0', '<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Уважаемые дамы и господа! Вашему вниманию предлагается жилой 3-х уровневый дом Премиум Класса, общей площадью 580 кв.м. на участке 24 сотки. Месторасположение: Рублево-Успенское ш., 16 км от МКАД, пос. Горки-8. Дом &laquo;под ключ&raquo; полностью готов к заселению, выполнен по калифорнийскому проекту, с использованием дорогих отделочных материалов, многофункциональный, теплый, уютный. Коммуникации: электричество 100 кВт, газ магистральный, водоснабжение скважина 150 м, канализация септик. Планировка Цокольный этаж &ndash; 2 комнаты свободного назначения (кинотеатр, бильярдная и т.д.), прачечная, холл &ndash; тренажерный зал, бассейн &ndash; 70 кубов, сауна &ndash; под чистовую отделку, котельная с отдельным входом. 1-ый этаж &ndash; холл, гардеробная, гостиная комната с камином, сан. узел, выход-2 на барбекю, выход в гаражи. 2-ой этаж &ndash; 3 спальни, холл, 2 ванные комнаты, 2 балкона, выход на крышу.</p>
<p>
	Цена: $ 2,5 млн.</p>
<h2>
Белее подробную информацию о доме можно найти на сайте <a href=\"http://elitka.info/56\">http://elitka.info/56/</a></h2>', '4', '55.711833', '37.158337');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('57', '1', '10', '50.00', '0', '20.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Дом в классическом стиле, с живописным лесным участком 20 км от МКАД Рублево-Успенское ш. 
', '/_files/129915890740.gif', '/_files/129915890769.jpg', '/_files/129915890714.jpg', '/_files/129915890721.jpg', '/_files/129915890745.jpg', '/_files/129915890703.jpg', '/_files/129915890717.jpg', '', '', '', '150000000.00', '', '0', 'Загородный дом находится в живописном клубном поселке на Рублево-Успенском шоссе, расположенном в лесном массиве. Свежий и хвойный воздух, взрослые лесные деревья прямо на участке- это и есть воплощение идеального места для комфортной и спокойной жизни. В поселке представлен единый архитектурный современный стиль загородных домов. Вся территория огорожена, а безопасность жителей обеспечивает частное охранное предприятие. Поселок полностью заселен, к каждому дому подведены централизованные коммуникации . Жителям поселка доступна богатая инфраструктура Рублево-Успеннского шоссе: спортивно-развлекательные центры, магазины, торговые центры, рестораны и клубы, частные школы и многое другое. Просторный дом площадью 650 кв.м. выполнен в классическом стиле с хорошо продуманной планировкой, идеальной отделкой, оснащен дорогой техникой и изысканной мебелью. Роскошный лесной участок 0,5 га восхитит своим великолепным ландшафтным дизайном. ', '4', '55.709319', '37.121086');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('58', '1', '6', '24.00', '0', '20.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Cовременный дом в охраняемом поселке категории Де-Люкс в окружении многолетнего хвойного леса', '/_files/129915936682.gif', '/_files/129915947940.jpg', '/_files/129915947961.jpg', '/_files/129915947937.jpg', '/_files/129915947906.jpg', '', '', '', '', '', '52500000.00', '', '0', 'Вашему вниманию предлагается  новый, современный дом  в охраняемом  поселке категории Де-Люкс в окружении многолетнего хвойного леса. Расположенного в  20 км от МКАД по Минскому или скоростному Киевскому шоссе.  Площадь поселка 21.7 га. Это современный поселок с развитой инфраструктурой: бассейн, кафе, тренажерный зал, кинозал, английская школа для детей, спортивная площадка и т.д.  
Дом  построен по индивидуальному проекту известного архитектора, с использованием высококачественных строительных материалов, прошел строительную экспертизу.
Коробка – монолит-кирпич, Внешняя отделка – доска из лиственницы.
Под отделку.
Площадь дома 456 кв.м. 2 этажа. Площадь участка 24 сотки. 
Все коммуникации - центральные, проведены в дом. 
Категория земель - ИЖС, Назначение – земли населенных пунктов.

', '4', '55.628044', '37.171211');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('59', '1', '6', '25.00', '0', '12.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Загородный Дом 450 кв. м. Минское шоссе 12 км от МКАД', '/_files/129916229084.gif', '/_files/129916229050.jpg', '/_files/129916229013.jpg', '/_files/129916229081.jpg', '/_files/129916229095.jpg', '/_files/129916229093.jpg', '/_files/129916229059.jpg', '/_files/129916229034.jpg', '/_files/129916229065.jpg', '/_files/129916229026.jpg', '26460000.00', '', '0', '<p>
	Участок 25 соток расположен в Лесном городке в 12 км от МКАД по Минскому шоссе. На участке красивый 3-х уровневый дом площадью 450 кв.м. из красного кирпича с белыми колоннами, гостевой домик, гараж, бассейн, теннисный корт. Общая площадь дома - 450 м2. На первом этаже - кухня, гостиная, кабинет, санузел, веранда; На втором этаже - санузел, спальни, техническая и гардеробная комнаты, комната отдыха. На третем этаже - спальни и бильярдная комната.Дому 7 лет. Полностью готов для круглогодичного комфортного проживания. Все коммуникации центральные. Посёлок охраняется.</p>
', '4', '55.669574', ' 37.317553');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('60', '1', '6', '36.00', '0', '12.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Коттедж, ш. Минское, 12 км., д. Солманово', '/_files/129916273181.gif', '/_files/129916273156.JPG', '/_files/129916273180.JPG', '/_files/129916273196.JPG', '/_files/129916273149.JPG', '/_files/129916273155.JPG', '', '', '', '', '129000000.00', '', '0', 'Коттедж, 500 м2 

Участок: 36 сот.

Дом расположен в охраняемом лесном поселке категории Де-Люкс 12 км от МКАД. Площадь поселка 300 га. Это современный мини город в окружении леса. Все коммуникации центральные. Дом построен в стиле шале, с использованием итальянских отделочных материалов. 
Под ключ.

Площадь дома 500 кв.м. Площадь участка 36 соток. 

Все коммуникации- центральные, проведены в дом. 

Категория земель- ИЖС, Назначение – земли населенных пунктов. На участке взрослые лесные деревья, ландшафтный дизайн, стародачное место.', '4', '55.632551', '37.189236');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('61', '1', '6', '25.00', '0', '12.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Участок 25 соток в элитном коттеджном поселке 
Современный дом 600 кв. м
12 км от МКАД по Минское шоссе

', '/_files/129916298038.gif', '/_files/129916298052.JPG', '/_files/129916298094.JPG', '/_files/129916298052.JPG', '/_files/129916298015.JPG', '/_files/129916298079.JPG', '/_files/129916298045.JPG', '/_files/129916298030.JPG', '/_files/129916298026.JPG', '/_files/129916298033.JPG', '135000000.00', '', '0', 'Дом расположен в охраняемом лесном поселке категории Де-Люкс 12 км от МКАД. Площадь поселка 300 га. Это современный мини город в окружении леса. Все коммуникации центральные.
Дом построен в современном стиле, с использованием итальянских отделочных материалов. 
Площадь дома 600 кв.м. Площадь участка 25 соток.

Все коммуникации- центральные, проведены в дом.

Категория земель ИЖС, Назначение - земли населенных пунктов.
На участке лесные деревья, ландшафтный дизайн, стародачное место.', '4', '55.647925', '37.244865');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('62', '1', '6', '6.00', '0', '33.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Коттедж 200 кв.м. на участке в 6 соток  в полностью заселенном коттеджном поселке Бизнес Класса', '/_files/129916330553.gif', '/_files/129916330565.jpg', '/_files/129916330532.jpg', '/_files/129916330541.jpg', '/_files/129916330505.jpg', '/_files/129916330521.jpg', '/_files/129916330538.jpg', '/_files/129916330521.jpg', '', '', '9500000.00', '', '0', 'Коттедж 200 кв.м. на участке в 6 соток  в полностью заселенном коттеджном поселке Бизнес Класса. 33 км от МКАД по Минскому шоссе, поселок расположен в лесном массиве. Все коммуникации центральные, проведены в дом. Так же есть возможность подключения  интернета и городского телефона. 
Назначение земли - земли населенных пунктов.', '4', '55.582808', '36.859303');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('63', '1', '6', '10.00', '0', '35.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Двухэтажный дом  в коттеджном посёлке по 
Минскому шоссе 35 от МКАД', '/_files/129916382553.gif', '/_files/129916382508.jpg', '/_files/129916382571.jpg', '/_files/129916382500.jpg', '/_files/129916382559.jpg', '/_files/129916382585.jpg', '/_files/129916382523.jpg', '/_files/129916382581.jpg', '', '/_files/129916382598.jpg', '11000000.00', '', '0', 'Двухэтажный дом 235кв.м в охраняемом коттеджном поcёлке в 35 км от МКАД по Минскому шоссе. Дом выполнен из кленового бруса, необходима косметическая отделка, есть деревянная лестница. Дом в 2008 году введён в эксплуатацию по разрешению. Участок 10 соток, газ по границе, свет, септик - топаз, на участке есть колодец. Красивое место, живописные виды. Земли населённых пунктов, без права прописки. Назначение земли - земли населенных пунктов.
', '4', '55.574463', '36.785145');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('64', '1', '6', '8.00', '0', '43.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', '43 км от МКАД по Можайскому или Минскому шоссе (заезд с Можайского)
Вблизи Дома отдыха Покровское', '/_files/129917929845.gif', '/_files/129917929825.jpg', '/_files/129917929806.jpg', '/_files/129917929865.jpg', '/_files/129917929828.jpg', '', '', '', '', '', '5600000.00', '', '0', '43 км от МКАД по Можайскому или Минскому шоссе. (заезд с Можайского) СНТ охраняемое, крайний лесной участок, вблизи дома отдыха Покровское. участок 8 соток, Блочный дом покрытый сайдингом под отделку 380 кв.м., 2 этажа.
Коммуникации:
Эл-во 8 Квт (заведено в дом)
Газ по границе (300 000 руб. подключение)
Вода колодец,
Септик.
', '4', '55.587562', '36.511002');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('65', '1', '6', '8.00', '0', '35.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Двухэтажный дом  в коттеджном посёлке по Минскому шоссе 35 км от МКАД', '/_files/129917981573.gif', '/_files/129917981539.jpg', '/_files/129917981503.jpg', '/_files/129917981591.jpg', '/_files/129917981525.jpg', '/_files/129917981595.jpg', '', '', '', '', '8600000.00', '', '0', 'Продпются 3 участка с одинаковыми домами 170 кв.м в охраняемом коттеджном поcёлке в 35 км от МКАД по Минскому шоссе. Два дома без отделки, один с отделкой и мебелью, полностью готовый к проживанию. Участок 8 соток, газ по границе, свет. Красивое место, живописные виды. Земли населённых пунктов. 
Ежемесчный взнос 3000 руб. за услуги охраны, вывоза мусора, чистки дорог и уличное освещение.', '4', '55.605699', '36.849346');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('66', '1', '4', '12.00', '0', '15.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Участок c домом в 15 км от Мкад 12 соток', '/_files/129918041788.gif', '/_files/129918041741.jpg', '/_files/129918041718.jpg', '/_files/129918041789.jpg', '/_files/129918041730.jpg', '', '', '', '', '', '10000000.00', '', '0', '<p>
	Участок c домом в 15км от Мкад 12 соток, Заезд с 3х шоссе.Киев.Минск.Боровск. Пос Кокошкино.газ, эл-во, по границе Участка. Идеально для ПМЖ.10 мин от ж/ст Толстопальцево. до метро Юго-Западная 30 мин. Коттедж без внутренней отделки на 12 сотках с гаражом, газ по границе, свет есть.</p>
', '4', '55.609214', '37.245541');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('67', '1', '4', '15.00', '0', '78.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Коттедж 150 кв.м., Киевское ш. (можно Калужское ш.), 78 км от МКАД, в охраняемом 
коттеджном посёлке «Русские узоры»', '/_files/129923640618.gif', '/_files/129918060264.jpg', '/_files/129918060233.jpg', '/_files/129918060262.jpg', '/_files/129918060214.jpg', '', '', '', '', '', '5750000.00', '', '0', '<p>
	Коттедж 150 кв.м. на участке 15 соток. Киевское ш. (можно Калужское ш.), 78 км от МКАД, в охраняемом коттеджном посёлке Русские узоры Дом: фунтдамент -бетон ленточный, армированный, пенобетон + утеплитель, оштукатурен., крыша- металлочерепица, пластиковые окна, перегородки пеноблочные, сделана лестница. В доме 2 этажа, 4 спальни, 2 с/у, гостиная со вторым светом. 1 этаж - тамбур, бойлерная, холл, гостиная со вторым светом, кухня, кабинет (или спальня) 11,5 м, два балкона, санузел с отделением для постирочной; 2 этаж - 3 комнаты (15 , 18, 20 кв.м.), холл, санузел, стены оштукатурены.Под чистовую отделку. Эл-во (7кВт) заведено в дом, разведены проводка и подготовка под сантехнику. Все коммуникации: центральный водопровод, магистральный газ, септик(3 куба) заведены в дом. Участок ровный, правильной формы. Забор по периметру участка. Хороший асфальтированный подъезд, развитая инфраструктура. В посёлке предусмотрен свой супермаркет, кафе, детская площадка, гостевая парковка. Живописный ландшафт, посёлок примыкает к густому смешанному лесу, до большого озера - 300 м, отличная рыбалка; недалеко расположены охотхозяйство и Парк птиц. ПМЖ. Коттеджный посёлок охраняется,вывозится мусор,обслуживание-3900р.</p>
', '4', '55.202386', '36.613140');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('68', '1', '5', '10.00', '0', '7.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Дом 160 кв. м. рядом c рекой
Калужское шоссе 7 км от МКАД', '/_files/129918080675.gif', '/_files/129918080632.jpg', '/_files/129918080642.jpg', '/_files/129918080627.jpg', '/_files/129918080604.jpg', '/_files/129918080679.jpg', '/_files/129918080653.jpg', '', '', '', '12900000.00', '', '0', '<p>
	Дом 160 кв.м. из оцил. бревна по специальному проекту на ухоженном уч-ке 10 сот., под чист. отделку, 2 с/у. Участок расположен у береговой линии реки, великолепный вид на воду, капитальный забор по периметру + открытый забор на речку. Раздвижные ворота, эл-во, канал., газ, охрана, солидное окружение, кругл. подъезд. Собственность. Документы готовы к сделке.</p>
', '4', '55.563932', '37.433896');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('70', '1', '5', '10.00', '0', '25.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '0', '0', '0', '0', 'Участок 10 соток в СНТ с кирпичным трех этажным домом, гостевым домиком и гаражом.', '/_files/129918172066.gif', '/_files/129918172043.jpg', '/_files/129918172078.jpg', '/_files/129918172092.jpg', '/_files/129918172018.jpg', '/_files/129918172087.jpg', '', '', '', '', '9800000.00', '', '0', '<p>
	Участок в СНТ Пахра в близи деревни Шахово 25 км от МКАД по Калужскому шоссе 10 соток с домом 300 кв.метров, гостевым домиком и гаражом. Круглогодичный подьезд. Все соседи построились. На участке электричество, водопровод, колодец. В 2 км большое озеро, река и платная рыбалка. В 200 метрах начинается смешанный лес. Тихое живописное место для загородной жизни. Дом из кирпича, внутренняя отделка - дерево. На первои и втором этажах санузлы. На цокольном этаже баня. На третьем этаже бильярдная. Веранды на каждом этаже. Дом полностью готов для проживания.</p>
', '4', '55.431351', '37.209578');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('71', '3', '6', '14.00', '0', '1.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Уникальный земельный участок 14 соток село Немчиновка 1 км от МКАД
', '/_files/129918224161.gif', '/_files/129918224190.jpg', '/_files/129918224123.jpg', '/_files/129918224157.jpg', '/_files/129918224173.jpg', '/_files/129918224160.jpg', '/_files/129918224188.jpg', '/_files/129918224148.jpg', '/_files/129918224133.jpg', '/_files/129918224191.jpg', '14700000.00', '', '0', 'Вашему вниманию предлагается уникальный земельный участок 14 соток. Назначение : ИЖС. 1 км от МКАД. С. Немчиновка. 600 м от ТЦ Кунцево. Круглогодичный асфальтовый подъезд. Участок расположен на склоне, с которого открывается красивый вид. Электричество и газ по границе участка.', '4', '55.717418', '37.364030');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('72', '3', '6', '25.00', '0', '1.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Земельный участок 25 соток село Немчиновка 1 км от МКАД', '/_files/129918248660.gif', '/_files/129918248605.jpg', '/_files/129918248602.jpg', '/_files/129918248691.jpg', '/_files/129918248643.jpg', '/_files/129918248624.jpg', '/_files/129918248640.jpg', '/_files/129918248654.jpg', '/_files/129918248674.jpg', '/_files/129918248602.jpg', '35300000.00', '', '0', '<p>
	Вашему вниманию предлагается уникальный земельный участок 25 соток. Назначение : ИЖС. 1 км от МКАД. С. Немчиновка. 600 м от ТЦ Кунцево. Круглогодичный асфальтовый подъезд. Участок расположен на склоне, с которого открывается красивый вид. Электричество и газ по границе участка.</p>
', '4', '55.725998', '37.364674');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('73', '3', '12', '35.00', '0', '17.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Продается великолепный просторный участок в поселке писателей «Загорянcкий»', '/_files/129918277899.gif', '/_files/129918277858.jpg', '/_files/129918277808.jpg', '/_files/129918277819.jpg', '/_files/129918277895.jpg', '/_files/129918277886.jpg', '', '', '', '', '17800000.00', '', '0', 'Продается великолепный просторный участок в поселке писателей «Загорянкий». Щелковское (Ярославское) шоссе 17 км от МКАД. 

Участок правильной прямоугольной формы 35 соток с собственным проточным прудом, с деревянным летним домиком, с подведенными коммуникациями. До реки Клязьма — 2,5 км, до заповедника Лосиный Остров — 2 км. В поселке отдыхал Постернак, жил великий комментатор Озеров, проживали и писали свои произведения известнейшие советские писатели.', '4', '55.937520', '37.923474');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('74', '3', '4', '250.00', '0', '95.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Самый лучший участок в «Солнечной долине»
«Долина Имений» ', '/_files/129922816897.gif', '/_files/130073262510.jpg', '/_files/130073262596.jpg', '/_files/130073262562.jpg', '/_files/130073262547.jpg', '/_files/130073262529.jpg', '', '', '', '', '70000.00', '', '0', '<p>
	Очень красивое и престижное место! Стоимость участка 2,5 Га &ndash; 70 000 руб. за сотку до 28 февраля Возможно преобретение половины участка по цене 80 000 руб. за сотку. В 95 км. по Киевское ш., Боровский р-н, Калужской области, расположен великолепный участок 250 соток в готовом коттеджном поселке бизнес класса \\&quot;Солнечная долина\\&quot;. Участок расположен в центре комплекса на центральной улице, участок прилегает к смешенному лесу. С участка открывается панорамный вид на долину. На участке посажено по 150 высоких сосен. В примыкающем к участку лесу, протекает ручей, возможно создание собственного пруда. По границе поселка протекает река Протва. По границе участка проходят: газ, эл-во(50 кВт), водопровод, дорога.</p>
', '4', '55.229610', '36.454353');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('75', '3', '10', '25.00', '0', '17.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Московская область, Одинцовский район, д. Лайково. 17 км от МКАД, Рублево-Успенское, Красногорское, Можайское ш.
', '/_files/129922880511.gif', '/_files/129922880565.jpg', '/_files/129922880583.jpg', '/_files/129922880526.jpg', '/_files/129922880575.jpg', '/_files/129922880584.jpg', '/_files/129922880576.jpg', '/_files/129922880557.jpg', '/_files/129922880590.jpg', '/_files/129922880550.jpg', '22500000.00', '', '0', '4 последних земельных участка по 25 соток  под  Дачное строительство.  
Отличный подъезд, стародачное место, полностью заселенное. 
Рядом несколько элитных коттеджных поселков, достойное окружение. 
Крайние участки, прилегающие к лесу. Газ, электричество по границе. 
Время построить  дом своей мечты  пришло!', '4', '55.709754', '37.134562');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('77', '3', '10', '6.00', '0', '15.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Участок 6 соток 15 км от МКАД по Новорижскому/Рублёво-Успенскому шоссе', '/_files/129922942185.gif', '/_files/129922942168.JPG', '/_files/129922942148.JPG', '/_files/129922942143.JPG', '', '', '', '', '', '', '2800000.00', '', '0', 'Участок 6 соток  СНТ «Земля», пос. Ильинское, в 6 км от пос.Архангельское. 15км от МКАД по Новорижскому или Рублёво-Успенскому шоссе. Участок в тихом, живописном месте, 1км до р.Москва. Газ в 300 м, свет по границе и оплачен, на участке колодец.

 
', '4', '55.757549', '37.107182');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('78', '3', '10', '15.00', '0', '9.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Шикарный земельный участок 15 соток ИЖС в деревне Шульгино Рублево-Успенское шоссе 9 км от МКАД.', '/_files/129922997376.gif', '/_files/129922997368.JPG', '/_files/129922997329.JPG', '/_files/129922997300.JPG', '/_files/129922997333.JPG', '/_files/129922997372.JPG', '', '', '', '', '40000000.00', '', '0', '<p>
	Уникальное предложение!!! Уважаемые дамы и господа! Вашему вниманию предлагается шикарный земельный участок 15 соток (в границах забора 30 соток, 15 оформляется в собственность или аренду дополнительно). ИЖС. Месторасположение: Рублево-Успенское ш., 9 км от МКАД, д. Шульгино. На участке находится дачный дом площадью 91,2 кв.м. Коммуникации: все центральные, заведены в дом. Электричество 15 Квт, газ магистраль, вода магистраль, канализация магистраль. Стоимость:</p>
', '4', '55.730614', '37.281675');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('79', '4', '4', '15.00', '0', '90.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Участки в поселке бизнес класса с каскадом прудов. Киевское шоссе, 1 час пути, 91 км от МКАД. В 7 км от города Боровск.', '/_files/129923086203.gif', '/_files/129923086236.jpg', '/_files/129923086269.jpg', '/_files/129923086256.jpg', '/_files/129923086246.jpg', '', '', '', '', '', '70000.00', '', '0', '<p>
	&nbsp;</p>
<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"95%\">
	<tbody>
		<tr>
			<td valign=\"top\">
				<p align=\"left\">
					Уважаемые дамы и господа, предлагаем Вам последние предложения из 75 участков в коттеджном поселке бизнес класса &laquo;Оборенское поместье&raquo;. По границам всех участков проведены: газ, эл-во. Асфальтовый подъезд к каждому участку. Охраняемый комплекс вписан в смешанный лес, имеет свою зону отдыха, каскад проточных прудов до 2 Га площадью на реке м. Оборенка.</p>
				<h2 style=\"text-align: center\">
					<a href=\"javascript:void(0)/*313*/\">Подробнее о поселке здесь! </a></h2>
				<h2 style=\"text-align: center\">
					<a href=\"http://elitka.info/vip\">http://elitka.info/vip</a></h2>
				<p align=\"left\">
					&nbsp;</p>
				<h2 align=\"left\">
					Краткий обзор</h2>
			</td>
		</tr>
		<tr>
			<td align=\"center\" colspan=\"2\" height=\"250\" valign=\"middle\">
				<p align=\"justify\">
					<img align=\"left\" height=\"200\" src=\"http://elitka.info/vip/buttons/1.jpg\" width=\"300\" /> Комплекс расположен в Боровском районе Калужской области, в окрестностях д.Лучны. Проезд осуществляется по Киевскому или Минскому шоссе, 1 час пути, 91 км от МКАД. В 7 км от города Боровск.</p>
			</td>
		</tr>
		<tr>
			<td colspan=\"2\" height=\"250\" valign=\"top\">
				<p align=\"justify\">
					<img align=\"left\" height=\"200\" src=\"http://elitka.info/vip/buttons/2.jpg\" width=\"300\" /> В комплексе началось строительство с августа прошлого года. Участки продаются без подряда, коммуникации входят в стоимость. Назначение земли &mdash; населенный пункт, д. Лучны, Индивидуальное Жилищное Строительство с возможностью прописки.</p>
			</td>
		</tr>
		<tr>
			<td colspan=\"2\" valign=\"top\">
				<p align=\"justify\">
					<img align=\"left\" height=\"200\" src=\"http://elitka.info/vip/buttons/3.jpg\" width=\"300\" /> Главное отличие поселка в том, что на 83 Га земли всего 75 участков. Красивейшее место, первозданность которого нам удалось сохранить за счет прокладки коммуникаций под землей. На участках бизнес и премиум класса посажены сосны, ряд участков имеют свой водоем или выходят к лесу, который можно арендовать на 49 лет с пролонгацией. С участков открываются панорамные виды на долину, леса и пруды. Лес удобен для прогулок на лошадях, в комплексе есть конюшня.</p>
				<p align=\"justify\">
					&nbsp;</p>
				<p style=\"text-align: center\">
					&nbsp;</p>
				<h2 style=\"text-align: center\">
					<a href=\"http://elitka.info/vip\">Подробнее о поселке здесь! </a></h2>
				<h2 style=\"text-align: center\">
					<a href=\"http://elitka.info/vip\">http://elitka.info/vip</a></h2>
			</td>
		</tr>
	</tbody>
</table>
', '4', '55.268383', '36.439290');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('142', '4', '6', '9.00', '0', '100.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Участки в современный дачный посёлок 100 км Минское шоссе', '/_files/130675193335.gif', '/_files/130675193364.jpg', '/_files/130675193370.jpg', '/_files/130675193338.jpg', '/_files/130675193376.jpg', '/_files/130675193314.jpg', '/_files/130675193361.jpg', '/_files/130675193330.jpg', '', '', '36000.00', '', '0', '<p>
	Наш дачный поселок&nbsp; расположен в непосредственной близости от деревни Сивково, Можайского района Московской Области в 103 км от МКАД по Минскому шоссе. Поселок состоит из 109 дачных участков размером <strong>от 9 до 40 соток</strong>. Земельные участки размежеваны и оформлены в полном соответствии с законодательством, что гарантирует покупателю спокойствие и юридическую чистоту при совершении сделки.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Лиственный лес, соседствующий с поселком, протянулся на несколько километров, даря тишину и умиротворение, красоту и покой! Именно здесь, в Можайске, расположена запруда на реке Мжут &ndash; известное рыболовное хозяйство и уникальный, экологически чистый участок. Здесь река имеет запруду с зеркалом воды площадью более 130 Га, активный отдых и рыбалка ждут вас!!! Рядом находится церковь 17 века постройки Преображения Господня.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Здесь вы сможете отдохнуть, забыв о пыли и шуме перегруженных автодорог - место является не проездным и предоставлено исключительно жителям поселка и деревни. Недорогие дачи в Подмосковье &ndash; это лучшее решение и выгодное вложение денег! Дачи у воды, элитные дачи в Можайске, участки размером до 40 соток &ndash; вот перспективы, которые мы Вам предлагаем. Закончены работы по электрификации,&nbsp; продажа дачных участков в Подмосковье весьма популярна. Более того, купить дачу в лучшем районе Подмосковья можно недорого.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Стоимость земельных участков в ДНП&nbsp; зависит от расположения участка на территории поселка и составляет</p>
<p>
	<strong>от 36.000 рублей до 49.000 рублей за сотку. </strong></p>
<p>
	Стоимость земельного участка складывается из цены за сотку и оплаты целевого взноса в ДНП. Размер целевого взноса составляет 288.000 рублей с каждого участка.</p>
<p>
	&nbsp;В целевой взнос за вступление в ДНП&nbsp; входит:</p>
<p>
	1) оплата электрических мощностей и подведения электричества к каждому участку (5 кВт);</p>
<p>
	2) оплата строительства дорог на территории поселка;</p>
<p>
	3) оплата возведения общего ограждения поселка;</p>
<p>
	4) оплата строительства КПП охраны;</p>
<p>
	5) обустройство 2 гостевых парковок;</p>
<p>
	6) обустройство пожарного пруда.</p>
<p>
	<strong>При приобретении от 40 соток &ndash; скидка 10% от общей стоимости участка.</strong></p>
<p>
	Узнать о скидках и проходящих акциях можно по телефону 8 (495) 545-73-05</p>
<p>
	<object align=\"middle\" classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0\" height=\"500\" id=\"map\" name=\"map\" width=\"500\"><param name=\"allowScriptAccess\" value=\"always\" /><param name=\"allowFullScreen\" value=\"false\" /><param name=\"movie\" value=\"http://www.sivkovo.info/images/genplan/map.swf?_pathToMyXML=/xml/generated.xml\" /><param name=\"quality\" value=\"high\" /><param name=\"bgcolor\" value=\"#ffffff\" /><embed align=\"middle\" allowfullscreen=\"false\" allowscriptaccess=\"always\" bgcolor=\"#ffffff\" height=\"500\" name=\"map\" pluginspage=\"http://www.adobe.com/go/getflashplayer\" quality=\"high\" src=\"http://www.sivkovo.info/images/genplan/map.swf?_pathToMyXML=/xml/generated.xml\" type=\"application/x-shockwave-flash\" width=\"500\"></embed></object></p>
', '4', '55.443390', '35.894330');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('141', '4', '14', '9.00', '0', '10.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Современный посёлок на территории исторического заповедника Каширское ш. 10 км от МКАД', '/_files/130674699286.gif', '/_files/130674699230.jpg', '/_files/130674699293.jpg', '/_files/130674699234.jpg', '/_files/130674699236.jpg', '/_files/130674699273.jpg', '/_files/130674699288.jpg', '/_files/130674699250.jpg', '/_files/130674803616.jpg', '', '410000.00', '', '0', '<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Уникальный коттеджный поселок&nbsp; расположен всего в 10 минутах езды от МКАД по Каширскому шоссе. Земельные участки расположены в одном из живописнейших и экологически чистых мест Московской области, - территории природно-исторического заповедника &quot;Горки Ленинские&quot;. Посёлок расположен в непосредственной близости с д.Коробово .</p>
<p>
	&nbsp;</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Посёлок отличается удобным месторасположением, он словно вписан в неповторимую природу Подмосковья. Здесь сложились уникальные для этого района условия, разнообразные природные ландшафты, живописнейшие виды. В 1 км расположено большое и чистое озеро, где можно отдохнуть и искупаться. Не далеко протекает р.Пахра &mdash; прекрасное место для рыбалки. Ежегодно проводят соревнования по катанию на лыжах и собачьих упряжках. На заповедной территории располагается уникальный комплекс археологических, архитектурных и исторических памятников:остатки реликтового леса, курганная группа X-XI вв.; усадебно-парковый ансамбль &quot;Горки&quot; (XIX-XX вв.).</p>
<p>
	&nbsp;</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Посёлок активно застраивается, осталось несколько участков без подряда от 9 до 20 соток.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Также есть 5 участков с уже построенными кирпичными домами на участках по 9 соток.</p>
<p>
	<strong>Инфраструктура </strong></p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Городской комфорт для будущих обывателей поселка обеспечивается посредством необходимых центральных коммуникаций: <u>магистральный газ, электричество, водопровод и канализация</u>. Земля ИЖС.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Кроме того концепцией поселка предусмотрено строительство контрольно-пропускного пункта, круглогодичная охрана, магазин, спортивная и детская площадки, дороги с твердым покрытием. Недалеко от земель коттеджного поселка расположен город Видное с объектами социально-бытовой и развлекательной инфраструктуры (6 км).</p>
<p>
	Цена: 410-520 тыс.руб/сотка</p>
<p>
	<a href=\"http://elitka.info/poselki/196/196.html\" target=\"_blank\"><img border=\"0\" src=\"http://elitka.info/poselki/196/196.gif\" /></a><a href=\"http://elitka.info/poselki/226/226.html\" target=\"_blank\"><img border=\"0\" src=\"http://elitka.info/poselki/226/226.gif\" /></a></p>
', '4', '55.535625', '37.814169');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('81', '4', '6', '10.00', '0', '97.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Последние Земельные участки без подряда! 
От 15-25 соток. Со всеми центральными коммуникациями! ', '/_files/129923391251.gif', '/_files/129923391298.jpg', '/_files/129923391243.jpg', '/_files/129923391267.jpg', '/_files/129923391246.jpg', '/_files/129923391291.jpg', '', '', '', '', '40000.00', '', '0', 'Коттеджный поселок расположен на берегу Рузского водохранилища, одного из самого красивого места у воды в Московской области!  Вашему вниманию предлагаются земельные наделы без подряда на строительство. Таким образом, Вы можете сами сделать выбор строительной фирмы. 

Инфраструктура:

Спортивно-развлекательный комплекс – 3 500 кв.м. 
  
Конноспортивный комплекс
  
Лодочная станция с причалами и эллингами
  
Магазин
  
Многофункциональная система: 
коммуникацийэлектричество, газ, водопровод, канализация. 
Круглосуточная профессиональная охрана с оперативной связью и видеонаблюдением гарантирует спокойствие всем обитателям поселка.

Все дома предусматривают установку сигнализации с выводом на центральный пост охраны поселка, при этом выбор вида сигнализации осуществляется каждым жителем индивидуально.', '4', '55.756870', '36.101730 ');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('82', '4', '8', '10.00', '0', '17.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Участки в готовом коттеджном поселке 17 км по Ленинградскому шоссе со всеми необходимыми коммуникациями', '/_files/129923519440.gif', '/_files/130709482695.jpg', '/_files/129923519418.jpg', '/_files/130806042460.JPG', '/_files/130709099586.jpg', '/_files/130709099598.jpg', '/_files/130709099522.jpg', '/_files/130709099585.jpg', '/_files/130709099525.jpg', '/_files/130709099552.jpg', '300000.00', '', '0', '<p>
	Поселок расположен в 17 км от МКАД по Ленинградскому шоссе. Поселок вписан в лесной массив в близи реки Клязьма и озера Круглое. Состоит из 88 индивидуальных земельных участков с подведенными к ним всеми коммуникациями, площадью от 10 до 16 \\\\\\&quot;соток\\\\\\&quot;, часть из которых предлагается к продаже. Так же поселок окружен удобной вмешней инфраструктурой включающая в себя магазиты, рестораны, кинотеатры, спортивные комплексы и пр.</p>
', '4', '56.031389', '37.324762');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('83', '4', '6', '10.00', '0', '110.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Лучшие Земельные участки в Дачном поселке на Можайском водохранилище!', '/_files/129923580919.gif', '/_files/130763652296.jpg', '/_files/130763652240.jpg', '/_files/130763652238.jpg', '/_files/129923580930.jpg', '/_files/130763652283.jpg', '/_files/129923580962.jpg', '/_files/130763652212.jpg', '/_files/130763652287.jpg', '/_files/130763652236.jpg', '35000.00', '', '0', '<p>
	Лучшие Земельные участки в Дачном поселке на Можайском водохранилище!!! Вашему вниманию предлагаются земельные участки в дачном поселке на Можайском водохранилище! От 12 до 35 соток. Дачный поселок располагается в историческом месте, недалеко от старейшего в мире музея-заповедника &laquo;Бородинское поле&raquo;. Тишина и спокойствие, кристально чистый воздух, смешанный лес, состоящий из хвойных и лиственных деревьев дадут возможность забыть Вам о городских проблемах! И самое главное, что Поселок находится в непосредственной близости от Можайского водохранилища, где вы ощутите единение с природой и с самим с собой. Садоводческое Некоммерческое Партнерство обеспечит наличие в Поселке хороших дорог, внешнего ограждения, детских площадок. И поможет решить вопросы с электричеством для создания комфорта Вам, дорогие Покупатели!</p>
', '4', '55.570969', '35.841522');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('102', '1', '10', '15.00', '0', '25.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дом брус 150 кв.м., 2 этажа; Баня 2 этажа брус 130 кв.м 25км. от МКАД, Рублево-Успенского ш.', '/_files/130013206238.gif', '/_files/130013162875.JPG', '/_files/130013162898.JPG', '/_files/130013162839.JPG', '/_files/130013162867.JPG', '/_files/130013162853.JPG', '/_files/130013162802.JPG', '/_files/130013162857.JPG', '/_files/130013162833.JPG', '/_files/130013162869.JPG', '21000000.00', '', '0', '25км. от МКАД, Рублево-Успенского ш., село Иславское, участок 15 соток СНТ крайний к лесу, Дом брус 150 кв.м., 2 этажа; Баня 2 этажа брус 130 кв.м. (бильярд, комната отдыха);  Гараж на 1 авто, 2-ой этаж 2 жилые комнаты. СНТ охраняемое, стародачное место. Все коммуникации центральные, заведены в дом. (Эл-во - 9 Квт, газ -магистраль, водопровод круглогодичный, канализация центральная). Подъезд -асфальт. Дом под ключ, теплый уютный. 100 метров до Москвы-реки. ', '4', '55.719497', '37.015493');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('84', '5', '6', '460.00', '0', '10.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Одинцовская Южная Промзона Земельный находится в производственной зоне.
', '/_files/130225723256.gif', '/_files/130225723209.jpg', '/_files/129952274230.jpg', '/_files/129952274257.jpg', '/_files/129952274226.jpg', '/_files/129952274203.jpg', '/_files/129952274248.jpg', '/_files/129952274227.jpg', '', '', '600000.00', '', '0', '<p>
	Под производственно-складской комплекс. Имеет прямоуголную форму. Хороший асфальтированный подъезд. Имеется возможность альтернативного въезда. Аренда 30 лет.</p>
', '4', '55.677899', '37.306309');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('85', '2', '3', '0.00', '8', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '1-комн. квартира м.Пражская ул.Чертановская д.29 к.2, 7 мининут пешком до метро', '/_files/129976856753.gif', '/_files/129976833794.jpg', '/_files/129976833789.jpg', '/_files/129976833704.jpg', '/_files/129976833784.jpg', '/_files/129976833718.jpg', '/_files/129976833754.jpg', '/_files/129976833763.jpg', '', '', '5200000.00', '', '0', '1-комн. квартира м.Пражская ул.Чертановская д.29 к.2, 7 мин. пешком до метро, общ. 33 кв.м., кухня  6 кв.м, с/у совм, окна во двор. Чистая уютная квартира, после ремонта, частично мебел.(встроенная кухня, шкафы купе), пол паркет, стеклопакеты. Аккуратный и ухоженный подъезд, во дворе дет. сад, школа, поликлиника,  рядом продуктовый рынок, док. более 3 лет


 
', '4', '55.615056', '37.595800');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('186', '4', '13', '0.00', '0', '50.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Уникальный посёлок близ села Якиманское. Истринское вдх. Пятницкое ш. 50 км от МКАД.
', '/_files/131375076790.gif', '', '', '', '', '', '', '', '', '', '7000000.00', '', '0', '<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Территория этого нового коттеджного поселка расположена в экологически чистом природном ландшафте, всего в пяти минутах прогулки пешком от Истринского водохранилища. Приезжать в поселок, в котором вы можете в настоящий момент приобрести жильё от застройщика, вполне удобно по Ленинградскому или Пятницкому шоссе. Расстояние от МКАД до этого нового коттеджного поселка составляет около 50 км.</p>
<p>
	Наш коттеджный поселок&nbsp; это индивидуальный проект, разработанный специалистами компании ООО &laquo;Истра Ламбер&raquo;, которая работает на рынке проектирования, производства и строительства домов из клееного бруса более 10 лет. В план поселка&nbsp; мы отобрали самые лучшие комфортабельные дома, которые максимально соответствуют соотношению цена-качество.<br />
	<br />
	Есть 4 готовых проекта и 12 свободных.<br />
	На свободных участках вы можете заказать дом по нашим проектам или предложить свой.</p>
<p>
	Посёлок рассчитан всего на 16 землевладений, площадь участков<u> 8-17,5 соток. Коммуникации все центральные,</u> заведены в дом или по границе участка.<br />
	Предлагаемые в поселке коттеджи возведены по оригинальным проектам из надежного и качественного клееного бруса. Внутренняя площадь каждого из домов составляет от 160 м 2.</p>
<p>
	Готовые коттеджные поселки из клееного хвойного бруса предоставляют своим владельцам прекрасные условия для жизни. В домах, построенных из этого материала, в любое время года царит исключительно комфортная атмосфера. Летом брус &laquo;дышит&raquo;, а в холодный сезон очень хорошо держит тепло.</p>
<p>
	<img alt=\"\" src=\"http://elitka.info/yak/1.jpg\" width=\"450\" /></p>
<p>
	<img alt=\"\" src=\"http://elitka.info/yak/2.jpg\" width=\"450\" /></p>
<p>
	<img alt=\"\" src=\"http://elitka.info/yak/3.jpg\" width=\"450\" /></p>
<p>
	<img alt=\"\" src=\"http://elitka.info/yak/4.jpg\" width=\"450\" /></p>
<p>
	<img alt=\"\" src=\"http://elitka.info/yak/5.jpg\" width=\"450\" /></p>
<p>
	<img alt=\"\" src=\"http://elitka.info/yak/6.jpg\" width=\"450\" /></p>
<p>
	<img alt=\"\" src=\"http://elitka.info/yak/7.jpg\" width=\"450\" /></p>
<p>
	<img alt=\"\" src=\"http://elitka.info/yak/8.jpg\" width=\"450\" /></p>
<h1>
	<strong>ГОТОВЫЕ КОТТЕДЖИ</strong></h1>
<h1>
	<strong>Готовый коттедж &laquo;Д19&raquo;. </strong><strong>Участок 15,78 </strong><strong>соток.</strong></h1>
<p>
	<img alt=\"\" height=\"345\" src=\"http://elitka.info/yak/d19.jpg\" width=\"450\" /></p>
<p>
	Коттедж, возведенный по данному проекту, состоит из двух этажей и удобной мансарды. Его общая внутренняя площадь составляет 356,7м&sup2; Пять спален, холл, каминный зал, кухня, гардеробные, обширный балкон и прочие удобства предоставляют идеальные условия для проживания большой семьи. Площадь 1-го этажа &mdash; 176.1 м&sup2; Площадь 2-го этажа &mdash; 129,58 м&sup2; Площадь 3-го этажа (мансарда) &mdash; 51 м&sup2;</p>
<p>
	<em>Цена: 15 229 500 руб.</em></p>
<h1>
	<strong>Готовый коттедж &laquo;Д12&raquo;. </strong><strong>Участок 15,78 </strong><strong>соток.</strong></h1>
<h1>
	<img height=\"337\" src=\"http://elitka.info/yak/d12.jpg\" width=\"450\" /></h1>
<p>
	Общая площадь двухэтажного коттеджа проекта Д12 составляет 247,2 м&sup2; На его втором этаже помимо трех спален и холла находятся удобный балкон, ванная, гардероб, санузел. Помещения первого этажа включают в себя холл, сауну, комнату отдыха, гостиную, кухню, прихожую и гараж.</p>
<p>
	<em>Цена: 12 082 000 руб</em></p>
<h1>
	<strong>Готовый коттедж &laquo;Д20&raquo;. </strong><strong>Участок 16,2 соток.</strong></h1>
<p>
	<img alt=\"\" height=\"299\" src=\"http://elitka.info/yak/d20.jpg\" width=\"450\" /></p>
<p>
	Двухэтажный коттедж проекта Д20, имеющий общую площадь внутренних помещений 245,85 м&sup2;, включает в себя четыре спальни, кухню, гостиную, обширную галерею и удобный балкон. Он замечательно подойдет для постоянного проживания.</p>
<p>
	<em>Цена: 12 738 000 руб.</em></p>
<h1>
	<strong>Готовый коттедж &laquo;Д29&raquo;. </strong><strong>Участок 8 соток.</strong></h1>
<p>
	<img alt=\"\" height=\"337\" src=\"http://elitka.info/yak/d29.jpg\" width=\"450\" /></p>
<p>
	Сравнительно небольшой по размерам двухэтажный коттедж проекта Д29 общей площадью 160,59 м&sup2; станет комфортабельным домом для небольшой семьи. Как и коттеджи других проектов, он имеет все необходимые коммуникации и условия для проживания в любой сезон года.</p>
<p>
	<em>Цена: 7 224 000 руб.</em></p>
<p>
	Готовые коттеджные поселки из клееного хвойного бруса предоставляют своим владельцам прекрасные условия для жизни. В домах, построенных из этого материала, в любое время года царит исключительно комфортная атмосфера. Летом брус &laquo;дышит&raquo;, а в холодный сезон очень хорошо держит тепло.</p>
<p>
	&nbsp;</p>
<p>
	<object classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0\" height=\"380\" width=\"490\"><param name=\"quality\" value=\"high\" /><param name=\"movie\" value=\"http://www.yakimanskoe.ru/content/plan_cs3_new(1).swf\" /><embed height=\"380\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" quality=\"high\" src=\"http://www.yakimanskoe.ru/content/plan_cs3_new(1).swf\" type=\"application/x-shockwave-flash\" width=\"490\"></embed></object></p>
', '4', '56.132972', '36.859989');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('87', '2', '8', '0.00', '0', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Двухкомнатная квартира на м. Динамо', '/_files/129976926070.gif', '/_files/129976926029.jpg', '/_files/129976926024.jpg', '/_files/129976926048.jpg', '/_files/129976926077.jpg', '/_files/129976926034.jpg', '/_files/129976926069.jpg', '/_files/129976926017.jpg', '/_files/129976926015.jpg', '', '12500000.00', '', '0', 'В 7 минутах ходьбы от метро на улице Верхняя Масловка на 5 этаже 14 этажного дома двухкомнатная квартира 53,2 м2 с перепланировкой и дорогим ремонтом. Одна комната совмещена с кухней. Вторая комната - спальня. Совмещенный санузел, великолепная отделка под золото, джакузи. В подъезде консьержка и два домофона, на этаже домофон с видеонаблюдением. ', '4', '55.794597', '37.561904');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('88', '2', '6', '0.00', '0', '7.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Уютная и обустроенная 3-х комнатная квартира в г. Одинцово, ул. Можайское ш,', '/_files/129976962402.gif', '/_files/129976962445.jpg', '/_files/129976962485.jpg', '/_files/129976962480.jpg', '/_files/129976962430.jpg', '/_files/129976962401.jpg', '/_files/129976962473.jpg', '/_files/129976962432.jpg', '/_files/129976962461.jpg', '/_files/129976962453.jpg', '9.00', '', '0', '3-х комнатная квартира в г. Одинцово, ул. Можайское ш, д. 45А. 
11 эт. / 17 эт. дома, новостройка П-44Т, 3-х комнатная квартира. Хорошее расположение дома. Сделан качественный евроремонт. Общая площадь 76,5 кв. м., жилая площадь 55 кв.м., С/У раздельный, кухня 13 кв.м., комнаты: 16,5; 14,9; 19,1 кв.м. Проведен интернет и городской телефон.
Доп. информация: просторная квартира в отличном состоянии. Новый дом, металлическая дверь, домофон, консъерж, 2 лифта. Лоджия и балкон застеклены. Пластиковые окна, электроплита. 
Квартира продается со встроенной кухней, мебелью и техникой ! Двор с детской площадкой, рядом детский сад, школа, центральная больница, торговые центры. Вся инфраструктура в шаговой доступности. 
Свидетельства 2009 г. 2 собственника.
Свободная продажа! 

', '4', '55.672805', '37.267076');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('89', '2', '8', '0.00', '0', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '3-х комнатная квартира Метро Октябрьское поле Улица Генерала Глаголева дом 30 корп. 2 
', '/_files/129976992481.gif', '/_files/129976992444.jpg', '/_files/130012704925.jpg', '/_files/130012704974.jpg', '/_files/130012704932.jpg', '/_files/130012705077.jpg', '/_files/130012705041.jpg', '/_files/130012705050.jpg', '/_files/130012705066.jpg', '/_files/130012705092.jpg', '10800000.00', '', '0', '3-х комнатная квартира в г. Москва, ул. Генерала Глаголева,   д. 30, корп. 2 
М. Октябрьское поле

11 эт. / 16 эт. дома,  3-х комнатная квартира. Общая площадь 66,5 кв. м.  До  М. Октябрьское поле 15 мин. пешком.  Жилая площадь  41 кв.м., кухня 8 кв.м., метраж по комнатам: 17; 12; 9 кв.м., С/У раздельный.  Проведен интернет и городской телефон.
Доп. информация: просторная квартира под косметический ремонт.  Металлическая дверь, домофон, консьерж, 2 лифта. Лоджия застеклена. Пластиковые окна, электроплита. 
Двор с детской площадкой, рядом детский сад, школа, торговые центры. Вся инфраструктура в шаговой доступности. 
Свидетельства 2001 г. 2 собственника.
Альтернатива.', '4', '55.788936', '37.466858');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('90', '2', '6', '0.00', '0', '7.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Уютная и обустроенная 4-х комнатная квартира в г. Одинцово.', '/_files/129977043039.gif', '/_files/129977043067.jpg', '/_files/129977043095.jpg', '/_files/129977043029.jpg', '/_files/129977043016.jpg', '/_files/129977043006.jpg', '/_files/129977043083.jpg', '/_files/129977043058.jpg', '/_files/129977043013.jpg', '/_files/129977043088.jpg', '29500000.00', '', '0', '13 эт. / 14 эт. монолитного дома, 4-х комнатная квартира. Хорошее расположение дома.  Сделан качественный евроремонт. Общая площадь 182,2 кв. м., жилая площадь 98 кв.м., 2 С/У совместный,  раздельный; сауна с душевой кабиной; кухня 15,5 кв.м.;  комнаты: 36/24/22/16 кв.м. Проведен  интернет и городской телефон.
Доп. информация: просторная квартира в отличном состоянии. Новый дом, металлическая дверь, домофон, консьерж, 2 лифта. 
Лоджия и балкон застеклены. Пластиковые окна, встроенная кухня, сауна. 

        В Цену квартиры входит 1 машиноместо в ПАРКИНГЕ 300 м от дома, Красногорское ш. 4. Квартира продается со встроенной кухней, мебелью и техникой!  Охраняемая придомовая территория, рядом детский сад, школа, Одинцовский Университет,  торговые центры. Вся инфраструктура в шаговой доступности. 
Свидетельства 2009 г. 2 собственника.
Свободная продажа!

', '4', '55.679579', '37.276941');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('91', '2', '6', '0.00', '0', '9.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Московская область, Одинцовский район, м-н Дубки, ул. Дружбы, д. 27', '/_files/129977098333.gif', '/_files/129977098375.jpg', '/_files/129977098356.jpg', '/_files/129977098369.jpg', '/_files/129977098378.jpg', '/_files/129977098325.jpg', '', '', '', '', '5200000.00', '', '0', 'Московская область, Одинцовский район, м-н Дубки, ул.  Дружбы, д. 27.
17 эт. / 17 эт. дома, новостройка, 2-х комнатная квартира. Хорошее расположение дома.  Сделан качественный ремонт. Общая площадь 66  кв. м., жилая площадь 34,2 кв.м., С/У  совместный, кухня 15 кв.м., комнаты: 19; 15,2 кв.м.  Потолки 2,7 м.

Доп. информация: Новый микрорайон с развитой инфраструктурой: детский сад, школа, современные магазины, спортивные сооружения, рестораны, многоярусные автомобильные стоянки. Территория застройки-хорошо известное дачное место - находится рядом со станцией Пионерская Белорусской железной дороги в 2-х км. от города Одинцово и в 9-ти км от МКАД. Рядом лес и озеро. Проект дома - РД-90, потолки - 2,70 м. просторная квартира в отличном состоянии. Новый дом, металлическая дверь, 2 лифта.  Лоджия и балкон застеклены. Пластиковые окна. 
Переуступка.
Свободная продажа!', '4', '55.667680', '37.209749');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('92', '2', '6', '0.00', '0', '9.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Московская область, Одинцовский район, м-н Дубки, ул.  Рябиновая, д. 8.', '/_files/129977124481.gif', '/_files/129977124465.jpg', '/_files/129977124491.jpg', '/_files/129977124479.jpg', '/_files/129977124465.jpg', '/_files/129977124455.jpg', '/_files/129977124454.jpg', '/_files/129977124498.jpg', '', '', '7700000.00', '', '0', '    Московская область, Одинцовский район, м-н Дубки, ул.  Рябиновая, д. 8.
1 эт. / 17 эт. дома, новостройка, 3-х комнатная квартира. Хорошее расположение дома.  Сделан качественный ремонт. Общая площадь  88  кв. м., жилая площадь 49,4 кв.м., С/У  совместный, кухня 9,9 кв.м., комнаты: 15,2: 15,2; 19 кв.м.  Потолки 2,7 м.
Доп. информация: Новый микрорайон с развитой инфраструктурой: детский сад, школа, современные магазины, спортивные сооружения, рестораны, многоярусные автомобильные стоянки. Территория застройки-хорошо известное дачное место - находится рядом со станцией Пионерская Белорусской железной дороги в 2-х км. от города Одинцово и в 9-ти км от МКАД. Рядом лес и озеро. Проект дома - РД-90, потолки - 2,70 м. просторная квартира в отличном состоянии. Новый дом, металлическая дверь, 2 лифта.  2 Лоджии застеклены. Пластиковые окна, продается с мебелью. Возможно рассматривать под нежилое помещение. 
Собственность.
Свободная продажа!', '4', '55.668074', '37.203484');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('93', '3', '6', '12.00', '0', '33.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Земельный участок  12 соток  в полностью заселенном коттеджном поселке Бизнес Класса', '/_files/129986680823.gif', '/_files/129986680889.JPG', '/_files/129986680830.JPG', '/_files/129986680861.jpg', '/_files/129986680864.JPG', '/_files/129986680869.JPG', '/_files/129986680870.JPG', '/_files/129986680824.JPG', '', '', '4140000.00', '', '0', 'Земельный участок  12 соток  в полностью заселенном коттеджном поселке Бизнес Класса  33 км от МКАД по Минскому шоссе, поселок расположен в лесном массиве. Все коммуникации центральные. Так же есть возможность подключения  интернета и городского телефона. ', '4', '55.593673', '36.971483 ');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('94', '3', '6', '14.00', '0', '33.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Уникальный Земельный участок  14 соток  в полностью заселенном коттеджном поселке Бизнес Класса', '/_files/129986719926.gif', '/_files/129986719949.JPG', '/_files/129986719945.JPG', '/_files/129986719949.JPG', '/_files/129986719977.JPG', '/_files/129986719944.JPG', '/_files/129986719902.JPG', '/_files/129986719990.JPG', '/_files/129986719927.JPG', '/_files/129986719960.JPG', '5670000.00', '', '0', 'Уникальный Земельный участок  14 соток  в полностью заселенном коттеджном поселке Бизнес Класса  33 км от МКАД по Минскому шоссе, поселок расположен в лесном массиве. Все коммуникации центральные, полностью оплачены!!! Так же есть возможность подключения  интернета и городского телефона. ', '4', '55.590594', '36.990023');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('95', '1', '4', '20.00', '0', '21.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Современный комфортабельный трехуровневый дом в стиле Hi-Tech', '/_files/129986787519.gif', '/_files/129986836880.JPG', '/_files/129986836855.JPG', '/_files/129986836813.JPG', '/_files/129986836839.JPG', '/_files/129986836899.JPG', '/_files/129986836829.JPG', '/_files/129986836870.JPG', '/_files/129986836800.JPG', '/_files/129986836805.JPG', '67000000.00', '', '0', '<p>
	Современный комфортабельный трехуровневый дом <strong>в стиле Hi-Tech </strong>высочайшим качеством отделки, расположенный в охраняемом коттеджном поселке бизнес-класса &quot;Крекшино&quot; с развитой инфрастуктурой,</p>
<p>
	<strong>Общая площадь дома 720 м2</strong>, площадь участка 0,2 га,&nbsp; первая линия к лесу,</p>
<p>
	Дом кирпичный, наружная отделка натуральным камнем</p>
<p>
	<strong>Дом под ключ</strong>без мебели,&nbsp; внутренняя отделка мрамором.</p>
<p>
	Межкомнатные дверипр-ва Union(Италия)</p>
<p>
	Дом оснащен самыми современными инженерными системами, встроенная музыкальная система, 3 уровня освещения, весь первый этаж и все с\\у в доме теплые полы.</p>
<p>
	<strong>Красивые виды на лес</strong>открываются с просторных открытых террас и окон спален</p>
<p>
	<strong>Панорамное остекление</strong>(алюминиевые рамы),</p>
<p>
	<strong>Удобная функциональная планировка:</strong></p>
<p>
	1-й этаж: прихожая- холл, 2 с\\у, гостиная с камином, кухня-столовая, кабинет,</p>
<p>
	<strong>Спа - зона</strong>:&nbsp; сауна с подключением&nbsp; парогенератора , так и&nbsp; для&nbsp; электрической каменки, массажный кабинет,</p>
<p>
	<strong>Большой бассейн</strong>40 м2 выложен морской мозаикой, установлена&nbsp; система очистки и циркуляции&nbsp; воды, спортивный зал,</p>
<p>
	<strong>2-й этаж</strong>: 4 спальни с собственными с\\у&nbsp; и гардеробными,</p>
<p>
	<strong>3-й этаж</strong>: комната свободного назначении (бильярдная &ndash; библиотека &ndash; кальянная- творческая мастерская)</p>
<p>
	Отдельная зона для обслуживающего персонала с отельным входом, с 2-мя комнатами с&nbsp; встроенными кухнями, с\\у,&nbsp; прачечная, котельная.</p>
<p>
	Автономная система отопления дома, пр-ва&nbsp; Buderas,</p>
<p>
	Коммуникации центральные: вода, электричество, канализация, газ.</p>
<p>
	Спутниковое телевидение, Интернет</p>
<p>
	Домофон, видеонаблюдение.</p>
<p>
	Система обогрева крыльца</p>
<p>
	Гараж на 2 а\\м, возможность парковки на участке еще 5 а\\м &nbsp;электрический привод ворот.</p>
<p>
	Фото и видео съемка всего периода строительства дома.</p>', '4', '55.594971', '37.113833');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('96', '1', '8', '5.00', '0', '18.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дуплекс 200 кв. метров под чистовую отделку Ленинградское шоссе  18 км от МКАД', '/_files/129986970618.gif', '/_files/129986970634.jpg', '/_files/129986970645.gif', '/_files/129986970631.gif', '/_files/129986970609.gif', '', '', '', '', '', '6000000.00', '', '0', '', '4', '55.999365', '37.310300');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('97', '1', '6', '5.00', '0', '20.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Таунхаус п.Жаворонки, 20км от Москвы,и вы живописном месте. ', '/_files/130011054361.gif', '/_files/130012712982.jpg', '/_files/130011054387.JPG', '/_files/130011054377.JPG', '/_files/130011054350.JPG', '/_files/130011054361.JPG', '', '', '', '', '12500000.00', '', '0', '<p>
	Площадь дома 170 (м&sup2;) Площадь участка 2 (сотки)<br />
	Комуникации - центральные<br />
	Цена 12 500 000 руб.<br />
	Эксклюзивный поселок &laquo;Жаворонки-1&raquo;, расположенный в 20 км от МКАД по Можайскому шоссе, представляет собой огороженную и охраняемую территорию поселка таунхаусов и коттеджей с собственным декоративным озером, беседками, прогулочными зонами и детской площадкой. Поселок имеет отличную транспортную доступность, добраться в него возможно также по Рублево-Успенскому, Минскому, Киевскому и Боровскому шоссе. В 15 минутах ходьбы - ж/д станция &quot;Дачное&quot;. Поселок полностью построен и готов к заселению!!!<br />
	&nbsp;</p>
', '4', '55.627929', '37.094522');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('100', '1', '11', '40.00', '0', '14.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Продаётся шикарный коттедж в 14 км от МКАД по Можайскому шоссе,д. Бородки.', '/_files/130012951844.gif', '/_files/130012970048.JPG', '/_files/130012951842.JPG', '/_files/130012951865.JPG', '/_files/130012951869.JPG', '/_files/130012951886.JPG', '/_files/130012951873.JPG', '/_files/130012951839.JPG', '/_files/130012951842.JPG', '/_files/130012951899.JPG', '60000000.00', '', '0', 'Продаётся шикарный коттедж в 14 км от МКАД по Можайскому шоссе,д. Бородки. Коттедж площадью 520 кв.м., 3 этажа, отделка в классическом стиле на участке 40 соток. На 1-ом этаже зал с камином, зимний сад, кухня, кабинет, сауна, гардеробная. На 2-ом этаже расположены 2 комнаты, 3 спальни. В доме все коммуникации. На участке гостевой дом 170 кв.м., 2 гаража, спортивная и детская площадка. Дом полностью готов к проживанию.', '4', '55.650110', '37.210393');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('98', '3', '10', '9.00', '0', '25.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '25 км. от МКАД, Рублево-Успенского ш., село Иславское, участок 9 соток ', '/_files/130011104728.gif', '/_files/130011104774.JPG', '/_files/130011104798.JPG', '/_files/130011104786.JPG', '/_files/130011104732.JPG', '/_files/130011104755.JPG', '', '', '', '', '6600000.00', '', '0', '25 км. от МКАД, Рублево-Успенского ш., село Иславское, участок 9 соток стародачное место. Все коммуникации центральные по границе участка . Подъезд -асфальт. 300 метров до Москвы-реки.', '4', '55.718566', '37.004088');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('99', '2', '6', '0.00', '0', '0.00', '999.99', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Однокомнатная квартира от станции метро \"Кунцевская\" 10 мин. транспортом', '/_files/130011398466.gif', '', '/_files/130011398413.jpg', '/_files/130011398437.jpg', '/_files/130011398473.jpg', '', '', '', '', '', '4200000.00', '', '0', '<p>
	Сталинский кирпичный дом, 5-ый этаж. Высокие потолки. Окна во двор. Стеклопакеты. Евроремонт. Встроенный шкаф. Антрисоли. Кухонный гарнитур. Домофон. Железная дверь. Телефон. Интернет. Рядом детсад, школа, магазин, продуктовый рынок. До станции электрички &quot;Рабочий поселок&quot; пять мин. пешком. До станции метро &quot;Кунцевская&quot; 10 мин. транспортом. ВОЗМОЖЕН ТОРГ!</p>
', '4', '55.729267', '37.414836');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('101', '1', '9', '12.00', '0', '8.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Продаётся коттедж в 8 км от МКАД по Дмитрвскому шоссе, д. Новосельцево. ', '/_files/130012976415.gif', '/_files/130013011452.JPG', '', '/_files/130013011466.JPG', '/_files/130013011432.JPG', '/_files/130013011476.JPG', '/_files/130013011459.JPG', '/_files/130013011422.JPG', '/_files/130013011457.JPG', '/_files/130013011419.JPG', '39000000.00', '', '0', 'Продаётся коттедж в 8 км от МКАД по Дмитрвскому шоссе, д. Новосельцево.  Кирпичный коттедж 2 этажа площадью 500 кв. м., отделка камнем. В доме сделан качественный евроремонт, имеется спа-зона, бассейн, мебель. Готовы и заведены все необходимые коммуникации: электричество, газ, водопровод, центральное отопление, канализация, септик. Участок 12 соток , ПМЖ, охраняемая коттеджная застройка, ухоженная территория, сделан ландшафтный дизайн. На участке гараж на 2 машины. Коттедж под ключ, полностью готов к проживанию.', '4', '55.999941', '37.583284');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('103', '3', '7', '25.00', '19', '55.00', '15.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Участок 25 соток в с. Локотня, 15 км от Звенигорода, 55 км от МКАД по Новорижскому ш, так же можно по Минскому или Рублево-Успенскому ш.', '/_files/130090915116.gif', '/_files/130090881750.jpg', '/_files/130090881796.jpg', '/_files/130090881748.jpg', '/_files/130090881730.jpg', '/_files/130090881761.jpg', '/_files/130090881718.jpg', '/_files/130090881703.jpg', '/_files/130090881761.jpg', '', '3000000.00', '', '0', '<p>
	&nbsp;</p>
<p class=\"playlist\">
	<span style=\"color: windowtext\">Село Локотня, <st1:metricconverter productid=\"15 км\" w:st=\"on\">15 км</st1:metricconverter> от Звенигорода, Одинцовский район.</span></p>
<p class=\"playlist\">
	<span style=\"color: windowtext\">5 участков по 25 соток;</span></p>
<p class=\"playlist\">
	<span style=\"color: windowtext\">фактически 30-40 соток каждый участок; </span></p>
<p class=\"playlist\">
	<span style=\"color: windowtext\">вместе или по отдельности;</span></p>
<p class=\"playlist\">
	<span style=\"color: windowtext\">земли поселений, ИЖС;</span></p>
<p class=\"playlist\">
	<span style=\"color: windowtext\">последняя линия застройки у ЛЕСА;</span></p>
<p class=\"playlist\">
	<span style=\"color: windowtext\">живописный лес с двух сторон;</span></p>
<p class=\"playlist\">
	<span style=\"color: windowtext\">большое озеро богатое рыбой;<br />
	хороший круглогодичный подъезд, идеальная дорога;</span></p>
<p class=\"playlist\">
	<span style=\"color: windowtext\">автобус до Звенигорода &ndash; остановка 20м;<br />
	коттеджная застройка;</span></p>
<p class=\"playlist\">
	<span style=\"color: windowtext\">солидные соседи;</span></p>
<p class=\"playlist\">
	<span style=\"color: windowtext\">решаются вопросы по общей охране, вывозе мусора;</span></p>
<p class=\"playlist\">
	<span style=\"color: windowtext\">электричество &ndash; 15 кВт на участок (технические условия);</span></p>
<p class=\"playlist\">
	<span style=\"color: windowtext\">газ до конца 2012 года (ведутся работы);<br />
	рядом: церковь, магазин, АЗС;</span></p>
', '4', '55.695221', '36.592197');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('104', '1', '4', '5.00', '0', '90.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Готовая для проживания дача в экологически чистом районе подмосковья. ', '/_files/130091162165.gif', '/_files/130091162199.JPG', '/_files/130091162109.JPG', '/_files/130091162151.JPG', '/_files/130091162189.JPG', '/_files/130091162142.JPG', '/_files/130091162115.JPG', '/_files/130091162147.JPG', '/_files/130091162141.JPG', '', '1000000.00', '', '0', '<ul>
	<li>
		Дом брус 6х8, 90 км от МКАД по Киевскому шоссе, вблизи д.Митяево.</li>
	<li>
		Участок 5 соток СНТ, по периметру огорожен забором, рядом пруд.</li>
	<li>
		Дом брус 6х8, 2-ый этаж- мансарда.</li>
	<li>
		По границе участка проходит электричество (<span style=\"color: #f00\">80 000 руб. подключение, 7кВт<strong> уже оплачено!</strong></span>),</li>
	<li>
		Колодец на участке.</li>
	<li>
		Круглогодичный подъезд.</li>
	<li>
		Очень красивое, экологически чистое место.</li>
</ul>
', '4', '55.370381', '36.138732');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('105', '3', '10', '6.00', '0', '20.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Земельные участки вблизи леса под коттеджную застройку, 20 км от МКАД по Рублёво-Успенскому шоссе ', '/_files/130202875436.gif', '/_files/130167739695.jpg', '/_files/130167739698.jpg', '/_files/130167739681.jpg', '/_files/130167739669.jpg', '/_files/130167739640.jpg', '/_files/130167739649.jpg', '/_files/130167739613.jpg', '/_files/130167739621.jpg', '/_files/130167739609.jpg', '600000.00', '', '0', '<p>
	&nbsp;<span class=\"Apple-style-span\" style=\"font-family: geneva; color: rgb(84,92,101)\"><strong>Земельные участки вблизи леса под коттеджную застройку, 20 км от МКАД по&nbsp;Рублёво-Успенскому шоссе</strong>&nbsp;</span></p>
<p>
	<span class=\"Apple-style-span\" style=\"font-family: geneva; color: rgb(84,92,101)\">Продаются земельные участки в 20 км от МКАД по <font color=\"#545c65\"><strong>Рублёво-Успенскому шоссе</strong></font>, д. Дарьино Одинцовского района. Предлагается 17 участков общей площадью 6,6 Га. Территория участков представляет собой открытое пространство, окружённое с двух сторон лесом, с третьей стороны- коттеджным посёлком, а с четвёртой- деревней.&nbsp;Земли предназначены для индивидуального жилищного строительства. Живописнейшая местность, красивые виды. Стоимость &nbsp;600 000 руб. за сотку</span></p>
', '4', '55.685989', '37.102053');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('106', '1', '5', '7.00', '0', '90.00', '2.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Обустроенный коттедж 200 кв. метров в тихом и живописном месте в 90 км от Москвы по Калужскому шоссе', '/_files/130185080661.gif', '/_files/130207934102.JPG', '/_files/130207934108.JPG', '/_files/130207934177.JPG', '/_files/130207934173.JPG', '/_files/130207934121.JPG', '/_files/130207934179.JPG', '/_files/130207934111.JPG', '/_files/130207934124.JPG', '/_files/130207934135.JPG', '11000000.00', '', '0', '<p>
	Полностью готовый для круглогодичного проживания дом в застроенном СНТ Дубрава 1. Дом из красного кирпича, площадь 200 кв.м. До г.Жуков 2 км. Дом со все коммуникациями, 3 этажа, полностью мебелирован,сделан качественный дорогой евроремонт, 6 просторных комнат, сауна. Ухоженный участок 5 соток ( по факту 7 соток ) с сараем и беседкой прилегает к лесополосе. На участок два заезда, подъезд &mdash; асфальт. В 100 метрах автобусная остановка.</p>
', '4', '55.053805', '36.703434');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('107', '1', '4', '13.00', '0', '90.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Недостроеный дом 90 км по киевскому шоссе', '/_files/130185094849.gif', '/_files/130207951571.JPG', '/_files/130207951554.JPG', '/_files/130207951540.JPG', '/_files/130207951534.JPG', '/_files/130207951508.JPG', '/_files/130207951586.JPG', '/_files/130207951561.JPG', '', '', '1700000.00', '', '0', '<p>
	Участок 13 соток с недостроенным домом 150 кв.м., д.Ильино. Дом введён в эксплуатацию, присвоен адрес. 1-й этаж кирпич, 2-ой этаж дерево, крыша &mdash; металлочерепица. Дом построен очень качественно, не для продажи. Рядом лес, ручей, проезд 3 км от большого бетонного кольца.</p>
', '4', '55.371795', '36.120172');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('225', '1', '7', '100.00', '0', '44.00', '0.00', '1', '1', '2', '1', '2', '4', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '1', '0', '0', '1', '0', '1', '1', '', '0', '0', '0', '0', '0', '0', 'Загородная резиденция 1282 кв.м. построена на живописном участке недалеко от деревни Котово', '/_files/132691597230.gif', '/_files/132692022784.jpg', '/_files/132692022751.jpg', '/_files/132692022744.jpg', '/_files/132692022733.jpg', '/_files/132692022754.jpg', '/_files/132692022730.jpg', '/_files/132692022769.jpg', '/_files/132692022721.jpg', '/_files/132692022737.jpg', '225000000.00', '', '0', '<p>
	&nbsp;&nbsp;&nbsp;&nbsp; Загородный дом 1282 кв.м. построен на живописном участке недалеко от деревни Котово Московской области Истринского района 45 км. от МКАД (Новорижское ш.). Главной задачей проекта было наиболее органично вписать дом в окружающий пейзаж. Здание раскрывается дугой к искусственному водоему, имеет современную открытую планировочную структуру.</p>
<div>
	&nbsp;&nbsp;&nbsp;&nbsp; Участок 100 соток огорожен от магистрали глухим забором, по задней и боковым сторонам &laquo;живой изгородью&raquo;, тропинки, проезды и парковка для автомобилей &ndash; асфальтовое покрытие.</div>
<div>
	<br />
	&nbsp;&nbsp;&nbsp;&nbsp; При въезде на территорию участка находится двухэтажный дом 251 кв.м. охраны с выстой этажа 3,3м со стоянкой для автомобилей, которые отделены от жилого дома искусственным водоемом.</div>
<div>
	<br />
	На 1-ом этаже дома охраны расположены: помещение охраны, котельная, кухня, узел ввода, санузел.</div>
<div>
	<br />
	На 2-ом этаже дома охраны расположены: 3 спальные комнаты, складское помещение, санузел.</div>
<div>
	&nbsp;</div>
<div>
	Жилой дом двух этажный, высота этажей 4,2 м, и функционально разделен на несколько зон.</div>
<div>
	<br />
	На 1-ом этаже: гардеробная, каминный зал с потолками 10 м, кухня-столовая, кинотеатр, бассейн с купелью, санузлы, сауна, раздевалка, массажная, постирочная, тренажерный зал, венткамеры, узел ввода, вентшахты, гараж на 5 автомашин.</div>
<div>
	<br />
	На 2-ом&nbsp; этаже: 2 мастер спальни с балконами, гостевые спальни, кабинет, санузлы, ванные комнаты, гардеробные.</div>
<div>
	<br />
	&nbsp;&nbsp;&nbsp;&nbsp; В доме&nbsp; три камина, в холле и в мастер-спальнях.В доме расположен бассейн размером 12х2,5м и купель размером 1,5х2,0м. Чаша бассейна и купели &ndash; монолитный железобетон. Бассейн переливной, оборудован двухсопловым противотоком, стационарной подкидной доской и подводным освещением. Купель с горячей водой оборудована соплами для гидромассажа и подводным освещением. При бассейне имеется сауна.Попав на территорию участка, можно оставить машину на стоянке или в гараже и зайти через вестибюль сразу в вестибюль - открытое, двухсветное пространство с каминным залом, домашним кинотеатром и открытой зоной кухни-столовой.<br />
	&nbsp;&nbsp;&nbsp;&nbsp; В восточном крыле расположен бассейн с купелью, сауна с массажной и тренажерный зал. По лестнице из гостиной можно попасть на второй этаж. Здесь расположены жилые комнаты, мастер-спальни с гардеробными, каминами и балконами, библиотека с открытым рабочим кабинетом.<br />
	На территории резиденции оборудована вертолетная площадка, разрешены взлеты и посадки.<br />
	&nbsp;</div>
', '4', '55.869663', '36.757395');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('112', '5', '6', '59.00', '0', '1.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Земельный участок 5914 кв.м. в 1 км от МКАД на Минском шоссе. Аренда 20 лет.16000$/сотка. 
', '/_files/130225917254.gif', '/_files/130225917216.jpg', '', '', '', '', '', '', '', '', '30000000.00', '', '0', '<p>
	Земельный участок 5914 кв.м. в 1 км от МКАД на Минском шоссе в сторону Москвы на повороте&nbsp; на Одинцово не доезжая АЗС &quot;Лукойл&quot;.&nbsp; Существующий въезд на участок. Не входит в территорию проекта &quot;Сколково&quot;, подлежащую изъятию. для размещения объектов дорожного сервиса. Аренда 20 лет.</p>
<p>
	16000$/сотка. Возможно увеличение площади участка. За ним 2,4 га со строениями (14000 долл/сотка).</p>
', '4', '55.703703', '37.359277');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('111', '5', '6', '130.00', '0', '9.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Одинцовская Западная Промзона. Земельный участок 1,3 га 25 000 долл/сотка', '/_files/130225610096.gif', '/_files/130225610083.jpg', '/_files/130225610068.JPG', '/_files/130225610044.JPG', '/_files/130225610039.JPG', '/_files/130225610001.JPG', '', '', '', '', '92000000.00', '', '0', '<p>
	Одинцовская Западная Промзона. Земельный участок 1,3 га расположен по направлению в область по Минскому ш. 9 км. у поворота на г. Одинцово, напротив бывшего поста ДПС, в настоящее время получается разрешение на строительство придорожного комплекса.</p>
<p>
	Аренда 10 лет.</p>
', '4', '55.655690', '37.288059');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('110', '1', '10', '15.00', '0', '27.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Кирпичный 3-х уровневый Дом 750 кв.м. Рублево-Успенское ш. 27 км от МКАД.', '/_files/130217715683.gif', '/_files/130217715604.jpg', '', '', '', '', '', '', '', '', '30000000.00', '', '0', '<p>
	Рублево-Успенское ш. 27 км от МКАД Дом 3х уровневый кирпич, проект согласован, собственность как объект незавершенного стр-ва, 750 кв.м. скважина 120м. док-ты оформлены, газ по забору - тех. условия есть, оплачен, эл-во 8кВатт, 15КВатт - на согласовании, септик, ливневка, &quot;Перекресток&quot; в 200 метрах<br />
	15 соток участок квадратной формы, выровнен.<br />
	материалы - Германия,<br />
	возможен подряд на внутреннюю отделку.</p>
', '4', '55.671057', '37.087001 ');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('113', '4', '4', '6.00', '0', '20.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Cовременный поселок всего в 15 минутах езды от Москвы. Все коммуникации. Участки от 7 до 15 соток', '/_files/130227641413.gif', '/_files/130227303081.jpg', '/_files/130227303002.jpg', '/_files/130227303005.jpg', '/_files/130227303058.jpg', '/_files/130227303025.jpg', '/_files/130227303033.jpg', '/_files/130227303022.jpg', '', '', '370000.00', '', '0', '<p>
	Поселок всего в 15 минутах езды от Москвы. Поселок отличается удобным месторасположением и уникальной транспортной доступностью и располагается недалеко от р. Незнайка и Крекшинских прудов. В непосредственной близости от поселка расположена церковь Спаса Нерукотворного. Природные особенности и развитая инфраструктура создают все условия для круглогодичного комфортного проживания.</p>
<p>
	Территория поселка расположена вблизи населенных пунктов Крекшино и Власово. Киевское направление известно своими стародачными поселками Апрелевка, Крекшино, Селятино, Фрунзевец. Собственный земельный участок в Крекшино в советские времена олицетворял собой достаток его владельца. Сегодня Киевское шоссе переживает вторую молодость, - популярность направления в последние годы стремительно растет. После работ по увеличению пропускной способности трассы в радиусе 30 км от Москвы начался самый настоящий бум коттеджного строительства. Строить коттеджи в Крекшино, Селятино или Апрелевке стало не только модно, но и выгодно. Коттеджи, Киевское шоссе, - в последние годы эти понятия стали символом достатка и респектабельности.</p>
<h2>
	Инфраструктура</h2>
<p>
	Городской комфорт для будущих обывателей поселка обеспечивается посредством необходимых центральных коммуникаций: магистральный газ, электричество, водопровод (водоснабжение из артезианской скважины с системой водоподготовки), канализация (очистные сооружения на поселок).</p>
<p>
	Кроме того концепцией поселка предусмотрено строительство контрольно-пропускного пункта, круглогодичная охрана, магазин, спортивная и детская площадки, дороги с твердым покрытием.</p>
<p>
	Земельные участки расположены в сельском поселении Марушкинское. В 2007 году в соответствии с распоряжением мэра Москвы Ю.Лужкова здесь открылась новая современная средне-образовательная школа на 550 детей. В школе два спортзала, актовый зал на 210 мест, компьютерный зал и игротека.</p>
<p>
	Для любителей здорового образа жизни в 5 км. от поселка в г. Апрелевка располагается современный дворец спорта &laquo;Мелодия&raquo;. Под сводами комплекса имеются: бассейн, тренажерный зал, зал единоборств, сауна, универсальный спортивный зал, зал аэробики.</p>
<p>
	Недалеко от коттеджного поселка &laquo;Черничные Поля&raquo; расположены города Троицк и Апрелевка, а также район Москвы &quot;Ново-Переделкино&quot; с объектами социально-бытовой и развлекательной инфраструктуры.</p>
<address>
	Цена 370-520 тыс.руб за сотку</address>
', '4', '55.5801883235', '37.136771679');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('114', '4', '4', '8.00', '0', '20.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Последние пять участков в полностью готовом коттеджном поселке по Киевскому шоссе 20 км от МКАД', '/_files/130632897058.gif', '/_files/130227389500.jpg', '/_files/130227389590.jpg', '/_files/130227389536.jpg', '/_files/130227389562.jpg', '/_files/130227389540.jpg', '/_files/130227389511.jpg', '/_files/130227389546.jpg', '/_files/130227389564.jpg', '', '360000.00', '', '0', '<script type=\"text/javascript\" src=\"http://maps.google.com/maps/api/js?sensor=false&language=ru\"></script>
<script src=\"/javascripts/prototype.js\" type=\"text/javascript\"></script>
<script src=\"http://poiskn.ru/api/83dc2a72f19a24de0511189f412e80ca441433e9/latest/poiskn.js?object_type=land&deal=buy&search_filter[currency_id]=1\" type=\"text/javascript\"></script>

<script type=\"text/javascript\">
  function loadMap() {
    var map_options = {
      center: new google.maps.LatLng(55.5795, 37.265625),
      zoom: 11,
      mapTypeId: google.maps.MapTypeId.HYBRID,
      mapTypeControlOptions: {
        mapTypeIds: [google.maps.MapTypeId.ROADMAP, google.maps.MapTypeId.HYBRID, google.maps.MapTypeId.TERRAIN]
      }
    };

    google_map = new google.maps.Map($(\'map\'), map_options);

    poiskn.showGenPlan(67, google_map, true);
  }
  document.observe(\'dom:loaded\', loadMap);
</script>

<div id=\"map\"></div>


<p>
	Современный поселок всего в 15 минутах езды от Москвы по Киевскому шоссе. Земельные участки расположены в живописном месте с уникальными ландшафтными характеристиками, - южной границей он примыкает к реке, а с севера и запада ограничен живописными березовыми аллеями. Участки в поселке предлагаются без подряда на застройку. В непосредственной близости от поселка расположена церковь Спаса Нерукотворного.</p>
<p>
	Природные особенности и развитая инфраструктура поселка создают все условия для круглогодичного комфортного проживания и активного отдыха на лоне природы.</p>
<h2>
	Инфраструктура</h2>
<p>
	Городской комфорт для будущих обывателей поселка обеспечивается посредством необходимых центральных коммуникаций: магистральный газ, электричество, водопровод, канализация.</p>
<p>
	Кроме того концепцией поселка предусмотрено строительство контрольно-пропускного пункта, круглогодичная охрана, магазин, спортивная и детская площадки, дороги с твердым покрытием.</p>
<p>
	Участки земли расположены в сельском поселении Марушкинское. В 2007 году в соответствии с распоряжением мэра Москвы Ю.Лужкова здесь открылась новая современная средне-образовательная школа на 550 детей. В школе два спортзала, актовый зал на 210 мест, компьютерный зал и игротека.</p>
<p>
	Для любителей здорового образа жизни в 5 км. от поселка в г. Апрелевка располагается современный дворец спорта &laquo;Мелодия&raquo;. Под сводами комплекса имеются: бассейн, тренажерный зал, зал единоборств, сауна, универсальный спортивный зал, зал аэробики.</p>
<p>
	Недалеко от коттеджного поселка, рядом с Киевским шоссе, расположены города Троицк и Апрелевка, а также район Москвы &quot;Ново-Переделкино&quot; с объектами социально-бытовой и развлекательной инфраструктуры.</p>
<address>
	Цена: 360-550 тыс.руб. за сотку</address>
', '4', '55.5795', '37.265625');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('117', '4', '3', '6.00', '0', '89.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '20 Поселков по Симферопольскому шоссе в 90 км от МКАД', '/_files/130227763170.gif', '', '', '', '', '', '', '', '', '', '10000.00', '', '0', '<h2 style=\"text-align: center\">
	<a href=\"http://axdem.ru/simferopolskiekp/index.htm\">Подробрее о поселках здесь</a>!</h2>
<p>
	Каждый хочет построить загородный коттедж для всей семьи, либо приобрести живописный участок земли рядом с лесом у реки. Дачное строительство на участках в Подмосковье набирает небывалые темпы. Особым спросом в Московской области пользуются садовые и дачные участки у большой воды (на берегу крупной реки, например, Оки), продающиеся без посредников. Такая популярность освоения земель объясняется следующими факторами:</p>
<ul>
	<li>
		купить земельный <strong>участок без подряда</strong>*** можно недорого.</li>
	<li>
		участки земли под застройку продаются в коттеджных посёлках со всеми коммуникациями и развитой инфраструктурой.</li>
	<li>
		построить загородный дом на собственной земле дешево по сравнению с покупкой готового коттеджа.</li>
	<li>
		выгодные программы продажи <strong>участков в кредит</strong>, ипотеку, рассрочку по низким процентным ставкам.</li>
	<li>
		приобретение <strong>земли под ИЖС</strong> позволяет как возвести дачу для отдыха на природе, так и прописаться в собственном частном доме для ПМЖ.</li>
	<li>
		здоровая экология юга Московской области &ndash; Ока, чистый воздух, лес.</li>
</ul>
<p>
	<strong>Покупка земли</strong> в Заокском районе Тульской области на границе южного Подмосковья &ndash; инвестиция в качество жизни и отличный вариант вложить деньги в загородную недвижимость. Вложение в земельные <strong>участки без подряда</strong> по Симферопольскому шоссе &ndash; надежный, безопасный способ приумножить капитал. Приобретя сейчас землю в Заокском &ndash; рядом с Тарусой и Серпуховом за 400 000 рублей, уже через год участок можно продать за миллион.&nbsp;Мы предлагаем выбор из двух десятков коттеджных поселков у Оки с <strong>участками без подряда</strong> и переплаты: продажа <strong>земли</strong> в Заокском осуществляется <strong>без посредников</strong>!</p>
<p>
	Дорога до Заокского по Тульскому направлению удобна и не заставит Вас томиться в изматывающих пробках. По Симферопольскому шоссе (трассе М2) доехать до дачи под Москвой, находящейся в ста километрах от МКАД, можно буквально за час благодаря хорошей асфальтированной трассе, отсутствию светофоров и населенных пунктов на протяжении всего пути. Те, кому больше по душе поездная романтика, также комфортно доберутся до поселка Заокский. С Курского вокзала пригородный электропоезд доставит Вас до станции Тарусская Заокского района. Путешествие из шумного мегаполиса в тихое экологичное Подмосковье займет чуть больше часа.</p>
<h2 style=\"text-align: center\">
	<a href=\"http://axdem.ru/simferopolskiekp/index.htm\">Подробрее о поселках здесь</a>!</h2>
', '4', '54.820798', '37.445971');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('118', '4', '3', '12.00', '0', '30.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Турар Контакт Федяев 8(915) 485-97-11', '0', '0', '0', '0', '0', '0', 'Земельный участок в лесном коттеджном поселке Симферопольское шоссе, 30 км от МКАД, ИЖС.', '/_files/130250909035.gif', '/_files/131004980762.JPG', '/_files/131004980774.JPG', '/_files/131004980715.JPG', '/_files/131004980754.JPG', '/_files/131004980750.JPG', '/_files/131004980735.JPG', '/_files/131004980756.JPG', '/_files/131004980757.JPG', '/_files/131004980742.JPG', '225000.00', '', '0', '<p>
	<a href=\\\"http://elitka.info/les/\\\">http://elitka.info/les/</a> - сайт поселка.</p>
<ul>
	<li>
		Площадь земельных участков&nbsp; 12,5 и 25 соток.</li>
	<li>
		Коммуникации центральные: газ, электричество, вода, канализация.</li>
	<li>
		Круглосуточная охрана.</li>
	<li>
		Удобная транспортная доступность.</li>
	<li>
		Удобный&nbsp; круглогодичный подъезд.</li>
	<li>
		Стародачное тихое место, имение Татищевых (18-19 век).</li>
	<li>
		Рядом действующий православный храм (с. Валищево)</li>
	<li>
		Территория относится к русским Святым местам:</li>
</ul>
<p>
	Сельцо Воробьево (ныне пос. Лесные Поляны) находилось в приходе древнего Корытненского погоста, известного с XVI в. В начале XVII в. здесь стоял деревянный храм в честь Успения Пресвятой Богородицы. До второй половины XVIII в. селом владели кнн. Долгоруковы, с 1750-х гг. оно числилось за Р. Е. Татищевым. В 1848 г. стараниями кн. Е. Р. Вяземской (в девичестве Татищева) в Воробьеве построена каменная домовая церковь в честь Сошествия Святого Духа. В 1897 г. старая деревянная Успенская церковь на погосте в Корытне сгорела. Вскоре Свято-Духовскую церковь с. Воробьево приписали к вновь выстроенному храму в с. Валищево.</p>
<ul>
	<li>
		Рядом река&nbsp; Рожайка&nbsp; (500 м).</li>
	<li>
		Ближайшие населенные пункты:&nbsp; Лесные Поляны, Прохорово, Лопаткино, Валищево.</li>
	<li>
		Ближайшие крупные населенные пункты:&nbsp; Климовск, Чехов, Подольск.</li>
	<li>
		Современные проекты домов на выбор: от 200 до 500 м2.</li>
	<li>
		Возможен индивидуальный проект.</li>
</ul>
<p>
	<strong><em>Менеджер поселка: Александр</em></strong></p>
<p>
	<strong><em>моб.: +7-915-485-97-11</em></strong></p>
<p>
	<a href=\\\"http://elitka.info/les/\\\">http://elitka.info/les/</a>&nbsp;- сайт поселка.</p>
', '6', '55.309524', '37.660446');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('116', '4', '4', '12.00', '9', '25.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Поселок бизнес-класс всего в 15 минутах езды от Москвы. Проект отличается удобным месторасположением и уникальной транспортной доступностью.', '/_files/130227667439.gif', '/_files/130674362179.jpg', '/_files/130876683854.jpg', '/_files/130227593335.jpg', '/_files/130227593375.jpg', '/_files/130227593352.jpg', '/_files/130227593373.jpg', '/_files/130700650993.jpg', '', '', '435000.00', '', '0', '<h2>
	Философия проекта</h2>
<p>
	Собственный загородный дом, место, где вы чувствуете себя совершенно комфортно, где нет места заботам и суете. Мир покоя и тишины, мир, где само пространство питает вас положительной энергией и окружает ощущением абсолютной завершённости. Мир, в котором природа сливается с творениями рук человека. Где каждый предмет находится на своём месте, и нет ничего лишнего и ненужного.В котором есть всё, что нужно вашей душе и вашему телу. Место, где вы можете отдохнуть и восстановить силы. Место, в котором само пространство располагает к обретению душевного равновесия. Где гармония присутствует в каждой детали и заполняет каждый отрезок пространства.</p>
<h2>
	Описание проекта</h2>
<p>
	Бизнес-класс всего в 15 минутах езды от Москвы. Проект отличается удобным месторасположением и уникальной транспортной доступностью. расположен на территории природно-территориального комплекса общей площадью более 3000 Га. На территории парка сосредоточены самые разнообразные природные ландшафты: черноольховые и лиственно-хвойные леса, луга, ручьевые поймы. Площадь только лесных угодий составляет более 2500 Га. Здесь сложились уникальные для Подмосковья условия, позволившие встретить редки природные биотопы, многие из которых уже исчезли в других районах Московской области.</p>
<p>
	Водная система парка представлена озером Лебяжьим и ручьем Лесной. Общая площадь водных объектов составляет около 22 Га, из которых 19.5 Га занимает зеркало воды озера. Это крупнейший водный бассейн в этом районе.</p>
<p>
	В силу уникальных особенностей территории парка только проектно-изыскательские работы заняли более 3 лет, что позволило выработать уникальную, экологически чистую концепцию, сохраняющую великолепную экосистему природно-территориального комплекса. &laquo;Природный парк КАМЕНКА&raquo; - это удивительная возможность жить на территории природного парка, соприкасаться с природой, предоставить своим детям возможность наблюдать, общаться, и, может быть, даже подружится с представителями животного мира.</p>
<h2>
	Инфраструктура</h2>
<p>
	Городской комфорт для будущих обывателей поселка обеспечивается посредством необходимых центральных коммуникаций: магистральный газ, электричество, водопровод (водоснабжение из артезианской скважины с системой водоподготовки), канализация (очистные сооружения на поселок).</p>
<p>
	Кроме того концепцией проекта предусмотрено строительство детской и спортивной площадок, въездной группы с мини-маркетом и помещением для охраны, асфальтированных дорог, заборов в едином архитектурном стиле, благоустроенной парковой зоны, гостевой парковки.</p>
<address>
	Цена 435-600 тыс.руб. за сотку</address>
', '4', '55.489298350137396', '37.13599622199997');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('119', '3', '4', '12.00', '0', '85.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Продаётся огороженный участок 12 соток, 85 км от МКАД, Киевское шоссе, Балабаново.', '/_files/130366899521.gif', '/_files/130366935189.JPG', '', '', '', '', '', '', '', '', '1800000.00', '', '0', '<p>
	Продаётся огороженный участок 12 соток, 85 км от МКАД, Киевское шоссе, Балабаново.&nbsp; К участку подведены коммуникации: эл-во, газ, канализация, центральный водопровод. Участок располагается в черте города, магазины 100м, рядом школа, до красивейшего водоёма и леса 300м, до участка асфальтированный подъезд.&nbsp;</p>
', '4', '55.170535', '36.646271');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('120', '3', '4', '10.00', '0', '100.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Участок  10 соток, 100 км от МКАД по Киевскому шоссе  в черте города исторически-прекрасного Боровска', '/_files/130366923175.gif', '/_files/130366932954.JPG', '', '', '', '', '', '', '', '', '1300000.00', '', '0', '<p>
	Участок&nbsp; 10 соток, 100 км от МКАД по Киевскому шоссе&nbsp; в черте города исторически-прекрасного Боровска,&nbsp; На участке имеется скважина, свет по границе, удобный&nbsp; подъезд к участку, вокруг соседи построились.</p>
', '4', '55.199545', '36.455641');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('121', '3', '4', '15.00', '0', '110.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Участки по 15 соток в  обжитой деревне Тюнино,  110 км от МКАД по Киевскому шоссе', '/_files/130366953059.gif', '/_files/130366953077.JPG', '/_files/130366953024.JPG', '/_files/130366953080.JPG', '/_files/130366953072.JPG', '/_files/130366953008.JPG', '/_files/130366953093.JPG', '/_files/130366953098.JPG', '/_files/130366953067.JPG', '/_files/130366953059.JPG', '450000.00', '', '0', '<p>
	Участки по 15 соток в&nbsp; обжитой деревне Тюнино,&nbsp; 110 км от МКАД по Киевскому шоссе, рядом д.Асеньевское, под которой расположен скит монастыря (участки у православных мест). Подъезд круглогодичный, асфальт-ПГС. Участки&nbsp; категории ЛПХ, рядом лес, река, живописные места. По границе участков- эл-во.</p>
', '4', '55.117434', '36.288915');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('123', '4', '7', '10.00', '0', '47.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'яч', '0', '0', '0', '0', '0', '0', 'Эко-посёлок на берегу Истринского водохранилища. 47 км от МКАД по по Новорижскому шоссе.', '/_files/132402838274.gif', '/_files/130615062510.gif', '/_files/130640449410.jpg', '/_files/130640491284.jpg', '/_files/130640449458.jpg', '/_files/130640449470.jpg', '/_files/130640449401.jpg', '/_files/130640449457.jpg', '/_files/130640449460.jpg', '/_files/130640449465.jpg', '618000.00', '', '0', '<p style=\"text-align: center\">
	<span style=\"font-size: 22px\"><a href=\"#here\" onclick=\"window.open(\'http://elitka.info/doma/\',\'01\',\'width=800,height=800,top=50,left=50\');\">Проекты домов</a></span></p>
<p>
	<strong>Эко-посёлок на берегу Истринского водохранилища. 56 км от МКАД по&nbsp;Новорижскому шоссе.</strong></p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Эко-посёлок&nbsp; расположен прямо на берегу Истринского водохранилища, имеет очень удобную транспортную доступность:&nbsp; 47 км от МКАД по Пятницкому ш. (по Ленинградскому ш. 50 км от МКАД, по Новорижскому ш. 59 км от МКАД). Солнечногорский район&nbsp; одно из самых чистых и живописных мест Подмосковья, рядом расположены с.Якиманское, д. Кривцово,&nbsp; в 9 км г.Солнечногорск, где есть ж/д станция.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Посёлок рассчитан на 84 земельных участка&nbsp; площадью от 10 до 38 соток. Мы предлагаем участки как без подряда, так и с подрядом на строительство, сотрудничая со специалистами строительной компании.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Наш посёлок окружён густым лесным массивом и&nbsp; занимает 21 Га земли, покрытой вековыми соснами, елями, берёзами. Это место уникально по своей красоте, вокруг живописнейшие виды, благоприятная роза ветров с Истринского водохранилища, где специально оборудованы места для отдыха и рыбалки, леса отличаются изобилием ягод и грибов. Это прекрасное место для постоянного проживания и загородного отдыха.</p>
<p>
	<strong><em>Проведены все центральные коммуникации</em></strong></p>
<ul>
	<li>
		газ</li>
	<li>
		вода</li>
	<li>
		электричество</li>
	<li>
		канализация</li>
	<li>
		телефон</li>
	<li>
		интернет</li>
</ul>
<p>
	<strong><em>Инфраструктура</em></strong></p>
<ul>
	<li>
		Управляющая компания</li>
	<li>
		Охрана</li>
	<li>
		Зоны отдыха</li>
	<li>
		Пляжная зона</li>
	<li>
		Спортивные площадки</li>
	<li>
		Минимаркет</li>
</ul>
<p>
	<strong><em>Развитая внешняя инфраструктура</em></strong></p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Школы, больницы, магазины, рестораны, церкви расположены в ближайших населённых пунктах д.Кривцово, д.Обухово, с.Якиманское, в 9 км г.Солнечногорск. В 10 км воднолыжная база и сёрфинг-клуб на озере Сенеж.</p>
<p style=\"text-align: center\">
	<span style=\"font-size: 22px\"><a href=\"#here\" onclick=\"window.open(\'http://elitka.info/doma/\',\'01\',\'width=800,height=800,top=50,left=50\');\">Проекты домов</a></span></p>
', '4', '56.136858', '36.862522');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('124', '4', '5', '13.00', '14', '35.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Булгаков', '0', '0', '0', '0', '0', '0', 'Один  из самых лучших коттеджных посёлков по Калужскому шоссе в 35 км от МКАД', '/_files/130367131215.gif', '/_files/130379905137.jpg', '/_files/130461313718.jpg', '/_files/130379905171.jpg', '/_files/130461305752.jpg', '/_files/130461305700.jpg', '/_files/130461305705.jpg', '/_files/130379905169.jpg', '/_files/130461319340.jpg', '/_files/130461319318.jpg', '360000.00', '', '0', '<p>
	Мы предлагаем &nbsp;один &nbsp;из самых лучших коттеджных посёлков по Калужскому шоссе. Он располагается всего в 35 км от МКАД, имеет &nbsp;круглогодичный подъезд с 2-х шоссе: Калужского и Варшавского. Поселок располагается&nbsp; в уединённом, тихом месте района Красного и Щапово, на красивой поляне, с которой открывается превосходный вид на расположенные вблизи поля,&nbsp; леса&nbsp; и озера. Эта местность идеально подходит для создания собственного загородного дома- невероятно живописная природа- вблизи большое озеро, позволяющее отдыхать на природе, купаться, рыбачить. Все участки от 13 до 50 соток, без строительного подряда, предназначены под индивидуальное жилищное строительство, имеют все необходимые центральные коммуникации: водопровод, газ, канализация, электричество.</p>
<p>
	&nbsp;На территории коттеджного посёлка много лет назад был организован парк с прогулочными аллеями, и теперь предлагаемые участки располагаются в красивейшей местности с большими деревьями, и организуют отдельные лесные зоны с берёзами, липами, дубами, елями. По- настоящему свежий, лесной воздух&nbsp; дарит Вам ощущение бодрости, оздоравливает и поднимает настроение.</p>
<p>
	Строительство загородного&nbsp; коттеджа можно начинать уже&nbsp; сейчас &mdash;&nbsp; предлагаемые участки без подряда предназначены для индивидуального жилищного строительства,&nbsp; на каждый участок готово&nbsp; свидетельство о собственности.</p>
<p>
	<strong>Инфраструктура:</strong></p>
<p>
	Наш коттеджный посёлок огорожен, на въезде имеется контрольно-пропускной пункт расположено здание администрации . Подольский район славится хорошей, развитой инфраструктурой. Вблизи располагаются крупные города&nbsp; Подольск и Троицк, что обеспечивает близкое расположение необходимых для развития, обучения, отдыха объектов и позволяет совмещать отдых на природе, тихую загородную жизнь с развитой и комфортной городской жизнью. Рядом с посёлком расположены несколько музейных комплексов: усадьба Красное, музей-усадьба Александрово-Щапово, усадьба Дубровицы. Посёлок располагается в уникальном, тихом месте, но в то же время не теряет связь&nbsp; с благами цивилизации.</p>
', '4', '55.404533', ' 37.381024');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('125', '3', '14', '10.00', '0', '110.00', '10.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Продается участок 10 соток в живописной деревне Воскресенское. рядом с огромным озером.', '/_files/130497086467.gif', '/_files/130641789622.jpg', '/_files/130641789695.jpg', '/_files/130641789673.jpg', '/_files/131370377357.jpg', '/_files/131370377361.jpg', '/_files/131370377335.jpg', '/_files/131370377379.jpg', '/_files/131370377381.jpg', '', '420000.00', '', '0', '<p>
	Продается участок 10 соток в живописной деревне Воскресенское, соседи построились, рядом лес, возвышенность, красивые панорамные виды. Эл-во по границе, рядом колодец. В деревне есть продуктовый магазин. Автобусная ост. в 500 местрах от участка. Проезд до жд. ст. 8 км, проезд на автобусе до Москвы 110 км. Возможно ПМЖ. Возможно увеличение за счет соседнего участка. От собственника.</p>
', '4', '54.791546', '38.368093');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('127', '1', '10', '10.00', '0', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Жилой дом в центре Москвы! Общей площадью 500 кв.м.  под отделку 
', '/_files/130442989032.gif', '/_files/130442989027.JPG', '/_files/130442989051.JPG', '/_files/130442989096.JPG', '/_files/130442989055.JPG', '/_files/130442989050.JPG', '/_files/130442989053.JPG', '/_files/130442989007.JPG', '/_files/130442989072.JPG', '', '210000000.00', '', '0', '<p>
	Город Москва, Метро Сокол - Октябрьское поле, поселок Художников.</p>
<p>
	<u>Жилой дом в центре Москвы!</u></p>
<p>
	Общей площадью 500 кв.м.&nbsp; под отделку (можно перевести под нежилое использование).</p>
<p>
	Участок 10 соток ИЖС.</p>
<p>
	&nbsp;<u>3 уровня.</u></p>
<p>
	Цоколь: гараж на 1 авто, сауна, бассейн, джакузи, кинотеатр.</p>
<p>
	1-ый этаж: гардеробная, СУ, холл с кухней, гостевая комната.</p>
<p>
	2-ой этаж: 4 комнаты (3 с СУ), холл.</p>
<p>
	<u>Коммуникации:</u> все центральные заведены в дом.</p>
<p>
	<u>Дополнительно:</u></p>
<p>
	Жилой дом находиться в известном и знаменитом историческом месте города Москвы&nbsp; - &quot;Поселке художников&quot;. Парковое место. Рядом метро &quot;Сокол&quot;. Прямая дорога по Ленинградскому шоссе до центра Москвы. Прямая дорога по ул. Алабяна до Рублево-Успенского шоссе.</p>
<p>
	Поселок, возникший в 1923 году, является памятником градостроительства как объект малоэтажной застройки.</p>
', '4', '55.803496', '37.502148');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('128', '2', '10', '10.00', '0', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Жилой дом в центре Москвы! Общей площадью 500 кв.м.  под отделку 
', '/_files/130442997014.gif', '/_files/130442997033.JPG', '/_files/130442997076.JPG', '/_files/130442997020.JPG', '/_files/130442997065.JPG', '/_files/130442997082.JPG', '/_files/130442997045.JPG', '/_files/130442997018.JPG', '/_files/130442997063.JPG', '', '210000000.00', '', '0', '<p>
	Город Москва, Метро Сокол - Октябрьское поле, поселок Художников.</p>
<p>
	<u>Жилой дом в центре Москвы!</u></p>
<p>
	Общей площадью 500 кв.м.&nbsp; под отделку (можно перевести под нежилое использование).</p>
<p>
	Участок 10 соток ИЖС.</p>
<p>
	&nbsp;<u>3 уровня.</u></p>
<p>
	Цоколь: гараж на 1 авто, сауна, бассейн, джакузи, кинотеатр.</p>
<p>
	1-ый этаж: гардеробная, СУ, холл с кухней, гостевая комната.</p>
<p>
	2-ой этаж: 4 комнаты (3 с СУ), холл.</p>
<p>
	<u>Коммуникации:</u> все центральные заведены в дом.</p>
<p>
	<u>Дополнительно:</u></p>
<p>
	Жилой дом находиться в известном и знаменитом историческом месте города Москвы&nbsp; - &quot;Поселке художников&quot;. Парковое место. Рядом метро &quot;Сокол&quot;. Прямая дорога по Ленинградскому шоссе до центра Москвы. Прямая дорога по ул. Алабяна до Рублево-Успенского шоссе.</p>
<p>
	Поселок, возникший в 1923 году, является памятником градостроительства как объект малоэтажной застройки.</p>
', '4', '55.802715', '37.500098');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('134', '3', '3', '10.00', '0', '70.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Участок 10 соток в красивейшем посёлке у соснового леса и реки, Симферопольское ш., д. Кудаево.', '/_files/130520015428.gif', '/_files/130519965907.jpg', '/_files/130519965977.jpg', '/_files/130519965961.jpg', '/_files/130519965920.jpg', '/_files/130519965934.jpg', '', '', '', '', '1200000.00', '', '0', '<p>
	Продаётся земельный участок&nbsp; 10 соток в красивейшем коттеджном посёлке, 70 км от МКАД по Симферопольскому шоссе в одном самых живописных &nbsp;мест Чеховского района. Вблизи располагается д. Кудаево, протекает р.Нара. Посёлок окружён сосновым лесом. К участку&nbsp; подведена &nbsp;отличная подъездная дорога, в посёлке имеются беседки, игровая детская площадка.</p>
<p>
	Инфраструктура</p>
<ul>
	<li>
		2 КПП,</li>
	<li>
		2 гостевые автостоянки;</li>
	<li>
		межевые заборы;</li>
	<li>
		общее озеленение поселка;</li>
	<li>
		игровые площадки для детей;</li>
	<li>
		универсальная спортивная площадка для любителей активного отдыха;</li>
	<li>
		беседки для барбекю;</li>
	<li>
		прогулочный пешеходный бульвар;</li>
	<li>
		подключение к электричеству.</li>
</ul>
', '4', '55.057148', '37.183206');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('129', '1', '15', '5.00', '0', '140.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Продается летний домик на участке  в 5 соток на берегу р. Оки.', '/_files/130467915951.gif', '/_files/130467849848.jpg', '/_files/130467849827.jpg', '/_files/130467849816.jpg', '/_files/130467849843.jpg', '/_files/130467849889.jpg', '/_files/130467849857.jpg', '', '', '', '700000.00', '', '0', '<p>
	Продается летний домик, 6*4 каркасно-щитовой на участке &nbsp;в 5 соток на берегу р. Оки. До реки 900 метров. На участке плодовые деревья, кустарники, туалет, сарайчик, летний водопровод, электричество в доме. Рязанское шоссе 140 км. Казанское ж/д направление ст Слёмы. До ж/д станции 1 км. Входит в заповедную 20-ти км зону вокруг Государственного музея-заповедника С.А. Есенина.</p>
', '4', '54.865645', '39.479295');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('130', '3', '14', '11.00', '0', '125.00', '0.00', '0', '2', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Продается участок ИЖС 11 соток, Каширское ш. 120 км от МКАД, в р-не д. Вослинка', '/_files/130504150674.gif', '/_files/130504074777.jpg', '', '/_files/130504074737.jpg', '', '/_files/130504074744.jpg', '/_files/130504074718.jpg', '/_files/130504074720.jpg', '/_files/130504074705.jpg', '/_files/130504074742.jpg', '700000.00', '', '0', '<p>
	Электричество по границе,соседи построились со всех сторон, не крайний. тихое, живописное место, пруд в 100 м, жипописное большре озеро 1 км, лес в 100 м, проезд общественным транспортом (автобус или ж/д станция - 2 км.) Рядом церковь- 500м.</p>
', '4', '54.722551', '38.534803');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('131', '3', '14', '13.00', '0', '125.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Продается участок на возвышенности в Тапканово 13 осток. Каширское ш. 125 км.', '/_files/130504152321.gif', '/_files/130504135385.jpg', '/_files/130504135389.jpg', '/_files/130504135381.jpg', '/_files/130504135346.jpg', '/_files/130504135363.jpg', '/_files/130504135388.jpg', '', '', '', '850000.00', '', '0', '<p>
	Продается живописный участок на возвышенности в Тапканово 13 соток. Каширское ш. 125 км. Великолепный вид на долину, реку и лес, великолепная панорама, за ним участка уже не будет. Эл-во рядом, газ - будет протянут на эту улицу в этом году. Красота! Автобусная остановка 1 км. Жд ст. 2,5 км.</p>
', '4', '54.716843', '38.486985');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('132', '3', '14', '22.00', '0', '110.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Продается участок 22 сотки, ИЖС. Каширское ш. 110 км от МКАД, д. Никулино', '/_files/130504197513.gif', '/_files/130504197570.jpg', '/_files/130504197540.jpg', '/_files/130504197568.jpg', '/_files/130504197552.jpg', '/_files/130504197591.jpg', '', '', '', '', '1050000.00', '', '0', '<p>
	Электричество, газ в по границе. подъездная дорога асфальт+100м насыпная,два пруда для купания в 100 и 500м, лес в 200м,проезд общественным транспортом жд ст. Пчеловодное, 1,5 км., Автобусная остановка 1 км. ,активно застраивается - рядом коттеджи, соседи построились. красивое место, два магазина - 1 км.,поселковая инфраструктура, документы готовы к сделке.</p>
', '4', '54.714532', '38.227208');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('133', '3', '14', '8.00', '0', '110.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Участок на берегу Оки - самое широкое место реки, 8 соток ИЖС. Каширский р-он МО', '/_files/130504261297.gif', '/_files/130504261213.JPG', '/_files/130504261290.JPG', '/_files/130504261296.jpg', '/_files/130504261243.jpg', '', '', '', '', '', '650000.00', '', '0', '<p>
	Участок 8 соток(по факту 10, можно увеличить) расположен в деревне Большое Руново в Каширском районе, ИЖС, р. Ока в 300 метрах, идеальное место: для рыбалки, водятся раки; для купания - песчаный пляж; для катания на моторных лодках, водных лыжах, кругах - самое широкое место реки в районе. Столб с эл-вом по границе участка, подъезд асфальт. Зимний водопровод. Газ по границе участка. Живописные места. Рядом прудик. 3 км. Дом отдыха. С участка видна церковь - памятник архитектуры - видна с участка, магазин и палатка в 1 км. Возможен проезд на автобусе от ЖД, 200 м. от участка остановка, обжитое и приятное место для проживания и отдыха на реке в тишине и красоте. Документы готовы.</p>
', '4', '54.857757', '38.394030');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('135', '1', '10', '134.00', '0', '20.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Усадьба на Рублево-Успенском шоссе, оборудованная последними средствами обеспечения безопастности. ', '/_files/130520767425.gif', '/_files/130520778006.jpg', '/_files/130520778067.jpg', '/_files/130520778069.jpg', '/_files/130520778089.jpg', '/_files/130520780923.jpg', '/_files/130520780942.jpg', '/_files/130520780936.jpg', '/_files/130520780939.jpg', '/_files/130520780964.jpg', '240000000.00', '', '0', '<p>
	<strong>Усадьба оборудованна последними средствами обеспечения&nbsp;безопастности и конфиденциальности.</strong></p>
<p>
	Рублево-Успенское шоссе 21 км.<br />
	Отдельностоящая усадьба 2000 кв.м готова к проживанию:</p>
<p>
	Усадьба находится на возвышеннности , по периметру 4 метрый зобор оборудованный современной системой видеонаблюдения и вальерами с сторожевыми собаками. Выездная дорога просматривается системой видеонаблюдения на расстоянии&nbsp;2 км.</p>
<ul>
	<li>
		основной дом 940 кв.м</li>
	<li>
		спорткомплекс с бассейном&nbsp;</li>
	<li>
		русская баня&nbsp;</li>
	<li>
		гараж на 6 авто с мойкой&nbsp;</li>
	<li>
		дом охраны</li>
	<li>
		гостевой дом</li>
</ul>
<p>
	Лесной участок 134 сотки (84 - собственность и 50 - аренда).</p>
<p>
	Есть пруд и детская площадка.<br />
	Рядом развитая инфраструктура поселка НИКОЛИНО.<br />
	&nbsp;</p>
', '4', '55.679838', '37.077355');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('136', '2', '3', '0.00', '0', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Продается однакомнатная квартира, ул. Болотниковская д.46', '/_files/130555518436.gif', '/_files/130555518454.jpg', '/_files/130555518431.jpg', '/_files/130555518449.jpg', '', '', '', '', '', '', '4600000.00', '', '0', '<p>
	Продается квартира на 5 пятом этаже пятитиэтажно дома, тихий дворик. Один собственник, прямая продажа.</p>
', '4', '55.664642', '37.585438');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('137', '1', '3', '15.00', '0', '99.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дом 140 кв.м.  на участке с соснами в охраняемом посёлке вблизи реки.', '/_files/130556175039.gif', '/_files/130641726546.jpg', '/_files/130641726507.jpg', '/_files/130641726520.jpg', '/_files/130641726539.jpg', '/_files/130641726573.jpg', '/_files/130641726556.jpg', '/_files/130641726517.jpg', '/_files/130641726528.jpg', '', '5300000.00', '', '0', '<p style=\"text-align: justify;\">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Продаётся красивый двухэтажный дом площадью 137,7 кв.м. в охраняемом застроенным коттеджном посёлке, Заокский район, 90 км от МКАД по Симферопольскому шоссе. Участок 15 соток, посажены сосны, соседи построились. Красивейшая местность- рядом р.Ока, доступна рыбалка, конный комплекс. Отличная транспортная доступность- хорошая дорога,рядом ж/д станция</p>
', '4', '54.699444', '37.305987');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('138', '4', '12', '15.00', '0', '10.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Поселок находящегося на берегу Клязьмы в окружении чудесных лесов Пушкинского района Московской области 14 километров по Осташковскому шоссе', '/_files/130581507111.gif', '/_files/130581507187.JPG', '/_files/130581507188.JPG', '/_files/130581507164.JPG', '/_files/130581507171.JPG', '/_files/130581507194.JPG', '/_files/130581507164.JPG', '/_files/130581507165.JPG', '', '', '570000.00', '', '0', '<h3>
	<strong>О поселке</strong></h3>
<pre>
&nbsp;</pre>
<pre>
&nbsp;</pre>
<div style=\"text-align: right\">
	<pre>
	<em>&nbsp;&laquo;Летний лес великолепно ласков.</em></pre>
</div>
<p align=\"right\">
	<em>Если есть река, пригож вдвойне &mdash;</em></p>
<p align=\"right\">
	<em>Серебристой радуюсь волне,</em></p>
<p align=\"right\">
	<em>Южный ветерок похож на сказку.</em></p>
<p align=\"right\">
	<em>Человеку хорошо тогда:</em></p>
<p align=\"right\">
	<em>Есть где обрести свободу духа!</em></p>
<p align=\"right\">
	<em>Встретится русалка-молодуха,</em></p>
<p align=\"right\">
	<em>С ней еще приятнее вода!</em></p>
<p align=\"right\">
	<em>Камыши беседуют с осокой,</em></p>
<p align=\"right\">
	<em>Отблеск солнца прыгает, резвясь.</em></p>
<p align=\"right\">
	<em>Мудрый лес, великий и высокий,</em></p>
<p align=\"right\">
	<em>Ублажает в благодатный час&raquo;.</em></p>
<p>
	&nbsp;</p>
<p>
	В своем стихотворении Николай Глазков очень точно описал, то благодатное состояние духа человека, попадающего на территорию нашего нового коттеджного поселка, -&nbsp; находящегося на берегу Клязьмы в окружении чудесных лесов Пушкинского района Московской области.</p>
<p>
	Проехав всего 14 километров по Осташковскому шоссе, Вы попадаете в живописную долину реки Клязьмы окруженную светлым смешанным лесом, погружаясь в атмосферу умиротворения и покоя. Свежий, напитанный лесными ароматами воздух, речная прохлада, тенистые аллеи и залитые солнцем полянки. Здесь даже самый взыскательный человек найдет место по душе.</p>
<p>
	Вас встречает приветливая въездная группа с административным центром, центром досуга и отдыха, детской и спортивной площадками, гостевой парковкой. По берегу реки, вдоль всего поселка, тянется широкая прогулочная зона, где можно погулять, расположиться с барбекю, насладиться пляжным отдыхом и искупаться, или просто посидеть в тени раскидистых ив, полюбоваться рекой и окружающей природой.</p>
<p>
	Находясь в этом чудном уголке природы, жители поселка могут пользоваться всеми современными централизованными системами инженерной инфраструктуры и жизнеобеспечения.</p>
<p>
	Наш поселок, расположенный в непосредственной близи от Акуловского гидроузла, питающего водой столицу, как и вся прилежащая территория, находится под круглосуточной двухуровневой охраной Экологической полиции и Службы охраны стратегических объектов.</p>
<p>
	Всё это великолепие, заботливое благоустройство и удобство мы предлагаем покупателям земельных участков &ndash; будущим счастливым жителям нашего коттеджного поселка. Если у Вас есть желание стать одним из них, мы будем рады Вам в этом помочь.&nbsp;</p>
<p>
	<strong><em>Площадь участков: 15-33 сотки.&nbsp;&nbsp;&nbsp;&nbsp; </em></strong></p>
<p>
	<strong><em>Стоимость земли:&nbsp; 19000-25000 долл./сотка.</em></strong></p>
<h3>
	<strong>Инфраструктура</strong></h3>
<p>
	Жители нашего поселка могут пользоваться всеми благами современной цивилизации. К их услугам:</p>
<p>
	- вся развитая социальная инфраструктура ближайших населенных пунктов (Пироговский, Черкизово, Мытищи);</p>
<p>
	- магазины, супермаркеты и гипермаркеты, в том числе Леруа Мерлен;</p>
<p>
	- горнолыжные курорты Дмитровского шоссе;</p>
<p>
	- дома отдыха, санатории, профилактории и летние курорты у &laquo;большой воды&raquo; Пестовского, Пяловского, Учинского, Клязьминского и Пироговского водохранилищ.</p>
<p>
	А также внутренняя социальная инфраструктура поселка:&nbsp;&nbsp;&nbsp;</p>
<p>
	- административно-техническое здание;</p>
<p>
	- гостевая автостоянка;</p>
<p>
	- спортивная и детская площадки;</p>
<p>
	- зона отдыха;</p>
<p>
	И инженерные коммуникации:</p>
<p>
	- асфальтированные дороги;</p>
<p>
	- централизованные системы водоснабжения и канализации;</p>
<p>
	- централизованные системы электроснабжения и газификации.</p>
<p>
	<strong><em>Все удобства городской жизни, на лоне природы.</em></strong></p>
<p>
	<strong><em>Стоимость подключения к инженерным сетям включена в стоимость земли.</em></strong></p>
<p>
	<strong>Уникальность</strong></p>
<p>
	Место расположения нашего поселка уже многие годы является, по сути, экологическим заповедником. В нем располагаются стратегические водоемы и гидросооружения питающие Москву питьевой водой. Пестовское, Пяловское, Учинское, Клязьминское и Пироговское водохранилища, - все они сосредоточены в этом районе. Прямо по территории поселка протекает река Клязьма, даря ему свой собственный речной курорт.</p>
<p>
	Принимая во внимание близость поселка, удобную транспортную доступность и высокий уровень безопасности, можно назвать его действительно уникальным местом для жизни и отдыха.</p>
<p>
	<strong><em>Удачное место для Вас и Ваших гостей.</em></strong></p>
', '4', '55.975143', '37.780781');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('139', '4', '3', '10.00', '0', '96.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Капитан Виталий 222-64-77 ', '0', '0', '0', '0', '0', '0', 'Участки и коттеджи, расположенные в прекрасных местах Заокского района ', '/_files/130674773393.gif', '/_files/130674773355.jpg', '/_files/130674773354.jpg', '/_files/130674773378.jpg', '/_files/130674773385.jpg', '/_files/130674773313.jpg', '/_files/130674773392.jpg', '/_files/130674773318.jpg', '/_files/130674773351.jpg', '/_files/130674773332.jpg', '100000.00', '', '0', '<p>
	<strong>О посёлках.</strong></p>
<p>
	&nbsp;&nbsp; Мы&nbsp; предлагаем своим клиентам участки и коттеджи, расположенные в прекрасных местах Заокского района Тульской области.&nbsp; Здесь предусмотрено абсолютно все, что необходимо для комфортабельной жизни жителей наших посёлков. В поселке есть круглосуточная охрана, рестораны,кафе с панорамными видами, магазины, аптеки, дежурные врачи, пруды с пляжами, конный комплекс, страусиные фермы, превосходные дороги и многое другое, что делает повседневную жизнь комфортной и приятной. Предлагаемые коттеджные поселки &laquo;Новиково&raquo; и &laquo;Рождествено&raquo;, располагаются по Симферопольскому шоссе, которое сравнительно мало загружено даже в самые напряженные периоды времени, ведь это направление сравнительно новое - трасса практически всегда свободна, на ней нет, уже ставших привычнымы, пробок. В наших условиях это &ndash; просто неоценимое достоинство.</p>
<p>
	&nbsp;&nbsp;&nbsp; Рождествено, поселок, расположенный вдоль озер и соснового массива, имеет уникальный ландшафт, прекрасно оборудованную детскую площадку, теннисный корт, зону отдыха, пляж и многие другие атрибуты современной загородной инфраструктуры.</p>
<p>
	&nbsp;&nbsp; Поселок Новиково соседствует с природным заповедником, обитателями которого являются самые разнообразные животные. В обоих поселках действует клубная система, позволяющая их жителям пользоваться услугами всей инфраструктуры.</p>
<p>
	&nbsp;&nbsp; В наших посёлках все до мелочей продумано для максимально комфортного и приятного отдыха жителей поселка. Для любителей рыбалки &ndash; красивейшие &laquo;зарыбленные&raquo; озера, поклонники верховой езды смогут в свободное время кататься на лошадях, так как на территории поселка есть даже свой конный комплекс. Если вы отдаете предпочтение экзотике, - вашему вниманию предоставлена страусиная ферма. Летом вас ожидают чистые и удобные пляжи, а зимой &ndash; лыжные прогулки в светящемся от пушистого снега лесу.</p>
<p>
	&nbsp;Участки в посёлках без подряда&nbsp; так же имеют свою развитую инфраструктуру: зону скверов, детскую площадку, прогулочные зоны, административный комплекс, красивейший пруд с пляжной зоной, к участкам уже подведены все коммуникации.</p>
<p>
	&nbsp;&nbsp;&nbsp; &nbsp;Мы предлагаем Вам земельные участки под строительство: можно выбрать не только типовой проект для Вашего будущего коттеджа, но и полностью оригинальное архитектурное решение, на свой вкус. Также Вам предоставляется возможность создать уникальный ландшафтный дизайн на участке вокруг Вашего коттеджа.Остановив свой выбор на коттедже в поселках Рождествено или Новиково, вы будете обеспечены комфортным жильем в красивом месте по максимально выгодной цене.</p>
<p>
	<strong>Уникальность</strong></p>
<p>
	Приобретение загородного жилья становится вопросом номер один для человека, живущего в шумном, суетливом мире мегаполиса. Однако привычный комфортабельный образ жизни заставляет с особой тщательностью отнестись к подбору загородного жилья, отвечающего все требованиям уюта, комфорта&nbsp; и обустроенности. Мы готовы предложить Вам идеальный вариант загородной жизни. Комплекс наших посёлков&nbsp; располагается в удивительно красивом месте- земли примыкают к Приокско-Террасному заповеднику,славящемуся своими природными богатствами, чистейшим воздухом. Культурные наследия- храмы, музеи- всё располагается в максимальной доступности. Для создания нашей загородной сказки мы выбрали оптимальную для экологического комфорта удалённость- несколько десятков километров &ndash; и вы начисто забываете о шуме, грязи и суете мегаполиса. Великолепие лесов, озер, хрустальных ключей, питающих реку Оку, чистейший прозрачный воздух, звенящая тишина, иногда прерываемая щебетом птиц&hellip;Приобретая загородное имущество в наших посёлках, вы имеете уникальную возможность наслаждаться чудеснейшей природой, чувствовать уют загородной жизни, не отказываясь при этом от всех комфортабельных благ, а также в транспортной доступности своего дома.</p>
<p>
	<strong>Инфраструктура</strong></p>
<p>
	Посёлки, входящие в комплекс, располагаются в непосредственной близости друг от друга, обеспечивая удобную транспортную доступность, а также единство инфраструктуры.</p>
<p>
	&nbsp;В посёлках имеется &nbsp;круглосуточная охрана с проездом через КПП,&nbsp; уличное освещение, асфальтированные дороги, административный комплекс (магазин, аптека,дежурный врач, ресторан, медпункт), детские и спортивные площадки. Также&nbsp; на весь комплекс организована служба эксплуатации (централизованное обслуживание коммуникаций, уборка территории, чистка дорог, вывоз мусора), единая диспетчерская служба, которая поможет решить вопросы связанные как эксплуатацией домов, так и бытовых, в виде уборки или доставки продуктов.</p>
<p>
	&nbsp;</p>
<p>
	Каждый поселок имеет свои, достаточно уникальные, особенности (конноспортивный комплекс, страусиный питомник, лебединые и зарыбленные озера, пляжи, парковая зона), пользоваться которыми имеют возможность все жители комплекса посёлков. До пляжа на реке Оке и обратно можно добраться на клубном автобусе.</p>
<p>
	С уверенностью можно заявить, что &nbsp;жители наших посёлков получают&nbsp; элитный уровень сервиса по доступной цене.</p>
', '4', '54.726987', '37.528310');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('143', '4', '7', '9.00', '0', '109.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Финский дачный поселок расположен в живописном месте в 109 км от Москвы', '/_files/130684699427.gif', '/_files/130684406281.jpg', '/_files/130684406229.jpg', '/_files/130684406206.jpg', '/_files/130684406239.jpg', '/_files/130684406247.jpg', '/_files/130684406275.jpg', '/_files/130684406237.jpg', '/_files/130684820068.gif', '/_files/130684406274.gif', '69000.00', '', '0', '<p>
	<strong>СПЕЦИАЛЬНОЕ ПРЕДЛОЖЕНИЕ </strong><strong>участок в 10 соток со всеми коммуникациями с домом 106 кв.м из клееного бруса &ndash; Вы можете приобрести всего за 3,8 млн. руб!</strong></p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Финский дачный поселокрасположен в живописном месте в 109 км от Москвы по Новорижскому шоссе, с одной стороны поселок граничит с лесным озером, с другой с лесным массивом. Это поселок для тех, кто любит тишину природы, активный отдых и рыбную ловлю.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Это удобный, комфортный и качественный поселок, на его территории всего 76 участков на любой вкус<strong>от 9 до 24 соток</strong>. Вы можете выбрать участок на воде или у леса, есть и небольшие участки в центре поселка.&nbsp; Мы &nbsp;предлагаем участки с подрядом на строительство деревянного дома из клееного бруса. Дома от 106 до 300 кв.м.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Сама природа подсказала стиль посёлка, традиционный финский дом всегда стоит на берегу озера, где можно купаться и ловить рыбу, и одновременно в лесу, где летом можно собирать грибы, ягоды, а зимой кататься на лыжах или снегоходах.</p>
<p>
	&nbsp;</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Мы поможем воплотить Вашу мечту, ведь именно в этом поселке Ваши дети проведут незабываемые мгновения детства.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Так, под общественные зоны выделено 15% общей площади поселка, а это более 2 ГА, кроме того, все центральные коммуникации разводятся подземным способом, что соответствует инфраструктуре бизнес-класса.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p>
	<strong>Коммуникации: </strong></p>
<p>
	- Электричество из расчета до10 кВт на домовладение с возможностью увеличения</p>
<p>
	- Центральный газопровод</p>
<p>
	- Центральное водоснабжение</p>
<p>
	- Центральная ливневая канализация</p>
<p>
	- Хозяйственно - бытовая канализация: ЛОС &laquo;Топас 8&raquo; на каждый дом</p>
<p>
	- Внутрипоселковые дороги: бетонные плиты ПАГ-14</p>
<p>
	- Подъездная дорога - асфальт</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; В поселке обеспечивается охрана и патрулирование, а также построен контрольно-пропускной пункт с автоматическими воротами. На территории поселка организованы пешеходные зоны и беговые дорожки, оборудованы места для рыбной ловли, финские гриль-домики на берегу озера создают неповторимый уют, причалы для лодок, пирсы на воде, и это еще не все.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Детская площадка, пляжная зона, футбольное поле и волейбольная площадка. Уютный посёлок &ndash; это место, куда Вы будете ездить с семьей - отдыхать от мегаполиса на своем участке. Финский дом из клееного бруса - это целый мир комфорта и полноценного отдыха, который не захочется покидать даже ненадолго.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Настоящий финский поселок с развитой инфраструктурой, при этом стоимость домовладений в поселке умеренная, так земельный <u>участок в 10 соток со всеми коммуникациями с домом 106 кв.м из клееного бруса &ndash; Вы можете приобрести всего за 3,8 млн. руб!</u></p>
', '4', '56.062980', '35.750542');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('144', '4', '7', '10.00', '0', '99.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '  Японский поселок  расположен в 99 км от Москвы по Новорижскому шоссе ', '/_files/130692471210.jpg', '/_files/130692471269.jpg', '/_files/130692471281.jpg', '/_files/130692471255.jpg', '/_files/130692471264.jpg', '/_files/130692471227.jpg', '/_files/130692471202.jpg', '/_files/130692471274.jpg', '/_files/130692471206.jpg', '/_files/130692501520.jpg', '0.00', '', '0', '<p>
	<span style=\"color: #f00\"><strong>ГОРЯЧЕЕ ПРЕДЛОЖЕНИЕ!!!</strong></span></p>
<p>
	<span style=\"color: #f00\">&nbsp;<strong>Земельный участок 12 соток со всеми коммуникациями (газ, эл-во 10 кВт, центральный водопровод, асфальтовые дороги) и с домом 145 кв.м из кирпича всего за 5,49 млн. руб.</strong></span></p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Японский поселок&nbsp; расположен в 99 км от Москвы по Новорижскому шоссе и еще около 19 км к Рузскому водохранилищу и граничит с Завидовским заповедником. Участок с трех сторон окружен лесом, а с четвертой &mdash; большим озером, что делает место скрытым от посторонних глаз, в 2-х км от поселка расположено Рузское вдхр.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Такое сочетание восточной стилистики и европейской архитектуры вы не найдете ни в каком другом поселке Подмосковья.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; В поселке у каждого участка &mdash; свой характер. Творческим натурам подойдут уединенные лесные участки, окруженные соснами. Людям созерцающим, мечтательным - участки у воды. Добрым соседям &mdash; в центре поселка.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Умеренные цены не влияют на качество инфраструктуры, здесь все сделано для комфортного проживания.&nbsp;</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; В поселке всего 80 домов, 18 Га земли, что делает его достаточно камерным - все знают всех. Статус земли &quot;Для индивидуального жилищного строительства <strong>(ИЖС)</strong>&quot; позволяет не только жить круглый год, но и сделать прописку для себя или своих родных. Мы предлагаем <strong>участки от 12 до 30 соток.</strong></p>
<p>
	Ландшафт проектировался вместе с японскими консультантами, поэтому во всем чувствуется тонкая восточная аура.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Выбрать для себя один из вариантов дома непросто, поскольку независимо от площади и отделки все проекты очень красивы и удобны.</p>
<p>
	<u>В продаже есть участки и без подряда.</u></p>
<p>
	&nbsp;</p>
<p>
	<strong>Инфраструктура</strong></p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Под общественные зоны выделено около 25% общей площади поселка, а это более 4 Га, кроме того, все цетральные коммуникации разводятся подземным способом, что соответсвует инфраструктуре бизнес-класса.</p>
<p>
	&nbsp;Общественные зоны:</p>
<p>
	- Беседки в японском стиле</p>
<p>
	- Сад камней</p>
<p>
	- Пешеходные &ndash; беговые дорожки</p>
<p>
	- Каскад водопадов&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p>
	- Причалы для лодок</p>
<p>
	- Детская площадка</p>
<p>
	- Пляжная зона&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p>
	- Спортплощадка</p>
<p>
	- Уличное освещение - декоративные фонари</p>
<p>
	&nbsp;Административно-хозяйственное здание:</p>
<p>
	- Мини &ndash; маркет</p>
<p>
	- Аптека</p>
<p>
	- Сервисные службы&nbsp;</p>
<p>
	- Гостевая парковка</p>
<p>
	&nbsp;Безопасность:</p>
<p>
	- Круглосуточная охрана&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p>
	- Забор по периметру&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p>
	- Система видаонаблюдения</p>
<p>
	&nbsp;</p>
<p>
	Коммуникации:</p>
<p>
	- Электричество из расчета до 10 кВт на домовладение с возможностью увеличения</p>
<p>
	- Центральное газоснабжение</p>
<p>
	- Центральное водоснабжение&nbsp;</p>
<p>
	- Центральная ливневая канализация</p>
<p>
	- Хозяйственно - бытовая канализация: ЛОС &laquo;Топас 8&raquo; на каждый дом</p>
<p>
	- Подъездная и внутрипоселковые дороги: бетонные плиты ПАГ-14</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>В нашем поселке можно </strong><strong>здорово провести время!</strong> Поселок расположен на берегу большого рыбного озера, это значит, что по озеру можно плавать на весельных и моторных лодках, а главное ловить рыбу в любое время года.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; В нашем озере водится щука, карп, лещ, окунь, плотва и белый амур. Кроме того, мы заботимся о состоянии водоема &ndash; очищаем его от избыточной растительности и поддерживаем популяцию рыб.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Стоит также отметить, что в 5-ти км от поселка находится Рузское водохранилище, добраться до которого можно как на автомобиле, так и пешком (около 2-х км).</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Для любителей охоты &ndash; в Вашем распоряжении лесной массив вокруг поселка.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; На территории поселка для Вас обустроен парк вдоль озера с пешеходными дорожками, беседками и мостиками. Здесь Вы можете наслаждаться видом каскадных прудом с водопадиками и садом камней в традиционном японском стиле.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Для самых маленьких жителей поселка построена детская площадка. А на берегу озера будут сделаны пляж и пирсы с причалом для лодок.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Кроме того, летом Вы можете кататься на квадроциклах и совершать велосипедные прогулки, или просто гулять, дыша воздухом соснового леса, а зимой традиционно кататься на лыжах, коньках и снегоходах (снегоходы и квадроциклы можно будет взять в аренду).</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Для любителей экстремального отдыха в 15-ти минутах езды аэродром Ватулино, где можно совершать прыжки с парашютом.</p>
', '4', '55.896203', '35.840664');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('145', '2', '6', '0.00', '0', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Уникальная 2-х уровневая квартира в современном элитном комплексе. САМАЯ НИЗКАЯ ЦЕНА !!!
', '/_files/130709957897.gif', '/_files/130710097268.jpg', '/_files/130710097228.jpg', '/_files/130710097223.jpg', '/_files/130710097205.jpg', '/_files/130710097256.jpg', '/_files/130710097272.jpg', '/_files/130710123807.jpg', '/_files/130710097218.jpg', '', '43000000.00', '', '0', '<p align=\"center\">
	Уникальная 2-х уровневая квартира в современном элитном комплексе.</p>
<p align=\"center\">
	САМАЯ НИЗКАЯ ЦЕНА !!!</p>
<p align=\"center\">
	5 000 $ - 1 кв.м.</p>
<p>
	&nbsp;Предлагаем 2-х уровневую квартиру из 5 комнат &nbsp;( 3-4 этаж) в обжитом&nbsp; комплексе &quot;12 Месяцев&quot; в Заречье возле Международного Университета. Общая площадь 301,1 кв м.&nbsp;</p>
<p>
	&nbsp;</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Элитный посёлок &nbsp;&quot;12 месяцев&rdquo; - это двенадцать 4-х уровневых отдельно расположенных домов клубного типа, рассчитанных всего на 6 или 7 квартир. Здания располагаются в значительном расстоянии друг от друга, чему способствует большая площадь поселка -&nbsp; 3 гектара. Оригинальная концепция застройки комплекса: каждый из двенадцати домов олицетворяет определенный месяц года, а группы из трех зданий &ndash; четыре времени года.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Квартира под чистовую отделку очень светлая, уютная.&nbsp; Планировочное решение было разработано архитектором комплекса.&nbsp; В квартире выполнена черновая отделка по дизайн-проекту: возведены стены, отлита лестница, разведена электрика медным проводом. На квартиру выделена мощность 24кВт.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 уровень: гостиная-столовая со вторым светом, камином и зимним садом (высота потолков до 7 м), кухня, кабинет, спальня, 2 с/у, гардеробная, 2 балкона.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 уровень: Четыре спальни, библиотека, 2 с/у, сауна, гардеробная, кладовка-прачечная, 3 балкона, дополнительно: антресоль 20 кв.м&nbsp;&nbsp; В гостиной второй свет, высота потолков 9 м.&nbsp; Есть возможность установить камин.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Дополнительно возможно приобретения&nbsp; 2-х машиномест в подземном паркинге (цена 50 000 $ за м/м), цокольного помещения в доме № 10 общ.пл. 70,1 кв.м. (цена 140 200 $)</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <u>Инфраструктура:</u> &nbsp;Дома построены по индивидуальному проекту в стиле постмодерн, монолитно-каркасные, фасад вентилируемый, облицован керамогранитными плитами, крыша покрыта гибкой черепицей. Территория ЖК &quot;12 Месяцев&quot; граничит с кампусом Международного Университета и его спорткомплексом. Рядом находятся детские сады &quot;Малышок&quot; и &quot;Академия детства&quot;, элитная гимназия &quot;Сократ&quot; (www.socratic.ru), школа-пансион &quot;Росинка&quot; (www.rosinka-school.ru). На въезде на Сколковское шоссе, строится Московская бизнес-школа управления &quot;Сколково&quot;. Поблизости от поселка располагается Баковский лесопарк, долина реки Сетунь, дворцово-парковый ансамбль &quot;Мещерский&quot; с прудами. Рядом с Заречьем находятся конно-спортивный комплекс и поля для гольфа.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <u>Придомовая территория</u> &ndash; благоустроена, разбиты газоны и цветники, установлены пешеходные мостики, устроен пруд, скульптурные композиции, оборудована прогулочная зона, две детские площадки.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <u>Паркинг</u>: Подземная стоянка на 94 парковочных места. Въезд и выезд предусмотрен по отдельным пандусам с использованием автоматических ворот фирмы &laquo;HOERMANN&raquo;. Автостоянка обеспечена естественным освещением и дымоудалением через зенитные фонари. Для жителей спроектированы четыре пешеходных выхода из паркинга, которые максимально сокращают путь к жилым домам. Габариты парковочного места: 5,7м х 2,5 м. К услугам автовладельцев ручная мойка на въезде.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <u>Охрана:</u> Залогом безопасности является служба охраны, работающая в круглосуточном режиме, системы видеонаблюдения, установленные по периметру жилого комплекса, установлена система контроля доступа. Въезд на территорию осуществляется через контрольно-пропускной пункт.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <u>Особенности:</u> Строительство объекта велось по индивидуальному проекту по современной монолитно-кирпичной технологии, фасад облицован природным камнем.&nbsp; Кровля мирового производителя, выполненная из гибкой черепицы. В квартире установлены экологически чистые деревянные окна с двойными стеклопакетами, имеется система очистки воздуха. В соответствии с требованиями пожарной безопасности, квартира оборудована противопожарной сигнализацией. К квартире подведены линии цифровых коммуникаций (спутниковое ТВ и выделенная линия для высокоскоростного доступа к сети Интернет).&nbsp; Архитектурный стиль: постмодерн.</p>
<p>
	Адрес: Сколковское шоссе, Одинцовский район, Заречье, 2 км от МКАД, дом №10.</p>
', '4', '55.686022', '37.391742');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('147', '1', '11', '20.00', '0', '14.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Жилой дом из строганного лафета, общей площадью 400 кв.м. на участке 20 соток.', '/_files/131098491710.gif', '/_files/131098500730.JPG', '/_files/130744667643.JPG', '/_files/130744667621.JPG', '/_files/130744667648.JPG', '/_files/130744667655.JPG', '/_files/130744667615.JPG', '/_files/130744667601.JPG', '/_files/130744667608.JPG', '/_files/130744667677.JPG', '48000000.00', '', '0', '<p>
	Вашему вниманию предлагается жилой дом из строганного лафета, общей площадью 400 кв.м. на участке 20 соток. Месторасположение: Можайское-Минское-Киевское-Рублевское ш., 14 км от МКАД, д. Акулово.</p>
<p>
	Дом &laquo;под ключ&raquo; полностью готов к заселению, выполнен по уникальному проекту, с использованием дорогих отделочных материалов, многофункциональный, теплый, уютный.</p>
<p>
	Коммуникации: электричество 15 Квт, газ магистральный, водоснабжение скважина 100 м, канализация центральная.</p>
<p>
	Планировка:</p>
<p>
	1-ый этаж &ndash; кухня, холл, гардеробная, гостиная комната с камином, 2 сан. узела, выход на барбекю, бассейн, сауна, гостевая комната.</p>
<p>
	2-ой этаж &ndash; 3 спальни, холл, 2 ванные комнаты, второй свет.&nbsp;</p>
<p>
	Дополнительно:</p>
<p>
	2-х этажный гараж 100 кв.м. на 2 машины,</p>
<p>
	1-ый этаж- гараж, бойлерная, котельная.</p>
<p>
	2-ой этаж жилое помещение&nbsp; с&nbsp; СУ и душевой кабиной.</p>
', '4', '55.663329', '37.229147');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('148', '4', '14', '6.00', '0', '30.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '30 км по южному направлению в центральной части городского округа Домодедово', '/_files/130763489049.gif', '/_files/130831864811.JPG', '/_files/130995481880.JPG', '/_files/130995481818.JPG', '/_files/130995481803.JPG', '/_files/130831864803.JPG', '/_files/130831864892.JPG', '/_files/130763358275.jpg', '/_files/130763358228.jpg', '/_files/130831864856.JPG', '180000.00', '', '0', '<p>
	&nbsp;&nbsp;&nbsp; Жилой посёлок&nbsp;располагается в 30 км по южному направлению в центральной части городского округа Домодедово. Можно добраться&nbsp; по Симферопольскому или Каширскому шосе. Место расположения поселка представляет собой небольшую живописную возвышенность, окруженную с запада и севера березовыми рощами, переходящими в густой смешанный лес, а с востока &ndash; обширными лугами.&nbsp; Небольшая речка Сушка пересекает территорию поселка с севера на юг и образует каскад прудов в центральной и восточной части поселка.</p>
<p>
	<strong>Коммуникации </strong></p>
<p>
	&nbsp;&nbsp; Коммуникации: в поселке&nbsp;отведено место для современных инженерных коммуникаций, которые представлены объектами электро-, водо- и газоснабжения, бытовой и ливневой канализацией. В посёлке &nbsp;предусмотрено &nbsp;электроснабжение от существующей линии электропередач, которая проходит по границе его территории. Именно поэтому была поставлена своя распределительная трансформаторная подстанция с показателем мощности в 1,4 МВт вместе с сетью локальных трансформаторных пунктов. Настоящая система позволит обеспечивать каждый земельный участок мощностью до 15 кВт.</p>
<p>
	Территория коттеджного посёлка оснащена газорегуляторным пунктом с соответствующей мощностью, который вынесен за пределы жилого сектора. Кроме того, запроектирован водозаборный узел с производительностью 500 м3, способный обеспечить потребности населения в воде на жилищно-коммунальные нужды.</p>
<p>
	Посёлок строится с запланированной постройкой канализационных насосных и очистных станций с вынесением последним за пределы жилой застройки. Используемые при строительстве коммуникаций технологии позволяют минимизировать неблагоприятное воздействие на окружающую среду.</p>
<p>
	&nbsp;<strong>Инфраструктура.</strong></p>
<p>
	Площадь общественных территорий под объекты социально-бытового обслуживания, рекреационного назначения и объекты инженерной инфраструктуры составляет более 40 %, что позволит обеспечить в будущем жителей посёлка всеми необходимыми элементами социальной и бытовой инфраструктуры для комфортного проживания.</p>
<p>
	Проектом планировки предусмотрено строительство на территории поселка 2-ух торговых центров площадью 650 кв.м и 2150 кв.м, детского сада и начальной школы, административного здания поселка, ресторана и физкультурно-оздоровительного центра. В стоимость земельного участка включено строительство торгового центра площадью 650 кв.м, детского сада расчетной численностью 40 детей и административного здания поселка. Остальные объекты строятся за счет привлеченных инвестиционных средств с предоставлением инвестору земельных участков в долгосрочную аренду. В настоящий момент разработаны архитектурные проекты торгового центра и административного здания поселка и направлены обращения в администрацию городского округа Домодедово за разрешением на строительство.</p>
<p>
	Поселок обладает уникальной транспортной доступностью, формируемой за счет равно удаленности от современных скоростных трасс: Каширского и Симферопольского шоссе. До посёлков можно добраться ж/д транспортом с Павелецкого вокзала.</p>
<p>
	<u><em>Стоимость от 180 000 руб./сотка</em></u></p>
<p>
	<strong>Готовые дома в поселке</strong></p>
', '4', '55.338225', '37.764602');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('149', '1', '4', '10.00', '0', '25.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Кирпичный 3-х этажный дом. Киевское ш. 25 км.', '/_files/130770164583.gif', '/_files/130770164521.JPG', '/_files/130770164575.JPG', '/_files/130770164546.JPG', '/_files/130770164528.JPG', '/_files/130770164507.JPG', '/_files/130770164532.JPG', '/_files/130770164548.JPG', '/_files/130770164511.JPG', '/_files/130770164502.JPG', '19600000.00', '', '0', '<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Продаётся 3-х этажный дом в 25 км от МКАД по Киевскому ш. СНТ Чистые пруды 2 , рядом населённый пункт Крёкшино. Дом построен в 1995 году, выполнен из красного кирпича, общая площадь 380 кв.м. На участке 10 соток сделан ландшафтный дизайн, посажен газон, кустарники и деревья, очень красивые цветники, разведено декоративное освещение вокруг &nbsp;дома. Участок огорожен кирпичным забором, охраняется. Дом с двумя тёплыми гаражами и сауной. Газ, электричество, септик, вода скважина, хорошая подъездная дорога. Очень красивое и живописное окружение, лес, вода.</p>
', '4', '55.598184', '37.116076');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('150', '1', '14', '40.00', '0', '19.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'lena@kuz.me
89154755727
Елена
8(916)9924382 - собственник в Домодедово', '0', '0', '0', '0', '0', '0', 'Дом 300 кв. метров в березовой роще в черте города Домодедово', '/_files/130804262049.gif', '/_files/130804262093.jpg', '/_files/130804262003.jpg', '/_files/130804262068.jpg', '/_files/130804262034.jpg', '/_files/130804262094.jpg', '/_files/130804262024.jpg', '/_files/130804262011.jpg', '/_files/130804262056.jpg', '/_files/130804262016.jpg', '13600000.00', '', '0', '<p>
	Продается участок 40 соток с домом в березовой роще. Дом расположен&nbsp;в черте города Домодедово. Общая площедь 300 кв. метров. Коммуникации: Газ, Электричество, Вода.</p>
', '4', '55.414327', '37.778292');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('233', '3', '10', '15.00', '0', '18.00', '0.00', '1', '2', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'От радюк', '0', '0', '0', '0', '0', '0', 'Предлагается  шикарный лесной земельный участок 14 соток ИЖС', '/_files/132912806421.gif', '/_files/132912806416.JPG', '/_files/132912806412.JPG', '/_files/132912806443.JPG', '/_files/132912806495.JPG', '/_files/132912806428.JPG', '/_files/132912823832.jpg', '', '', '', '11700000.00', '', '0', '<p>
	Уникальное предложение!!!</p>
<p>
	Вашему вниманию предлагается&nbsp; шикарный лесной земельный участок 14 соток ИЖС.</p>
<p>
	&nbsp;Месторасположение: Рублево-Успенское ш., 21 км от МКАД, середина Николиной горы</p>
<p>
	дер. Маслово. &nbsp;</p>
<p>
	Коммуникации: газ, электричество по границе участка.</p>
<p>
	Стоимость:&nbsp; 390&nbsp;000 долл.</p>
', '4', '55.746813', '37.062292');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('152', '3', '7', '10.00', '0', '20.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Земельный участок в д. Обушково
Новорижское ш. 20 км от МКАД

', '/_files/130821394928.gif', '', '', '', '', '', '', '', '', '', '4800000.00', '', '0', '<p>
	Продаётся участок 10 соток в д.Обушково Истринский район МО. Проезд по Новорижскому ш 20 км от МКАД.&nbsp; Участок ровной формы для ИЖС, коммуникации проходят по границе, есть два соседа.&nbsp; В деревне продуктовый магазин, хороший асфальтовый подъезд, в 1 км лес, в 1,5 км запруда р.Белая, очень красивое и живописное место!<br />
	&nbsp;</p>
', '4', '55.795238', '37.022510');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('153', '4', '9', '10.00', '0', '53.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Уникальный посёлок на 37 домовладений. Дмитровское ш. 53 км', '/_files/130831759201.gif', '/_files/130831776750.jpg', '/_files/130831776700.jpg', '/_files/130831776707.jpg', '/_files/130831776762.jpg', '/_files/130831776765.jpg', '/_files/130831776772.jpg', '/_files/130831776751.jpg', '/_files/130831776722.jpg', '/_files/130831776756.jpg', '1200000.00', '', '0', '<p>
	Предлагаются к продаже земельные участки в посёлке на 37 домовладений близ д.Ваньково расположенного в 53 км по Дмитровскому шоссе.</p>
<p>
	К продаже предлагаются участки <strong>10, 15, 25 соток</strong> с подрядом или без подряда.</p>
<p>
	<strong>Стоимость участков от 120 000 до 160 000 руб за сотку.</strong></p>
<p>
	Коммуникации все в поселке(свет 7кв, газ, вода скважина на каждом участке, канализация септик).Проезд к поселку по асфальтированной дороге, круглогодичный. В 2 км находится лесное озеро. До г.Дмитров 12км.</p>
<p>
	Посёлок расположен в Дмитровском районе Московской области в окружении хвойных и лиственных лесов и предтавляет собой отдельную лесную опушку. Расположен в окружении леса, в шаговой доступности протекает река, в 5-10 минутной доступности на автомобиле &ndash; уникальное лесное озеро и водохранилище. 1 км &ndash; освещенный родник с купелью. Историческое месторасположение усадьбы художника Васнецова. Экологически чистая зона Клинско-Дмитровской гряды.&nbsp;</p>
<p>
	&nbsp;</p>
<p>
	<strong>ГОТОВЫЕ ДОМА:</strong></p>
<p>
	спецпредложение</p>
<p>
	<strong>3 870 000 руб</strong></p>
<p>
	Участок 10 соток (№14) + дом 170 м кв + полный пакет коммуникаций</p>
<p>
	<strong>3 800 000 руб</strong></p>
<p>
	Участок 10 соток (№16) + дом 170 м кв + полный пакет коммуникаций</p>
<p>
	&nbsp;</p>
<p>
	<strong>*АКЦИЯ&nbsp; </strong><strong>Участок 10 соток по 95 000 руб за сотку!!! </strong>Акция действует при условии заключения договора подряда на строительство.</p>
<p>
	Стомость строительства домов от 10 000 руб за кв.м. Зависит от материала (профилированный или клееный брус, оцилиндрованное бревно) и комплектации.</p>
<p>
	КОММУНИКАЦИИ СТОИМОСТЬ:</p>
<p>
	&bull;450 000 руб. Пакет коммуникаций (газ 300 000р до участка + электричество 150 000р до участка 8кВт).</p>
<p>
	&bull;100 000 руб. Канализация (право подключения септика к дренажной системе поселка). Септик в стоимость не входит.</p>
<p>
	&bull;100 000 руб. Водопровод</p>
<p>
	Поселок располагает&nbsp; своей электроподстанцией, газовой магистральной трубой, системой водоснабжения и канализации.</p>
<p>
	Поселковая КТП</p>
<p>
	Историческое месторасположение великого русского художника Васнецова.&nbsp;&nbsp; С одной стороны по дороге к посёлку вдоль всего подмосковного пути расположен канал имени Москвы и цепь знаменитых водохранилищ: Пироговское, Клязьминское, Пестовское, Иваньковское, Икшинское, с другой &mdash; Клинско-Дмитровская гряда. Рядом с поселком озера и родник.&nbsp; Летом доступны великолепные пляжи, открыты яхт-клубы, созданы конноспортивные базы, картинговые трассы. Зимой работают такие знаменитые горнолыжные парки, как Яхрома, Тягачево, Сорочаны, Степаново.</p>
<p>
	От локального (нешумного) шоссе до поселка мы для Вашего удобства через лес проложили асфальтовую дорогу длиной 1 км.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Рядом с поселком находится уникальное лесное озеро, в шаговой доступности протекает река Яхрома и освещенный родник с купелью.</p>
<p>
	Предусмторены:&nbsp; управляющая компания, общие зоны отдыха (спортивные и детские площадки).</p>
', '4', '56.266927', '37.699800');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('155', '2', '12', '0.00', '0', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Продаётся комната в сталинском доме м. ВДНХ', '/_files/130864766242.gif', '/_files/130864766257.jpg', '/_files/130864766298.jpg', '/_files/130864766293.jpg', '/_files/130864766218.jpg', '/_files/130864766214.jpg', '', '', '', '', '2650000.00', '', '0', '<p>
	Продаётся комната 19,6 кв.м в на 7 этаже 3-х комнатной квартиры сталинского дома, 3 мин пешком от м. ВДНХ, ул. Академика Королёва д.1. Общая площадь квартиры 80 кв.м., кухня 9,7 кв.м., с/у раздельный, большой коридор, высокие потолки 3,10 м, окна выходят во двор, балкон. Зелёный тихий двор с детской площадкой, чистый и аккуратный подъезд. Квартира перспективна для разъезда, всего два лицевых счёта!!!<br />
	<br />
	&nbsp;</p>
', '4', '55.820662', '37.635333');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('156', '7', '8', '1.00', '0', '25.00', '0.00', '1', '1', '2', '1', '2', '4', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Cовременный таунхаус рядом с тремя озерами.', '/_files/130892246090.gif', '/_files/130892246091.jpg', '/_files/130892246050.jpg', '/_files/130892246037.jpg', '/_files/130892246088.jpg', '/_files/130892246080.jpg', '/_files/130892246045.jpg', '/_files/131980935832.jpg', '/_files/131980935885.jpg', '/_files/131980935807.jpg', '5040000.00', '', '0', '<p>
	Предлагаем Вам последние&nbsp;2 секции таунхауса, 150 м.кв. и 120 м.кв. Об объекте: Современный 3 &ndash; этажный таунхаус, состоящий из 19 секций в 25 км от МКАДа по Ленинградскому, Дмитровскому или Рогачёвскому шоссе. Дмитровский район, Габовское с/п, д. Рыбаки. Ближайший населённый пункт гор. Лобня. Категория земель ИЖС, назначение - земли населённых пунктов. На первом этаже (50 м.кв. или 40 м.кв.) &ndash; входная группа, лестничный блок, помещение свободной планировки. На втором (50 м.кв. или 40 м.кв.) и третем этажах(50 м.кв. или 40 м.кв.) &ndash; санузел, лестничный блок, Помещение свободной планировки. Потолки высотой 3 м., Крыша &ndash; эксплуатируемая мембранного типа. Все коммуникации внутри каждой секции. Инфраструктура: Рядом с вашим будущим домом расположены: супермаркет, ресторан и кафе. Окружение: В 20 метрах от объекта смешанный лес, в 400 м. красивейший сосновый бор. Три больших красивых озера, где можно купаться и рыбачить. До ближайшего озера Круглое - 1 км. Условия приобретения: Стоимость за кв. м. - 42 000 руб. с учетом земельного участка. Предусмотрена рассрочка на четыре равных платежа в течение 6 месяцев.</p>
', '4', '56.061590', '37.361755');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('157', '6', '6', '6.00', '0', '12.00', '0.00', '1', '1', '1', '1', '2', '2', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Готовый дуплекс под ключ в 12 км от МКАД, Можайскому или Минскому шоссе', '/_files/130892280184.gif', '/_files/130892280127.jpg', '/_files/130892280111.jpg', '/_files/130892280182.jpg', '/_files/130892280159.jpg', '/_files/130892280154.jpg', '/_files/130892280194.jpg', '/_files/130892280151.jpg', '/_files/130892280172.jpg', '/_files/130892280150.jpg', '7500000.00', '', '0', '<p>
	У дома предусмотрено 4 отдельных, изолированных входа и въездная группа на 2 машины. Каждая часть имеет свой коридор, сан. узел, кухню и жилую комнату. На каждую часть проведен отдельный счетчик электроэнергии. 12 км. от МКАД, Можайское &ndash; Минское ш. ст. Пионерская 15 мин. пешком, ст. Перхушково 5 мин. пешком. 2-х этажный жилой дом &laquo;под ключ&raquo; 200 кв.м., 2010 год постройки. Участок 6 соток, возможно приоретение соседнего участка тоже 6 соток. Стародачное, полностью жилое место. В основном люди живут круглогодично. Развитая инфраструктура жилые комплексы Дубки и Гусарская баллада находятся на противоположной стороне Можайского ш. от въезда в поселок, г. Одинцово 2 км. Готовый бизнес Дом, возможно, приобрести как целиком, так и на две семьи. Или использовать его в дальнейшем для сдачи в аренду, как 4 однокомнатные квартиры, а это 30 000 руб. с одной части в месяц! Коммуникации: Электричество 15 Квт, Газ- магистраль, Септик Топаз 20, Вода &ndash; скважина.</p>
', '4', '55.653282', '37.228374');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('158', '6', '6', '2.00', '0', '20.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Таунхаус п.Жаворонки, 20км от Москвы,и вы живописном месте. ', '/_files/130892296327.gif', '/_files/130892296348.jpg', '/_files/130892296356.jpg', '/_files/130892296399.jpg', '/_files/130892296322.jpg', '/_files/130892296395.jpg', '', '', '', '', '12500000.00', '', '0', '<p>
	Площадь дома 170 (м&sup2;) Площадь участка 2 (сотки)<br />
	Комуникации - центральные<br />
	Цена 12 500 000 руб.<br />
	Эксклюзивный поселок &laquo;Жаворонки-1&raquo;, расположенный в 20 км от МКАД по Можайскому шоссе, представляет собой огороженную и охраняемую территорию поселка таунхаусов и коттеджей с собственным декоративным озером, беседками, прогулочными зонами и детской площадкой. Поселок имеет отличную транспортную доступность, добраться в него возможно также по Рублево-Успенскому, Минскому, Киевскому и Боровскому шоссе. В 15 минутах ходьбы - ж/д станция &quot;Дачное&quot;. Поселок полностью построен и готов к заселению!!!</p>
', '4', '55.627929', '37.094522');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('159', '7', '8', '5.00', '0', '18.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дуплекс 200 кв. метров под чистовую отделку Ленинградское шоссе 18 км от МКАД', '/_files/130892314873.gif', '/_files/130892314824.jpg', '/_files/130892314815.gif', '/_files/130892314861.gif', '', '', '', '', '', '', '6000000.00', '', '0', '', '4', '55.999365', '37.310300');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('224', '3', '7', '27.00', '0', '95.00', '0.00', '4', '2', '5', '5', '2', '6', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '05.12.2011	89035118373	
Полубояров Дмитрий Владимирович	
Хочет что бы мы продали участок Волокаламский р-н, сельское поселение Теряево 2 900 000 
5% комиссия	
poldmitry@rambler.ru выслан договор и список необходимых документов. 7.12 
Выслал заполненный договор Созвон 20.12
', '0', '0', '0', '0', '0', '0', 'Участок в деревне Теряево 95 км от МКАД Новорижское шоссе', '/_files/132403810505.gif', '/_files/132403810508.JPG', '/_files/132403810546.JPG', '/_files/132403810546.JPG', '/_files/132403810523.JPG', '', '', '', '', '', '2900000.00', '', '0', '<p>
	- Адрес: МО, Волокаламский р-н, сельское поселение Теряево.</p>
<p>
	- Удаленность - 80 км. по Новойрижскому шоссе в сторону Волоколамска, и еще<br />
	15 км. в сторону - всего 95 км.<br />
	- Участок приобретен в ноябре 2007 года.<br />
	- все документы в наличии в полном объеме<br />
	- Площадь - 2 660 кв.м.<br />
	- целевое использование - ИЖС<br />
	- Ровный участок<br />
	- К участку подведена асфальтированная дорога<br />
	- Подвод хол.воды от сельской водонапорной башни по новой проложенной сети<br />
	- Подвод к участку электричества<br />
	- Точка газа на начале улицы - за три участка (примерный расчет подвода газа<br />
	к каждому участку 360 000 руб.) В противном случаи, администрация<br />
	района имеет четкое предписание подвести газ к каждому дому до 2012 года,<br />
	т.е. в течении максимум 2-х лет администрация своими силами и за свой счет<br />
	обеспечит все участки подводом газа.<br />
	- 2 км. до большого чистого монастырского пруда<br />
	- 3 км. до Иосифо-Волоколамского монастыря<br />
	- 8 км. До платформы Чисмена<br />
	- на расстоянии 5 км. виден Завидовский заповедник<br />
	- весьма достойные соседи<br />
	<br />
	&nbsp;</p>
<p>
	<iframe allowfullscreen=\"\" frameborder=\"0\" height=\"315\" src=\"http://www.youtube.com/embed/U5r8auUZ_5o\" width=\"420\"></iframe></p>
', '4', '56.179946', '36.135312');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('185', '4', '7', '10.00', '0', '30.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Коттеджный посёлок близ д.Петровское. Новорижское ш. 30 км.
', '/_files/131340156006.gif', '/_files/131340177364.jpg', '/_files/131340177369.jpg', '/_files/131340177319.jpg', '/_files/131340177300.jpg', '/_files/131340177372.jpg', '/_files/131340177307.jpg', '/_files/131340177329.jpg', '/_files/131340177377.jpg', '/_files/131340177355.jpg', '3280000.00', '', '0', '<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\">Коттеджный поселок в 30км от МКАД по Новорижскому шоссе, расположен по адресу: Московская область, Истринский район, Ивановский с/о., в районе деревни Петровское. </span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\">Данное направление является одним из наиболее престижных и экологически чистых мест ближнего Подмосковья. Район застройки находится в живописном месте &ndash; в двух километрах река Истра, часть участков лежит на опушке леса, а на части растут лесные деревья.</span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\">На территории поселка предусмотрено административное здание, гостевая автостоянка, общественная зона отдыха с прудом и детской площадкой. Территория огорожена, освещена и круглосуточно охраняется.</span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\">Жилая зона поселка организована на основе застройки индивидуальными жилыми домами с земельными <u>участками площадью от 8 до 24 соток </u>и удобным подъездом к каждому участку. Предусматривается возможность объединения нескольких участков.<u> Участки продаются без подряда,</u> и строительство жилых домов осуществляется Вами по индивидуальным проектам. Однако по Вашему желанию мы можем организовать и строительство коттеджей (в соответствии с архитектурной концепцией предлагаются различные проекты).</span></font></p>
<p>
	<u><font face=\"Times New Roman CYR\"><span lang=\"RU\">Стоимость сотки от 410 000 рублей,</span></font></u><font face=\"Times New Roman CYR\"><span lang=\"RU\"> цена зависит от расположения участка в посёлке.</span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\"><u>Коммуникации</u></span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\"><i>Дороги</i></span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\">От Новорижского шоссе к поселку ведет асфальтированная дорога. На подъезде и внутри поселка проложены дороги с покрытием из дорожных плит.</span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\"><i>Электроснабжение</i></span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\">На территории поселка расположена электроподстанция мощностью 2000 кВт. По территории проложена линия электропередач, способная обеспечить каждый индивидуальный участок электроснабжением мощностью не менее 10 кВт по трем фазам, 380 В. При необходимости существует возможность приобретения дополнительной мощности. На период строительства подключение осуществляется по временной схеме.</span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\"><i>Газоснабжение</i></span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\">Газораспределительная станция расположена на территории поселка. В настоящее время проводятся работы по вводу в эксплуатацию газопровода среднего давления (3 атм.). Через понижающий ящик к каждому участку подведен газопровод низкого давления (0.2 атм). Работы по обустройству газопроводной сети завершены. Подача газа будет осуществлена при появлении первых потребителей.</span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\"><i>Водоснабжение</i></span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\">Забор воды для поселка происходит из глубоководной скважины с глубины 145 м. Обустроена резервная скважина. Завершено строительство Водозаборного узла. В состав водозаборного узла входят два резервуара емкостью по 50 м3, выполняющие также роль пожарных резервуаров. Сеть холодного водоснабжения от водозаборного узла способна обеспечить получение воды для каждого коттеджа из расчета не менее 1,2 м3 в сутки. Расчетное давление в сети &ndash; 6 атм. В настоящее время организуется возможность забора воды непосредственно с водозаборного узла для целей строительства.</span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\"><i>Канализация</i></span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\">Поселок обеспечен современным комплексом по очистке бытовых сточных вод производительностью 200 м3/сутки, разработанным специалистами компании </span></font><font face=\"Times New Roman\"><span lang=\"EN\">&laquo;</span></font><span lang=\"RU\"><font face=\"Times New Roman CYR\">НВР-БИО</font></span><font face=\"Times New Roman\"><span lang=\"EN\">&raquo;. </span></font><span lang=\"RU\"><font face=\"Times New Roman CYR\">По территории поселка проложена канализационная сеть, способная обеспечить прием стоков из расчета не менее 1,2 м3 в сутки с каждого коттеджа.</font></span></p>
<p>
	<span lang=\"RU\"><font face=\"Times New Roman CYR\"><i>Телефонизация</i></font></span></p>
<p>
	<span lang=\"RU\"><font face=\"Times New Roman CYR\">В поселке предусмотрена установка телефонной станции оптиковолоконной связи на 1000 номеров и подключение к сети Интернет. В настоящее время осуществляется прием заявок на установку телефонных номеров. При накоплении необходимого количества заявок начнутся работы по прокладке кабеля.</font></span></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\">При приобретении земельного участка в собственность Вам гарантируется: </span></font></p>
<p>
	<span lang=\"\">&bull;</span><font face=\"Times New Roman CYR\"><span lang=\"RU\">Возможность бесплатного подключения жилых домов к канализации и к сетям электро- и водоснабжения*. Работы по подключению к внутренней сети газоснабжения к построенному жилому строению оплачиваются обслуживающей организации.</span></font></p>
<p>
	<span lang=\"\">&bull;</span><font face=\"Times New Roman CYR\"><span lang=\"RU\">Бесперебойное снабжение расположенных на участках жилых домов и хозяйственных построек соответствующими видами коммунальных услуг в соответствии с действующим законодательством, правилами, установленными эксплуатирующими организациями &ndash; поставщиками услуг, и по расценкам не выше установленных решением общего собрания собственников участков. </span></font></p>
<p>
	<font face=\"Times New Roman CYR\"><span lang=\"RU\">В случае если подключение внутренних сетей газоснабжения и/или электроснабжения Поселка к соответствующим наружным сетям не может быть осуществлено по причинам, не зависящим от нас, срок окончания работ по сдаче в эксплуатацию сетей газоснабжения и/или электроснабжения Поселка, может быть продлен.</span></font></p>
<p>
	<u><font face=\"Times New Roman CYR\"><span lang=\"RU\">Инфраструктура </span></font></u><font face=\"Times New Roman CYR\"><span lang=\"RU\">- в поселке планируется магазин товаров первой необходимости, детские и спортивные площадки. Ближайшие города с развитой инфраструктурой Истра 17 км, Звенигород 13 км.</span></font></p>
', '4', '55.901664', '37.082677');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('160', '5', '4', '76.00', '0', '110.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Участок промышленного назначения, по Киевской трассе. От трассы 40 метров. От МКАД 110км', '/_files/130892461173.gif', '/_files/130892461130.JPG', '/_files/130892461186.JPG', '/_files/130892461139.JPG', '/_files/130892461134.JPG', '', '', '', '', '', '4500000.00', '', '0', '<p>
	Участок промышленного назначения, по Киевской трассе. От трассы 40 метров. От МКАД 110км. Подъезд асфальтирован,круглогодичный. Участок 76 соток, правильной формы в собственности. Коммуникации: Свет по границе, газ по границе. Отличное место.</p>
', '4', '55.008376', '36.543231');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('161', '1', '9', '30.00', '0', '14.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '(916)7909848 Валерий собственник', '0', '0', '0', '0', '0', '0', 'Великолепный дом на возвышенности в д.Сумароково.  Дмитровское ш. 14 км от МКАД.', '/_files/130917661495.gif', '/_files/130917661428.JPG', '/_files/130917661459.JPG', '/_files/130917661464.JPG', '/_files/130917661458.JPG', '/_files/130917661446.JPG', '/_files/130917661439.JPG', '/_files/130917661426.JPG', '/_files/130917661450.JPG', '/_files/130917661466.JPG', '29500000.00', '', '0', '<p>
	Продаётся великолепный дом на ухоженном участке 30 соток в 14 км от МКАД по Дмитровскому ш., Мытищинский р-н, дер. Сумароково. Очень красивое и живописное место, вокруг зелёные посадки, рядом &nbsp;чистые озёра и пруд для рыбалки и купания.</p>
<p>
	Участок ровной формы, расположен на возвышенности, прилегающая к участку территория зеленая, ухожена, - используется как собственная зона отдыха, спорт-площадка. На &nbsp;территрии участка сделан ландшафтный дизайн: зелёный газон, декоративные кустарники, &nbsp;вокруг &nbsp;посадка деревьев, пруд (с рыбой), альпийская горка, детская площадка, сад, гараж на 3 авто, гостевая парковка, площадка для барбекю.</p>
<p>
	<u>Основной дом</u>400 кв.м. выполнен из&nbsp; кирпича в три уровня, крытая веранда и гараж на 2 авто. В доме: подвал (3 помещения), кухня, столовая, зал с камином, 5 спален, 3 санузла.<br />
	<u>Гостевой дом</u>&nbsp; деревянный,&nbsp; двухэтажный (400 м2) с пристроенным крытым бассейном. В доме: сауна, джакузи, бильярдный зал с камином, фитнес-зал, 2 комнаты отдыха, 3 спальни, 4 санузла, кухня. На участке расположен&nbsp; отдельно стоящий флигель: 1 комната совмещенная с кухней + санузел.<br />
	К дому ведёт хорошая асфальтовая дорога. Все коммуникации заведены: газ-магистральный, электричество, вода - свой колодец, канализация - септик. Участок огорожен забором, выполненном из кирпича, искусственного камня и ковки.<br />
	В 500 м развитая инфраструктура, г.Лобня, до ж/д и автобусной станции 1,5 км.(20 мин.)<br />
	<br />
	&nbsp;</p>
', '4', '55.995597', '37.516680');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('162', '3', '5', '30.00', '0', '80.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Продается участок в заповедной зоне Жуковского района, деревня Воробьи, рядом с Парком птиц.', '/_files/130917875925.gif', '/_files/130917875934.JPG', '/_files/130917875996.JPG', '/_files/130917875952.JPG', '/_files/130917875919.JPG', '/_files/130917875933.JPG', '/_files/130917875926.JPG', '', '', '', '2500000.00', '', '0', '<p>
	Продается участок в заповедной зоне Жуковского района, деревня Воробьи, рядом с Парком птиц. От МКАД 80 км. по&nbsp;Калужскому шоссе. Удобно добираться общественным транспортом от жд вокзала- Балабаново. Участок ровный, правильной формы 30 соток, также возможна продажа по 15 соток. Участок огорожен с двух сторон профлистом, крайний к лесу, река в 200 метрах- Истья. Очень живописное место, на участке посажены березы и ели.Подьезд круглогодичный.</p>
<p>
	Коммуникации:</p>
<p>
	- свет по границе участка (оплачено).</p>
<p>
	-газ по границе участка, оплата за подключение будет составлять 70 тыс.руб.</p>
<p>
	- 2скважины с разводкой.</p>
<p>
	Также на участке стоит готовый фундамент 13х13, осталось только поставить коробку.</p>
', '4', '55.136917', '36.819820');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('163', '4', '14', '9.00', '0', '55.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дачный посёлок у д.Нефёдьево. Каширское ш. 54 км от МКАД', '/_files/130926588773.gif', '/_files/130926588753.jpg', '/_files/130926588710.jpg', '/_files/130926588714.jpg', '/_files/130926588793.jpg', '', '', '', '', '', '198000.00', '', '0', '<p>
	Предлагаем земельные участки в дачном посёлке, расположенном в эклогичном Ступинском районе Московской области, 54 км от МКАД по Каширскому или Новорязанскому ш.</p>
<p>
	Хорошая экология - это, прежде всего, здоровье Ваше и Ваших детей. На многие километры вокруг поселка нет промышленных предприятий. Живописные луга, лесные массивы и водоемы создают прекрасные возможности для отдыха, рядом д. Нефёдьево.</p>
<p>
	<u>Участки в посёлке от 7 до 22 соток без обязательного подряда, </u>что позволит Собственнику по своему реализовать свой творческий потенциал.&nbsp; Все участки максимально правильной формы. Кроме дачных участков на территории предусматриваются необходимые технические зоны и зоны рекреации, в том числе детская и спортивная площадка.</p>
<p>
	Для организации территории поселка предусмотрено комплексное строительство дорожной сети и электрификация.</p>
<p>
	&nbsp;</p>
<p>
	<u>В поселке предусмотрено обустройство:</u></p>
<p>
	1 этап: комплексное строительство дорожной сети с твердым покрытием (песок, щебенка), с шириной проезжей части 5м, при этом общая ширина улиц и проездов составит 15 м. для главных и 9 м. для второстепенных дорог.</p>
<p>
	2 этап: подведение электричества от 7 кВт на участок с обеспечением точки подключения к линиям, разведенным по поселку не далее 25 м. от каждого участка. Для учета потребления электроэнергии поселок будет оснащен АСКУЭ (автоматизированная система контроля и учета энергопотребления), обеспечивающей учет по индивидуальным счетчикам энергопотребления.</p>
<p>
	3 этап: общее ограждение из профлиста по периметру участка с организацией въездной группы и охрана. Обустройством поселка занимается дачное некоммерческое партнерство, в которое после оформления прав собственности будут включены все покупатели.</p>
<p>
	&nbsp;</p>
<p>
	<em>Стоимость участков &ndash; от 33 тыс. до 49 тыс. рублей за сотку</em>в зависимости от расположения участка. Невысокие цены обусловлены начальной стадией реализации проекта и не сохранятся долго!</p>
<p>
	Порядок оплаты.</p>
<p>
	За земельный участок оплачивается:</p>
<p>
	- 50% стоимости участка при заключении Предварительного договора купли-продажи земельного участка</p>
<p>
	- 50% стоимости при заключении Основного договора купли-продажи земельного участка.</p>
<p>
	Целевой взнос в дачное партнерство за обустройство оплачивается:</p>
<p>
	- за 1 этап (строительство дорог) - 8 тыс. рублей за сотку Участка при заключении Предварительного договора купли-продажи земельного участка</p>
<p>
	- за 2 этап (электрификация) - 145 тыс. руб.&nbsp; до 01.07.2011 г.</p>
<p>
	- за 3 этап - 49 тыс. руб.&nbsp; в срок по решению Дачного партнерства после заключения Основного договора купли-продажи земельного участка.</p>
<p>
	&nbsp;&nbsp;</p>
<p>
	&nbsp;&nbsp; Подъезд до Поселка от Москвы занимает немногим более 1 часа, а длина пути автомобилем составит 69 км.:</p>
<p>
	- по Каширскому шоссе с проездом через п.Барыбино, далее через Большое Алексеевское по прекрасной асфальтовой дороге местного значения Малино - Бронницы до въезда в поселок&nbsp; в районе поворота на д. Нефёдьево или</p>
<p>
	- по Новорязанскому шоссе до г.Бронницы, далее - съезд на ММК (А-107), далее - поворот на д. Толмачево и далее - по прекрасной асфальтовой дороге местного значения Малино - Бронницы до въезда в поселок&nbsp; в районе поворота на д. Нефёдьево.</p>
', '4', '55.178206', '38.176675');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('164', '4', '14', '10.00', '0', '55.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дачный посёлок у воды вблизи д.Ламоново. Каширское ш. 55 км от МКАД.', '/_files/130926605089.gif', '/_files/130926605001.jpg', '/_files/130926605019.jpg', '/_files/130926605063.jpg', '/_files/130926605088.jpg', '/_files/130926605043.jpg', '/_files/130926605037.jpg', '/_files/130926605024.jpg', '', '', '530000.00', '', '0', '<p>
	Земельные участки в коттеджном посёлке вблизи д.Ламоново. Место уникально по своей красоте и уюту, живописная местность, лес, большой пруд. Подъезд до Поселка от Москвы занимает немногим более часа, по Каширскому шоссе с проездом через Барыбино или по Новорязанскому шоссе с проездом через Бронницы. 55 км от МКАД.</p>
<p>
	&nbsp;</p>
<p>
	<u>Предлагаем участки на любой вкус от 9 до 22 соток:</u>у воды, у леса, в центре посёлка.</p>
<p>
	<u>Отсутствие обязательного подряда,</u>с одной стороны, и единая архитектурная концепция с комплексным обустройством, с другой стороны, обеспечивают возможность</p>
<p>
	- спланировать финансовые вложения в строительство</p>
<p>
	- иметь гарантию предсказуемой организации общего пространства и соблюдения общих требований к застройке.</p>
<p>
	<u>Уникальность посёлка</u></p>
<p>
	Круглогодичный подъезд к участку обеспечивает проходящая по южной границе участка асфальтовая дорога на д. Ламоново от автодороги Малино - Бронницы.</p>
<p>
	По западной и северной границам участка расположены лесной массив и живописный рукотворный пруд, а в 150 м. восточнее участка &ndash; обустроенный родник с чистейшей водой.</p>
<p>
	Кроме дачных участков на территории предусматриваются необходимые технические зоны и зоны рекреации, в том числе детская и спортивная площадки, площадка для барбекю на берегу пруда.</p>
<p>
	Также, проект предусматривает организацию гостевых парковок, 2 въездные группы с пунктами охраны, административное здание, магазин розничной торговли.</p>
<p>
	&nbsp;</p>
<p>
	<u>Для формирования единой архитектурной среды </u>условиями договоров предусматриваются:</p>
<p>
	1. Общее внешнее ограждение. Вид внешней части забора - мет.профлист &quot;под дерево&quot; (цвет - ольха) на кирпичных столбах (красные).</p>
<p>
	2. Фасадные части ограждения участков в соответствии с видом (цвет, тип фактуры) фасадных частей общего ограждения - красные кирпичные столбы в качестве опорной конструкции и мет. профлист &quot;под дерево&quot; либо дерево в пролетах между опорами.</p>
<p>
	3. Цвет кровельного покрытия красно-коричневого цвета, близкого к цветам RAL 3004 Purpurrot, RAL 3011 Braunrot.</p>
<p>
	&nbsp;</p>
<p>
	&nbsp;Обустройством территории поселка занимается <u>Дачное некоммерческое партнерство,</u> выполняющее следующие работы:</p>
<p>
	1. Реконструкция и строительство подъездных путей и внутрипоселковых дорог с шириной проезжей части 5м, при этом общая ширина улиц и проездов составит 15 м. для главных и 9 м. для второстепенных дорог:- с песчано-гравийным покрытием - в срок до 31 октября 2011 года- с асфальтовым покрытием - в срок до 31 октября 2013 года.</p>
<p>
	2. Установка внешнего ограждения Поселка, подключение автоматизированной системы охраны периметра, обустройство помещения для дежурного по поселку - в срок до 31 октября 2011 года.</p>
<p>
	3. Обеспечение точки забора воды для технических нужд в срок до 31 июня 2011 года.</p>
<p>
	4. Получение от энергоснабжающей организации технических условий (ТУ) на технологическое присоединение к электрической сети, исполнение полученных ТУ, в том числе: строительство линий электропередач до границы Поселка, установка ТП, а также строительство внутренних линий электропередач на территории Поселка в срок до 01 мая 2012 года с обеспечением возможности подключения к данным линиям зданий и сооружений на Участке с точкой подключения не более чем в 25 м. от границы участка, с предоставлением максимальной единовременной мощности не менее 10 кВт.</p>
<p>
	5. Организация всесезонного централизованного питьевого водопровода от собственного водозаборного узла с обеспечением возможности подключения к водопроводной сети зданий и сооружений на Участке с точкой подключения не более чем в 15 м. от границы Участка в срок до 01 мая 2012 года.</p>
<p>
	6. Строительство служебных помещений для работы Правления, для предприятия розничной торговли, помещения для хранения мотопомпы и другого необходимого оборудования, обустройство спортивной и детской площадок - в срок до 31 декабря 2012 года.</p>
<p>
	Кроме вышеуказанного комплекса обустройства Дачным партнерством принято решение&nbsp; о газификации&nbsp; поселка в период осень 2012 - весна 2013 г.&nbsp; Сметная стоимость работ будет расчитана после выполнения проекта присоединения к&nbsp; газовой сети.</p>
<p>
	<em>Стоимость участков &ndash; от 59 тыс. до 89 тыс. рублей за сотку </em>в зависимости от расположения участка.</p>
<p>
	Целевой взнос на комплексное обустройство - 560 тыс. рублей с одного участка</p>
<p>
	&nbsp;</p>
<p>
	Порядок оплаты.</p>
<p>
	За земельный участок</p>
<p>
	&bull; 50% стоимости участка при заключении Предварительного договора купли-продажи земельного участка</p>
<p>
	&bull; 50% стоимости при заключении Основного договора купли-продажи земельного участка.</p>
<p>
	Целевой взнос в дачное партнерство за обустройство оплачивается:</p>
<p>
	&bull; 280000 руб. в течение 3-х рабочих дней с момента подписания Предварительного договора</p>
<p>
	&bull; 280000 руб.&nbsp; до 01 мая 2012 г., но, в любом случае, не позднее даты заключения договора купли-продажи Участка</p>
', '4', '55.189367', '38.208808');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('165', '4', '9', '15.00', '0', '79.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Посёлок на уютной поляне в окружении леса, д. Акулово. Дмитровское ш. 79 км от МКАД', '/_files/130936238069.gif', '/_files/130936238080.jpg', '/_files/130936238093.jpg', '/_files/130936238048.jpg', '/_files/130936238042.jpg', '/_files/130936238077.jpg', '/_files/130936238093.jpg', '/_files/130936238093.jpg', '/_files/130936238059.jpg', '/_files/130936238070.jpg', '525000.00', '', '0', '<p>
	<strong>В посёлке 53 земельных участка <u>по 15 соток</u>, у</strong>частки в окружении леса, есть участки с деревьями;</p>
<p>
	Дмитровский район Московской области является популярным местом отдыха жителей Московского региона.<br />
	Наличие крупных водных объектов, значительные площади лесных массивов, прекрасная транспортная доступность &ndash; все это делает Дмитровский район отличным местом для летнего отдыха.</p>
<p>
	<br />
	-В 6 км. от поселка в&nbsp; районе д. Новое Сельцо на реке Веля располагается замечательный русловый пруд, занимающий площадь более 100 га и считающийся одним из самых чистых водоемов Дмитровского района.<strong>Территория поселка расположена</strong> в 700 м. юго-западнее деревни Акулово Дмитровского района Московской области в 79 км. от МКАД и представляет собой живописную поляну в окружении леса в обжитом дачном месте.</p>
<p>
	Продажа участков осуществляется в строгом соответствии с законодательством РФ,&nbsp;<strong>все документы готовы к сделке</strong><strong>.</strong> После оформления сделки участки переходят в частную собственность нового владельца.</p>
<p>
	<strong><u>Комплекс обустройства</u></strong> предусматривает строительство внутрипоселковых дорог, электрификацию с предоставлением мощности 15 кВт на участок, организацию внешнего ограждения и охрану.<br />
	В настоящее время ведется строительство внутрипоселковых дорог и проектные работы по электрификации. Срок электрификации территории - до 15.07.2011.</p>
<p>
	- Комплексное обустройство территории &ndash; дороги, электричество, охрана;<br />
	- Отличная транспортная доступность, скоростная трасса, бетонное кольцо А- 108;</p>
<p>
	Стоимость участков &ndash; <strong><em>35 - 45 тыс. рублей за сотку</em></strong> (оплачивается при заключении договора )<br />
	Электрификация (включая присоединение) - <strong><em>80 тыс. рублей&nbsp; с участка</em></strong> (оплачивается в срок по согласованию с СНТ)<br />
	Строительство дорог, ограждения, охрана - <strong><em>50 тыс. руб. с участка</em></strong> (оплачивается в срок по согласованию с СНТ)</p>
', '3', '56.509644', '37.722416');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('166', '3', '7', '44.00', '0', '7.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Элитная земля для создания загородной резиденции.Новорижское, Рублёво-Успенское ш. 7 км от МКАД', '/_files/130943276980.gif', '/_files/130943276941.jpg', '/_files/130943276925.jpg', '/_files/130943276904.jpg', '/_files/130943276919.jpg', '/_files/130943276943.jpg', '/_files/130943276942.jpg', '', '', '', '94000000.00', '', '0', '<p>
	<em>Комфорт, статусность, уникальность - вот термины, которые должны быть применимы к недвижимости, чтобы она по праву смогла быть названа элитной.&nbsp; </em><em><br />
	</em><em>И, разумеется, располагаться такая недвижимость должна в&nbsp; районах, обеспечивающих соответствующий уровень окружения.&nbsp;</em></p>
<p>
	<em><strong>Мы рады предложить Вам именно такой уникальный продукт - земельный участок для строительства загородной резиденции на берегу Москвы-реки или для коттеджного строительства с ПМЖ. </strong></em><em><br />
	<strong>&nbsp;- </strong><em>Участок площадью </em><strong>44 сотки </strong><em>расположен в&nbsp; Красногорском районе МО в одном из престижнейших мест в </em><strong>7 км от МКАД. </strong><strong><br />
	<strong>- </strong></strong><em>Заезд на участок осуществляется по&nbsp;</em><strong>Ильинскому шоссе, </strong><em>соединяющему </em><strong>Ново-рижское и Рублево-Успенское шоссе.</strong><strong><br />
	<strong>- </strong></strong><em>Участок имеет все необходимые коммуникации (</em><strong>газ, эл-во и вода </strong><em>подведены в существующие строения)</em><strong><br />
	<strong>- </strong></strong><em>Участок имеет</em><strong>собственную береговую линию</strong><strong>.</strong></em></p>
<p>
	<strong><em>Прекрасная экология, исторические места, выход к Москве-реке </em></strong><em>&ndash; все это Ильинское шоссе, которое сегодня входит в пятерку лидеров среди подмосковных направлений.</em><em><br />
	<em>Шоссе имеет дорожное покрытие высокого качества, что обеспечивает комфортный проезд до резиденции.&nbsp;Великолепная природа мгновенно помогает расслабиться, забыть о шуме большого города, но и любителям светской жизни здесь не грозит заскучать.</em><br />
	<em>За пять минут можно доехать до Жуковки и, например, посетить фитнес-центр или поужинать в одном из лучших ресторанов. Неподалеку расположен лицей, а также лучший в стране конный клуб &laquo;XXI век&raquo;, где можно не только кататься, но и держать собственных лошадей. </em></em></p>
<p>
	<strong>Отличное транспортное сообщение с Москвой, удобный въезд с Ильинского шоссе и собственный выход на берег старицы Москва-реки, откуда открывается живописный вид на сосновый остров-заповедник и музей-усадьбу &quot;Архангельское&quot;&nbsp; - такие предложения на рынке недвижимости встречаются в последнее время все реже, что делает их исключительными.</strong></p>
<p>
	На участок заведен&nbsp; газ, электричество 15 кВт, 2 индивидуальные скважины, в течение 2011 года планируется подведение центрального водопровода и канализации.</p>
<p>
	Уникальным данное предложение делает расположение в престижном, статусном месте с богатой историей и достойными соседями.</p>
', '4', '55.773479', '37.255294');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('167', '4', '7', '10.00', '0', '118.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Живописные участки в посёлке близ д.Ягодино. 118 км по Новорижскому, Минскому ш.', '/_files/130943380561.gif', '/_files/130943380514.jpg', '/_files/130943380560.jpg', '/_files/130943380582.jpg', '/_files/130943380575.JPG', '/_files/130943380570.jpg', '', '', '', '', '80000.00', '', '0', '<p>
	<strong>Дачный посёлок расположен &nbsp;в изумительно красивом месте в окружении великолепного соснового леса</strong><strong>. </strong>&nbsp;Удачный рельеф местности и окружающий ландшафт обеспечивают прекрасную инсоляцию участка и создают пространство, наполненное теплом и светом, а близость населенных пунктов с развитой инфраструктурой обеспечит необходимый уровень удобства. Здесь живописные виды на поля и леса, рыбные, грибные и ягодные места, прекрасная экология, хорошая дорога. В нашем посёлке мы предлагаем участки от <em>10 до 30 соток без подряда</em>. Все участки ровные и максимально правильной формы.</p>
<p>
	Если Вы давно мечтаете о собственном загородном доме, то подходящим решением будет купить участок по Можайскому, Минскому шоссе без подряда.<br />
	Предлагаемая нами земля (Можайское шоссе, Минское шоссе) отличается удачным ландшафтом и широкими рекреационными возможностями. Расположить свой дом здесь можно как на открытом пространстве, так и ближе к лесу или прямо в настоящем лесу.</p>
<p>
	На автомашине до поселка можно доехать:</p>
<p>
	- от Минскому шоссе с проездом через г. Можайск, либо</p>
<p>
	- от Новорижского шоссе с проездом через п. Шаховская, 118 км от МКАД.</p>
<p>
	<strong>Ценообразование:</strong><br />
	Стоимость участков &ndash; <em>от <strong>8 </strong>тыс. до <strong>20 </strong>тыс</em>. рублей за сотку в зависимости от расположения участка.</p>
', '4', '55.728654', '35.497653');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('168', '4', '7', '9.00', '0', '38.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Уютный коттеджный посёлок в 38 км от МКАД по Новорижскому ш.', '/_files/130943437447.gif', '/_files/130943437433.jpg', '/_files/130943437421.jpg', '/_files/130943437444.jpg', '/_files/130943437442.jpg', '/_files/130943437439.jpg', '/_files/130943437490.jpg', '/_files/130943437444.jpg', '/_files/131297193200.JPG', '/_files/131297193241.JPG', '1890000.00', '', '0', '<p>
	Поселок сформирован на площади&nbsp; всего 1,6 Га и представляет собой огороженную лиственно-сосновую рощу в зоне сложившейся коттеджной застройки в 40 км. от Москвы. Прекрасный вариант&nbsp; корпоративного поселка или &quot;своей территории&quot; для нескольких друзей - всего 12 участков площадью <u>от 9 до 15,5 соток</u> позволят создать неповторимый в крупных поселках климат доверия и добрососедства.</p>
<p>
	Удобный подъезд с Новорижского шоссе, достойное окружение и обеспеченность всеми необходимыми коммуникациями сделают жизнь в посёлке удобной и приятной. Кроме дачных участков на территории предусматриваются необходимые технические зоны и зоны рекреации, в том числе детская площадка и небольшой пруд, в котором на досуге можно половить рыбку.</p>
<p>
	<strong>В поселке предусмотрен комплекс обустройства:</strong><br />
	- комплексное строительство дорожной сети с асфальтовым покрытием шириной 5 м;<br />
	- общее ограждение из профлиста и охрана по периметру участка с организацией въездной группы;<br />
	- подведение электричества 15 кВт на участок (с возможностью докупки) с обеспечением точки подключения к линиям, граничащим с участками. Для учета потребления электроэнергии поселок будет оснащен АСКУЭ (автоматизированная система контроля и учета энергопотребления), обеспечивающей учет по индивидуальным счетчикам энергопотребления.<br />
	- централизованный круглогодичный водопровод с питьевой водой из артезианской скважины<br />
	- централизованное отопление от собственной котельной, расположенной в административном здании (проект системы &quot;Умный дом&quot; в части отопления в подарок)</p>
<p>
	<strong>Ценообразование:</strong><br />
	Стоимость полного комплекса обустройства &ndash; 995 тыс. рублей с каждого участка.<br />
	Стоимость участков &ndash; <u>210-290 тыс. рублей за сотку.</u></p>
<p>
	<strong>Порядок оформления договоров:</strong><br />
	Участки оформляются по предварительным договорам со сроком заключения Основного договора не позднее 01.09.2011 г. Предварительный договор устанавливает права и обязанности&nbsp; сторон заключить договор купли-продажи определенного участка с определенной площадью и местоположением согласно графическому приложению, по фиксированной цене.<br />
	После заключения Основного договора купли-продажи и государственной регистрации договора, Покупатель получает Свидетельство о государственной регистрации права собственности на земельный участок.</p>
<p>
	Порядок оплаты:<br />
	<u>За земельный участок</u> оплачивается<br />
	- 50% стоимости участка при заключении Предварительного договора купли-продажи земельного участка<br />
	- 50% стоимости при заключении Основного договора купли-продажи земельного участка.<br />
	<u>Целевой взнос в дачное партнерство за обустройство</u> оплачивается по договору обустройства в размере<br />
	- 600 тыс. руб. при заключении Предварительного договора купли-продажи земельного участка<br />
	- 395 тыс. руб. при заключении Основного договра купли-продажи земельного участка</p>
', '4', '55.858471', '36.767992');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('169', '4', '3', '11.00', '0', '61.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Посёлок в окружении березовой рощи, 61 км от МКАД по Симскоферопольскому шоссе.', '/_files/130943709492.gif', '/_files/130943709475.JPG', '/_files/130943709446.JPG', '/_files/130943709454.JPG', '/_files/130943709440.JPG', '/_files/130943709403.JPG', '/_files/130943709490.JPG', '/_files/130943709401.JPG', '/_files/130943709484.JPG', '/_files/130943709488.JPG', '1200000.00', '', '0', '<p>
	<strong>Описание</strong></p>
<p>
	Мы предлагаем Вашему вниманию неповторимый в своей красоте коттеджный посёлок, расположенный в 61 км от МКАД по южному направлению в ближайшем Подмосковье всего в получасе езды от столицы. Этот небольшой, рассчитанный на 137 участков, посёлок, очень гармонично вписан в живописнейший массив берёзовых рощ и представляет собой красивое, ровное плато, с удивительными видами на великолепие окружающего пространства. Густой, нетронутый лес, поражает своей красотой, дарит прохладу в жаркий летний день и наполняет свежестью и неповторимым ароматом окружающий воздух. В любое время Ваша семья может наслаждаться лесными прогулками, собирать вкуснейшие ягоды и грибы, а также Вашими добрыми лесными соседями могут стать непуганые дикие животные - косули, кабаны, зайцы, лисы, белки, куропатки. По границе с посёлком протекает река Московка, которая организуется в большие красивые пруды для отдыха жителей посёлка.</p>
<p>
	Мы предлагаем Вам приобрести земельный участок от 7 до 28 соток без строительного подряда или участок с тёплым, уютным домом- наша компания имеет несколько проектов, различных по площади и бюджету, но практичных и удобных как для постоянного проживания, так и для семейного отдыха. Мы также готовы построить дом по вашему проекту.</p>
<p>
	　</p>
<p>
	<strong>Инфраструктура</strong></p>
<p>
	Несмотря на то, что Наш коттеджный посёлок позиционируется как комплекс для дачного проживания, он великолепно подойдёт для круглогодичной загородной жизни, ведь для этого имеется вся необходимая инфраструктура.</p>
<p>
	<strong>Собственная инфраструктура посёлка включает :</strong></p>
<p>
	-профессиональную охрану</p>
<p>
	-кафе</p>
<p>
	-торговую точку</p>
<p>
	-зону отдыха с площадкой для барбекю</p>
<p>
	-детскую площадку</p>
<p>
	-спортивную площадку</p>
<p>
	-променад</p>
<p>
	&nbsp;</p>
<p>
	<strong>Инфраструктура близлежащей территории:</strong></p>
<p>
	-3 средние школы</p>
<p>
	-2 детских сада</p>
<p>
	-больница</p>
<p>
	-2 загородных отеля</p>
<p>
	-2 ресторана</p>
<p>
	-3 продуктовых магазина</p>
<p>
	-конноспортивный клуб &laquo;4 сезона&raquo;</p>
<p>
	-картинг- клуб &laquo;Красные Крылья&raquo;</p>
<p>
	-международная школа боевых искусств</p>
<p>
	<strong>Уникальность</strong></p>
<p>
	На сегодняшний день предложение на покупку красивого земельного участка за городом- не редкость, поэтому мы постарались сделать его уникальным, неповторимым в своём роде, местом для круглогодичного проживания вашей семьи или местом вашего выходного комфортного отдыха в экологически чистом месте Подмосковья.</p>
<p>
	Немаловажным достоинством поселка является наличие в нем центральных коммуникаций: газа и электричества. Приглашаем вас купить участок в незабываемом берёзовом окружении, построить дом своей мечты и наслаждаться красотой и щедротами природы, при этом пользуясь всеми благами цивилизации.</p>
<p>
	В поисках стилистики для ландшафтного оформления общественных зон и прилегающей к поселку территории, мы остановили свой выбор на английском садово - парковом стиле коттедж - гарден. Налет старины, ощущение того, что место имеет свою историю - все это придает местности неповторимый шарм и уютную изысканность.</p>
<p>
	В дополнение к вышеперечисленным плюсам загородной жизни в Нашем посёлке следует отметить отличную транспортную доступность: до места можно добраться по скоростному Симферопольскому шоссе без светофоров и поворотов, альтернативному маршруту по Старо- Симферопольскому шоссе или воспользовавшись пригородной электричкой Московско- курского направления до ст. Шарапова Охота.</p>
<p>
	　</p>
<p>
	<strong>Как добраться?</strong></p>
<p>
	<strong>на автомобиле:</strong></p>
<p>
	По скоростному Симферопольскому шоссе (трасса М2): движетесь по шоссе до пересечения с ББК (Большим бетонным кольцом) - поворот на Балабаново, Малоярославец. На ББК уходите вправо и едете не сворачивая до Т-образного перекрестка (прим. 5 км). На перекрестке сворачиваете налево и едете до АЗС (она будет у вас слева). На АЗС разворачиваетесь и едете в обратном направлении прим.900м. до указателя &quot;Родионовка&quot;. Сразу за указателем - съезд на второстепенную дорогу. Она и приведет вас в поселок.</p>
<p>
	По Старо - Симферопольскому шоссе (через г.г. Щербинка, Подольск, Чехов): проезжаете через все эти города, и не доезжая с. Васильевского по левую руку у вас будет АЗС. На ней разворачиваетесь в обратном направлении и едете до указателя &quot;Родионовка&quot; (прим. 900м). Сразу за указателем - съезд на второстепенную дорогу, которая приведет вас в поселок.</p>
<p>
	<strong>на общественном транспорте:</strong></p>
<p>
	1. От станции метро Южная рейсовым автобусом № 458 до Серпухова ( также можно автобусом до Протвино, Оболенска) до остановки д. Родионовка.</p>
<p>
	2. От Курского вокзала электричкой на Серпухов до станции &quot;Шарапова охота&quot;, далее на местном такси, стоимость проезда 120-150р</p>
', '4', '55.023201', '37.429819');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('170', '4', '7', '6.00', '0', '110.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Новый посёлок у Можайского водохранилища. Новорижское ш. 110 км.', '/_files/130951916997.gif', '/_files/130951916943.jpg', '/_files/130951916981.jpg', '/_files/130951916939.jpg', '/_files/130951916986.jpg', '/_files/130951916999.jpg', '/_files/130951916981.jpg', '/_files/130951916992.jpg', '', '', '222000.00', '', '0', '<p>
	Продаются земельные участки на берегу Москва реки у верховья Можайского водохранилища, 110 км от МКАД по Новорижскому, Минскому или Можайскому ш.</p>
<p>
	Дачный поселок, расположенный неподалеку от Можайского водохранилища - это:</p>
<p>
	- Прекрасные виды на живописные поля и леса,</p>
<p>
	- Рыбные, грибные и ягодные места,</p>
<p>
	- Прекрасная экология,</p>
<p>
	- Отличные подъездные асфальтовые дороги,</p>
<p>
	- Полноценный отдых в Можайском районе - одном из самых замечательных мест Подмосковья.</p>
<p>
	<u>Покупка земельного участка без подряд</u><u>а от 6 до 15 соток.</u></p>
<p>
	<em>Стоимость участков &ndash; от 37 тыс. до 43 тыс. рублей за сотку в</em>зависимости от расположения участк<u>а.</u></p>
<p>
	Здесь вы сможете выбрать участок на свой вкус, участок в тишине у леса, у водной глади, рядом с рекой, в центре посёлка. Участок должен отвечать все ваши пожелания!</p>
<p>
	Предлагаемая нами земля (Можайское шоссе, Минское шоссе) отличается удачным ландшафтом и широкими рекреационными возможностями. Расположить свой дом здесь можно как на открытом пространстве, так и ближе к лесу или прямо в настоящем лесу.</p>
<p>
	&nbsp;</p>
<p>
	Территория расположена на берегу реки Москвы в 2-х километрах Можайского водохранилища. Удачный рельеф местности и окружающий ландшафт обеспечивают прекрасную инсоляцию участка и создают пространство, наполненное теплом и светом, а близость населенных пунктов с развитой инфраструктурой обеспечит необходимый уровень удобства.</p>
<p>
	На автомашине от Москвы доехать до поселка можно по Минскому шоссе с проездом через г. Можайск на Можайское шоссе и далее по прекрасной асфальтовой дороге местного значения до поворота налево на д. Решники (1200 м. после д. Демехово ).</p>
<p>
	&nbsp;</p>
<p>
	Обустройством территории поселка занимается Дачное некоммерческое партнерство.</p>
<p>
	В рамках обустройства территории выполняются следующие работы:</p>
<p>
	1 этап -&nbsp; строительство внутрипоселковой дорожной сети; подача заявки на технологическое присоединение к сети электроснабжения - получение проекта договора на присоединение и ТУ -&nbsp; до 01 мая 2011 г.</p>
<p>
	2 этап -&nbsp; строительство сети электроснабжения поселка.</p>
<p>
	Целевой взнос в ДНП за 1 этап обустройства - 80 тыс. рублей.</p>
', '4', '55.675552', '35.655441');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('171', '4', '7', '15.00', '0', '105.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дачный посёлок между двух прудов. Новорижское ш. 105 км от Москвы.', '/_files/130952094389.gif', '/_files/130952094362.jpg', '/_files/130952094321.jpg', '/_files/130952094325.jpg', '/_files/130952094380.jpg', '/_files/130952094373.jpg', '/_files/130952128947.jpg', '', '', '', '625000.00', '', '0', '<p align=\"justify\">
	Поселок сформирован на площади 5 Га и представляет собой живописную поляну на опушке леса в 105 км. от Москвы по Новорижскому ш. . Красивейшее место, не оставляет равнодушным никого, кто приезжает сюда. Прогулки по окрестным лугам заканчиваются на берегу живописного пруда, на другом берегу которого пасутся лошадки. Катание на лошадях, рыбалка, купание, свежий, здоровый воздух и прекрасная земля - чистый, сухой участок на зеленой травке которого так здорово играть детям, а взрослым - выращивать цветы. С двух сторон от посёлка пруды, комплекс словно вписан в лесной массив, вдоль него протекает р.Фроловка.</p>
<p align=\"justify\">
	&bull; Купание, рыбалка, ягоды, грибы;</p>
<p align=\"justify\">
	&bull; Уютный поселок всего из 28 участков, с собственной инфраструктурой;</p>
<p align=\"justify\">
	&bull; Исключительно удобный подъезд.</p>
<p align=\"justify\">
	Удобный подъезд &ndash; скоростное движение по Новорижскому шоссе и 2 км по отличной дороге от съезда с шоссе до поселка.</p>
<p align=\"justify\">
	Достойное окружение, близость необходимой инфраструктуры (магазины, кафе, медицинские учереждения) и обеспеченность всеми необходимыми коммуникациями сделают жизнь в поселке удобной и приятной.</p>
<p align=\"justify\">
	По проекту территория поселка разбита на <u>индивидуальные дачные участки от 13,5 до 19,5 соток. </u>Все участки максимально правильной формы.</p>
<p align=\"justify\">
	После заключения Договора купли-продажи и государственной регистрации договора, Покупатель получает Свидетельство о государственной регистрации права собственности на земельный участок.</p>
<p align=\"justify\">
	Стоимость участков &ndash; от 45 до 55 тыс. рублей за сотку.</p>
<p align=\"justify\">
	Комплекс обустройства в поселке предусматривает:</p>
<p align=\"justify\">
	- комплексное строительство дорожной сети;</p>
<p align=\"justify\">
	- общее ограждение с организацией въездной группы;</p>
<p align=\"justify\">
	- подведение электричества с обеспечением точки подключения к линиям, граничащим с участками;</p>
<p align=\"justify\">
	- водоснабжение от собственного водозаборного узла;</p>
<p align=\"justify\">
	- газификация поселка.</p>
<p>
	Стоимость полного комплекса обустройства &ndash; 625 тыс. рублей с каждого участка.</p>
', '4', '55.176074', '38.188434');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('172', '3', '14', '10.00', '0', '50.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Участок в обжитой деревне Ганусово в 50 км от МКАД', '/_files/130977014473.gif', '/_files/130976511682.jpg', '/_files/130976511623.jpg', '/_files/130976511611.jpg', '/_files/130976511633.jpg', '/_files/130976511662.jpg', '/_files/130976511609.jpg', '', '', '', '1100000.00', '', '0', '<p>
	Участок&nbsp;расположен на возвышенности и&nbsp;примыкает к лесу. По границе участка проложены все центральные коммуникации(газ, электричество, водопродод).&nbsp;В деревне есть общественная баня, детская зона отдыха. В 3 км от участка есть храм. Развитая инфраструктура и асфальтированный подьезд.</p>
', '4', '55.356404', '38.119361');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('173', '4', '16', '6.00', '0', '50.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Земельные участки в дачных посёлках до 60 км от МКАД. Горьковское ш.', '/_files/130979027046.gif', '/_files/130978996405.jpg', '/_files/130978996496.jpg', '/_files/130978996452.jpg', '/_files/130978996409.jpg', '/_files/130978996418.jpg', '/_files/130978996416.jpg', '/_files/130978996434.jpg', '/_files/130978996416.jpg', '/_files/130978996481.jpg', '120000.00', '', '0', '<p>
	Наш проект - прекрасный вариант и для тех, кто планирует построить дом для сезонных выездов на природу, и для тех, кто предпочитает городской суете жизнь в уютном и красивом месте за городом, но не хотели бы слишком удаляться от &laquo;благ цивилизации&raquo;. Земельные участки по Горьковскому шоссе &mdash; это отличное место для обустройства собственного дома.</p>
<p>
	&nbsp;</p>
<p>
	<strong>Покупка земельного участка без подряда </strong><strong>от 6 соток.</strong></p>
<p>
	Если Вы давно мечтаете о собственном загородном доме, то подходящим решением будет&nbsp; купить участок (Горьковское шоссе) без застройки.</p>
<p>
	В этом случае Вам необходимо выбрать участок, соответствующий всем Вашим пожеланиям. Предлагаемая нами земля (Горьковское шоссе) отличается удачным ландшафтом и разнообразием зон рекреации. Расположить свой дом здесь можно как на открытом пространстве, так и ближе к лесонасаждениям или к пруду.</p>
<p>
	Что может быть лучше своего дома вблизи леса и водоема? Представленные земельные участки (Горьковское шоссе) созданы для уютного отдыха в экологически чистой зоне. Здесь можно отдыхать после рабочих будней или проживать постоянно, воспитывая детей в благоприятных условиях.</p>
<p>
	&nbsp;</p>
<p>
	Таким образом, отсутствие обязательного подряда, с одной стороны, и наличие организованного комплексного обустройства, с другой стороны, обеспечивают возможность</p>
<ul>
	<li>
		разумно спланировать строительство, не переплачивая за готовый дом</li>
	<li>
		в разумные сроки обеспечить свое домовладение необходимыми коммуникациями.</li>
</ul>
<p>
	&nbsp;<em>*** Дачный посёлок 46 км от МКАД д.Игнатово, 4 км до г.Павловский Посад.</em></p>
<p>
	Живописное место в зоне сложившейся дачной застройки;</p>
<p>
	Ж/д станция в 1,5 км от поселка;</p>
<p>
	Большой пруд в 700 м от участков;</p>
<p>
	Обустроенная территория, дороги, электричество, охрана, забор;</p>
<p>
	Газификация&nbsp; после застройки территории поселка.</p>
<p>
	&nbsp;</p>
<p>
	Цена 35-51 тыс.руб./сотка</p>
<p>
	&nbsp;</p>
<p>
	<em>*** Дачный посёлок 57 км от МКАД д.Бывалино</em>, <em>г.Павловский Посад.</em></p>
<p>
	- Близость города и железнодорожной станции</p>
<p>
	- Круглогодичный подъезд к поселку по асфальту</p>
<p>
	- Прекрасная экология</p>
<p>
	- Лесные массивы и озера поблизости</p>
<p>
	- Эл-во</p>
<p>
	Цена: 17-27 тыс.руб./сотка.</p>
<p>
	***<em>Дачный посёлок 53 км от МКАД д. Евсеево, 1,5 км до г.Павловский Посад</em></p>
<p>
	- Живописное место в зоне сложившейся дачной застройки;</p>
<p>
	- Вся социально-бытовая инфраструктура в 1,5 км от поселка в городе Павловский Посад;</p>
<p>
	- Дороги, электричество, охрана, газ по границе;</p>
<p>
	- Полностью готовые к застройке участки на живописной поляне в окружении леса;</p>
<p>
	- Возможна газификация&nbsp; после застройки территории поселка.</p>
<p>
	&nbsp;</p>
<p>
	Цена: 53 - 61 тыс.руб./сотка</p>
<p>
	<em>***Дачный посёлок 52 км от МКАД Северо-западная граница г.Павловский Посад</em></p>
<p>
	- Живописное место в зоне сложившейся дачной застройки на границе г. Павловский Посад;</p>
<p>
	- По границе - прекрасный лесной массив, вблизи - озеро, р. Клязьма;</p>
<p>
	- Магазины, образовательные и мед. учреждения и т.п. в шаговой доступности;</p>
<p>
	- Дороги, электричество, охрана, газ по границе. Полностью готовые к застройке участки на живописной поляне;</p>
<p>
	Цена: от 37 тыс.руб/сотка.</p>
<p lang=\"ru-RU\">
	<i>Удадьба Рахманово 59 км от МКАД, д.Демидово</i></p>
<p lang=\"ru-RU\">
	<i>Участок площадью 8.09 Га в Павлово- Посадском районе Московской области. </i></p>
<p lang=\"ru-RU\">
	- близость инфраструктуры д. Демидово и города Павловский Посад</p>
<p lang=\"ru-RU\">
	- отличная транспортная доступность</p>
<p lang=\"ru-RU\">
	- купание и рыбалка на р.Клязьма. и Нажитских прудах</p>
<p lang=\"ru-RU\">
	- электричество и газ на участке (380В, два цокольных ввода газа)</p>
<p lang=\"ru-RU\">
	Успдьба расположена в 800 м. от р.Клязьма и в 200 м от леса. На 120 соток получено разрешение на индивидуальное жилищное строительство (ИЖС). Удобный подъезд по асфальтированной дороге Павловский-Посад- Орехово-Зуево до поворота в д. Демидово и 750 метров по хорошо отсыпанной дороге ПГС.</p>
<p lang=\"ru-RU\">
	Кроме возможностей по организации фермерского хозяйства, участок можно использовать для организации усадьбы.</p>
<p lang=\"ru-RU\">
	На участке для ИЖС имеются: кирпичная ферма площадью 120 кв. м., овощехранилище площадью 56 кв. м., гараж из шлакоблоков площадью 56 кв. м. и недостроенная баня. Также растут плодовые деревья и кустарники , расположен прекрасный ключевой пруд площадью 225 кв. м. и есть колодец, от которого проложены трубы зимнего водопровода.</p>
<p lang=\"ru-RU\">
	Участок оформляется в в собственность по договору купли-продажи.</p>
<p lang=\"ru-RU\">
	Цена участка - 10,6 тыс. рублей за сотку.</p>
<dl>
	<dt>
		&nbsp;</dt>
</dl>', '4', '55.844482', '38.560295');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('174', '4', '12', '10.00', '0', '30.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Красивая земля в дачных посёлках ярославского направления
', '/_files/130987270675.gif', '/_files/130987270611.jpg', '/_files/130987270643.jpg', '/_files/130987270684.jpg', '/_files/130987270677.jpg', '/_files/130987270646.jpg', '/_files/130987270615.jpg', '/_files/130987270678.jpg', '/_files/130987270656.jpg', '/_files/130987270689.jpg', '1200000.00', '', '0', '<p style=\"text-align: justify\">
	Данный проект - прекрасный вариант для тех, кто планирует построить дом для выездов на природу и полноценного отдыха. Земельные участки по Ярославскому, Щелковскому шоссе &mdash; это отличное место для обустройства собственного дачного дома. Мы предлагаем Вам земельные участки от 7 соток в дачных посёлках, расположенных между лесом и водой.&nbsp; Удачный рельеф местности и окружающий ландшафт создают ощущение уюта и защищенности, создают пространство, наполненное теплом и светом, а близость хорошие подъездные дороги и близость населенных пунктов с развитой инфраструктурой обеспечит необходимый уровень удобства.</p>
<p>
	&nbsp;<strong><u><em>Дачный посёлокв&nbsp; 38 км от Москвы, и 5 км. от г. Хотьково в районе дер. Новоселки и дер. Антипино Сергиево-Посадского района Московской области.</em></u></strong></p>
<ul>
	<li>
		живописные леса и поля</li>
	<li>
		ж/д станция в пешей доступности</li>
	<li>
		прекрасные пруды в пешей доступности</li>
	<li>
		близость к Москве, Сергиев-Посаду, Хотьково</li>
	<li>
		В поселке предусмотрен комплекс обустройства:</li>
	<li>
		комплексное строительство дорожной сети с твердым покрытием (песок, щебень);</li>
	<li>
		общее ограждение&nbsp; и охрана по периметру участка с организацией въездной группы;</li>
	<li>
		газификация поселка с разведением до границ участков;</li>
	<li>
		подключение к линии центрального водоснабжения;</li>
	<li>
		подведение электричества&nbsp; с обеспечением точки подключения к линиям, граничащим с участками. Для учета потребления электроэнергии поселок будет оснащен АСКУЭ (автоматизированная система контроля и учета энергопотребления), обеспечивающей учет по индивидуальным счетчикам энергопотребления.</li>
</ul>
<p>
	<span style=\"color: #008000\">Цена: от 80 тыс. до 130 тыс. рублей за сотку в зависимости от расположения участка (возможно поэтапно).</span></p>
<p>
	<strong><u><em>Дачный поселок </em><em>в 50 км от МКАД.</em></u></strong></p>
<p>
	<strong><u><em>Территория расположена в 4-х километрах от г. Фряново вблизи д. Машино и представляет собой живописное ровное сухое поле со всех сторон окруженное лесом.</em></u></strong></p>
<ul>
	<li>
		изумительно красивое место недалеко от города</li>
	<li>
		поляна, окруженная лесами, богатыми грибами и ягодами</li>
	<li>
		чистый воздух</li>
	<li>
		пруд в 200 м. от поселка</li>
	<li>
		В поселке предусмотрен комплекс обустройства:</li>
	<li>
		комплексное строительство дорожной сети с твердым покрытием (песок, щебень) шириной 15 м для главных и 9 м для второстепенных дорог;</li>
	<li>
		общее ограждение из профлиста и охрана по периметру участка с организацией въездной группы;</li>
	<li>
		подведение электричества от 7 кВт на участок (с возможностью докупки) с обеспечением точки подключения к линиям, граничащим с участками. Для учета потребления электроэнергии поселок будет оснащен АСКУЭ (автоматизированная система контроля и учета энергопотребления), обеспечивающей учет по индивидуальным счетчикам энергопотребления.&nbsp;</li>
</ul>
<p>
	<span style=\"color: #006400\">Цена: от 35 тыс. до 60 тыс. рублей за сотку в зависимости от расположения участка.</span></p>
<p>
	&nbsp;</p>
<p>
	<em><strong><u>Дачный поселок в 95 км. от Московской кольцевой автодороги на территории Александровского района Владимирской области, между д.Обашево и д.Анисимка</u></strong></em></p>
<ul>
	<li>
		Живописное место вдалеке от городской суеты;</li>
	<li>
		Удобный асфальтированный подъезд с Ярославского шоссе;</li>
	<li>
		На берегу реки Кубрь;</li>
	<li>
		Обустроенная территория, дороги, электричество (7кВт), охрана, забор.</li>
</ul>
<p>
	Это прекрасный уголок русской природы. Здесь много свободного места, воздуха и света &ndash; золотые летом и девственно чистые зимой русские поля, богатые ягодами, грибами и мелкой лесной дичью леса Тирибровского охотхозяйства, живописные изгибы речки Кубри, являющейся прекрасным местом для купания и рыбалки, подарят отдых и позволят набраться сил и здоровья.</p>
<p>
	&nbsp;<span style=\"color: #006400\">Цена: &nbsp;от 12 до 15 тыс. рублей за сотку</span></p>
<p>
	&nbsp;</p>
<p>
	<strong><u><em>Посёлок &nbsp;вблизи деревни Подберезье Переславского района Ярославской области в 140 км. от Москвы. </em></u></strong><strong><u>Поселок&nbsp; состоит из 26 усадебных участков площадью около от 24 до 50 соток.</u></strong></p>
<ul>
	<li>
		&nbsp;участки в окружении лесов, вблизи &laquo;большой воды&raquo;, с хорошей подъездной дорогой;</li>
	<li>
		прекрасное место для организации небольшого поселения усадебного типа;грибные, ягодные места, прекрасная рыбалка и охота;</li>
	<li>
		участки для дачного строительства по минимальным ценам;отсутствие обязательного подряда и платежей за обустройство.</li>
</ul>
<p>
	В 1,5 км. от участков расположено красивейшее Вашутинское озеро площадью около 500 Га. Огромное чистое зеркало воды, живописные берега, богатство водного мира озера &ndash; а в нем в весьма солидных количествах водится щука, окунь, плотва, уклейка, линь, карась, карп - все это создает великолепные условия для активного отдыха.</p>
<p>
	<span style=\"color: #006400\">Цена: от 11 тыс.руб/сотка</span></p>
<p>
	&nbsp;</p>
<p>
	<strong><em><u>Поселок из 29 усадебных участков площадью около от 12 до 50 соток. Посёлок находятся вблизи деревни Подберезье Переславского района Ярославской области в 139 км. от Москвы.</u></em></strong></p>
<ul>
	<li>
		участки в окружении лесов, вблизи &laquo;большой воды&raquo;, с хорошей подъездной дорогой;</li>
	<li>
		прекрасное место для организации небольшого поселения усадебного типа;</li>
	<li>
		грибные, ягодные места, прекрасная рыбалка и охота;</li>
	<li>
		участки для дачного строительства по минимальным ценам;отсутствие обязательного подряда и платежей за обустройство.</li>
	<li>
		-В 1,5 км. от участков расположено красивейшее Вашутинское озеро площадью около 500 Га.</li>
</ul>
<p>
	&nbsp;</p>
<p>
	<span style=\"color: #006400\">Цена: от 8 тыс.руб/сотка</span></p>
', '4', '56.621440', '38.485365');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('175', '4', '16', '10.00', '0', '100.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Земельные участки в посёлках Петушинского района. Горьковское ш.100-117 км. от МКАД', '/_files/130987307193.gif', '/_files/130987307193.jpg', '/_files/130987307118.jpg', '/_files/130987307176.jpg', '/_files/130987307178.jpg', '/_files/130987307127.jpg', '/_files/130987307119.jpg', '/_files/130987307185.jpg', '/_files/130987307120.jpg', '/_files/130987307143.jpg', '120000.00', '', '0', '<p>
	Наша компания предлагает Вам земельные участки в живописном Петушинском районе Московской области. Прекрасное лесное и луговое окружение, панорамные виды, вид на водную гладь, места для отдыха и рыбалки. Участки от 12 соток без обязательного подряда.</p>
<p>
	<strong><em>Посёлок в 117 км от МКАД близ д. Михейцево</em></strong></p>
<ul>
	<li>
		Живописное место с отличными условиями для жизни и отдыха;</li>
	<li>
		Удобные подъездные пути &ndash; 5 мин. по асфальту от Горьковского шоссе;</li>
	<li>
		Комплексное обустройство территории: дороги, электричество, охрана, общественные зоны;</li>
	<li>
		Дачные, садовые участки Горьковское шоссе.</li>
	<li>
		После утверждения генерального плана района территория поселка будет включена в границы д. Михейцево, а владельцы домов в поселке получат возможность регистрироваться по месту жительства (ПМЖ).</li>
</ul>
<p>
	<u><em>Цена: от 9 тыс.руб./сотка.</em></u></p>
<p>
	<strong><em>Посёлок 104 км от МКАД&nbsp; д.Старые Петушки</em></strong></p>
<ul>
	<li>
		Полностью готовые к застройке земельные участки, право собственности на все участки -подтверждается свидетельствами о государственной регистрации.</li>
	<li>
		Исключительно живописное место на границе города Петушки (деревня Старые Петушки);</li>
	<li>
		Вся городская социально-бытовая и транспортная инфраструктура в пешей доступности;</li>
	<li>
		Комплексное обустройство территории: дороги, электричество, охрана, водоснабжение. Газификация;</li>
	<li>
		Внешняя инфраструктура: Магазины, Школа, Детский сад, Больница, Поликлиника, Аптека, -Почта, Банк и т.д.Отдых: лес, озеро, пляж.</li>
	<li>
		-Участки под ИЖС Горьковское направление.</li>
</ul>
<p>
	<u><em>Цена: от 20 тыс.руб./сотка.</em></u></p>
<p>
	<strong><em>Земельные участки в посёлке&nbsp; 100 км от МКАД у с.Грибово</em></strong></p>
<ul>
	<li>
		Живописное, экологически чистое место с отличными условиями для жизни и отдыха;</li>
	<li>
		Участки у озера. Озеро площадью 20 гектар. Купание, рыбалка;</li>
	<li>
		Удобные подъездные пути &ndash; 5 мин. по асфальту от Горьковского шоссе;</li>
	<li>
		Комплексное обустройство территории: дороги, электричество, охрана, общественные зоны;</li>
	<li>
		Дачные участки Горьковское шоссе.</li>
</ul>
<p>
	<u><em>Цена: от 15 тыс.руб./сотка</em></u></p>
<p>
	<strong><em>Участки для дачного строительства и ИЖС в 116 км от МКАД близ д.Желтухино</em></strong></p>
<ul>
	<li>
		Полностью готовые к застройке земельные участки, получены свидетельства на индивидуальные участки;Живописное место с отличными условиями для жизни и отдыха;</li>
	<li>
		Ж/д станция Костерево в пешей доступности;</li>
	<li>
		200 м. до оз. Кукушка, в 700 м от участков - р. Пекша, 5 км. до р. Клязьма;</li>
	<li>
		Обустроенная территория: дороги, электричество, охрана, забор;</li>
	<li>
		Магазины, Школа, Детский сад, Больница, Поликлиника, Аптека, Почта, Банк и др. в пешей доступности (2 км) в г.Костерево;</li>
	<li>
		Дачные, садовые участки Горьковское шоссе</li>
	<li>
		После утверждения генерального плана района территория поселка будет включена в границы д. Желтухино, а владельцы домов в поселке получат возможность регистрироваться по месту жительства (ПМЖ).</li>
</ul>
<p>
	<u><em>Цена: от 11 тыс.руб./сотка</em></u></p>
', '3', '55.942303', '39.472890');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('176', '1', '4', '26.00', '0', '89.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дом 244 м2 из архангельского леса (брус 150х150) - 2 этажа. 26 соток', '/_files/131011808556.gif', '/_files/132834800466.jpg', '/_files/132834800429.jpg', '/_files/132834800497.jpg', '/_files/131037799538.JPG', '/_files/131037799591.JPG', '/_files/131037799500.JPG', '/_files/131037799534.jpg', '', '', '3500000.00', '', '0', '<p>
	Дом 244 м2 из архангельского леса (брус 150х150) - 2 этажа.&nbsp;Фундамент - ленточно армировный столбчатый и три ряда блоков, цоколь до 1 метра. Перекрытия брус, хороший черновой пол, проём окон. Окон и дверей нет. Крыша винил. Участок рядом с прудом. ИЖС, Эл-во 5кв. Газ, организован асфальтированный полдьезд. 26 соток</p>
<p>
	&nbsp;</p>
<p align=\"center\">
<iframe width=\"450\" height=\"259\" src=\"http://www.youtube.com/embed/PSXHJaTvTtc\" frameborder=\"0\" allowfullscreen></iframe> </p>
', '4', '55.264508', '36.442788');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('177', '4', '7', '15.00', '0', '11.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Только 12 новых усадеб в поселке премиум класса на Ильинском шоссе по суперценам.', '/_files/131012447377.gif', '/_files/131012507626.gif', '', '', '', '', '', '', '', '', '33600000.00', '', '0', '<p>
	<strong>ИЛЬИНСКОЕ ШОССЕ, 14 КМ от МКАД, вблизи д. Александровка</strong></p>
<p>
	Охраняемый коттеджный поселок Премиум класса на 64 дома в единой архитектурной концепции. Всегда свободное Ильинское шоссе позволяет добраться в Москву быстро и комфортно. По Рублевке &mdash; 15 минут, по Новорижскому шоссе &mdash; 10 минут!&nbsp; Ваши соседи &mdash; первые лица государства и бизнес-элита.</p>
<p>
	&nbsp;<strong><u>Инфраструктура:</u></strong></p>
<p>
	Рядом с нами - суперсовременная школа, одна из лучших в мире.</p>
<p>
	Большой спорт-клуб с бассейном.</p>
<p>
	Вашу вниманию предлагается Комфортный дом 350 м2, выполненный из высококачественных материалов;</p>
<ul>
	<li>
		3 спальни с индивидуальными санузлами;</li>
	<li>
		Панорамные окна &laquo;в пол&raquo;;</li>
	<li>
		2 балкона в главной спальне;</li>
	<li>
		Огромная терасса с грилем;</li>
	<li>
		4 санузла;</li>
	<li>
		Отельная прачечная комната;</li>
	<li>
		Большой кабинет;</li>
	<li>
		Фирменный забор с воротами и въездом.</li>
	<li>
		Гарантия 3 года;</li>
</ul>
<p>
	<strong><em>Менеджер поселка: Александр</em></strong></p>
<p>
	<strong><em>7(495) 6-432-777</em></strong></p>
', '4', '55.768746', '37.199396');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('178', '1', '10', '55.00', '0', '20.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Продается недостроенный дом на 2000 кв.м. Построено 1000 кв.м. 1-ое Успенское ш, 20 км от МКАД.', '/_files/131038062367.gif', '/_files/131038062380.JPG', '/_files/131038062351.JPG', '/_files/131038062326.JPG', '', '', '', '', '', '', '84000000.00', '', '0', '<p>
	&nbsp;</p>
<p>
	Продается недостроенный дом на 2000 кв.м. Построено 1000 кв.м.&nbsp; Все коммуникации заведены в дом. Земельный участок с взрослыми елями 55 соток ИЖС. Строение находится &nbsp;в элитном, строго охраняемом, полностью заселенном коттеджном посёлке на Рублёво-Успенском ш. 20 км. от МКАД. Все ком-ции центральные.</p>
', '3', '55.711302', '37.056026');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('179', '4', '7', '12.00', '0', '56.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Комфортный посёлок близ Алексейково, Новорижское ш. 56 км от МКАД', '/_files/131046433868.gif', '/_files/131046433870.JPG', '/_files/131046433847.JPG', '/_files/131046433898.JPG', '/_files/131046433869.JPG', '/_files/131046433838.JPG', '/_files/131046433812.JPG', '/_files/131046433899.JPG', '/_files/131046433841.jpg', '/_files/131046433874.gif', '816000.00', '', '0', '<p>
	2 октября 2010 года наш поселок стал лауреатом национальной премии RREF AWARDS 2010 за достижения области жилищного строительства. Победа в номинации &quot;Комфортная среда для объектов загородной недвижимости&quot;!</p>
<p>
	&nbsp;</p>
<p>
	Дачный поселок расположен в Клинском районе Московской области, всего в часе езды от столицы. Это удивительное по красоте место на границе цивилизации и природы. Поселок находится на высоком холме, с трех сторон окруженном лесом. Отсюда открывается захватывающая панорама бесконечных лесных далей с маковками церквей и живописными деревнями. Площадь примыкающего&nbsp; леса составляет 29,9 тысяч гектаров. Вблизи поселка находятся лесное озеро и река Нудоль.&nbsp;</p>
<p>
	&nbsp;</p>
<ul>
	<li>
		Центральные коммуникации: электричество</li>
	<li>
		Количество участков: первая очередь - 135; вторая очередь - 111</li>
	<li>
		Площадь участков: <u>от 7 до 52 соток </u></li>
	<li>
		Стоимость участков без подряда с коммуникациями и фасадным забором: от 816 309 руб. за участок.</li>
	<li>
		<strong><u>от&nbsp; 82 000 руб. за сотку</u></strong></li>
</ul>
<p>
	&nbsp;</p>
<p>
	&nbsp;&nbsp; Озеро у порога! На территории ведется строительство уникального природного парка с каскадом из трех родниковых водопадов. Площадь водной глади превысит 1,5 гектара. В распоряжении жителей поселка будут собственный пляж на большом озере и благоустроенная территория с лесными деревьями для прогулок и отдыха. Это первый ландшафтный объект подобного уровня в поселках категории &quot;дальние дачи&quot;.</p>
<p>
	&nbsp;</p>
<p>
	В окрестностях поселка уже сформирована инфраструктура для отдыха: конно-спортивная база &quot;Кузнецово&quot;, где посетителям предлагают разнообразные услуги и развлечения (верховая езда, сафари на квадроциклах, пейнтбол, ресторан), санаторий &quot;Чайковский&quot; с современным медицинским центром, бассейном, теннисными кортами.</p>
<p>
	В пяти минутах ходьбы от поселка, на берегу р. Нудоль, расположена усадьба &quot;Кузнецово&quot;.</p>
<p>
	Усадьба - одна из немногих баз отдыха в Подмосковье, которая предлагает не только семейный отдых на природе,</p>
<p>
	но и разнообразные развлечения для активных людей:</p>
<ul>
	<li>
		аренда денников (услуга для владельцев лошадей)</li>
	<li>
		верховая езда</li>
	<li>
		сафари на квадроциклах</li>
	<li>
		пейнтбол</li>
	<li>
		ресторан</li>
	<li>
		бар</li>
	<li>
		бильярд</li>
	<li>
		магазин</li>
</ul>
<p>
	<strong>Добраться </strong><strong>на автомобиле:</strong></p>
<p>
	1-й путь: Двигайтесь 63 км от МКАД по Новорижскому шоссе (трасса М9) в сторону Волоколамска. На указателе &quot;Клин, Санкт-Петербург&quot; (за столбиком 81 км) поверните направо, на Московское Большое кольцо и двигайтесь прямо по А-108 11 км. Когда слева вы проедете автозаправку &laquo;ТНК&raquo; и указатель на &laquo;Нудоль&raquo;, через 1,5км поверните направо и справа от Вас, напротив деревни Алексейково, будет съезд на дорогу, которая ведет в поселок.</p>
<p>
	2-й путь: Двигайтесь по Новорижскому шоссе (трасса М9) от МКАД в сторону Волоколамска, не доезжая до Московского Большого кольца поверните направо на указателе &quot;Румянцево, Новопетровское&quot; (за столбиком 78км), далее по схеме.</p>
<p>
	<strong>Своим ходом:</strong></p>
<p>
	На электричке до платформ &laquo;Новопетровское&raquo; или г. Клин.</p>
<p>
	Со станций ходят регулярные рейсовые автобусы до п. Нудоль.</p>
', '4', '36.557609', '56.090894 ');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('180', '4', '5', '10.00', '0', '57.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Южные Озера  ', '0', '0', '0', '0', '0', '0', 'Готовый поселок у воды и леса Калужское или Симферопольское ш. 57 км от МКАД - путь займёт не более часа. ', '/_files/131064458658.gif', '/_files/131064458620.JPG', '/_files/131064458600.JPG', '/_files/131064458614.JPG', '/_files/131064458691.JPG', '/_files/131064458616.JPG', '/_files/131064458607.JPG', '/_files/131064458659.JPG', '/_files/131064458679.JPG', '/_files/131064458618.jpg', '1500000.00', '', '0', '<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">В поисках идеального сочетания для благоустроенной загородной жизни, люди стремятся совместить уникальное природное окружение: красивейший густой лес, щирокую реку или озеро недалеко от дома, и комфорт, выражающийся в полностью готовых коммуникациях, шикарной отделке Вашего собственного дома, атмосферы уюта от пребывания в нём. </span></font></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">Нельзя не отметить, что на сегодняшний день люди выбрали для себя идеальную удалённость , на которой должна располагаться их загородная недвижимость- это ближнее Подмосковье, не ближе 30 и не дальше 60 км, как правило. Это объясняется тем, что большинство городских жителей в летнее время стремятся проживать в своих загородных имениях. Но работая в городе, им не хотелось бы тратить на дорогу много времени. Поэтому идеальным считается вариант удалённости от МКАД в 50 км- это и прекраснейшая живописная местность, чистый воздух, и оптимальное по времени расстояние. </span></font></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">Учитывая пожелания, мы старались найти этот райский уголок, который отвечал бы самым взыскательным вкусам наших клиентов. И мы рады предложить Вам неповторимый в своей красоте коттеджный посёлок, располагающийся на живописнейшей земляничной поляне между двух больших озёр. К посёлку можно подъехать с <b>Калужского</b> и <b>Симферопольского</b> шоссе, <b>57 км от МКАД</b>- путь займёт не более часа. Собрав все плюсы воедино, без преувеличения можно утверждать, что среди всего ассортимента предложений по продаже земельных участков в Чеховском районе, наш коттеджный поселок занимает первое место.</span></font></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">Общая площадь поселка составляет <b>38,8 га</b>. Общее количество участков &ndash; <b>215</b>. Площадь одного - от 9 до 40 соток.</span></font></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">Мы предлагаем Вам все коммуникации: <b>электричество, газ, центральный водопровод и канализацию. </b></span></font></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">Мы попытались создать уникальную атмосферу в посёлке и стилизовали его под </span></font><span lang=\\\"EN\\\">&laquo;</span><font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">речную тему</span></font><span lang=\\\"EN\\\">&raquo;. </span><font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">Оформили детские площадки, зоны отдыха, а въездную группу представили в виде речного вокзала . </span></font></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">На настоящий момент <b>свободно не более 22 % </b>участков! Но еще есть выбор участков возле леса и с видом на озеро.</span></font></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">Земля в поселке продается без обязательного строительного подряда. Это значит, что вы имеете возможность построить дом по собственному проекту.</span></font></p>
<p>
	<b><font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">В стоимость участков уже включено:</span></font></b></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">подводка магистрального газа до границы участка; </span></font></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">подводка электроэнергии до границы участка; </span></font></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">общее ограждение вокруг поселка; </span></font></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">строительство отдельной дороги к поселку и внутренних дорог на территории поселка; </span></font></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">строительство запланированных объектов инфраструктуры: спортивная площадка, детская площадка, пляжи, медпункт, магазин, кафе, гостевая парковка; </span></font></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">система центрального освещения; </span></font></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">Примечание. Подключение к линиям центрального водопровода и канализации осуществляется за отдельную плату.</span></font></p>
<p>
	<font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">Посетив наш посёлок,вы не устоите перед шикарными видами на водную гладь, окружённую густым лесом- невероятно красивые места, которыми невозможно налюбоваться, чистый, свежий воздух. Коттеджный посёлок очень гармонично вписывается в это великолепное природное окружение, даря своим жителям красоту, спокойствие и комфорт.</span></font></p>
<p>
	&nbsp;</p>
<p>
	<b><font face=\\\"Times New Roman CYR\\\"><span lang=\\\"RU\\\">Стоимость от 185 000 руб. до 350 000 руб. за сотку</span></font></b></p>
', '6', '55.224005', '37.259531');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('181', '4', '7', '10.00', '0', '67.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Готовый коттеджный посёлок близ д.Богаиха. Новорижское ш. 67 км от МКАД', '/_files/131097222883.gif', '/_files/131097222871.jpg', '/_files/131097222841.jpg', '/_files/131097222892.jpg', '/_files/131097222868.jpg', '/_files/131097222894.jpg', '/_files/131097222839.jpg', '/_files/131097222820.jpg', '/_files/131097222855.jpg', '', '1500000.00', '', '0', '<p align=\"center\">
	<span style=\"color: #f00\">10 сот + дом &laquo;Заокский&raquo; 116 кв.м.+коммуникации = 2 990 000 руб.</span></p>
<h2 style=\"text-align: center\">
	<a href=\"http://elitka.info/nkeydom/nkeygdom/nkeygdom.html\" target=\"_blank\">&nbsp;УЧАСТКИ С ДОМАМИ</a></h2>
<h2 style=\"text-align: center\">
	<a href=\"http://elitka.info/nkeydom/nkeydom.html\" target=\"_blank\">Проекты домов</a></h2>
<p>
	Поселок&nbsp; расположен в Клинском районе Московской области, на 67 километре Новорижского шоссе. Новорижское шоссе в настоящее время - одно из самых перспективных и популярных направлений.</p>
<p>
	&bull;Наш поселок удачно расположен, добраться можно по трем шоссе: Новорижское, Ленинградское, Волоколамское.</p>
<p>
	&bull;Коттеджный поселок имеет статус Ecovillage (номинация &laquo;Абсолют&raquo;), что говорит о высоких показателях экологичности.</p>
<p>
	&bull;<u>Посёлок имеет всю необходимую инфраструктуру:</u> магистральный газ, центральная канализация, электроснабжение (независимая линия электропередач), чистая питьевая вода, круглосуточная охрана, кафе, магазин, пляж, рыбалка, детская площадка&nbsp; бытовые услуги (уборка дома, прачечная, слесарь, сантехник, электрик).</p>
<p>
	Наш поселок&nbsp; с двух сторон окружен лесом. Одно из самых важных преимуществ поселка &mdash; расположение в непосредственной близости от завидовских охотничьих угодий. Завидовский комплекс площадь свыше 125 гектар. По данным ЮНЕСКО это одно из самых экологически чистых мест на планете. В непосредственной близости от поселка протекает небольшая и несудоходная речка Локнаш. Общая длина реки &mdash; 35 километров, она впадает в Большую Сестру. Вниз по течение этой реки расположено село Теряево, в котором расположен Иосифо-Волоколамский монастырь, который по праву считается один из самых красивых в Московской области.</p>
<p>
	Все участки продаются <u>с подрядом на строительство дома. З</u>емля без подряда, не смотря на минимальный уровень начальных вложений, содержит массу рисков. Некоторые жильцы построят огромные дома, другие не будут строить 5 лет и перепродадут участки, когда их цена вырастет. Это приведет к неравноправию жителей, а также к тому, что они будут жить долгое время в окружении стройки. В нашем поселке &ndash; особый подход. Он будет полностью достроен к 2011-му году независимо от того, какая часть домов будет продана. Кроме того, для покупателей, которые на сегодняшний день не располагают полной суммой денег для оплаты, есть специальное предложение: они могут оплатить землю и коммуникации и<u>внести первый платеж в размере 10% за дом.&nbsp; </u></p>
<p>
	Правильно организованная <u>ирригационная система</u> позволяет беспрепятственно подъехать к дому в любое время года и совершенно исключает непроходимую грязь на улицах. Все улицы поселка хорошо освещены.</p>
<p>
	<u>Профессиональная вооруженная охрана</u> обеспечивает безопасность отдыха в поселке и покой его жителей. Территория поселка огорожена. Въезд в поселок возможен только через КПП, причем лишь при наличии пропуска. По периметру установлены камеры видеонаблюдения.</p>
<p>
	<u>Дорога до поселка з</u>анимает не более часа. Чтобы добраться до поселка, нужно проехать чуть более 60 км по скоростному Новорижскому шоссе, затем 12 километров &mdash; по бетонному кольцу, далее &mdash; 19 км в сторону Нудоля. К поселку обеспечивается круглогодичный проезд.</p>
<p>
	Доехать до &laquo;Новорижских ключей&raquo; можно также из Клина. Автобус ходит несколько раз в день.</p>
<p>
	<a href=\"http://elitka.info/nkeydom/nkeydom.html\" target=\"_blank\">Проекты домов</a></p>
<p>
	<a href=\"http://elitka.info/nkeydom/nkeygdom/nkeygdom.html\" target=\"_blank\">Участки с готовыми домами</a></p>
', '4', '56.224077', '36.447744');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('182', '4', '7', '8.00', '0', '63.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дачный посёлок у р.Нудоль. Новорижское ш. 63 км', '/_files/131097227855.gif', '/_files/131097227837.jpg', '/_files/131097227867.jpg', '/_files/131097227892.JPG', '/_files/131097227845.JPG', '/_files/131097227835.JPG', '/_files/131097227898.JPG', '/_files/131097227812.JPG', '/_files/131097227844.JPG', '/_files/131097227812.jpg', '0.00', '', '0', '<p>
	<span lang=\"RU\">Кол-во участков: 118 </span></p>
<p>
	<span lang=\"RU\">Площадь участков: от 8,5 соток </span></p>
<p>
	<span lang=\"RU\">Площадь домов: от 120 до 250 м2 </span></p>
<p>
	<span lang=\"RU\">Материалы домов: оцилиндрованное бревно, клееный брус, газобетонные блоки </span></p>
<p>
	<span lang=\"RU\">Инженерные коммуникации: центральные (эл-во 10 кВт, газ, водопровод, внутрипоселковые дороги под асфальт) </span></p>
<p>
	<span lang=\"RU\">Коттеджный посёлок расположен в 63 километрах от МКАД по Новорижскому шоссе. Около часа езды на личном автомобиле &mdash; и Вы уже оказываетесь в чудесном, живописном месте. Первая очередь поселка занимает площадь 16,7 га и состоит из 118 участков от 8,5 до 52 соток. Вторая очередь - 16 Га, состоит из 118 участков<u> площадью от 8,5 до 21,5 соток</u>. Цена за сотку:<b><u> от 96 000 рублей, включая коммуникации </u></b></span></p>
<p>
	<span lang=\"RU\">Вы можете выбрать участок на свой вкус - на поляне с захватывающим панорамным видом или граничащий с лесом. Посёлок имеет собственный выход в лес, а также обустроенную пляжную зону на берегу реки Нудоль. Всего за год в поселке продано 83% участков без подряда, с подрядом, с готовым домом. Рядом расположено большое Истринское водохранилище.</span></p>
<p>
	<span lang=\"RU\">В поселке есть все коммуникации, привычные городcкому жителю, асфальтовые дороги, круглосуточная служба охраны. Инфраструктура включает все необходимое для комфортной жизни - детские и спортивные площадки, магазин, гостевую парковку. Внутрипоселковые дороги делают удобный подъезд к каждому участку. Так же по границе участка будет проходить газопровод и электричество.</span></p>
<p>
	<span lang=\"RU\">Экология Клинского района и роза ветров создают благоприятную зону как для отдыха, так и для жизни. Наличие пляжной зоны будет радовать жителей каждое лето. Ну а зимой каток и построенная бобслейная площадка никого не оставит равнодушным.</span></p>
', '4', '56.110246', '36.60799');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('183', '4', '3', '10.00', '0', '65.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Сосновка парк ЗемАктив 8 (916) 153-02-85 Соболева Юлия', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок c развитой инфраструктурой всего в 65 км от Москвы', '/_files/131124040009.gif', '/_files/131124040046.JPG', '/_files/131124174601.jpg', '', '/_files/131124040032.jpg', '/_files/131124040008.jpg', '/_files/131124040048.JPG', '/_files/131124040056.JPG', '/_files/131124040032.JPG', '/_files/131124040050.jpg', '760000.00', '', '0', '<p>
	&nbsp;&nbsp;&nbsp; Коттеджный поселок располагается на живописной поляне всего в 65 км от Москвы, вблизи деревни Нижние Велеми. Это идеальный вариант для постоянного проживания и отдыха за городом. Рядом с поселком находятся крупные современные города Чехов и Серпухов с развитой социальной инфраструктурой и удобной транспортной доступностью. Посёлок окружён великолепным&nbsp; сосновым лесом, богатым грибами, ягодами, разнообразным животным миром. На большинстве участков молодые сосны и березы, много прилесных участков. Недалеко от поселка протекает река Нара и находится песчаный карьер, &mdash; замечательное место для купания и отдыха на воде всей семьёй.</p>
<p>
	&nbsp;&nbsp;&nbsp; Поселок делится на две очереди застройки - 95 и 86 участков, здесь есть вся инфраструктура, необходимая для комфортной жизни: единое ограждение поселка, круглосуточная охрана, широкие внутрипоселковые дороги, собственная инфраструктура: административное здание, детская и спортивная площадки, гостевая парковка. Планируется центральный водопровод.</p>
<p>
	Мы предлагаем Вам участки площадью от 8 до 14 соток&nbsp; по демократичным ценам. При этом в стоимость сотки включено: электричество (8 кВт на участок), газ, фасадное ограждение с воротами и калиткой.</p>
<p>
	&bull;Участок + коммуникации от 760 тыс. руб.</p>
<p>
	&bull;Участок + коммуникации + дом от 2,1 млн руб.</p>
<p>
	&nbsp;<strong>Преимущества поселка :</strong></p>
<ul>
	<li>
		поселок окружен лесным массивом;</li>
	<li>
		на большинстве участков растут молодые сосны, которые всего через несколько лет превратят территорию поселка в сосновый бор!</li>
	<li>
		менее, чем в километре от поселка открывается великолепная панорама реки Нара;</li>
	<li>
		центральные коммуникации. В стоимость сотки включено: электричество, газ, фасадное ограждение с воротами и калиткой;</li>
	<li>
		единое ограждение поселка;</li>
	<li>
		круглосуточная охрана, КПП;</li>
	<li>
		внутрипоселковые дороги;</li>
	<li>
		собственная инфраструктура поселка: административное здание управляющей компании, детская площадка, спортивная площадка, гостевая парковка, магазин.</li>
	<li>
		Внешняя инфраструктура: зоны отдыха и досуга, социальная инфраструктура, достопримечательности.</li>
</ul>
<p>
	&nbsp;<strong>Доступная инфраструктура</strong></p>
<ul>
	<li>
		&nbsp;<strong>Поселок&nbsp; Пролетарский (3 км от нешего поселка )</strong></li>
	<li>
		<strong>Магазины промышленных, продовольственных товаров, супермаркет &laquo;Дикси&raquo;;</strong></li>
	<li>
		<strong>Школа;</strong></li>
	<li>
		<strong>Детский сад;</strong></li>
	<li>
		<strong>Поликлиники, больница;</strong></li>
	<li>
		<strong>Ветеринарная лечебница широкого профиля;</strong></li>
	<li>
		<strong>Стадион &laquo;Сатурн&raquo; &ndash; лучший в районе, зимний каток;</strong></li>
	<li>
		<strong>Баня-сауна;</strong></li>
	<li>
		<strong>Парикмахерская;</strong></li>
	<li>
		<strong>Ресторан-бар &laquo;Айвенго&raquo; и бильярдный клуб; спорт-бар;</strong></li>
	<li>
		<strong>Автосервис, мойка, магазин автозапчастей;</strong></li>
	<li>
		<strong>АЗС;</strong></li>
</ul>
<p>
	&nbsp; - В д. Васильевское, которая расположена в 7 км от нашего поселка, находится конно-спортивный клуб.</p>
<p>
	&nbsp; -Спортивная база &laquo;Красные крылья&raquo;расположена в Серпуховском районе вблизи д. Васильевское, в 9,5 км от нашего поселка. .Это одна из лучших баз по техническим и зимним видам спорта в Южном Подмосковье.</p>
<p>
	&nbsp; - В д. Старые Кузьмёнки, всего в 2 км от нашего поселка, расположена ферма &quot;Русский Страус&quot;. Все посетители этого удивительного места смогут приобщиться к миру интересных и необычных птиц.</p>
<p>
	&nbsp;&nbsp; -Всего в 8,2 км от нашего поселка, на аэродроме в д. Волосово, находится аэро-парашютный клуб, где вы сможете пройти обучение полету, а также совершить прыжки с парашютом.</p>
<p>
	&nbsp;-&nbsp; Недалеко от нашего поселка, в селе Иванова Гора находится храм Иоанна Предтечи на реке Нара, который был построен в XVIII веке на средства фабриканта Д. М. Хутарева.</p>
<p>
	&nbsp; - В глубине села Васильевское, всего в 10,5 км от нашего поселка, спрятана от посторонних глаз старинная деревянная Никольская церковь. В настоящее время это не только памятник архитектуры, который имеет огромную научную и художественную ценность, но и действующий храм, в котором проводят богослужения по выходным дням и большим православным праздникам.</p>
<p>
	<strong>Проезд на машине</strong></p>
<p>
	От Москвы по Симферопольскому шоссе (М2) до поворота на Московское Большое бетонное кольцо (А108) (поворот направо на Балабаново)</p>
<p>
	Далее проезжаете до Т-образного перекрестка (Серпухов-Чехов), поворачиваете направо в сторону Чехова.</p>
<p>
	Проезжаете деревню Новые Кузьменки, и сразу за деревней сворачиваете налево по указателю на Старые Кузьменки.</p>
<p>
	Ориентируетесь на церковь, проезжаете мимо Страусиной фермы, деревни Верхние Велеми и Нижние Велеми.</p>
<p>
	Проезд общественным транспортом</p>
<p>
	1. От станции метро Южная рейсовым автобусом № 458 до Серпухова ( также можно автобусом до Протвино, Оболенска) до остановки Старые Кузьменки, далее на попутке. Стоимость проезда составит 120р.</p>
<p>
	2. От Курского вокзала электричкой на Серпухов до станции &quot;Шарапова охота&quot;, далее на местном такси, стоимость проезда 120-150р.</p>
<p>
	<strong>Стоимость от 59 000 руб.за сотку</strong></p>
', '6', '55.034276', '37.355822');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('184', '3', '4', '358.00', '0', '90.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', ' Уникальное предложение на самый лучший участок в комплексе площадью 358 соток, с лесными деревьями и и выходом к воде. 50 000 рублей за сотку.', '/_files/131159868084.gif', '/_files/131159868053.jpg', '/_files/131159868094.JPG', '', '', '', '', '', '', '', '17900000.00', '', '0', '', '4', '55.263016', '36.445577');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('187', '4', '16', '0.00', '0', '46.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дачные посёлки близ д.Кузяево. Егорьевское ш. 46 км от МКАД', '/_files/131400501677.gif', '', '', '', '', '', '', '', '', '', '230000.00', '', '0', '<p>
	<strong>Посёлок Рябинка 3</strong></p>
<p>
	Площадь территории поселка составляет 21,5 га. На продажу выставлено 125 индивидуальных участков</p>
<p>
	<span style=\"color: #008000\"><em><strong>от 9 соток</strong></em></span></p>
<p>
	Поселок расположился на ровной поляне, окруженной массивом леса. Недалеко находится большой пруд с чистой водой, где можно, и искупаться, и порыбачить.</p>
<p>
	Это населенный пункт с развитой инфраструктурой и коммуникациями. По его территории проложены песчано-гравийные дороги, обеспечивающие хороший подъезд к индивидуальным участкам.</p>
<p>
	Территория поселка Рябинка круглосуточно охраняется, он окружен забором. Въезд на его территорию обеспечивается двумя оборудованными воротами.</p>
<p>
	Поселок Рябинка электрифицирован, в 2012 году планируется его газификация.</p>
<p>
	<em><strong>Стоимость:&nbsp; от 40 000 рублей за сотку</strong></em></p>
<p><img src=\"http://elitka.info/objects/foto-eg/riabinka3/1.jpg\" /> </p>
<p><img src=\"http://elitka.info/objects/foto-eg/riabinka3/3.gif\" /> </p>
<p>
	<strong>Посёлок Антоновка 1</strong></p>
<p>
	Общая площадь земель составляет 23,2 га. Сегодня на продажу выставлено 192 участка</p>
<p>
	<span style=\"color: #008000\"><em><strong>от 6 соток</strong></em></span></p>
<p>
	Поселок Антоновка расположен в живописной местности на большой поляне окруженной бескрайними лесными массивами. Неподалеку от населенного пункта находится пруд с чистейшей водой. В нем очень любят купаться дачники.</p>
<p>
	Доехать до поселка Антоновка очень просто. Автотранспортом по Егорьевскому шоссе можно доехать быстро. Кроме того, многие дачники приезжают электричкой, которая отправляется с Казанского вокзала до станции &laquo;Игнатьево&raquo;.</p>
<p>
	Населенный пункт с развитой инфраструктурой. По территории поселка проложены автомобильные дороги с песчано-гравийным покрытием.</p>
<p>
	&nbsp;&bull; Охраняемая территория, установлены два въезда с воротами.</p>
<p>
	&bull; Круглогодичный подъезд.</p>
<p>
	&bull; Поселок полностью электрифицирован, часть поселка газифицируется.</p>
<p>
	&bull; Уличное освещение</p>
<p>
	<em><strong>Стоимость:&nbsp; от 36 800 рублей за сотку</strong></em></p>

<p><img src=\"http://elitka.info/objects/foto-eg/antonovka/1.jpg\" /> </p>
<p><img src=\"http://elitka.info/objects/foto-eg/antonovka/2.jpg\" /> </p>
<p><img src=\"http://elitka.info/objects/foto-eg/antonovka/3.gif\" /> </p>

<p>
	<strong>Посёлок Антоновка 2</strong></p>
<p>
	Общая площадь поселка составляет 23,88 га, количество индивидуальных участков 158,</p>
<p>
	<span style=\"color: #008000\"><em><strong>от 6 соток</strong></em></span></p>
<p>
	Дачный поселок расположен на красивой поляне рядом с бескрайним лесным массивом. Недалеко от поселка находятся большие чистые пруды - отличное место для отдыха и купания. Благополучная экология, прекрасные видовые характеристики поселка позволят будущим владельцам в полной мере насладиться жизнью в загородном доме.</p>
<p>
	&bull;Территория дачного поселка огорожена и охраняема. Работы завершены.</p>
<p>
	&bull; По территории поселка прокладываются автомобильные дороги с твердым покрытием. Сроки завершения работ &ndash; 2 квартал 2011 года.</p>
<p>
	&bull; Круглогодичный подъезд.</p>
<p>
	&bull; Организованная въездная группа &ndash; предусмотрены два въезда с воротами.</p>
<p>
	&bull; Электрификация поселка:</p>
<p>
	Работы по прокладке внешней высоковольтной линии электропередач до территории поселка и установке трансформаторных подстанций завершены в 2010 году.</p>
<p>
	Внутрипоселковая разводка электричества (включая уличное освещение) по границам участков начинается в 2011 году.</p>
<p>
	Газификация поселка:</p>
<p>
	Для обеспечения поселка газом будет создано НДП, куда могут вступить собственники земельных участков в поселке, желающие провести к своим участкам газ за дополнительную плату.</p>
<p>
	<em><strong>Стоимость:&nbsp; от 42 000 рублей за сотку&nbsp; </strong></em></p>

  <p><img src=\"http://elitka.info/objects/foto-eg/antonovka2/1.jpg\" /> </p>
<p><img src=\"http://elitka.info/objects/foto-eg/antonovka2/2.jpg\" /> </p>
<p><img src=\"http://elitka.info/objects/foto-eg/antonovka2/3.gif\" /> </p>



<p>
	<strong><span style=\"color: #f00\">! ХИТ ПРОДАЖ ! </span>Посёлок Лукошкино <span style=\"color: #f00\"><strong>! ХИТ ПРОДАЖ !</strong></span></strong></p>
<p>
	На продажу выставлено 146 участков</p>
<p>
	<span style=\"color: #008000\"><em><strong>от&nbsp;7 соток</strong></em></span></p>
<p>
	общая площадь земель составляет 21,21 га. Расположен участок в живописном месте, на поляне, окруженной лесом.</p>
<p>
	Поселок Лукошкино &ndash; территория с хорошо развитой инфраструктурой. Его территория огорожена и охраняется. Все работы, связанные с обустройством поселка, полностью завершены. Для въезда и выезда предусмотрены два пункта с воротами.</p>
<p>
	На территории поселка проложены дороги с твердым покрытием. В 2010 году были завершены работы по прокладке высоковольтной ЛЭП, а также обустройству трансформаторных подстанций. В ближайшее время завершаются работы по организации уличного освещения. Проводится газификация участков.</p>
<p>
	<em><strong>Стоимость:&nbsp; от 43 500 рублей за сотку&nbsp; </strong></em></p>

  <p><img src=\"http://elitka.info/objects/foto-eg/lukoshkino/1.jpg\" /> </p>
<p><img src=\"http://elitka.info/objects/foto-eg/lukoshkino/2.jpg\" /> </p>
<p><img src=\"http://elitka.info/objects/foto-eg/lukoshkino/3.jpg\" /> </p>
<p><img src=\"http://elitka.info/objects/foto-eg/lukoshkino/3.gif\" /> </p>



<p>
	<strong>Посёлок Одуванчик</strong></p>
<p>
	Поселок Одуванчик обрамлен лесами, которые дарят дачникам чистый воздух, насыщенный кислородом. Участки размежеваны</p>
<p>
	<span style=\"color: #008000\"><em><strong>от&nbsp;7 соток</strong></em></span></p>
<p>
	Поселок Одуванчик сегодня только застраивается, поэтому земля приобретается без коммуникаций и обустройства. Несомненно, для многих застройщиков это выгодный вариант. Прежде всего, благодаря доступным ценам.</p>
<p>
	Впоследствии собственники дачных участков на собрании примут решение о проведении всех необходимых коммуникаций и обустройстве поселка. Для этой цели создано Некоммерческое Партнерство, в собственности которого находятся земли общего пользования, административные и хозяйственные постройки, газовые сети и электрические установки.</p>
<p><img src=\"http://elitka.info/objects/foto-eg/oduvanchik/1.jpg\" /> </p>
<p><img src=\"http://elitka.info/objects/foto-eg/oduvanchik/2.gif\" /> </p>', '4', '55.623053', '38.528280');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('188', '4', '17', '15.00', '0', '45.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Готовый для проживания поселок', '/_files/131410856615.gif', '/_files/131410856643.jpg', '/_files/131410856642.jpg', '/_files/131410856674.jpg', '/_files/131410856639.JPG', '/_files/131410856603.JPG', '/_files/131410856636.jpg', '/_files/131410856622.JPG', '/_files/131410856665.gif', '', '630000.00', '', '0', '<p>
	В экологически чистом районе расположен дачный поселок , в 45 км от МКАД. Подъезд к нему осуществляется автотранспортом по Новорязанскому шоссе и по Малому бетонному кольцу в любое время года.</p>
<p>
	Недалеко от населенного пункта находятся две деревни - Марково и Бояркино.</p>
<p>
	Площадь поселка Ромашкино составляет 70,24 га, 385 земельных участков площадью 15 соток и расположен он в удивительно красивом месте. Рядом произрастает лес, богатый грибами и ягодами. В 2-х км от него находится большое озеро, а в 3-х км река Москва. Словом, место живописное, привлекающее большое количество отдыхающих.</p>
<p>
	Поселок полностью <u><strong>электрифицирован</strong>,</u> бесперебойная подача электричества гарантируется наличием трансформаторных подстанций. Разводку <strong><u>газопровода</u></strong> по индивидуальным участкам планируется начать в 2011 году.</p>
<p>
	Охрана поселка Ромашкино ведется круглосуточно.</p>
<p>
	Проложены автомобильные дороги внутри поселка, осуществлен ремонт подъездных путей. Это позволяет дачникам приезжать на свой участок в любое время года.</p>
<p>
	Развитие инфраструктуры территории поселка обеспечивает Некоммерческое партнерство, заключающее с подрядными организациями договоры на подведение коммуникаций, а также на строительство жизненно необходимых объектов.</p>
<p>
	Новый владелец земельного участка становится членом Некоммерческого партнерства с правом использования электросетей, дорог и прочих объектов инфраструктуры.</p>
<p>
	<em><strong>Стоимость:&nbsp; от 42 000 рублей за сотку</strong></em></p>
', '4', '55.451228', '38.319347');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('197', '3', '8', '6.00', '0', '12.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Участок на берегу канала имени Москвы', '/_files/131653126289.gif', '/_files/131653126235.JPG', '/_files/131653126211.JPG', '/_files/131653126238.JPG', '/_files/131653126210.JPG', '/_files/131653126205.JPG', '/_files/131653126271.JPG', '/_files/131653126261.JPG', '/_files/131653126246.JPG', '', '3000000.00', '', '0', '<p>
	Участок 6 соток в стародачном месте, в близи д. Терехово. На участке есть бытовка.&nbsp;Участок выходит на берег канала имени Москвы.&nbsp;Участок&nbsp;граничит с лесом.&nbsp;Все соседи построились. Идеальное сочетание загородного воздуха и городской инфраструктуры.</p>
', '4', '55.93383', '37.486296');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('190', '4', '17', '12.00', '0', '36.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Лесной посёлок  Егорьевское ш. 36 км от МКАД.
', '/_files/131411202304.gif', '/_files/131411202380.jpg', '/_files/131411202336.jpg', '/_files/131411202314.jpg', '/_files/131411202307.jpg', '/_files/131411202355.jpg', '/_files/131411202362.JPG', '/_files/131411202317.JPG', '/_files/131411202381.gif', '', '530000.00', '', '0', '<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Общая площадь этого дачного поселка равна 22,17 га, а количество отдельных участков составляет 118 индивидуальных владений, площадью от 11,6 соток.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Месторасположение поселка очень живописно, часть поселка расположена в лесу, 2-ая очередь Соснового края раскинулась на небольшой поляне в окружении деревьев Кратовсого лесного массива. По соседству с поселком имеются красивые и чистые лесные озера и карьеры &ndash; вот раздолье для летнего отдыха с купанием, а также для истинных любителей встретить утреннюю зорьку с удочкой на водоеме!</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Обязательно стоит отметить эксклюзивные возможности, которые дарит проживание в поселке Сосновый край. Имеется в виду прекрасная возможность совершать по сосновому лесу конные прогулки, коня можно взять на небольшом конезаводе, расположенном поблизости. Экология этого района выше всяких похвал, поселок Сосновый край имеет прекрасные виды местности. Те из дачников, кто остановит свой выбор на этом живописнейшем месте, ни секунды не пожалеют о своем решении, сполна насладятся деревенским воздухом и смогут отлично отдохнуть от городской суеты загазованного мегаполиса.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Транспортная доступность поселка - на высшем уровне. Сюда можно добраться на собственном автотранспорте, двигаясь по Егорьевскому шоссе, или же приехать электричкой, отправляющейся с Казанского вокзала, выйдя на станции Григорово.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Поселок располагается на охраняемой территории, имеющей ограждение. Дороги, которые прокладываются здесь, имеют твердое покрытие, поэтому круглогодичный беспрепятственный проезд владельцев к своей новой недвижимости обеспечен.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Вопрос с электрификацией поселка решен следующим образом: предусмотрена внешняя высоковольтная линия электропередач, включая трансформаторную подстанцию. По самому поселку осуществлена внутрипоселковая разводка, включающая, в том числе, и освещение улиц. Каждый участок имеет индивидуальное подключение к общей электросети.</p>
<p>
	&nbsp;Земли данного поселка имеют статус земель сельскохозяйственного назначения, которые можно использовать под строительство дома. Собственники имеют право возвести жилой дом с правами регистрации проживания.</p>
<p>
	&nbsp;</p>
<p>
	<em><strong>Стоимость:&nbsp; от 46 000 рублей за сотку</strong></em></p>
', '4', '55.586531', '38.65267');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('191', '3', '4', '15.00', '0', '110.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Уникальный земельный участок в поселке 15 соток у воды. ', '/_files/131557811762.gif', '/_files/131557811753.JPG', '/_files/131557811747.JPG', '/_files/131557811725.JPG', '/_files/131557811779.JPG', '', '', '', '', '', '530000.00', '', '0', '<p>
	<strong><strong>Продам уникальный земельный участок в поселке Козлово, Малоярославецкого района. Малоярославецкий район заслуженно признан одним из лучших мест Калужской Области для отдыха и досуга. Этот район славится своей экологией, чистейшим воздухом и неповторимыми природными ландшафтами. </strong></strong></p>
<p>
	<strong><strong>Месторасположение: 100 - 110 км на юго &ndash; запад от Москвы. От Киевской трассы 5 км до участков.</strong></strong></p>
<p>
	<strong><strong>Участоки по 12,15,14,15, соток. </strong></strong></p>
<p>
	<strong><strong>ВСЕГО 22 УЧАСТОКА. </strong>Участки продаются без подряда, коммуникации входят в стоимость. Строительство с возможностью прописки- назначение земли ПМЖ.</strong></p>
<p>
	<strong><strong>Рельеф местности - ровный. Подъезд круглогодичный. Деревня находится в живописном лесном массиве, рядом пруды для купания, рыбалка, в 50 метрах речка. Главное отличие поселка в том, что всего 22 участка. Красивейшее место, первозданность которого нам удалось сохранить. На участках имеются свои выходы к лесу, который можно арендовать на 49 лет с пролонгацией. С участков открываются панорамные виды на долину, леса и пруды. </strong></strong></p>
<p>
	<strong><strong>Коммуникации:</strong></strong></p>
<p>
	<strong><strong>- свет(по границе),</strong></strong></p>
<p>
	<strong><strong>- газ в 50 метрах.</strong></strong></p>
<p>
	<strong><strong><em>Стоимость сотки 35 тыс.</em></strong><strong><em>руб</em></strong><strong><em>.</em></strong>﻿</strong></p>
<p>
	<strong>﻿</strong></p>
', '4', '54.892868', '36.430042');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('192', '3', '4', '15.00', '0', '110.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Уникальный участок со своим выходом к лесу.', '/_files/131617931236.gif', '/_files/131557853663.JPG', '/_files/131557853663.JPG', '/_files/131557853638.JPG', '/_files/131557853624.JPG', '/_files/131557853654.JPG', '', '', '', '', '230000.00', '', '0', '<p>
	Продам уникальный земельный участок в поселке Березовка Малоярославецкого района. Малоярославецкий район заслуженно признан одним из лучших мест Калужской Области для отдыха и досуга. Этот район славится своей экологией, чистейшим воздухом и неповторимыми природными ландшафтами.<br />
	Месторасположение: 100-110 км на юго &ndash; запад от Москвы. От Киевской трассы 5 км до участков.<br />
	Участоки по 15 соток ВСЕГО 51 УЧАСТОК. Участки продаются без подряда, коммуникации входят в стоимость. Строительство с возможностью прописки.<br />
	Рельеф местности - ровный. Подъезд круглогодичный по асфальтированной дороге. Поселок находится в живописном лесном массиве, рядом пруды для купания, рыбалка. Главное отличие поселка в том что всего 22 участка по 10 соток. Красивейшее место, первозданность которого нам удалось сохранить. На участках имеются свои выходы к лесу, который можно арендовать на 49 лет с пролонгацией. С участков открываются панорамные виды на долину, леса и пруды.<br />
	Стоимость сотки 15 тыс.руб.<span>﻿</span><br />
	<br />
	&nbsp;</p>
', '4', '54.854576', '36.308162');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('193', '1', '4', '10.00', '0', '125.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дом 2х. эт. в п.Высокиничи Жуковского района Калужской области. 125км. от МКАД по Киевскому шоссе.', '/_files/131591586696.jpg', '/_files/131591586693.JPG', '/_files/131591586619.JPG', '/_files/131591586652.JPG', '/_files/131591586662.JPG', '/_files/131591586676.JPG', '/_files/131591586692.JPG', '', '', '', '2300000.00', '', '0', '<p>
	Дом 2х. эт. в п.Высокиничи Жуковского района Калужской области. ИЖС поселок городского типа. 125км. от МКАД по Киевскому шоссе. Хороший круглогодичный подъезд по асфальтовой дороге. Дом из кирпича, внутри оббит вагонкой, есть печь,камин. Большой погреб, гараж. Участок 10соток. Очень живописное место, рядом река, лес,церковь.</p>
<p>
	В дом заведены электричество и водопровод. Газ в перспективе.</p>
', '4', '54.911825', '36.925778');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('194', '1', '4', '10.00', '0', '130.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дом 2х.эт. 110кв.м. в с.Оболенское Жуковского района Калужской области 130км. от МКАД по Киевскому шоссе.', '/_files/131591600122.jpg', '/_files/131591600108.JPG', '/_files/131591600174.JPG', '/_files/131591600146.JPG', '/_files/131591600130.JPG', '', '', '', '', '', '2500000.00', '', '0', '<p>
	Дом 2х.эт. 110кв.м. в с.Оболенское Жуковского района Калужской области 130км. от МКАД по Киевскому шоссе.Участок 10соток. Рядом лес, река, действующая церковь.</p>
<p>
	В дом заведены электричество, газ, канализация и водопровод</p>
', '4', '54.895003', '36.924046');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('195', '1', '4', '10.00', '0', '130.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дом в с.Оболенское Жуковского района Калужской области. 130км. от МКАД по Кивскому шоссе.', '/_files/131591611076.jpg', '/_files/131591611066.JPG', '/_files/131591611086.JPG', '/_files/131591611046.JPG', '/_files/131591611051.JPG', '', '', '', '', '', '2200000.00', '', '0', '<p>
	Дом в с.Оболенское Жуковского района Калужской области. 130км. от МКАД по Кивскому шоссе. Участок 10 соток. Рядом лес, река( песочный пляж) действующая церковь.</p>
<p>
	В дом заведены электричество,&nbsp;газ,&nbsp;канализация&nbsp;и водопровод</p>
', '4', '54.895003', '36.924046');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('196', '1', '14', '10.00', '0', '120.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дом 48кв.м.2-эт. из бруса 6х6 в 1,5 км от ж/д станции Пурлово', '/_files/131609740280.gif', '/_files/131609740201.JPG', '/_files/131609740223.JPG', '/_files/131609740295.JPG', '/_files/131609740281.JPG', '/_files/131609740291.JPG', '/_files/131609740281.JPG', '/_files/131609740251.JPG', '/_files/131609740231.JPG', '', '1450000.00', '', '0', '<p>
	Дом 48кв.м.2-эт. из бруса 6х6 обшит вагонкой внутри утеплён,сайдингом снаружи ,хоз блок 3х6 вагонка, утеплён,душ,отапливается дровами или электричеством,сливная яма, погреб,водопровод летний по дому, участку,парник на фундаменте,плодовые деревья, участок 10сот.-ухожен,санузел на улице,охрана,от ж/д 1,5км.-20мин. пешком,СНТ,рядом деревня,пруд,лес.</p>
', '4', '54.736443', '38.381365');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('198', '1', '7', '25.00', '0', '55.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Срочная продажа дома 400 кв. метров на участке в 25 соток в 15 км от Звенигорода.', '/_files/131827035567.gif', '/_files/131827035570.jpg', '/_files/131827035558.jpg', '/_files/131827035567.jpg', '/_files/131827035533.jpg', '/_files/131827035516.jpg', '/_files/131827035551.jpg', '/_files/131827035503.jpg', '/_files/131827035518.jpg', '/_files/131827035571.jpg', '12000000.00', '', '0', '<p>
	Новорижское ш. 55 км от МКАД, так же можно Минское; Рублево-Успенское<br />
	Село Локотня, 17 км от Звенигорода, Одинцовский район.<br />
	Жилой дом площадью 400 кв.м.<br />
	3 этажа, 7 спален, сауна, 3 СУ<br />
	Участок 25 соток, ИЖС<br />
	На участке: 2-х этажный гараж с навесом, 2-ой этаж для охраны,<br />
	Хоккейная коробка, детская площадка.<br />
	Электричество 15 квт, газ в перспективе до конца 2012 года (ведутся работы);<br />
	рядом: церковь, магазин, АЗС;<br />
	<br />
	Поэтажное описание дома.<br />
	1-ый этаж &ndash; коридор, выход на закрытую веранду, выход на открытую террасу,<br />
	каминная с кухней-столовой,<br />
	спальная комната гостевая, СУ раздельный,<br />
	вниз по лестнице - кладовая, комната отдыха, раздельный СУ с душевой, через<br />
	душевую проход в сауну, бойлерная.<br />
	Подвал &ndash; для хранения консервации, вина и овощей.<br />
	Между 1-м и 2-м этажами &ndash; игровая комната 32 кв.м. потолки 6 метров, в этой же<br />
	комнате библиотечный этаж.<br />
	2-ой этаж &ndash; 3 спальни, хозяйская спальня объединена с кабинетом, СУ с ванной,<br />
	выход на балкон из коридора.<br />
	Мансардный этаж</p>
', '4', '55.700275', '36.572156');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('219', '4', '5', '6.00', '0', '62.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Белое озеро ИЖС тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок располагается в 62 км от МКАД по Калужскому шоссе ', '/_files/131981066854.gif', '/_files/131981066867.jpg', '/_files/131981066883.jpg', '/_files/131981066835.jpg', '/_files/131981066884.jpg', '', '', '', '', '', '600000.00', '', '0', '<p>
	Коттеджный поселок располагается в 62 км от МКАД по Калужскому шоссе в Чеховском районе. Категория земель- ИЖС. Вблизи поселка дубовый лес и природное озеро с рыбой. Неподалеку г. Дубна (в 4 км от поселка), где функционирует множество торговых центров, медицинских и образовательных учреждений, спортивных и детских центров.<br />
	Инфраструктура:<br />
	высокий забор по периметру поселка;<br />
	2 въезда, оборудованные КПП;</p>
<p>
	2 гостевые стоянки;<br />
	офис продаж на главном въезде в поселок;<br />
	2 зеленые зоны общей площадью 0,95 га;<br />
	оборудованная пляжная зона на берегу озера;<br />
	площадка для барбекю;<br />
	детские площадки;<br />
	спортивные площадки;<br />
	центральная дорога шириной 6 м;<br />
	второстепенные внутрипоселковые дороги шириной 3,5 м;<br />
	межевые заборы;<br />
	общее озеленение поселка;<br />
	подключение к коммуникациям (электрификация и газификация поселка).</p>
<p>
	Коммуникации:<br />
	Электричество<br />
	газ (строится)<br />
	<br />
	Площадь: от 6 соток<br />
	Стоимость: 125 000 руб./сот.<br />
	&nbsp;</p>
', '8', '55.172006', '37.046757');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('200', '2', '4', '0.00', '0', '10.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '2-х комнатная квартира в поселке внуково метро Юго-Западная, 20 мин.транспортом ', '/_files/131851875305.gif', '/_files/131851875368.JPG', '/_files/131851875326.JPG', '/_files/131851875333.JPG', '/_files/131851875315.JPG', '/_files/131851875347.JPG', '/_files/131851875376.JPG', '/_files/131851875396.JPG', '', '', '5000000.00', '', '0', '<p>
	<font size=\"2\"><span lang=\"RU\">2х комнатная квартира в поселке Внуково, от метро Юго-Западная, 20 мин.транспортом.</span></font></p>
<p>
	<font size=\"2\"><span lang=\"RU\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Поселок Внуково, ул.Спортивная дом 4Б( ПРОПИСКА МОСКОВСКАЯ), удобное транспортное сообщение </span></font><font size=\"2\"><span lang=\"RU\">квартира на 4 этаже 5 этажного кирпичного дома, общая площадь 43м2, </span></font><font size=\"2\"><span lang=\"RU\">жилая площадь 29м2( комнаты: 18м2 и 11м2), кухня 6м2, с\\у совмещен,</span></font><font size=\"2\"><span lang=\"RU\">балкон из комнаты 18м2, состояние в квартире среднее, окна стеклопакет,</span></font><font size=\"2\"><span lang=\"RU\">две металлические двери, квартира теплая и светлая, солнечная и уютная, </span></font><font size=\"2\"><span lang=\"RU\">новые трубы и проводка, </span></font><font size=\"2\"><span lang=\"RU\">домофон, зеленый двор, очень хорошие соседи, </span></font><font size=\"2\"><span lang=\"RU\">вся инфраструктура рядом, школа, детский сад, поликлиника,магазины,рынок,рестораны и кафе </span></font><font size=\"2\"><span lang=\"RU\">все в шаговой доступности, рядом с домом стадион,бассейн,кинотеатр,велодром. </span></font><font size=\"2\"><span lang=\"RU\">Чистая продажа, документы готовы к сделки.</span></font></p>
', '4', '55.609499', '37.302908');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('201', '4', '3', '6.00', '0', '104.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Всего час езды (104км от МКАД) по скоростному Симферопольскому шоссе отделяют этот поселок от Москвы', '/_files/131851941412.gif', '/_files/131851941411.jpg', '/_files/131851941490.jpg', '', '', '', '', '', '', '', '72000.00', '', '0', '<div id=\"style_13178059060000000375_BODY\">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;А те, кто не водит автомобиль, без проблем смогут добраться до&nbsp;него по железной дороге &ndash; станция совсем рядом. В этом поселке удивительным образом сочетаются черты приусадебных хозяйств родом из эпохи СССР и загородных курортов, которые вообще вне времени. Судите сами: район, где он расположен, издавна облюбовали придирчивые городские жители для своих дач, так что это &ndash; по-настоящему стародачное место. Всего в паре километров отсюда находится Музей-усадьба А.Т. Болотова &quot;Дворяниново&quot;, известное своим потрясающим парком со знаменитыми каскадами водопадов. Туда стоит сходить хотя бы за тем, чтобы посмотреть на устройство усадьбы и перенять опыт Андрея Тимофеевича, ведь он был одним из создателей агрономической науки в России. А настоящие романтики, ценители русских традиций, не смогут остаться равнодушными, если прогуляются по старинному парку &laquo;Дворянинова&raquo;, спустятся к Скниге и загадают желание у необычной арки над тропой &ndash; дуб, разбитый молнией, упал на соседнее дерево (вяз) и сросся с ним. Удивительное зрелище! Кроме того, жителям &laquo;Одуванчикова&raquo; будет доступна инфраструктура находящихся поблизости деревень.<br />
	А любители активного отдыха на природе оценят близость реки Скниги. Во время весеннего паводка к ней подтягиваются любители экстремальных сплавов на байдарках и катамаранах. А ближе к лету река успокаивается, уровень воды в ней спадает, и ее берега населяют уже рыбаки. Тем же, для кого любой водоем не интересен, если на нем нет пляжа, стоит прогуляться к близлежащему пруду (до него меньше километра) и убедиться, что и для них здесь все есть.Земельные под садоводство, без подряда.<br />
	Коммуникации:<br />
	Дорога до поселка (асфальт)<br />
	Газ (в 2 км)<br />
	Электричество (по границе поселка)<br />
	Инфраструктура:<br />
	музей-усадьба А.Т. Болотова - 4 км<br />
	музей В.Ф. Руднева - 4 км<br />
	Храм св. Дмитрия Ростовского в Дмитровском - 5 км<br />
	Храм Казанской Иконы Божьей Матери в Савино - 4 км<br />
	Ж/Д платформа &quot;132 км.&quot; - 5 км<br />
	Цены: от 12 000 руб./сотка<br />
	Площадь: от 6 до 8 соток.</div>
', '3', '54.702557', '37.453766');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('202', '4', '3', '15.00', '0', '111.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Участки в поселке от 15 до 30 соток расположились в 111 км от МКАД по Симферопольскому шоссе', '/_files/131851990261.gif', '/_files/131851990229.jpg', '/_files/131851990288.jpg', '/_files/131851990266.jpg', '', '', '', '', '', '', '450000.00', '', '0', '<p>
	Расположились в 111 км от МКАД по Симферопольскому шоссе. Известно, что лучший способ избежать ошибок &ndash; учесть чужой опыт. И коттеджный поселок - лучшее тому подтверждение. Место для него было выбрано не случайно &ndash; мы следовали по стопам великого русского художника В.Д. Поленова. Его усадьба расположена всего в 10 минутах езды от нашего поселка. Уж если эти места удовлетворили придирчивый вкус живописца, то лучше их точно не найти. Убедитесь сами &ndash; &laquo;Дача художника&raquo; находится на пологом холме, поросшем лесом. Отсюда открывается удивительный вид на красивейший ландшафт с лугами, лесами и небольшими холмами. Здесь предлагаются участки без подряда, статус земли в поселке - земли под садоводство правом возведения жилых и хозяйственных строений и сооружений. Одним словом, участки в Подмосковье на Симферопольском шоссе это прекрасное место для тех, кто ценит высокое качество жизни и не желает идти на уступки в мелочах. Обителью живописцев оно стало давно, мы только чуть-чуть добавили антураж &ndash; назвали улицы в честь любимых учеников В.Д. Поленова, да выбрали место поближе к его усадьбе. А остальное сделала природа. С пологого холма, на котором раскинулся наш поселок, открывается такой вид, что рука сама тянется если не к кисти и холсту, то хотя бы к фотоаппарату. Но до конца передать красоту этого живого места, наверное, никогда не удастся &ndash; так непоседливы солнечные зайчики, так кружит голову смешение ароматов теплой травы и хвои...<br />
	КОММУНИКАЦИИ:</p>
<p>
	&nbsp;Дорога до поселка (асфальт)</p>
<p>
	Внутрипоселковые дороги (строятся)</p>
<p>
	Электричество (по границе поселка)</p>
<p>
	ИНФРАСТРУКТУРА:<br />
	детская площадка, теннисный корт, магазин, зона отдыха<br />
	ЦЕНА: от 30000 руб, за сотку<br />
	ПЛОЩАДЬ:<br />
	от 15 до 30 соток</p>
', '3', '54.810405', '37.289786');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('203', '4', '3', '7.00', '0', '109.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок расположился в 109 км от МКАД по Симферопольскому шоссе. ', '/_files/131852060491.gif', '/_files/131852060474.jpg', '/_files/131852060420.jpg', '/_files/131852060474.jpg', '', '', '', '', '', '', '280000.00', '', '0', '<div id=\\\"style_13178097850000000499_BODY\\\">
	<p>
		Коттеджный поселок расположился в 109 км от МКАД по Симферопольскому шоссе. По-настоящему хорошее место как для загородного отдыха, так и для постоянного проживания. Благо категория ИЖС позволяет оформить регистрацию без проблем.Сейчас Заокский район, на территории которого расположен КП активно развивается, так что строительство здесь не составит проблем. К поселку ведет хорошая дорога, получены условия на все необходимые коммуникации, а окружение поселка предлагает большой выбор самых разных развлечений.Но, безусловно, главным сокровищем Заокского района является его уникальная природа. Ведь не просто так здесь построены многочисленные санатории: в округе из-под земли бьют источники минеральной воды. Более того &ndash; благодаря обилию сосновых лесов воздух насыщен отрицательными ионами, то есть по-настоящему целебен. А еще эти места стали настоящим оазисом для чудес. Здесь бытуют легенды о животворящих иконах, чудодейственных источниках и святых местах. Словом, здесь, всего в часе езды от Москвы, находится настоящая сказка.<br />
		КОММУНИКАЦИИ:<br />
		Дорога до поселка (асфальт)<br />
		Газ (по границе поселка)<br />
		Электричество (по границе поселка)<br />
		ИНФРАСТРУКТУРА:<br />
		<font color=\\\"#000000\\\">Конная Дача &laquo;Велегож&raquo;</font><br />
		<font color=\\\"#000000\\\">р. Ока</font><br />
		<font color=\\\"#000000\\\">Ж/Д платформа &quot;Тарусская&quot;</font><br />
		<font color=\\\"#000000\\\">музей-усадьба В.Д.Поленова</font><br />
		<font color=\\\"#000000\\\">Пляж на Оке</font><br />
		ЦЕНЫ: от 40000 руб./сот.<br />
		ПЛОЩАДЬ:<br />
		от 7 до 18 соток</p>
</div>
', '3', '54.704937', '37.276354');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('204', '4', '3', '6.00', '0', '60.00', '60.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Ромашкино тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок располагается в 60 км от МКАД по Симферопольскому шоссе в Чеховском районе Московской области.', '/_files/131852273317.gif', '', '', '', '', '', '', '', '', '', '180000.00', '', '0', '<div id=\\\"\\\\\\\">
	Поселок окружен дубовым лесом, огромным природным озером с рыбой. В 2 км от поселка Дубна , где функционирует множество торговых центров, медицинских и образовательных учреждений, спортивных и детских центров.<br />
	Инфраструктура:<br />
	- электрификация поселка из расчета 5 кВт на участок;<br />
	- межевание земельного участка.<br />
	Все необходимые коммуникации подключены.<br />
	Площадь:<br />
	участки от 6 до 20 соток.<br />
	Цена:<br />
	29000 руб./сот.</div>
', '3', '55.136304', '37.292576');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('205', '4', '3', '8.00', '0', '56.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Святой источник 2 тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Поселок в близи Святого Источника Преподобного Давида.', '/_files/131852346197.gif', '/_files/131852346127.jpg', '/_files/131852346116.jpg', '/_files/131852346158.jpg', '/_files/131852346183.jpg', '/_files/131852346199.jpg', '', '', '', '', '760000.00', '', '0', '<div id=\\\"\\\\\\\">
	Поселок располагается в 56 км от МКАД по Симферопольскому шоссе в Чеховском районе Московской области.Рядом есть очень много всего интересного, это и Святой Источник Преподобного Давида, и Вознесенская Давидова Пустынь, и Музей-усадьба А.П. Чехова.Ближайший населенный пункт &ndash; Талеж, в котором работает несколько магазинов, медпункт, средняя школа, а также церковно-приходская школа.<br />
	Инфраструктура:<br />
	Сейчас в коттеджном поселке&nbsp;идет интенсивное строительство, и в скором времени тут будет шикарная инфраструктура. Развлекательная зона будет включать в себя универсальные спортивные площадки и детские комплексы. На ней можно заниматься разными видами спорта: футболом, волейболом, баскетболом - наши площадки абсолютно универсальны. Ночью они освещаются. Ваши дети будут проводить время на площадках, оснащенных безопасным игровым оборудованием. Для Ваших гостей мы создадим автостоянки. А охранять Вас будут круглосуточно, мы об этом уже позаботились. Так что тут будет просто прекрасно. Приезжайте и убедитесь в этом. Все необходимые коммуникации подключены.<br />
	Площадь:<br />
	участки от 8 соток<br />
	Цена:<br />
	95000 руб./сот.</div>
', '8', '55.082431', '37.667369');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('206', '4', '3', '9.00', '0', '70.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Сосновый берег Кудаево тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок находится в Серпуховском районе Московской области в 70 км от МКАД', '/_files/131852387998.gif', '/_files/131852393332.jpg', '/_files/131852393337.jpg', '/_files/131852393379.jpg', '', '', '', '', '', '', '680000.00', '', '0', '<p>
	Коттеджный поселок находится в Серпуховском районе Московской области в 70 км от МКАД по Симферопольскому шоссе.Поселок находится будто в углублении и с трех сторон окружен лесами. С одной стороны смешанными, с другой сосновыми &ndash; и все это проходит по границе поселка.<br />
	Инфраструктура:<br />
	- рядом река Нара<br />
	- центральные и второстепенные дороги;<br />
	- круглосуточная охрана, КПП при въезде;<br />
	- гостевая парковка;<br />
	- беседки и зона для барбекю;<br />
	- детская игровая зона с безопасным оборудованием ( горки, лестницы, качели, турники и беседки);<br />
	- универсальная спортивная площадка (для футбола, волейбола, бескетбола или тенниса).В ночное время площадка освещается;<br />
	- межевание участков;<br />
	Коммуникации:<br />
	-электричество<br />
	-газ<br />
	-вода<br />
	Площадь:<br />
	от 9 до 13 соток<br />
	Цена:<br />
	75000 руб./сот.</p>
', '3', '55.064586', '37.178561');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('207', '4', '3', '10.00', '0', '78.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Сосновый берег Зарарское тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок располагается в 78 км от МКАД по Симферопольскому шоссе в Серпуховском районе Московской области.', '/_files/131852518582.gif', '/_files/131852518532.jpg', '/_files/131852518562.jpg', '/_files/131852518547.jpg', '', '', '', '', '', '', '700000.00', '', '0', '<div id=\\\"style_13182436310000000491_BODY\\\">
	Поблизости находится старинная церковь Архангела Михаила, построенная еще 1683 году. А по границе протекает река Нара. Все это в окружении соснового бора, поэтому тут всегда улавливается еловый ненавязчивый запах.<br />
	Инфраструктура:<br />
	- беседки и зона для барбекю;<br />
	- детские комплексы ( мини-беседки, лестницы, качели и канаты);<br />
	- универсальная спортивная площадка;<br />
	Поселок полностью озеленен<br />
	Все необходимые&nbsp;коммуникации подключены.<br />
	Площадь:<br />
	от 10 соток<br />
	Цена:<br />
	70000 руб./сот.</div>
', '4', '55.036433', '37.238000');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('208', '4', '3', '8.00', '0', '50.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Сосновый аромат тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок располагается в 50 км от МКАД по Симферопольскому шоссе в Чеховском районе ', '/_files/131852620436.gif', '/_files/131852620412.jpg', '/_files/131852620429.jpg', '/_files/131852620439.jpg', '', '', '', '', '', '', '760000.00', '', '0', '<div id=\\\"style_13182436030000000940_BODY\\\">
	Коттеджный поселок располагается в 50 км от МКАД по Симферопольскому шоссе в Чеховском районе Московской области. В окружении поселка хвойные леса, неподалеку святой Источник Преподобного Давида, музей-усадьба А.П.Чехова, конно-спортивный клуб (в д.Васькино).Поселок охраняется, полностью окультурен, а при въезде стоят античные статуи. Они создают атмосферу еще большего уюта, красоты и эстетичности поселка. Пруд в середине поселка придает&nbsp;поселку особую душевность, а на отлично оборудованном песочном пляже, Вы сможете проводить все солнечные деньки<br />
	Инфраструктура:<br />
	- внешнее ограждение поселка<br />
	- центральные и второстепенные дороги<br />
	- КПП с круглогодичной охраной<br />
	- пруд с песочным пляжем<br />
	- зона для барбекю<br />
	- детский городок<br />
	- универсальная спотривная площадка<br />
	- 2 общественные зоны<br />
	- озеленение поселка, парковая зона<br />
	- гостевые парковки<br />
	- межевание участков<br />
	Поселок подключен ко всем необходимым коммуникациям.<br />
	Площадь: от 8 соток<br />
	Цена: 95000 руб./сот.</div>
', '8', '55.1407983245244', '37.63193376464844');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('209', '4', '3', '6.00', '0', '77.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Высокий берег тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок располагается в 77 км от МКАД по Симферопольскому шоссе', '/_files/131852660378.gif', '/_files/131852660357.jpg', '/_files/131852660313.jpg', '/_files/131852660362.jpg', '', '', '', '', '', '', '210000.00', '', '0', '<div id=\\\"\\\\\\\">
	Коттеджный поселок располагается в 77 км от МКАД по Симферопольскому шоссе в Серпуховском районе.По границе поселка протекает река Нара.<font face=\\\"\\\\\\\">Практически рядом с коттеджным поселком&nbsp;находится охраняемая ЮНЕСКО территория &ndash; Приокско-Террасный биосферный заповедник. При въезде Вас всегда будет встречать охрана. Для Вас и Ваших детей создана отличная общественная зона.Для ребят это площадки с безопасным игровым оборудованием, где будет целый детский комплекс с домиками, качелями и качалками, а для Вас мы сделаем универсальную спортивную площадку. Вы сможете заниматься тут разными видами спорта: футболом, волейболом или баскетболом. Ночью площадка будет освещаться. Для Ваших гостей мы создадим гостевые автопарковки. Ну и, конечно, покушать и пообщаться с соседями Вы сможете в уютных беседках, рядом с которыми расположена зона для барбекю, ведь специально для таких душевных посиделок мы и создали подобное местечко.<br />
	<font face=\\\"\\\\\\\">Инфраструктура:<br />
	- внешнее ограждение поселка<br />
	- центральные и второстепенные дороги<br />
	- КПП с круглогодичной охраной<br />
	- пруд с песочным пляжем<br />
	- зона для барбекю<br />
	- детский городок<br />
	- универсальная спотривная площадка<br />
	- 2 общественные зоны<br />
	- озеленение поселка, парковая зона<br />
	- гостевые парковки</font><br />
	Все необходимые коммуникации подключены.<br />
	Площадь:<br />
	от 6 соток<br />
	Цена:<br />
	35000 руб./сот.</font></div>
', '5', '55.03464627977234', '37.2734731750488');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('210', '4', '3', '10.00', '0', '47.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Земляничный тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок распологается в 47 км от МКАД по Симферопольскому шоссе ', '/_files/131852706854.gif', '/_files/131852706863.jpg', '/_files/131852706847.jpg', '/_files/131852706810.jpg', '', '', '', '', '', '', '800000.00', '', '0', '<div id=\\\"style_13182429250000000598_BODY\\\">
	Коттеджный поселок распологается в 47 км от МКАД по Симферопольскому шоссе в Чеховском районе.<br />
	&nbsp;окружен интересными местами. К примеру, сложно не упомянуть усадьбу Курниково середины XIX века, которая по историческим данным принадлежала Н.П. Гладкову. Также недалеко располагается церковь Рождества Богородицы, построенная еще в 1700 году. Так же нельзя не упомянуть Святой источник преподобного Давида, куда съезжаются все жители Подмосковья, чтобы попить святой водицы. Он находится всего в 15 минутах езды от коттеджного поселка &laquo;Земляничный&raquo;. Также Вы сможете посетить музей-усадьбу Мелихово, где жил и работал А.П. Чехов.Коттеджный поселок &laquo;Земляничный&raquo; обладает отличной инфраструктурой и полностью готов к заселению. Прямо при въезде стоит КПП с круглосуточной охраной.
	<p>
		В коттеджном поселке создана компактная развлекательная зона для взрослых и детей. Детская площадка с безопасным игровым оборудованием, а рядом с ней располагается универсальная спортивная площадка. Она походит для игры в футбол, волейбол, баскетбол и теннис. Ночью она освещается фонарями. Однако самая &laquo;вкусная&raquo; зона &ndash; это зона для барбекю с уютным беседками. Тут можно не только кушать мясо и общаться с соседями, но и праздновать дни рождения и другие праздники, благо место позволяет.<br />
		Инфраструктура:<br />
		- внешнее ограждение поселка<br />
		- центральное и второстепенные дороги<br />
		- КПП с круглогодичной охраной<br />
		- детская площадка и безопасным оборудованием<br />
		- универсальные спортивные площадки ( для футбола, волейбола, баскетбола и тенниса)<br />
		- зона бля барбекю<br />
		- общее озеленение поселка<br />
		Все необходимые коммуникации подключены.<br />
		Площадь:<br />
		от 10 соток<br />
		Цена:<br />
		80000 руб./сот.</p>
</div>
', '8', '55.14605', '37.588107');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('211', '4', '3', '6.00', '0', '56.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Святой источник ИЖС тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок располагается в 56 км от МКАД по Симферопольскому шоссе в Чеховском районе', '/_files/131852991635.gif', '/_files/131852991627.jpg', '/_files/131852991641.jpg', '/_files/131852991608.jpg', '', '', '', '', '', '', '850000.00', '', '0', '<div id=\\\"style_13182396360000000659_BODY\\\">
	Коттеджный поселок располагается в 56 км от МКАД по Симферопольскому шоссе в Чеховском районе.У расположения огромное количество плюсов: во-первых, удобное месторасположение по отношению к городу, во-вторых, поселок окружают смешанные леса. А это означает, что Вы можете наслаждаться главной драгоценностью Подмосковья - свежим, чистым, живым воздухом.При въезде в поселок находится КПП,
	<p>
		детская площадка. Она оснащена безопасным игровым оборудованием, поэтому Вы можете спокойно оставлять детей на ней. Вокруг площадки стоят деревянные скамейки для того, чтобы родители могли на них отдохнуть. Чуть подальше от детской площадки стоят 2 беседки, а между ними зона для барбекю.<br />
		Инфраструктуа:<br />
		-внешнее ограждение поселка<br />
		-центральные и второстепенные дороги<br />
		-КПП с круглогодичной охраной<br />
		-детская площадка<br />
		-спортивные площадки<br />
		-2 беседки и зона барбекю<br />
		-общее озеленение поселка<br />
		Все необходимые коммуникации подключены<br />
		Площадь:<br />
		от 6 до 16 соток<br />
		Цена:<br />
		140000 руб./сот.</p>
</div>
', '8', '55.08474193816752', '37.68313380737305');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('212', '4', '3', '7.00', '0', '72.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Лесное озеро тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок располагается в 72 км от МКАД по Симферопольскому шоссе ', '/_files/131853093506.gif', '/_files/131853093587.jpg', '/_files/131853093510.jpg', '', '', '', '', '', '', '', '350000.00', '', '0', '<div id=\\\"\\\\\\\">
	Коттеджный поселок располагается в 72 км от МКАД по Симферопольскому шоссе в Серпуховском районе.Если рассматривать географическое положение поселка, то можно увидеть, что на юго-западе &laquo;Лесное Озеро&raquo; граничит с деревнями, на западе &ndash; с лесным массивом, на юго-востоке и востоке &ndash; с полем, а на севере - с шоссе. Недалеко от поселка разливается р. Нара. Поселок располагается на водораздельном плато и окружен небольшими речушками. Речки эти безымянные. Правые &ndash; притоки р. Нары, левый &ndash; приток р. Ока.<br />
	Инфраструктура:<br />
	- внешнее ограждение поселка<br />
	- центральные и второстепенные дороги<br />
	- КПП с круглосуточной охраной<br />
	- 2 гостевые автопарковки<br />
	- детская площадка с безопасным оборудованием<br />
	- универсальные спортивные площадки (для футбола, волейбола, баскетбола и тенниса)<br />
	- зона для барбекю<br />
	- общее озеленение поселка<br />
	Все необходимые коммуникации подключены.<br />
	Площадь:<br />
	от 7 соток<br />
	Цена:<br />
	48000 руб./сот.</div>
', '5', '54.9856911581455', '37.31403350830078');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('213', '4', '3', '6.00', '0', '54.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Снежная долина тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок располагается в 54 км от МКАД по Симферопольскому шоссе в Чеховском районе ', '/_files/131853347339.gif', '/_files/131853347354.jpg', '/_files/131853347374.jpg', '/_files/131853347347.jpg', '', '', '', '', '', '', '180000.00', '', '0', '<div id=\\\"style_13182377730000000941_BODY\\\">
	Коттеджный поселок&nbsp;располагается в 54 км от МКАД по Симферопольскому шоссе в Чеховском районе Московской области.
	<p>
		С Востока и Запада поселок охраняется хвойными лесами, а на северо-востоке и юго-западе окружен деревнями. Ближайший населенный пункт &ndash; деревня Бавыкино, где функционируют магазины. В 15 км от коттеджного поселка&nbsp;располагается город Чехов. В поселке есть 2 зоны отдыха:</p>
	<p>
		Одна зона &ndash; это тихое местечко для отдыха душой и телом. В ней будут расположены уютные лавочки, открытые беседки, сквер с пешеходными дорожками. Тем самым уют и защищенность будут чувствоваться не только в лесу, но и в самом коттеджном поселке, ведь зона будет полностью озеленена, вы сможете гулять по ней, дивясь красоте окружающей природы.<br />
		Вторая зона &ndash; это спортивный уголок для любителей активного отдыха. Она будет включать в себя спортивные поля с современным качественным искусственным покрытием, ни чем не уступающим настоящему газону. В одной развлекательной зоне совмещены площадки для футбола, баскетбола, волейбола, большого тенниса и для занятия аэробикой. Прямо около спортивной зоны, во имя искушения, будет стоять зона для барбекю.<br />
		Инфраструктура:<br />
		- внешнее ограждение поселка<br />
		- центральные и второстепенные дороги<br />
		- КПП с круглогодичной охраной<br />
		- спортивные площадки<br />
		- &quot;зеленая&quot; зона с лавочками, открытыми беседками и сквером с пешеходными дорожками<br />
		- зона бля барбекю<br />
		- общее озеленение поселка<br />
		Все необходимые коммуникации подключены<br />
		Площадь:<br />
		от 6 соток<br />
		Цена:<br />
		30000 руб./сот.</p>
	<p>
		&nbsp;</p>
</div>
', '3', '55.08902794317405', '37.59693145751953');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('214', '4', '3', '10.00', '0', '49.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Соколиная гора тел. контакта с собственником 8 (926)780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок располагается в 49 км от МКАД по Симферопольскому шоссе', '/_files/131853337725.gif', '/_files/131853337742.jpg', '/_files/131853337741.jpg', '', '', '', '', '', '', '', '650000.00', '', '0', '<div id=\\\"style_13182370910000000959_BODY\\\">
	Коттеджный поселок располагается в 49 км от МКАД по Симферопольскому шоссе в Чеховском районе Московской области.По границе поселка идет небольшой перелесок, который чуть дальше перерастает в густую березовую рощу,открывается великолепный вид на огромное чистейшее озеро. Напротив &laquo;Соколиной Горы&raquo; разливается широкое чистейшее озеро.Лицевой стороной поселок обращен к деревне Сокольниково, в которой есть все необходимые элементы коммуникации. Другой своей стороной поселок обращен к лесу. В деревне Сокольниково, которая находится в шаговой доступности от &quot;Соколиной Горы&quot;, с конца 16 века стоит Крестовоздвиженская Церковь.В 10 минутах езды от &laquo;Соколиной Горы&raquo; вы увидите село Талеж. В нем стоит Святой Источник преподобного Давида.В Подворье Вознесенской Давидовой Пустыни, месте, где стоит источник, расположены храм во имя преподобного Давида Серпуховского, звонница, мужская и женская купели.<br />
	Поселок охраняется круглый год.<br />
	Инфраструктура:<br />
	- внешнее ограждение поселка<br />
	- центральные и второстепенные дороги<br />
	- КПП с круглогодичной охраной<br />
	- многофункциональные детские площадки<br />
	- спортивные площадки<br />
	- беседки, скамейки, зона для барбекю<br />
	- исскуственный водоем<br />
	-общее озеленение поселка<br />
	Все необходимые коммуникации подключены.<br />
	Площадь:<br />
	от 10 до 25 соток<br />
	Цена:<br />
	65000 руб./сот.</div>
', '8', '55.14711411342877', '37.601024494628906');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('215', '4', '3', '6.00', '0', '65.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Святая гора тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок расположился в 65 км от МКАД по Симферопольскому шоссе', '/_files/131853342601.gif', '/_files/131853342668.jpg', '/_files/131853342655.jpg', '/_files/131853342622.jpg', '', '', '', '', '', '', '360000.00', '', '0', '<div id=\\\"style_13182345340000000860_BODY\\\">
	Коттеджный поселок расположился в 65 км от МКАД по Симферопольскому шоссе в Чеховском районе<br />
	Московской области.Первое значимое и интереснейшее место неподалеку от поселка &ndash; Святой Источник Преподобного Давида в Талеже. Он находится на территории Вознесенской Давидовой Пустыни. Стоит упомянуть еще одно любимое нами место - музей-усадьба А.П. Чехова. Здесь жил, творил и врачевал писатель. Музей работает все дни, кроме понедельника (санитарный день). Рядом со &laquo;Святой Горой&raquo;, в поселке Васькино, есть Галыгинский пруд. Для любителей половить рыбку - тут просто сказка, так как осуществляется искусственное разведение разных видов рыб. Город Чехов находится в 16 км от поселка.<br />
	Помимо леса коттеджный поселок обнесен забором, а на въезде стоит КПП. Наша охрана круглосуточно патрулирует территорию, поэтому за свою безопасность Вы можете не беспокоиться.<br />
	Инфраструктура:<br />
	- центральные и второстепенные дороги<br />
	- спортивные площадки<br />
	- зоны для барбекю<br />
	- озеленение поселка, парковая зона<br />
	- детские площадки<br />
	- круглогодичная охрана (КПП)<br />
	-внешнее ограждение поселка<br />
	Подключены все необходимые коммуникации.<br />
	Площадь:<br />
	участки от 6 соток<br />
	Цена:<br />
	50000 руб./сот.</div>
', '8', '55.07423974217946', '37.63938084411621');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('216', '4', '15', '6.00', '0', '14.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Сосновый бор 1 и 2. тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля. договор 2011-2012', '0', '0', '0', '0', '0', '0', 'Поселок в Раменском районе. Находится в окружении шикарного соснового бора', '/_files/131902085280.gif', '/_files/131902085280.jpg', '/_files/131902085242.jpg', '/_files/131902085299.jpg', '/_files/131902085273.jpg', '/_files/131902085212.jpg', '', '', '', '', '1100000.00', '', '0', '<div id=\\\"\\\\\\\">
	Коттеджный поселок&nbsp;располагается в 14 км от МКАД по Новорязанскому шоссе (М5) в Раменском районе.Находится в окружении шикарного соснового бора; отличается хорошей транспортной доступностью и удобным подъездом к участкам.Напротив поселка, через речку, располагается горнолыжный склон &ndash; &laquo;Боровской курган&raquo; &ndash; особая находка для любителей экстремальных видов спорта.Если Вы предпочитаете тихое романтическое уединение, то Вы можете прогуляться теплым летним вечерком вдоль Москвы-реки.<br />
	Разрешено использование земли- под дачное строительство.<br />
	ИНФРАСТРУКТУРА:<br />
	-КПП<br />
	-по периметру поселка кирпичный забор<br />
	-детская площадка<br />
	-поле для мини-футбола<br />
	-теннисный корт<br />
	-беседки и зоны для барбекю<br />
	-пешеходный бульвар<br />
	КОММУНИКАЦИИ:<br />
	-электричество<br />
	-газ<br />
	-водоснабжение<br />
	Площадь:<br />
	от 6 до 25 соток<br />
	Цена:<br />
	182000 руб./сот.</div>
', '5', '55.560923', '38.018103');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('232', '3', '10', '14.00', '0', '21.00', '0.00', '1', '2', '2', '3', '2', '6', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'От радюк', '0', '0', '0', '0', '0', '0', 'Шикарный земельный участок 15 соток ИЖС. В закрытом поселке Премиум класса.', '/_files/132912783510.gif', '/_files/132912783555.JPG', '/_files/132912783536.JPG', '/_files/132912783527.JPG', '/_files/132912783576.JPG', '/_files/132912783562.JPG', '/_files/132912783511.JPG', '', '', '', '16500000.00', '', '0', '<p>
	Месторасположение: Рублево-Успенское ш., 18 км от МКАД, 1-е Успенское шоссе.</p>
<p>
	Коммуникации: все оплаченные центральные. Электричество 15 Квт, газ магистраль, вода магистраль, канализация.</p>
<p>
	Стоимость:&nbsp; 550&nbsp;000 $</p>
', '4', '55.703806', '37.125292');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('218', '1', '14', '8.00', '0', '20.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Дом 500 кв. метров в с. Константирово', '/_files/131902458861.gif', '/_files/131902458895.jpg', '/_files/131902458855.jpg', '/_files/131902458852.jpg', '/_files/131902458804.jpg', '/_files/131902458853.jpg', '/_files/131902458818.jpg', '/_files/131902458875.jpg', '/_files/131945243300.JPG', '/_files/131945243380.jpg', '9000000.00', '', '0', '<p>
	Продается дом из газоблоков облицованный кирпичем&nbsp;под чистовую отделку.</p>
<p>
	Дом размещен на участке 8 соток.</p>
<p>
	Коммуиникации газ и электричество по границе участка.</p>
', '4', '55.444553', '37.719744');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('220', '4', '15', '6.00', '0', '38.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Великие озера тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок располагается в 38 км от МКАД по Новорязанскому шоссе', '/_files/131981105995.gif', '/_files/131981105989.jpg', '/_files/131981105929.jpg', '/_files/131981105909.jpg', '/_files/131981105958.jpg', '/_files/132835711919.jpg', '/_files/132835697460.jpg', '', '', '', '330000.00', '', '0', '<p>
	Коттеджный поселок&nbsp;располагается в 38 км от МКАД по Новорязанскому шоссе в Раменском районе.<font face=\\\"\\\\\\\">Шикарное зарыбленное озеро, летом здесь можно увидеть не только купающихся ребятишек, но и рыбаков, которые приехали сюда основательно порыбачить. Рыбалка получается отличная. Здесь несколько подходов к озеру, хотите, можете рыбачить прямо со стороны коттеджного поселка, или же перейти на другой берег, пройти по полю и устроится в ожидании хорошего клева там.Ближайший населенный пункт-Бронницы.<span .=\\\"\\\\\\\" face=\\\"\\\\\\\" font=\\\"\\\\\\\" font-family:=\\\"\\\\\\\" font-size:=\\\"\\\\\\\" span=\\\"\\\\\\\">Инфраструктура:<br />
	-развлекательная зона<br />
	-песочный пляж<br />
	-КПП<br />
	-круглосуточная охрана<br />
	-огражденная территория<br />
	Коммуникации:<br />
	газ<br />
	электричество<br />
	Площадь:<br />
	от 6 соток<br />
	Стоимость:<br />
	55 000 руб./сот.</span></font></p>
', '5', ' 55.472880', '38.250665 ');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('221', '4', '5', '7.00', '0', '60.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Южные озера-2 тел. контакта с собственником 8 (926) 780-70-83 Мая Красивая земля', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок располагается в 60 км от МКАД по Калужскому шоссе на берегу лесного озера', '/_files/131981137792.gif', '/_files/131981137721.jpg', '/_files/131981137778.jpg', '/_files/131981137766.jpg', '', '', '', '', '', '', '525000.00', '', '0', '<p>
	Коттеджный поселок располагается в 60 км от МКАД по Калужскому шоссе в Чеховском районе.Поселок окружен лесом, а неподалеку протекает река Лопасня.Очень интересно будет заехать в церковь Иконы Божьей Матери &laquo;Всех Скорбящих Радость&raquo; в Шарапове, и посмотреть это величественное и красивое здание, которое ведет свою историю, начиная еще с XVI века.<br />
	Инфраструктура:<br />
	дороги (строятся)<br />
	КПП<br />
	круглосуточная охрана<br />
	общественная зона (детская и спортивная площадки)<br />
	собственный пляж<br />
	Коммуникации:<br />
	электричество<br />
	газ<br />
	Площадь:<br />
	от 7 соток<br />
	Стоимость:<br />
	75 000 руб./сот.</p>
', '8', '55.234505', '36.975861');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('222', '1', '6', '6.00', '0', '1.00', '1.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Продаётся новый коттедж (ниже себестоимости) в охраняемом посёлке. Немчиновка 2 км от МКАДа.', '/_files/132205052225.gif', '/_files/132205052281.JPG', '/_files/132205052273.JPG', '/_files/132205052228.JPG', '/_files/132205052267.JPG', '/_files/132205052283.JPG', '/_files/132205194252.JPG', '/_files/132205194272.JPG', '/_files/132205194216.JPG', '/_files/132205194296.JPG', '27500000.00', '', '0', '<p style=\"text-align: justify\">
	Продаётся новый коттедж (ниже себестоимости) в охраняемом посёлке.Запад Москвы, Можайское направление ,Одинцовский район .Немчиновка 2 км от МКАДА свой заезд через ул Горбунова всегда без пробок ,подъезд асфальт. 5 мин. до метро Молодёжная. Авторские проект и дизайн. Высокий уровень строительства. очень удобная планировка. Инфраструктура:Это Москва, плюс местные магазины, кафе, ресторанный комплекс, церковь, милиция, частный детский садик, ж/д станция Немчиновка, парк семейного отдыха с благоустроенными детскими площадками, а так же: Немчиновка-парк с гольфовыми полями, река Сетунь с пляжем и местами для рыбной ловли, Барвихинский лесопарк. Дом: Монолитнокирпичный . Площадь: 704 кв.м.Этажность: 3 Число уровней: 5 ,Потолки 3.25 м. В доме действующий итальянский гидравлический бесшумный лифт на четыре остановки, сауна, бассейн 3.5м Х 7.5м.,огромный подвал. В доме 44 окна REHAU элит с тройным остекленением . Коммуникации: Газ: Магистральный, проплачен ,по границе. Электричество: 10 кВт. проплачено, Водоснабжение артезианская скважина 120м Очень серьёзная дренажная система. Гараж на 2 авто + стоянка на территории участка на 3 авто . Участок 6 с возможностью расширения до 12 соток. Дом готов под внутреннюю отделку. Свободная планировка перегородок. Дом строился не на продажу , качество наилучшее. БТИ было, можно прописываться, документы на землю и дом готовы. Цена - 27 500 000 руб.</p>
', '4', '55.72769', '37.365103');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('223', '1', '10', '17.00', '0', '17.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '17 км. От МКАД, Рублево-Успенского ш., д. Солослово, участок 17 соток, Дом брус 150 кв.м. Горки-8', '/_files/132205513860.gif', '/_files/132205513899.jpg', '/_files/132205513893.jpg', '/_files/132205513883.jpg', '/_files/132205513822.jpg', '/_files/132205513829.jpg', '/_files/132205513854.jpg', '/_files/132205513843.jpg', '/_files/132205513869.jpg', '', '17700000.00', '', '0', '<p>
	&nbsp;</p>
<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"95%\">
	<tbody>
		<tr>
			<td height=\"79\">
				<p>
					17 км. От МКАД, Рублево-Успенского ш., д. Солослово, Горки-8, участок 17 соток, Дом брус 150 кв.м., 2 этажа. Баня. Все коммуникации центральные, заведены в дом. (Эл-во - 9 Квт, газ -магистраль, вода- скважина). Дом под ключ, теплый уютный. Отличная инфраструктура в 5 мин. пешком торговый комплекс, Сбер. Банк и т.д. Москва Река 1,5 км.</p>
			</td>
		</tr>
	</tbody>
</table>
', '4', '55.695813', '37.151878');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('227', '1', '7', '10.00', '0', '14.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Современный дом в 14 км по Новорижскому или Ильинскому шоссе, вблизи д. Александровка', '/_files/132692017289.gif', '/_files/132692017203.jpg', '/_files/132692017270.jpg', '/_files/132692017288.jpg', '/_files/132692017220.jpg', '/_files/132692017234.jpg', '/_files/132692017269.jpg', '/_files/132692017213.jpg', '/_files/132981245837.jpg', '/_files/132981245893.jpg', '31300000.00', '', '0', '<p>
	&nbsp;&nbsp;&nbsp;&nbsp; Вашу вниманию предлагается Комфортный дом 300 м2, выполненный из высококачественных материалов, расположенный на 10 сотках земли в<span> </span>охраняемом коттеджном поселке Премиум класса на 64 дома в единой архитектурной концепции. Всегда свободное Ильинское шоссе позволяет добраться в Москву быстро и комфортно. По Рублевке &mdash; 15 минут, по Новорижскому шоссе &mdash; 10 минут!<span> </span>Ваши соседи &mdash; первые лица государства и бизнес-элита.</p>
<p>
	&nbsp;</p>
<p style=\\\"line-height: normal; margin-bottom: 0pt\\\">
	<b><u>Инфраструктура:</u></b></p>
<p>
	Рядом с нами - суперсовременная школа, одна из лучших в мире.</p>
<p>
	Большой спорт-клуб с бассейном.<br />
	<br />
	Планировка:</p>
<ul>
	<li>
		3 спальни с индивидуальными санузлами;</li>
	<li>
		Панорамные окна &laquo;в пол&raquo;;</li>
	<li>
		2 балкона в главной спальне;</li>
	<li>
		Огромная терасса с грилем;</li>
	<li>
		4 санузла;</li>
	<li>
		Отельная прачечная комната;</li>
	<li>
		Большой кабинет;</li>
	<li>
		Фирменный забор с воротами и въездом.</li>
	<li>
		Гарантия 3 года</li>
</ul>
<p style=\\\"line-height: normal; margin-bottom: 0pt\\\">
	<span style=\\\"color: #f00\\\"><strong>Стоимость по спец. предложению 990 000 $</strong></span></p>
', '4', '55.770792', '37.217957');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('228', '1', '7', '11.00', '0', '14.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Современный дом в 14 км по Новорижскому или Ильинскому шоссе, вблизи д. Александровка', '/_files/132692012841.gif', '/_files/132692012850.jpg', '/_files/132692012830.jpg', '/_files/132692012846.jpg', '/_files/132692012813.jpg', '/_files/132692012809.jpg', '/_files/132981251572.jpg', '/_files/132981251537.jpg', '/_files/132981251570.jpg', '/_files/132981251500.jpg', '38000000.00', '', '0', '<p>
	Новорижское шоссе (ИЛЬИНСКОЕ ШОССЕ), 14 КМ от МКАД до самого поселка, вблизи д. Александровка</p>
<p style=\\\"line-height: normal; margin-bottom: 0pt\\\">
	Жилой дом 350 кв.м. расположен в охраняемом коттеджном поселке Премиум класса на 64 дома в единой архитектурной концепции. Участок 11 соток ИЖС. Всегда свободное Ильинское шоссе позволяет добраться в Москву быстро и комфортно. По Рублевке &mdash; 15 минут, по Новорижскому шоссе &mdash; 10 минут!<span> </span>Ваши соседи &mdash; первые лица государства и бизнес-элита.</p>
<p style=\\\"line-height: normal; margin-bottom: 0pt\\\">
	<b><u>Инфраструктура:</u></b></p>
<p style=\\\"line-height: normal; margin-bottom: 0pt\\\">
	Рядом с поселком - суперсовременная школа, одна из лучших в мире.</p>
<p style=\\\"line-height: normal; margin-bottom: 0pt\\\">
	Большой спорт-клуб с бассейном.</p>
<p style=\\\"line-height: normal; margin-bottom: 0pt\\\">
	Вашу вниманию предлагается Комфортный дом 350 м2, выполненный из высококачественных материалов;</p>
<ul>
	<li>
		3 спальни с индивидуальными санузлами;</li>
	<li>
		Панорамные окна &laquo;в пол&raquo;;</li>
	<li>
		2 балкона в главной спальне;</li>
	<li>
		Огромная терасса с грилем;</li>
	<li>
		4 санузла;</li>
	<li>
		Отельная прачечная комната;</li>
	<li>
		Большой кабинет;</li>
	<li>
		Фирменный забор с воротами и въездом.</li>
	<li>
		Гарантия 3 года</li>
</ul>
', '4', '55.768885', '37.198763');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('229', '3', '7', '10.00', '0', '20.00', '0.00', '1', '1', '4', '5', '2', '3', '1.00', '1.00', '1.00', '1.00', '', '0.00', '', '0.00', '0.00', '0.00', '1', '0', '0', '1', '1', '0', '0', '', '0', '0', '0', '0', '0', '0', 'Обжитой участок в поселке Нахабино 15 км от МКАД', '/_files/132739276306.gif', '/_files/132731771308.jpg', '/_files/132731771335.jpg', '/_files/132731771301.jpg', '/_files/132739261250.jpg', '/_files/132731771389.jpg', '/_files/132731771379.jpg', '/_files/132731771322.jpg', '', '', '4000000.00', '', '0', '<p>
	<span color:=\\\"\\\\\\\" font-family:=\\\"\\\\\\\" font-size:=\\\"\\\\\\\">Продается участок с ветхим домом, в дом заведены все коммуникации (магистральный газ и электричество) в Участок ровный с фруктовыми деревьями, огорожен забором из сетки-рабицы. На участке питьевой колодец. Документы готовы к сделке.<o:p></o:p></span></p>
', '4', '55.846494', '37.189461');
INSERT INTO `land` (landID, location_view, location_direction, location_square, region_centerID, location_mkad_remoteness, location_region_center_remoteness, communication_gas, communication_electricity, communication_water, communication_sewage, communication_road, communication_fence, infrastructure_region_center_remoteness, infrastructure_shop, infrastructure_garbage, infrastructure_clinic, transport_bus_station, transport_bus_station_remotness, transport_train_station, transport_train_station_remotness, ecology_forest, ecology_water, landscape_smooth, landscape_elevation, landscape_lowland, landscape_trees, landscape_fruit_garden, landscape_design, landscape_pool, documents, buildings_house, buildings_bath, buildings_arbor, buildings_supply, buildings_garage, buildings_foundation, comment, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, owner_price, owner_contacts, owner_state, owner_advertisement, userID, latitude, longitude)
VALUES ('231', '4', '3', '10.00', '0', '90.00', '0.00', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', '0.00', '', '0.00', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', 'КП Гильвеция Александр (495) 232-24-35', '0', '0', '0', '0', '0', '0', 'Коттеджный поселок расположен в 90 км от Москвы, вдали от шумного мегаполиса, окруженный полями и лесами.', '/_files/133010469845.gif', '/_files/132790862308.jpg', '/_files/132790862350.jpg', '/_files/132790862326.jpg', '/_files/132790862356.jpg', '/_files/132790862347.jpg', '/_files/132790862376.jpg', '/_files/132790862320.jpg', '/_files/132790862301.jpg', '/_files/132790862339.jpg', '3500000.00', '', '0', '<p>
	<strong>К</strong><strong>оттеджный поселок </strong>расположен в <strong>90 км от Москвы</strong>, вдали от шумного мегаполиса, окруженный полями и лесами. Сюда не доходят звуки автомагистралей и неоновый свет супермаркетов. Здесь можно уединиться, наблюдая <strong>природу </strong>в ее первозданном виде, не тронутую цивилизацией. Название &nbsp;<strong>Коттеджный поселок </strong>построен с учетом требований <strong>современных</strong> жилищно-коммунальных <strong>условий</strong>, оснащен сферами техобслуживания, отвечающими мировым стандартам. Тем не менее, высокая комфортабельность поселка никак не отразилась на живописных видах, которые можно увидеть из окон Вашего собственного дома: зеленые луга, сосновые и смешанные леса, огромные природные пространства.</p>
<p>
	Тульская область, где расположился коттеджный поселок, неизменно притягивает взгляды проезжающих. Совсем недалеко от располагается музей-заповедник В.Д. Поленова, музей А. Т. Болотова, турбазы &laquo;Велегож&raquo; и &laquo;Поленово&raquo;, детский оздоровительный лагерь &laquo;Детская республика Поленово&raquo;, Храм Живоначальной Троицы, Святой Источник &ndash; все это находится на высоком берегу р.Оки, который мгновенно завораживает видом, открывающимся с него.</p>
<p>
	На территории поселка <strong>развита инфраструктура</strong> (магазины, детские площадки), <strong>коммуникации </strong>- на высоком уровне, <strong>развлекательная </strong>и <strong>спортивная</strong> сферы (рыбалка, катание на байдарках, в зимнее время лыжи и каток) &ndash; все для комфортного и полноценного отдыха. Приобрести участок в коттеджном поселке доступно каждому. Наши цены максимально адаптированы к рынку и требованиям покупателей.</p>


<p align=\"center\"><iframe width=\"450\" height=\"259\" src=\"http://www.youtube.com/embed/em5e_bvueuM\" frameborder=\"0\" allowfullscreen></iframe></p>', '5', '54.804507', '37.434947');


DROP TABLE IF EXISTS `page`;

CREATE TABLE `page` (
`pageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
`title` varchar(255),
`parentID` int(11) DEFAULT '0',
`content` text,
`shortcontent` text,
primary key(pageID)
);

INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('1', 'О таунхаусах', '0', '<p>
	sdfsdf</p>
', '<p>
	sdfds</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('2', 'Законодательство', '0', 'sdf', 'fdsf');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('3', 'Полезное', '0', '', '');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('4', 'Инвесторам', '0', '', '');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('7', 'Таунхаусы это', '1', '<p>
	В настоящее время многим уже знакомо такое понятие как &laquo;таунхаус&raquo;, но всего 15 лет назад мало кто в России представлял что это такое. А ведь первые таунхаусы появились еще в позапрошлом веке, в Англии, и представляли собой дома на несколько семей.</p>
<p>
	Дословно &laquo;таунхаус&raquo; означает &laquo;дом в городе&raquo; или &laquo;городской дом&raquo;, но в нашем сегодняшнем представлении это скорее большая квартира за пределами города. <strong><em>Таунхаус</em></strong> &mdash; комплекс малоэтажных домов, имеющих одну или несколько общих стен. Каждый дом в этом комплексе называется секцией таунхауса. Количество секций в таунхаусе не лимитируется. Дом, разделенный на две части, называется дуплекс; дом, разделенный на три части называется триплекс, дом из четырёх и более частей называют таунхаусом.</p>
<p>
	На самом деле, таунхаус &ndash; это нечто среднее между городской квартирой и коттеджем. Он имеет гораздо большую площадь, нежели обычная квартира, находится в пригороде, имеет несколько этажей, отдельный вход и небольшой придомовой участок. Стоимость квадратного метра в таунхаусе значительно ниже стоимости метра даже в московской пятиэтажке, поэтому просторный таунхаус ненамного дороже средней столичной &laquo;трешки&raquo;. От коттеджа таунхаус отличается тем, что это, прежде всего, сблокированное жилье, а значит, за стеной все же будут соседи. Кроме того, площадь прилегающего участка составляет несколько соток &ndash; гораздо меньше, чем площадь стандартного участка при загородном доме. Зато содержание таунхауса обходится в разы дешевле, нежели содержание большого дома, таунхаусы строятся вне шумного города &ndash; а значит, у вас появится прекрасная возможность приобрести жилье на свежем воздухе со всем необходимым по цене небольшой московской квартиры.</p>
<p>
	Таунхаусы привлекают все большее внимание городских жителей, сочетая в себе доступность квартиры и комфорт загородного дома. В настоящий момент рынок недвижимости таунхаусов растет семимильными темпами, на рынок вышло много новых игроков, но, как правило, это уже именитые строительные компании, которые осваивают непаханное поле в виде этого привлекательного малоэтажного загородного жилья.</p>
<p>
	Мы создали этот сайт с целью погрузить Вас в многообразие таунхаусов, предлагаемых на современном московском рынке загородной недвижимости, разобрать для Вас основные плюсы и минусы жизни в этом современном варианте загородной жизни. С целью упрощения мы подготовили информацию для Вас в доступном виде, исходя из основных вопросов и проблем, возникающих при выборе, приобретении, оформлении в собственность таунхауса и квартиры в малоэтажном многоквартирном доме.</p>
', '<p>
	Дословно &laquo;таунхаус&raquo; означает &laquo;дом в городе&raquo; или &laquo;городской дом&raquo;, но в нашем сегодняшнем представлении это скорее большая квартира за пределами города. <strong><em>Таунхаус</em></strong>&nbsp; &mdash;&nbsp; комплекс малоэтажных домов, имеющих&nbsp; одну или несколько общих стен.</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('8', 'Появление таунхаусов', '1', '<p>
	Первые многосекционные дома появились в 19 веке в Англии. Предположительно, первые таунхаусы появились в России в 1995 году в ближайшем Подмосковье, при этом стоимость квадратного метра составляла примерно 500 долларов США с учетом земельного участка и коммуникаций.</p>
', '<p>
	Первые многосекционные дома появились в 19 веке в Англии.</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('9', 'Что входит в стоимость секции таунхауса?', '1', '<p>
	В стоимость секции таунхауса входит небольшой земельный участок (1-4 сотки), который также оформляется в собственность, фундамент, коробка с утеплением, кровля, окна, двери, инженерные системы, включающие наружные коммуникации. Реже: отопление с настенным электрическим или газовым котлом, черновая лестница, электрическая или газовая плита, минимальный комплект для санузла &mdash; в редких случаях.</p>
', '<p>
	В стоимость секции таунхауса входит небольшой земельный участок (1-4 сотки), который также оформляется в собственность, фундамент, коробка с утеплением, кровля, окна, двери, инженерные системы, включающие наружные коммуникации. Реже: отопление с настенным электрическим или газовым котлом, черновая лестница, электрическая или газовая плита, минимальный комплект для санузла &mdash; в редких случаях.</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('10', 'Виды таунхаусов и классификация', '1', '<p>
	Существует 2 основных вида поселков таунхаусов:</p>
<p>
	1) таунхаусы, которые строятся по единому проекту, в радиусе 30 км от Москвы рядом с подмосковными городами. Все таунхаусы имеют одинаковый дизайн.</p>
<p>
	2) таунхаусы, входящие в состав мультиформатных поселков. В таких поселках кроме таунхаусов есть и коттеджи, и среднеэтажные дома с привычными квартирами.</p>
<p>
	&nbsp;</p>
<p>
	Таунхаусы можно разделить на следующие типы</p>
<p>
	<strong><em>1) по наличию соседних секций:</em></strong></p>
<ul>
	<li>
		центральные (с двумя соседями);</li>
	<li>
		боковые (с одним соседом);</li>
</ul>
<p>
	<em><strong>2) по материалам, используемым при строительстве:</strong></em></p>
<ul>
	<li>
		таунхаусы из сплиттерных теплоблоков</li>
	<li>
		газо-пено-шлако блочные</li>
	<li>
		кирпичные</li>
	<li>
		монолитно-кирпичные</li>
	<li>
		из смешанных материалов</li>
	<li>
		один из выше перечисленных с деревянной мансардой</li>
</ul>
<p>
	<em><strong>3) по виду крыши:</strong></em></p>
<ul>
	<li>
		с мансардой;</li>
	<li>
		с обычной крышей;</li>
	<li>
		с эксплуатируемой крышей</li>
</ul>
<p>
	<em><strong>4). по форме:</strong></em></p>
<ul>
	<li>
		вытянутые,</li>
	<li>
		г-образные,</li>
	<li>
		т-образные,</li>
	<li>
		овлальные</li>
	<li>
		округлые</li>
</ul>
<p>
	<em><strong>5) по цене и классу:</strong></em></p>
<ul>
	<li>
		эконом,</li>
	<li>
		средний,</li>
	<li>
		бизнес,</li>
	<li>
		премиум.</li>
</ul>
', '<p>
	Существует 2 основных вида поселков таунхаусов.</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('11', 'Сравнение: Квартира — Таунхаус — Загородный дом', '1', '<p>
	&nbsp;&nbsp;&nbsp;Большинство покупателей выбирают не между таунхаусом и коттеджем, а между таунхаусом и квартирой в Москве. Поэтому&nbsp; развитие рассматриваемого сегмента схожа с динамикой рынка городского жилья, но немного отличаются конечные потребители. Как правило, таунхаус&nbsp; бизнес-класса - замена квартиры того же уровня. Преимущества: экологичное место,&nbsp; большая площадь&nbsp; за те же деньги, отдельный вход в дом, машино-место рядом с подъездом. Недостатки&nbsp; - удаленность от центра столицы и недостаточно развитая инфраструктура. С другой стороны, в Подмосковье уже появились места, где уровень инфраструктуры практически соответствует столичному.</p>
<table border=\"1\" bordercolor=\"#000000\" cellpadding=\"1\" cellspacing=\"0\">
	<tbody>
		<tr>
			<td height=\"26\">
				<p>
					Вид неджижимости</p>
			</td>
			<td>
				<p style=\"text-align: center\">
					<span style=\"background-color: #d3d3d3\"><strong>Таунхаус</strong></span></p>
			</td>
			<td width=\"380\">
				<p style=\"text-align: center\">
					<span style=\"background-color: #d3d3d3\"><strong>Кваритира</strong></span></p>
			</td>
			<td width=\"380\">
				<p style=\"text-align: center\">
					<span style=\"background-color: #d3d3d3\"><strong>Загородный дом</strong></span></p>
			</td>
		</tr>
		<tr>
			<td height=\"26\">
				<p>
					Стоимость</p>
			</td>
			<td>
				<p>
					<strong>7 000 000 руб.</strong></p>
			</td>
			<td width=\"380\">
				<p>
					<strong>7 000 000 руб.</strong></p>
			</td>
			<td width=\"380\">
				<p>
					<strong>7 000 000 руб.</strong></p>
			</td>
		</tr>
		<tr>
			<td height=\"45\" valign=\"middle\" width=\"197\">
				<p>
					Метраж</p>
			</td>
			<td valign=\"middle\" width=\"209\">
				<p>
					150 м кв.</p>
			</td>
			<td valign=\"middle\">
				<p>
					70 м кв.</p>
			</td>
			<td valign=\"middle\">
				<p>
					100 -120 м кв.</p>
			</td>
		</tr>
		<tr>
			<td valign=\"middle\">
				<p>
					Коммуникации</p>
			</td>
			<td valign=\"middle\">
				<p>
					&bull; Электричество<br />
					&bull; Газ<br />
					&bull; Вода<br />
					&bull; Канализация</p>
			</td>
			<td valign=\"middle\">
				<p>
					&bull; Электричество<br />
					&bull; Газ<br />
					&bull; Вода<br />
					&bull; Канализация</p>
			</td>
			<td valign=\"top\">
				<p>
					&bull; Электричество<br />
					&bull; Газ<br />
					&bull; Вода</p>
			</td>
		</tr>
		<tr>
			<td height=\"39\" valign=\"middle\">
				<p>
					Ярусность</p>
			</td>
			<td valign=\"middle\">
				<p>
					3 этажа</p>
			</td>
			<td valign=\"middle\">
				<p>
					1 этаж</p>
			</td>
			<td valign=\"middle\">
				<p>
					2-3 этажа</p>
			</td>
		</tr>
		<tr>
			<td valign=\"middle\">
				<p>
					Планировка</p>
			</td>
			<td valign=\"middle\">
				<p>
					<br />
					Свободная<br />
					&nbsp;</p>
			</td>
			<td valign=\"middle\">
				<p>
					Три комнаты, кухня 6 кв. м. Один сан узел<br />
					(хорошо если раздельный)</p>
			</td>
			<td valign=\"middle\">
				<p>
					Свободная</p>
			</td>
		</tr>
		<tr>
			<td height=\"52\" valign=\"middle\">
				<p>
					Высота потолков</p>
			</td>
			<td valign=\"middle\">
				<p>
					3 метра</p>
			</td>
			<td valign=\"middle\">
				<p>
					2,6 метра</p>
			</td>
			<td valign=\"middle\">
				<p>
					2,5-3 метров</p>
			</td>
		</tr>
		<tr>
			<td height=\"118\" valign=\"middle\">
				<p>
					Инфраструктура</p>
			</td>
			<td valign=\"middle\">
				<p>
					&bull; Транспортная доступность<br />
					&bull; Магазины<br />
					&bull; Кафе, Рестораны<br />
					&bull; Школа<br />
					&bull; Больница<br />
					&bull; Миллиция<br />
					&bull; Охраняемая территория</p>
			</td>
			<td valign=\"middle\">
				<p>
					&bull; Транспортная доступность<br />
					&bull; Магазины<br />
					&bull; Кафе, Рестораны<br />
					&bull; Школа<br />
					&bull; Больница<br />
					&bull; Миллиция</p>
			</td>
			<td valign=\"middle\">
				<p>
					Полное или частичное отсутствие инфраструктуры в шаговой доступности</p>
			</td>
		</tr>
		<tr>
			<td height=\"69\" valign=\"middle\">
				<p>
					Парковка</p>
			</td>
			<td valign=\"middle\">
				<p>
					Собственный отапливаемый<br />
					гараж совмещенный<br />
					с входом в дом</p>
			</td>
			<td valign=\"middle\">
				<p>
					Стихийная парковка во дворе<br />
					<br />
					&nbsp;</p>
			</td>
			<td valign=\"middle\">
				<p>
					Собственный гараж</p>
			</td>
		</tr>
		<tr>
			<td height=\"77\" valign=\"middle\">
				<p>
					Шумоизоляция</p>
			</td>
			<td valign=\"middle\">
				<p>
					Монолитные железобетонные перекрытия</p>
			</td>
			<td valign=\"middle\">
				<p>
					Панельные перекрытия с множеством зазоров</p>
			</td>
			<td valign=\"middle\">
				<p>
					Деревянные перекрытия с отсутствием шумоизоляции</p>
			</td>
		</tr>
		<tr>
			<td height=\"77\" valign=\"middle\">
				<p>
					<strong><span style=\"color: #f00\">Плюсы</span></strong></p>
			</td>
			<td valign=\"middle\">
				<p>
					<span style=\"color: #f00\">Сомещение уюта собственного дома с городскими коммуникациями и инфраструктурой и экологической чистотой загородного воздуха.</span></p>
			</td>
			<td valign=\"middle\">
				<p>
					<span style=\"color: #f00\">Транспортная доступность и развитая инфраструктура города.</span></p>
			</td>
			<td valign=\"middle\">
				<p>
					<span style=\"color: #f00\">Уют и спокойствие загородного дома</span></p>
				<p>
					<span style=\"color: #f00\">Чистый воздух</span></p>
			</td>
		</tr>
		<tr>
			<td height=\"77\" valign=\"middle\">
				<p>
					&nbsp;<strong><span style=\"color: #00f\">Минусы</span></strong></p>
			</td>
			<td valign=\"middle\">
				<p style=\"text-align: center\">
					<span style=\"color: #00f\">-</span></p>
			</td>
			<td valign=\"middle\">
				<p>
					<span style=\"color: #00f\">Ужасная экологическая обстановка</span></p>
				<p>
					<span style=\"color: #00f\">Неудобная планировка</span></p>
				<p>
					<span style=\"color: #00f\">Маленький метраж</span></p>
			</td>
			<td valign=\"middle\">
				<p>
					<span style=\"color: #00f\">Полное или частичное отсутствие инфраструктуры</span></p>
				<p>
					<span style=\"color: #00f\">Отсутствие централизованной канализации</span></p>
				<p>
					<span style=\"color: #00f\">Сложности с эксплуотацией</span></p>
			</td>
		</tr>
	</tbody>
</table>
<p>
	Поскольку таунхаус - это, как правило, основное жилье, крайне важен фактор транспортной доступности. Большинство&nbsp; объектов премиум-класса расположены в ближней и средней зоне (до 20 км от МКАД) и на относительно свободных трассах или магистралях.</p>
<p>
	Типичный покупатель таунхауса среднего класса - молодой специалист, который работает в Москве, проводит дома мало времени, но хочет, чтобы его семья жила за городом на природе.&nbsp; Ему не нужны &laquo;огороды&raquo; и неинтересно &laquo;земледелие&raquo;, поэтому размер участка не играет роли. Этот сегмент будет развиваться и дальше в Московском регионе, так как по сути это более комфортное жилье по стоимости сопоставимое с квартирой около МКАД, а то и дешевле неё. Самые востребованные секции из качественных, дорогих материалов, в районах с развитой инфраструктурой и хорошей доступностью. Такие проекты не только не уступают городским квартирам высокого уровня, но и по многим параметрам их превосходят.</p>
<p>
	В последнее время таунхаусы с каждым годом все дорожают и даже в самый сложный экономический период не опускались в цене. Можно говорить и о динамике роста дохода. Для инвестора, вложившего деньги в таунхаус на ранней стадии строительства,&nbsp; в некоторых случаях увеличение капитала возможно до 80 и более %. Большинство расположено на расстоянии до 30 км от МКАД.&nbsp; Таунхаусы &ndash; это жилье эконом- и бизнес-класса, как и квартиры, но это отдельные дома, представляющие&nbsp; собой более широкий спектр классов.<br />
	<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Одно из достоинств подмосковных таунхаусов &mdash; это стоимость. При покупке дома с земельным участком, стоимость дома составляет около 50%, стоимость же участка в таунхаусе составляет всего около 20-30%. Таунхаус дешевле, чем квартира в Москве&nbsp; и загородный дом, но не уступает по основным преимуществам. По&nbsp; площади таунхаус, в среднем,&nbsp; составляет около 170 м2, загородный дом &ndash; 220 м2, средняя площадь двухкомнатной квартиры в новостройке - около 70 м2. Таким образом, по площади таунхаус обычно значительно превосходит квартиру и&nbsp; уступает дому, но на рынке есть предложения и с большей площадью. Если же сопоставить площади к цене, то получается,в среднем, двухкомнатная квартира 70м2 сопоставима с секцией таунхауса в 150-170 м2 и с домом порядка 120 м2. Таким образом видно, что по площади таунхаус сильно выигрывает у конкурентов.&nbsp;<br />
	<br />
	Таунхаус &ndash; рациональное решение для покупателей среднего и эконом-класса жилья, объединяющее плюсы городского и загородного проживания.</p>
<p>
	Подведя итог, скажем, что таунхаус дешевле двух конкурентов и для семьи с небольшим достатком или людей, желающих приобрести относительно недорогое, но комфортное жилье, он идеально подходит.</p>
', '<p>
	Большинство покупателей выбирают не между таунхаусом и коттеджем, а между таунхаусом и квартирой в Москве. Поэтому развитие рассматриваемого сегмента схожа с динамикой рынка городского жилья</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('12', 'Важное о строительстве и материалах', '1', '<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;На данный момент строительство таунхаусов осуществляется из трех основных материалов бетон, кирпич и пено (газо) блоки. В некоторых случаях верхний этаж &mdash; мансарда, строится из дерева, деревянных каркасов, причем, не всегда утепленных, на что стоит обратить внимание, так как это повлечет дополнительные затраты при внутренней отделке.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Самым качественным и честным&nbsp; видом является монолитные и монолитно-кирпичные дома без деревянных этажей-мансард.&nbsp; Если таунхаус имеет эксплуатируемую крышу, то Вы получаете бесплатные квадратные метры для досуга, зависящие, как правило, от размера каждого этажа.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; При выборе таких домов, очень важно, чтобы строители соблюдали нормативы при заливке бетона крыши, в противном случае крыша может не выдержать нашей зимы и подтекать.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Среди блочных домов рекомендуется обратить внимание на сами блоки. Если дом построен&nbsp; из пеноблоков, произведенных в Белоруссии, есть опасность образования повышенного радиационного фона.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Отечественные блоки надежнее, особенно сделанные по немецкой&nbsp; технологии. Их стоимость, конечно, значительно выше для застройщика. Стандартно, таунхаус сдается с металлическими дверьми и двойным остеклением ( двойным стеклопакетом). Нередко на первом этаже располагается гараж.&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
', '<p>
	&nbsp;На данный момент строительство таунхаусов осуществляется из трех основных материалов бетон, кирпич и пено (газо) блоки.</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('13', ' Планировка и внутренняя  отделка таунхауса', '1', '<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;В основном, таунхаусы продаются со свободной планировкой, что дает возможность Вам сделать ремонт по своему вкусу и организовать &nbsp;внутреннее пространство, исходя из индивидуальных пожеланий. Часто первый этаж запланирован под гараж или гостинную-кухню.&nbsp; Следующие этажи обычно отводятся под спальни, гостиные. Удобства, как правило, располагаются на каждом этаже.</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Внутренняя отделка предполагает и разведение инженерных коммуникаций. Стоимость внутриотделочных работ,&nbsp; установки межкомнатных перегородок, выравнивание полов и стен, косметической отделки всего дома, и прокладка инженерии, как правило, обходится не менее&nbsp; 1 мл. рублей из расчета 150 кв. метров.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p style=\"text-align: center\">
	<a href=\"http://5896299.ru\">Примеры работ по отделке и заказать отделку вашего таунхауса вы можете здесь: </a><a href=\"http://5896299.ru\">www.</a><a href=\"http://5896299.ru\">5896299.ru</a></p>
', '<p>
	В основном, таунхаусы продаются со свободной планировкой, что дает возможность Вам сделать ремонт по своему вкусу и организовать внутреннее пространство, исходя из индивидуальных пожеланий.</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('14', 'Элитные таунхаусы  ', '1', '<p>
	Не редкость на московском рынке и элитные таунхаусы, в основном,&nbsp; элитность определяется&nbsp; расположением и окружением. Например,&nbsp; элитные секции на в Горках-8 обходятся в среднем в 1 мл. долларов США. Также предполагается большая площадь и нередко они продаются с отделкой, под ключ. Зачастую среди этого сегмента есть и мебелированные варианты, гаражи на две машины и применение новых технологий &mdash; &laquo;умный дом&raquo;. Элитные таунхаусы не всегда располагаются на природе,&nbsp; но, как правило, имеют удобную транспортную доступность или развитую инфраструктуру.&nbsp;</p>
', '<p>
	Не редкость на московском рынке и элитные таунхаусы, в основном, элитность определяется расположением и окружением.</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('15', 'На что обратить внимание при покупке', '3', '<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Перед приобретением таунхауса необходимо выбрать место его расположения&nbsp; &mdash; транспортная доступность, инфраструктура, наличие школ и детских садов в непосредственной близости, экология и природа места. Следующий, для кого-то принципиальный момент&mdash; наличие прописки, так как многие хотят поменять квартиру на&nbsp; таунхаус и жить в нем круглый год. Юридические вопросы, касающиеся оформления прав собственности, наличия прав&nbsp; у компании строить жилой дом на данной земле,&nbsp; можно посмотреть в разделе&nbsp; -&nbsp; &laquo;Законодательство&raquo;.&nbsp; Необходимо обратить внимание на материалы и качество самих домов, на наличие коммуникаций или технических условий, желательно оплаченных. Обратите внимание на мощность электричества при приобретении секции и возможности его увеличения.&nbsp;&nbsp; Для комфортного проживания необходимо не менее 5 кВ. Также обратите внимание на земельный участок с секцией или наличие общественной территории.&nbsp; Способы оплаты также могут привлечь Вас своей гибкостью, рассрочка платежа может быть очень удобной для приобретения, а вот для получения ИПОТЕКИ нужно учитывать, что она дается только на построенные и введенные&nbsp; в эксплуатацию таунхаусы.&nbsp; Многие поселки начинают продажи с ранней стадии строительства, привлекая покупателей низкой стоимостью и зачастую не имеют полного пакета документов на землю и коммуникации, при приобретении таунхауса в&nbsp; таком проекте, необходимо обратиться к профессионалу для проведения необходимых проверок.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
', '<p>
	Перед приобретением таунхауса необходимо выбрать место его расположения &mdash; транспортная доступность, инфраструктура, наличие школ и детских садов в непосредственной близости, экология и природа места.</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('16', 'Малоэтажные квартирные дома', '3', '<p>
	В этом году стремительными темпами растет спрос на квартиры в загородных малоэтажных домах, по сути представляющие собой то же самое, что и секции таунхауса, только меньше по&nbsp; площади и имеющие соседей&nbsp; на одной лестничной клетке. Малоэтажные квартирные дома &mdash; это, прежде всего, эконом-жилье, чаще всего на этапе строительства, оно вообще не имеет конкуренции. Как правило с такими квартирами идет небольшая общественная территория, но&nbsp; собственного участка у них нет.&nbsp;&nbsp;</p>
', '<p>
	В этом году стремительными темпами растет спрос на квартиры в загородных малоэтажных домах, по сути представляющие собой то же самое, что и секции таунхауса, только меньше по площади и имеющие соседей на одной лестничной клетке.</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('17', 'Перспективы рынка таунхаусов ', '1', '<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Рынок недвижимости таунхаусов растет семимильными темпами, несмотря на общую тенденцию в&nbsp; увеличении средней стоимости квадратного метра на секцию&nbsp; в таунхаусе. В последнее время самые высокие показатели стали показывать малоквартирные дома.&nbsp;&nbsp;</p>
<p>
	&nbsp;Рекомендуем Вам ознакомиться с юридическими вопросами покупки и оформления секции таунхауса в собственность в разделе</p>
', '<p>
	Рынок недвижимости таунхаусов растет семимильными темпами, несмотря на общую тенденцию в увеличении средней стоимости квадратного метра на секцию в таунхаусе. В последнее время самые высокие показатели стали показывать малоквартирные дома.</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('18', 'ФЕДЕРАЛЬНЫЙ ЗАКОН ОБ УЧАСТИИ В ДОЛЕВОМ СТРОИТЕЛЬСТВЕ', '2', '<div class=\"txtlr\" id=\"txt\" name=\"text\" style=\"PADDING-BOTTOM: 14px; PADDING-LEFT: 60px; PADDING-RIGHT: 15px; PADDING-TOP: 4px\">
	<div class=\"zone\" id=\"z0\" style=\"Z-INDEX: 3\">
		<br id=\"p0\" />
		<div class=\"i_0\" id=\"bkimg_b\" tabindex=\"0\">
			&nbsp;</div>
		<table cellpadding=\"0\" cellspacing=\"0\" class=\"LIP\" id=\"p1\">
			<tbody>
				<tr>
					<td class=\"LCELL\" width=\"50%\">
						30 декабря 2004 года</td>
					<td class=\"RCELL\" width=\"50%\">
						N 214-ФЗ</td>
				</tr>
			</tbody>
		</table>
		<hr class=\"D\" id=\"p2\" />
		<br id=\"p3\" />
		<div class=\"H\" id=\"p4\">
			РОССИЙСКАЯ ФЕДЕРАЦИЯ</div>
		<br id=\"p5\" />
		<div class=\"H\" id=\"p6\">
			ФЕДЕРАЛЬНЫЙ ЗАКОН</div>
		<br id=\"p7\" />
		<div class=\"H\" id=\"p8\">
			ОБ УЧАСТИИ В ДОЛЕВОМ СТРОИТЕЛЬСТВЕ</div>
		<div class=\"H\" id=\"p9\">
			МНОГОКВАРТИРНЫХ ДОМОВ И ИНЫХ ОБЪЕКТОВ НЕДВИЖИМОСТИ</div>
		<div class=\"H\" id=\"p10\">
			И О ВНЕСЕНИИ ИЗМЕНЕНИЙ В НЕКОТОРЫЕ ЗАКОНОДАТЕЛЬНЫЕ</div>
		<div class=\"H\" id=\"p11\">
			АКТЫ РОССИЙСКОЙ ФЕДЕРАЦИИ</div>
		<br id=\"p12\" />
		<div class=\"R\" id=\"p13\">
			Принят</div>
		<div class=\"R\" id=\"p14\">
			Государственной Думой</div>
		<div class=\"R\" id=\"p15\">
			22 декабря 2004 года</div>
		<br id=\"p16\" />
		<div class=\"R\" id=\"p17\">
			Одобрен</div>
		<div class=\"R\" id=\"p18\">
			Советом Федерации</div>
		<div class=\"R\" id=\"p19\">
			24 декабря 2004 года</div>
		<br id=\"p20\" />
		<div class=\"CV\" id=\"p21\">
			(в ред. Федеральных законов от 18.07.2006 <q class=\"r\" id=\"r\">N 111-ФЗ</q>,</div>
		<div class=\"CV\" id=\"p22\">
			от 16.10.2006 <q class=\"r\" id=\"r\">N 160-ФЗ</q>, от 23.07.2008 <q class=\"r\" id=\"r\">N 160-ФЗ</q>,</div>
		<div class=\"CV\" id=\"p23\">
			от 17.07.2009 <q class=\"r\" id=\"r\">N 147-ФЗ</q>, от 17.06.2010 <q class=\"r\" id=\"r\">N 119-ФЗ</q>)</div>
		<br id=\"p24\" />
		<div class=\"CP\" id=\"p25\">
			(см. <q class=\"r\" id=\"r\">Обзор</q> изменений данного документа)</div>
		<br id=\"p26\" />
		<div class=\"U\" id=\"p27\">
			<div class=\"i_1\" id=\"bkimg_c\" name=\"Статья 1. Предмет регулирования настоящего Федерального закона\" tabindex=\"0\">
				&nbsp;</div>
			Статья 1. Предмет регулирования настоящего Федерального закона</div>
		<br id=\"p28\" />
		<div class=\"U\" id=\"p29\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			1. Настоящий Федеральный закон регулирует отношения, связанные с привлечением денежных средств граждан и юридических лиц для долевого строительства многоквартирных домов и (или) иных объектов недвижимости (далее - участники долевого строительства) и возникновением у участников долевого строительства права собственности на объекты долевого строительства и права общей долевой собственности на общее имущество в многоквартирном доме и (или) ином объекте недвижимости, а также устанавливает гарантии защиты прав, законных интересов и имущества участников долевого строительства.</div>
		<div class=\"UNI\" id=\"p30\">
			(в ред. Федеральных законов от 18.07.2006 <q class=\"r\" id=\"r\">N 111-ФЗ</q>, от 17.06.2010 <q class=\"r\" id=\"r\">N 119-ФЗ</q>)</div>
		<div class=\"UNIP\" id=\"p31\">
			(см. текст в предыдущей <q class=\"r\" id=\"r\">редакции</q>)</div>
		<div class=\"U\" id=\"p32\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			2. Привлечение денежных средств граждан, связанное с возникающим у граждан правом собственности на жилые помещения в многоквартирных домах, которые на момент привлечения таких денежных средств граждан не введены в эксплуатацию в <q class=\"r\" id=\"r\">порядке</q>, установленном законодательством о градостроительной деятельности (далее - привлечение денежных средств граждан для строительства), допускается только:</div>
		<div class=\"U\" id=\"p33\">
			1) на основании договора участия в долевом строительстве;</div>
		<div class=\"U\" id=\"p34\">
			2) путем выпуска эмитентом, имеющим в собственности или на праве аренды, праве субаренды земельный участок и получившим в установленном <q class=\"r\" id=\"r\">порядке</q> разрешение на строительство на этом земельном участке многоквартирного дома, облигаций особого вида - жилищных сертификатов, закрепляющих право их владельцев на получение от эмитента жилых помещений в соответствии с <q class=\"r\" id=\"mr\">законодательством</q> Российской Федерации о ценных бумагах;</div>
		<div class=\"U\" id=\"p35\">
			3) жилищно-строительными и жилищными накопительными кооперативами в соответствии с федеральными <q class=\"r\" id=\"mr\">законами</q>, регулирующими деятельность таких кооперативов.</div>
		<div class=\"UNI\" id=\"p36\">
			(часть 2 в ред. Федерального <q class=\"r\" id=\"r\">закона</q> от 17.06.2010 N 119-ФЗ)</div>
		<div class=\"UNIP\" id=\"p37\">
			(см. текст в предыдущей <q class=\"r\" id=\"r\">редакции</q>)</div>
		<div class=\"U\" id=\"p38\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			2.1. Запрещается привлечение денежных средств граждан для строительства в нарушение требований, установленных <q class=\"r\" id=\"r\">частью 2</q> настоящей статьи. Сделка по привлечению денежных средств граждан для строительства, совершенная в нарушение требований, установленных <q class=\"r\" id=\"r\">частью 2</q> настоящей статьи, может быть признана судом недействительной только по иску гражданина, заключившего такую сделку.</div>
		<div class=\"UNI\" id=\"p39\">
			(часть 2.1 введена Федеральным <q class=\"r\" id=\"r\">законом</q> от 17.06.2010 N 119-ФЗ)</div>
		<div class=\"U\" id=\"p40\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			2.2. Лица, привлекающие денежные средства граждан для строительства в нарушение требований, установленных настоящей статьей, несут ответственность в соответствии с <q class=\"r\" id=\"r\">законодательством</q> Российской Федерации об административных правонарушениях.</div>
		<div class=\"UNI\" id=\"p41\">
			(часть 2.2 введена Федеральным <q class=\"r\" id=\"r\">законом</q> от 17.06.2010 N 119-ФЗ)</div>
		<div class=\"U\" id=\"p42\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			3. Действие настоящего Федерального закона не распространяется на отношения юридических лиц и (или) индивидуальных предпринимателей, связанные с инвестиционной деятельностью по строительству (созданию) объектов недвижимости (в том числе многоквартирных домов) и не основанные на договоре участия в долевом строительстве. Указанные отношения регулируются Гражданским <q class=\"r\" id=\"r\">кодексом</q> Российской Федерации и <q class=\"r\" id=\"r\">законодательством</q> Российской Федерации об инвестиционной деятельности. Передача гражданам прав путем уступки требования по договорам, которые заключены юридическими лицами и (или) индивидуальными предпринимателями и связаны с инвестиционной деятельностью по строительству (созданию) многоквартирных домов и после исполнения которых у граждан возникает право собственности на жилое помещение в строящемся (создаваемом) многоквартирном доме, не допускается.</div>
		<div class=\"UNI\" id=\"p43\">
			(часть третья введена Федеральным <q class=\"r\" id=\"r\">законом</q> от 18.07.2006 N 111-ФЗ)</div>
		<br id=\"p44\" />
		<div class=\"U\" id=\"p45\">
			<div class=\"i_1\" id=\"bkimg_c\" name=\"Статья 2. Основные понятия, используемые в настоящем Федеральном законе\" tabindex=\"0\">
				&nbsp;</div>
			Статья 2. Основные понятия, используемые в настоящем Федеральном законе</div>
		<br id=\"p46\" />
		<div class=\"U\" id=\"p47\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			Для целей настоящего Федерального закона используются следующие основные понятия:</div>
		<div class=\"U\" id=\"p48\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			1) застройщик - юридическое лицо независимо от его организационно-правовой формы, имеющее в собственности или на праве аренды, на праве субаренды земельный участок и привлекающее денежные средства участников долевого строительства в соответствии с настоящим Федеральным законом для строительства (создания) на этом земельном участке многоквартирных домов и (или) иных объектов недвижимости, за исключением объектов производственного назначения, на основании полученного разрешения на строительство;</div>
		<div class=\"UNI\" id=\"p49\">
			(в ред. Федеральных законов от 18.07.2006 <q class=\"r\" id=\"r\">N 111-ФЗ</q>, от 17.06.2010 <q class=\"r\" id=\"r\">N 119-ФЗ</q>)</div>
	</div>
	<div class=\"zone\" id=\"z1\" style=\"Z-INDEX: 3\">
		&nbsp;</div>
	<div class=\"zone\" id=\"z2\" style=\"Z-INDEX: 3\">
		&nbsp;</div>
	<div class=\"zone\" id=\"z3\" style=\"Z-INDEX: 3\">
		<div class=\"U\" id=\"p430\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			5) осуществлять контроль за соблюдением положений настоящего Федерального закона, рассматривать жалобы граждан и юридических лиц, связанные с нарушениями настоящего Федерального закона;</div>
		<div class=\"U\" id=\"p431\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			6) направлять лицам, осуществляющим привлечение денежных средств граждан для строительства, предписания об устранении нарушений настоящего Федерального закона, нормативных правовых актов Президента Российской Федерации, нормативных правовых актов Правительства Российской Федерации, нормативных правовых актов уполномоченного органа и устанавливать сроки устранения таких нарушений;</div>
		<div class=\"UNI\" id=\"p432\">
			(в ред. Федерального <q class=\"r\" id=\"r\">закона</q> от 17.06.2010 N 119-ФЗ)</div>
		<div class=\"UNIP\" id=\"p433\">
			(см. текст в предыдущей <q class=\"r\" id=\"r\">редакции</q>)</div>
		<div class=\"U\" id=\"p434\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			7) принимать меры, необходимые для привлечения лиц, осуществляющих привлечение денежных средств граждан для строительства (их должностных лиц), к ответственности, установленной настоящим Федеральным законом и <q class=\"r\" id=\"r\">законодательством</q> Российской Федерации об административных правонарушениях;</div>
		<div class=\"UNI\" id=\"p435\">
			(в ред. Федерального <q class=\"r\" id=\"r\">закона</q> от 17.06.2010 N 119-ФЗ)</div>
		<div class=\"UNIP\" id=\"p436\">
			(см. текст в предыдущей <q class=\"r\" id=\"r\">редакции</q>)</div>
		<div class=\"U\" id=\"p437\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			8) обращаться в суд с заявлениями в защиту прав и законных интересов участников долевого строительства;</div>
		<div class=\"U\" id=\"p438\">
			9) осуществлять иные предусмотренные настоящим Федеральным законом полномочия.</div>
		<div class=\"U\" id=\"p439\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			6. Лицо, осуществляющее привлечение денежных средств граждан для строительства, которому направлено предписание контролирующего органа в соответствии с <q class=\"r\" id=\"r\">пунктом 6</q> части 5 настоящей статьи, в течение трех месяцев со дня направления указанного предписания вправе обратиться в арбитражный суд с заявлением о признании указанного предписания незаконным. Обращение в арбитражный суд с заявлением о признании указанного предписания незаконным не приостанавливает его исполнение. Порядок обращения с таким заявлением, порядок его рассмотрения и порядок принятия решения по заявлению о признании предписания незаконным определяются <q class=\"r\" id=\"r\">законодательством</q> о судопроизводстве в арбитражных судах.</div>
		<div class=\"UNI\" id=\"p440\">
			(в ред. Федерального <q class=\"r\" id=\"r\">закона</q> от 17.06.2010 N 119-ФЗ)</div>
		<div class=\"UNIP\" id=\"p441\">
			(см. текст в предыдущей <q class=\"r\" id=\"r\">редакции</q>)</div>
		<div class=\"U\" id=\"p442\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			7. Контролирующий орган вправе обратиться в арбитражный суд с заявлением о приостановлении на определенный срок осуществления застройщиком деятельности, связанной с привлечением денежных средств участников долевого строительства для строительства (создания) многоквартирных домов и (или) иных объектов недвижимости, в случае, если:</div>
		<div class=\"U\" id=\"p443\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			1) более чем на тридцать дней задержано представление отчетности, предусмотренной настоящим Федеральным законом;</div>
		<div class=\"U\" id=\"p444\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			2) застройщиком не соблюдаются <q class=\"r\" id=\"r\">нормативы</q> финансовой устойчивости его деятельности, установленные Правительством Российской Федерации;</div>
		<div class=\"U\" id=\"p445\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			3) застройщик не удовлетворяет требования участников долевого строительства по денежным обязательствам, предусмотренным частью 2 <q class=\"r\" id=\"r\">статьи 12.1</q> настоящего Федерального закона, и (или) не исполняет обязанность по передаче объекта долевого строительства в течение трех месяцев со дня наступления удовлетворения таких требований и (или) исполнения такой обязанности. При этом указанные требования в совокупности должны составлять не менее чем 100 тысяч рублей;</div>
		<div class=\"U\" id=\"p446\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			4) застройщиком не исполнялись положения настоящего Федерального закона, а также принятые в соответствии с ним иные нормативные правовые акты при условии, что в течение года к застройщику два и более раза применялись предусмотренные настоящим Федеральным законом меры воздействия.</div>
		<div class=\"U\" id=\"p447\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			8. Контролирующий орган вправе обратиться в арбитражный суд с заявлением о ликвидации лица, осуществляющего привлечение денежных средств граждан для строительства, в случае неоднократного или грубого нарушения им положений настоящего Федерального закона или принятых в соответствии с ним иных нормативных правовых актов, а также в иных предусмотренных федеральными законами случаях.</div>
		<div class=\"UNI\" id=\"p448\">
			(в ред. Федерального <q class=\"r\" id=\"r\">закона</q> от 17.06.2010 N 119-ФЗ)</div>
		<div class=\"UNIP\" id=\"p449\">
			(см. текст в предыдущей <q class=\"r\" id=\"r\">редакции</q>)</div>
		<div class=\"U\" id=\"p450\">
			9. В случае обращения в арбитражный суд с заявлениями, предусмотренными <q class=\"r\" id=\"r\">частями 7</q> и <q class=\"r\" id=\"r\">8</q> настоящей статьи, контролирующий орган в течение пяти рабочих дней с даты вступления в силу решения арбитражного суда о ликвидации застройщика или приостановлении осуществления застройщиком деятельности, связанной с привлечением денежных средств участников долевого строительства для строительства (создания) многоквартирных домов и (или) иных объектов недвижимости, обязан уведомить органы, осуществляющие государственную регистрацию прав на недвижимое имущество и сделок с ним, о вступлении в силу соответствующего решения суда.</div>
		<div class=\"UNI\" id=\"p451\">
			(часть 9 введена Федеральным <q class=\"r\" id=\"r\">законом</q> от 17.06.2010 N 119-ФЗ)</div>
		<br id=\"p452\" />
		<div class=\"U\" id=\"p453\">
			<div class=\"i_1\" id=\"bkimg_c\" name=\"Статья 24. О внесении изменений в Федеральный закон &quot;О государственной регистрации прав на недвижимое имущество и сделок с ним&quot;\" tabindex=\"0\">
				&nbsp;</div>
			Статья 24. О внесении изменений в Федеральный закон &quot;О государственной регистрации прав на недвижимое имущество и сделок с ним&quot;</div>
		<br id=\"p454\" />
		<div class=\"U\" id=\"p455\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			Внести в Федеральный <q class=\"r\" id=\"r\">закон</q> от 21 июля 1997 года N 122-ФЗ &quot;О государственной регистрации прав на недвижимое имущество и сделок с ним&quot; (Собрание законодательства Российской Федерации, 1997, N 30, ст. 3594; 2001, N 11, ст. 997; N 16, ст. 1533; 2002, N 15, ст. 1377; 2003, N 24, ст. 2244; 2004, N 27, ст. 2711; N 30, ст. 3081; N 35, ст. 3607; N 45, ст. 4377) следующие изменения:</div>
		<div class=\"U\" id=\"p456\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			1) пункт 1 <q class=\"r\" id=\"r\">статьи 7</q> дополнить абзацем следующего содержания:</div>
		<div class=\"U\" id=\"p457\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			&quot;В выписке из Единого государственного реестра прав, содержащей сведения о земельном участке, на котором создается объект недвижимого имущества, в состав которого входят жилые и нежилые помещения, являющиеся предметами договоров участия в долевом строительстве, помимо сведений об ипотеке указывается наличие зарегистрированных договоров участия в долевом строительстве с перечнем объектов долевого строительства, а также фирменные наименования (наименования) юридических лиц - участников долевого строительства, фамилии, имена, отчества физических лиц - участников долевого строительства.&quot;;</div>
		<div class=\"U\" id=\"p458\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			2) <q class=\"r\" id=\"r\">дополнить</q> статьей 25.1 следующего содержания:</div>
		<br id=\"p459\" />
		<div class=\"U\" id=\"p460\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			&quot;Статья 25.1. Государственная регистрация договоров участия в долевом строительстве</div>
		<br id=\"p461\" />
		<div class=\"U\" id=\"p462\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			1. На государственную регистрацию договоров участия в долевом строительстве наряду с документами, необходимыми для государственной регистрации в соответствии с настоящим Федеральным законом, представляются документы с описанием объекта долевого строительства с указанием его местоположения на плане создаваемого объекта недвижимого имущества и планируемой площади объекта долевого строительства.</div>
		<div class=\"U\" id=\"p463\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			2. Государственная регистрация договора участия в долевом строительстве, заключенного застройщиком с первым участником долевого строительства, осуществляется на основании заявления сторон договора (застройщика, участника долевого строительства). На государственную регистрацию договора участия в долевом строительстве, заключенного застройщиком с первым участником долевого строительства, наряду с документами, необходимыми для государственной регистрации договора участия в долевом строительстве в соответствии с настоящим Федеральным законом, застройщиком представляются:</div>
		<div class=\"U\" id=\"p464\">
			1) разрешение на строительство;</div>
		<div class=\"U\" id=\"p465\">
			2) проектная декларация;</div>
		<div class=\"U\" id=\"p466\">
			3) план создаваемого объекта недвижимого имущества с указанием его местоположения и количества находящихся в составе создаваемого объекта недвижимого имущества жилых и нежилых помещений и планируемой площади каждого из указанных помещений.</div>
		<div class=\"U\" id=\"p467\">
			3. Запись о договоре участия в долевом строительстве (о его изменении, о расторжении, об уступке прав требования по этому договору), государственная регистрация которого установлена федеральным законом, вносится в содержащий записи о сделках подраздел III раздела, открытого на земельный участок, на котором возводится объект недвижимого имущества в порядке долевого строительства, Единого государственного реестра прав. При государственной регистрации договора участия в долевом строительстве в указанный подраздел также вносится запись о возникающем на основании федерального закона залоге земельного участка или залоге права аренды с указанием в графе &quot;особые отметки&quot; распространения права залога на создаваемый объект недвижимого имущества.</div>
		<div class=\"U\" id=\"p468\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			4. Заявление о внесении в Единый государственный реестр прав записи о расторжении договора участия в долевом строительстве может быть представлено одной из сторон договора участия в долевом строительстве с приложением документов, подтверждающих расторжение договора. Орган по государственной регистрации при представлении заявления одной из сторон такого договора в течение рабочего дня обязан в письменной форме уведомить об этом другую сторону договора.&quot;.</div>
		<br id=\"p469\" />
		<div class=\"U\" id=\"p470\">
			<div class=\"i_1\" id=\"bkimg_c\" name=\"Статья 25. О внесении изменений в Кодекс Российской Федерации об административных правонарушениях\" tabindex=\"0\">
				&nbsp;</div>
			Статья 25. О внесении изменений в Кодекс Российской Федерации об административных правонарушениях</div>
		<br id=\"p471\" />
		<div class=\"U\" id=\"p472\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			Внести в <q class=\"r\" id=\"r\">Кодекс</q> Российской Федерации об административных правонарушениях (Собрание законодательства Российской Федерации, 2002, N 1, ст. 1; N 18, ст. 1721; N 30, ст. 3029; N 44, ст. 4295; 2003, N 27, ст. 2700, 2708, 2717; N 46, ст. 4434, 4440; N 50, ст. 4847, 4855; 2004, N 30, ст. 3095; N 31, ст. 3229; N 34, ст. 3529, 3533; N 44, ст. 4266) следующие изменения:</div>
		<div class=\"U\" id=\"p473\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			1) абзац второй части 3 <q class=\"r\" id=\"r\">статьи 3.5</q> после слов &quot;об охране окружающей природной среды,&quot; дополнить словами &quot;об участии в долевом строительстве многоквартирных домов и (или) иных объектов недвижимости,&quot;;</div>
		<div class=\"U\" id=\"p474\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			2) часть 1 <q class=\"r\" id=\"r\">статьи 4.5</q> после слов &quot;о выборах и референдумах,&quot; дополнить словами &quot;об участии в долевом строительстве многоквартирных домов и (или) иных объектов недвижимости,&quot;;</div>
		<div class=\"U\" id=\"p475\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			3) <q class=\"r\" id=\"r\">главу 14</q> дополнить статьей 14.28 следующего содержания:</div>
		<br id=\"p476\" />
		<div class=\"U\" id=\"p477\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			&quot;Статья 14.28. Нарушение требований законодательства об участии в долевом строительстве многоквартирных домов и (или) иных объектов недвижимости</div>
		<br id=\"p478\" />
		<div class=\"U\" id=\"p479\">
			1. Привлечение денежных средств граждан для целей строительства многоквартирных домов лицом, не имеющим на это права в соответствии с законодательством об участии в долевом строительстве многоквартирных домов и (или) иных объектов недвижимости, -</div>
		<div class=\"U\" id=\"p480\">
			влечет наложение административного штрафа на должностных лиц в размере от ста пятидесяти до двухсот минимальных размеров оплаты труда; на юридических лиц - от четырех тысяч до пяти тысяч минимальных размеров оплаты труда.</div>
		<div class=\"U\" id=\"p481\">
			2. Опубликование в средствах массовой информации и (или) размещение в информационно-телекоммуникационных сетях общего пользования застройщиком проектной декларации (в том числе вносимых в нее изменений), содержащей неполную и (или) недостоверную информацию, предоставление застройщиком неполной и (или) недостоверной информации, опубликование, размещение или предоставление которой предусмотрено законодательством об участии в долевом строительстве многоквартирных домов и (или) иных объектов недвижимости, а равно нарушение сроков опубликования и (или) размещения проектной декларации либо вносимых в нее изменений -</div>
		<div class=\"U\" id=\"p482\">
			влекут наложение административного штрафа на должностных лиц в размере от ста до ста пятидесяти минимальных размеров оплаты труда; на юридических лиц - от трех тысяч до четырех тысяч минимальных размеров оплаты труда.</div>
		<div class=\"U\" id=\"p483\">
			3. Непредставление в установленный срок в орган, осуществляющий контроль и надзор в области долевого строительства многоквартирных домов и (или) иных объектов недвижимости, отчетности в случаях, предусмотренных законодательством об участии в долевом строительстве многоквартирных домов и (или) иных объектов недвижимости, а равно представление отчетности, содержащей недостоверные сведения, -</div>
		<div class=\"U\" id=\"p484\">
			влечет наложение административного штрафа на должностных лиц в размере от ста до ста пятидесяти минимальных размеров оплаты труда; на юридических лиц - от одной до двух тысяч минимальных размеров оплаты труда.&quot;;</div>
		<div class=\"U\" id=\"p485\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			4) <q class=\"r\" id=\"r\">статью 19.5</q> дополнить частью 4 следующего содержания:</div>
		<br id=\"p486\" />
		<div class=\"U\" id=\"p487\">
			&quot;4. Невыполнение в установленный срок законного предписания органа, осуществляющего контроль и надзор в области долевого строительства многоквартирных домов и (или) иных объектов недвижимости, -</div>
		<div class=\"U\" id=\"p488\">
			влечет наложение административного штрафа на должностных лиц в размере от ста до ста пятидесяти минимальных размеров оплаты труда; на юридических лиц - от одной до двух тысяч минимальных размеров оплаты труда.&quot;;</div>
		<div class=\"U\" id=\"p489\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			5) <q class=\"r\" id=\"r\">главу 23</q> дополнить статьей 23.64 следующего содержания:</div>
		<br id=\"p490\" />
		<div class=\"U\" id=\"p491\">
			&quot;Статья 23.64. Органы, осуществляющие контроль и надзор в области долевого строительства многоквартирных домов и (или) иных объектов недвижимости</div>
		<br id=\"p492\" />
		<div class=\"U\" id=\"p493\">
			1. Органы, осуществляющие контроль и надзор в области долевого строительства многоквартирных домов и (или) иных объектов недвижимости, рассматривают дела об административных правонарушениях, предусмотренных статьей 14.28 и частью 4 статьи 19.5 настоящего Кодекса.</div>
		<div class=\"U\" id=\"p494\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			2. Рассматривать дела об административных правонарушениях от имени органов, указанных в части 1 настоящей статьи, вправе:</div>
		<div class=\"U\" id=\"p495\">
			1) руководитель федерального органа исполнительной власти, осуществляющего контроль и надзор в области долевого строительства многоквартирных домов и (или) иных объектов недвижимости, его заместители;</div>
		<div class=\"U\" id=\"p496\">
			2) руководители структурных подразделений федерального органа исполнительной власти, осуществляющего контроль и надзор в области долевого строительства многоквартирных домов и (или) иных объектов недвижимости, их заместители;</div>
		<div class=\"U\" id=\"p497\">
			3) руководители территориальных органов федерального органа исполнительной власти, осуществляющего контроль и надзор в области долевого строительства многоквартирных домов и (или) иных объектов недвижимости, их заместители.&quot;.</div>
		<br id=\"p498\" />
		<div class=\"U\" id=\"p499\">
			<div class=\"i_1\" id=\"bkimg_c\" name=\"Статья 26. О внесении изменений в Федеральный закон &quot;Об ипотеке (залоге недвижимости)&quot;\" tabindex=\"0\">
				&nbsp;</div>
			Статья 26. О внесении изменений в Федеральный закон &quot;Об ипотеке (залоге недвижимости)&quot;</div>
		<br id=\"p500\" />
		<div class=\"U\" id=\"p501\">
			Первое предложение абзаца второго пункта 2 <q class=\"r\" id=\"r\">статьи 20</q> Федерального закона от 16 июля 1998 года N 102-ФЗ &quot;Об ипотеке (залоге недвижимости)&quot; (Собрание законодательства Российской Федерации, 1998, N 29, ст. 3400; 2002, N 7, ст. 629; 2004, N 27, ст. 2711; N 45, ст. 4377) изложить в следующей редакции:</div>
		<div class=\"U\" id=\"p502\">
			&quot;Государственная регистрация ипотеки в силу закона осуществляется одновременно с государственной регистрацией права собственности лица, чьи права обременяются ипотекой, если иное не установлено федеральным законом.&quot;.</div>
		<br id=\"p503\" />
		<div class=\"U\" id=\"p504\">
			<div class=\"i_1\" id=\"bkimg_c\" name=\"Статья 27. Вступление в силу настоящего Федерального закона\" tabindex=\"0\">
				&nbsp;</div>
			Статья 27. Вступление в силу настоящего Федерального закона</div>
		<br id=\"p505\" />
		<div class=\"U\" id=\"p506\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			1. Настоящий Федеральный закон вступает в силу по истечении трех месяцев после дня его официального опубликования.</div>
		<div class=\"U\" id=\"p507\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			2. Действие настоящего Федерального закона распространяется на отношения, связанные с привлечением денежных средств участников долевого строительства для строительства (создания) многоквартирных домов и (или) иных объектов недвижимости, разрешения на строительство которых получены после вступления в силу настоящего Федерального закона.</div>
		<hr class=\"DV\" id=\"p508\" />
		<div class=\"UV\" id=\"p509\">
			Положение части 3 статьи 27 распространяется на правоотношения, возникшие со 2 декабря 2008 года (<q class=\"r\" id=\"r\">часть 5 статьи 6</q> Федерального закона от 17.07.2009 N 147-ФЗ).</div>
		<hr class=\"DV\" id=\"p510\" />
		<div class=\"U\" id=\"p511\">
			<div class=\"i_2\" id=\"bkimg_f\" tabindex=\"0\">
				&nbsp;</div>
			3. Положения <q class=\"r\" id=\"r\">части 3 статьи 4</q> и <q class=\"r\" id=\"r\">части 3 статьи 13</q> настоящего Федерального закона не распространяются на случаи заключения государственных контрактов на приобретение жилых помещений в соответствии со <q class=\"r\" id=\"r\">статьей 20.1</q> Федерального закона от 21 июля 2007 года N 185-ФЗ &quot;О Фонде содействия реформированию жилищно-коммунального хозяйства&quot;.</div>
		<div class=\"UNI\" id=\"p512\">
			(часть третья введена Федеральным <q class=\"r\" id=\"r\">законом</q> от 17.07.2009 N 147-ФЗ)</div>
		<br id=\"p513\" />
		<div class=\"R\" id=\"p514\">
			Президент</div>
		<div class=\"R\" id=\"p515\">
			Российской Федерации</div>
		<div class=\"R\" id=\"p516\">
			В.ПУТИН</div>
		<div class=\"L\" id=\"p517\">
			Москва, Кремль</div>
		<div class=\"L\" id=\"p518\">
			30 декабря 2004 года</div>
		<div class=\"L\" id=\"p519\">
			N 214-ФЗ</div>
		<br id=\"p520\" />
		<br id=\"p521\" />
		<hr class=\"D\" id=\"p522\" />
	</div>
	<div id=\"bannersDiv\" style=\"WIDTH: 1578px; HEIGHT: 130px; OVERFLOW: hidden\">
		<table cellpadding=\"0\" cellspacing=\"0\" id=\"bannersTbl\" style=\"WIDTH: 1553px; TABLE-LAYOUT: fixed\">
			<tbody>
				<tr>
					<td align=\"center\" colspan=\"2\" style=\"HEIGHT: 60px; OVERFLOW: hidden\">
						&nbsp;</td>
				</tr>
				<tr>
					<td colspan=\"2\" style=\"HEIGHT: 15px; OVERFLOW: hidden\">
						&nbsp;</td>
				</tr>
				<tr>
					<td style=\"WIDTH: 50%\">
						<nobr>&copy; <span class=\"copyItem\">КонсультантПлюс</span>, </nobr><wbr><a class=\"copyItem\" href=\"mailto:contact@consultant.ru\">contact@consultant.ru</a></wbr></td>
					<td align=\"right\" style=\"WIDTH: 50%\">
						<div id=\"_insbottom\" style=\"OVERFLOW: hidden\">
							<div style=\"HEIGHT: 32px\">
								<img alt=\"\" height=\"1\" src=\"http://counter.rambler.ru/top100.cnt?91565\" width=\"1\" /> <a href=\"http://top100.rambler.ru/top100/\" target=\"_blank\"><img alt=\"Rambler\'s Top100\" border=\"0\" height=\"31\" src=\"http://top100-images.rambler.ru/top100/banner-88x31-rambler-gray2.gif\" width=\"88\" /></a> <a href=\"http://top.mail.ru/jump?from=186662\" target=\"_blank\"><img alt=\"Рейтинг@Mail.ru\" border=\"0\" height=\"31\" src=\"http://d9.cd.b2.a0.top.mail.ru/counter?id=186662;t=49\" width=\"88\" /></a></div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
', '<div class=\"H\" id=\"p6\">
	ФЕДЕРАЛЬНЫЙ ЗАКОН</div>
<p>
	&nbsp;</p>
<div class=\"H\" id=\"p8\">
	ОБ УЧАСТИИ В ДОЛЕВОМ СТРОИТЕЛЬСТВЕ</div>
<div class=\"H\" id=\"p9\">
	МНОГОКВАРТИРНЫХ ДОМОВ И ИНЫХ ОБЪЕКТОВ НЕДВИЖИМОСТИ</div>
<div class=\"H\" id=\"p10\">
	И О ВНЕСЕНИИ ИЗМЕНЕНИЙ В НЕКОТОРЫЕ ЗАКОНОДАТЕЛЬНЫЕ</div>
<div class=\"H\" id=\"p11\">
	АКТЫ РОССИЙСКОЙ ФЕДЕРАЦИИ</div>
<p>
	&nbsp;</p>
<div class=\"R\" id=\"p13\">
	Принят</div>
<div class=\"R\" id=\"p14\">
	Государственной Думой</div>
<div class=\"R\" id=\"p15\">
	22 декабря 2004 года</div>
<p>
	&nbsp;</p>
<div class=\"R\" id=\"p17\">
	Одобрен</div>
<div class=\"R\" id=\"p18\">
	Советом Федерации</div>
<div class=\"R\" id=\"p19\">
	24 декабря 2004 года</div>
<p>
	&nbsp;</p>
<div class=\"CV\" id=\"p21\">
	(в ред. Федеральных законов от 18.07.2006 <q class=\"r\" id=\"r\">N 111-ФЗ</q>,</div>
<div class=\"CV\" id=\"p22\">
	от 16.10.2006 <q class=\"r\" id=\"r\">N 160-ФЗ</q>, от 23.07.2008 <q class=\"r\" id=\"r\">N 160-ФЗ</q>,</div>
<div class=\"CV\" id=\"p23\">
	от 17.07.2009 <q class=\"r\" id=\"r\">N 147-ФЗ</q>, от 17.06.2010 <q class=\"r\" id=\"r\">N 119-ФЗ</q>)</div>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('19', 'Определение жилого дома ', '2', '<p>
	В соответствии со ст. 130, ст. 131 ГК и ст. 1 Закона от 21.07.1997 № 122-ФЗ &quot;О государственной регистрации прав на недвижимое имущество и сделок с ним&quot; жилые дома относятся к недвижимым вещам. Возникновение прав собственности на недвижимость происходит только после государственной регистрации этих прав (ст. 219 ГК РФ). То есть можно считать, что жилой дом как недвижимое имущество возникает только после государственной регистрации прав собственности.<br />
	<br />
	Для признания дома жилым действующим законодательством не предусмотрена его государственная регистрация. Государственная регистрация необходима только для вовлечения жилого дома (жилых помещений) в гражданский оборот. Недостроенный жилой дом также может быть вовлечен в гражданский оборот, но не в качестве жилого дома. Завершенный же строительством жилой дом, но не прошедший государственной регистрации, еще не может являться предметом сделок как жилой дом, поскольку он не будет еще являться объектом права собственности. Такой вывод вытекает из ст. 219 ГК РФ: &quot;право собственности на здания, сооружения и другое вновь создаваемое недвижимое имущество, подлежащее государственной регистрации, возникает с момента такой регистрации&quot;.<br />
	<br />
	Однако, если жилой дом прошел государственную регистрацию, он уже признан жилым домом.<br />
	<br />
	Государственной регистрацией прав на недвижимое имущество и сделок с ним осуществляет Федеральная регистрационная служба.&nbsp;&nbsp;<br />
	<br />
	<em>Источник:</em> <a href=\"http://dgp.stroi.ru/\">http://dgp.stroi.ru/</a></p>
', '<p>
	В соответствии со ст. 130, ст. 131 ГК и ст. 1 Закона от 21.07.1997 № 122-ФЗ &quot;О государственной регистрации прав на недвижимое имущество и сделок с ним&quot; жилые дома относятся к недвижимым вещам. Возникновение прав собственности на недвижимость происходит только после государственной регистрации этих прав (ст. 219 ГК РФ). То есть можно считать, что жилой дом как недвижимое имущество возникает только после государственной регистрации прав собственности.<a href=\"http://dgp.stroi.ru/\"><br />
	</a></p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('20', 'Правовые аспекты покупки таунхаусов', '2', '<p align=\"justify\">
	В настоящее время все более популярными среди приобретаемых объектов недвижимости становятся таунхаусы &ndash; блокированные жилые дома, сочетающие в себе преимущества квартиры и загородного дома. Можно согласиться с тем, что таунхаусы давно стали самостоятельным объектом покупательского спроса.</p>
<p align=\"justify\">
	Интересным для покупки таунхаусов является северо-запад Москвы &ndash; что традиционно связано с хорошей экологической обстановкой. На данной территории можно выделить район Куркино, который прилегает к городу Химки и уже давно фактически стал одним населенным пунктом с ним.</p>
<p align=\"justify\">
	Прежде всего, следует определиться с понятиями. Под таунхаусом (англ. townhouse) традиционно понимается жилой дом городского типа, состоящий из нескольких блоков, каждый из которых рассчитан на одну семью и имеет отдельный вход. Подобный тип загородных построений распространен в Европе, он позволяет сэкономить на строительстве и прокладке коммуникаций, удобен и с точки зрения обеспечения безопасности. К таунхаусу часто прилегает участок в несколько соток. Традиционно на первом этаже помимо жилых располагаются технические и подсобные помещения. Также для таунхауса характерно наличие собственного гаража или места, оборудованного под стоянку для одного - двух автомобилей.</p>
<p align=\"justify\">
	Можно заметить, что в Градостроительном кодексе РФ вместо таунхауса используется понятие &laquo;жилой дом блокированной застройки&raquo;. Данный термин определяется как жилой дом с количеством этажей не более чем три, состоящий из нескольких блоков, количество которых не превышает десять и каждый из которых предназначен для проживания одной семьи, имеет общую стену (общие стены) без проемов с соседним блоком или соседними блоками, расположен на отдельном земельном участке и имеет выход на территорию общего пользования. Таким образом, в правоустанавливающих документах на недвижимость может быть указано не только понятие &laquo;таунхаус&raquo;, но и смежные с ним термины &ndash; &laquo;блокированный жилой дом&raquo;, &laquo;секция в блокированном доме&raquo;. Поскольку таунхаус является жилым помещением, входящим в состав здания, в документах он может также указываться как квартира.</p>
<p align=\"justify\">
	Рассмотрим также некоторые иные аспекты покупки данного типа недвижимости. Прежде всего, следует установить, идет ли речь о приобретении строящегося или готового (т.е. введенного в эксплуатацию и зарегистрированного) дома. Для покупателя более удобным является второй вариант, когда на дом уже имеется свидетельство о государственной регистрации права собственности. Если таунахус еще только строится, то покупателю предлагают заключить предварительный договор, договор инвестирования (соинвестирования) или договор долевого участия в строительстве. Данный договор перед заключением вместе со строительной документацией целесообразно показать юристу. Также следует проверить информацию о застройщике &ndash; выяснить, какие объекты им построены, были ли проблемы со строительством. Это можно сделать, набрав, например, наименование застройщика в Интернете в поисковых системах.</p>
<p align=\"justify\">
	Далее следует обратить внимание непосредственно на приобретаемый дом. Здесь возможны два варианта &ndash; приобретается ли таунхаус как отдельный объект недвижимости или как доля в праве собственности. Во втором случае в свидетельстве о государственной регистрации и правоустанавливающих документах указывается &laquo;общая долевая собственность, доля в праве&raquo;. Данный вариант является менее удобным для собственника по нескольким причинам. Во-первых, считается, что собственники владеют всеми блоками (секциями) сообща, поэтому требуется дополнительное доказательство принадлежности конкретному лицу той или иной секции &ndash; таунхауса. Например, можно составить соглашение об определении порядка пользования общим имуществом в простой письменной форме, где указать единоличных пользователей каждого блока, или требовать дополнительные подтверждающие документы от застройщика. Во-вторых, при продаже доли в праве общей собственности собственники других долей имеют право преимущественной покупки &ndash; данные лица должны быть уведомлены о предстоящей продаже с указанием цены и условий и имеют право в течение одного месяца приобрести долю, по истечении данного срока доля в праве собственности может быть продана другому лицу. Поэтому лучше, когда таунхаус приобретается в качестве отдельного объекта (секции, квартиры), а не доли в праве собственности, что избавляет покупателя от указанных проблем.</p>
<p align=\"justify\">
	При покупке таунхауса также важно определить принадлежность и вид расположенного под ним земельного участка. Как известно, в Москве, в отличие от Московской области, нахождение земельного участка в частной собственности является большой редкостью. Поэтому в столице таунхаус, скорее всего, будет приобретаться только как дом, но без земельного участка. При этом в обоих случаях важно, чтобы земельный участок под таунхаусом имел надлежащий вид разрешенного использования и категорию земель. Данные характеристики указаны в правоустанавливающих документах на участок (если он не находится в собственности, следует внимательно посмотреть договор аренды). Также категорию и вид разрешенного использования можно узнать по кадастровому номеру на сайте www.kadastr.ru (в появившемся окне нужно выбрать ссылку &laquo;кадастровая стоимость земельных участков&raquo;, расположенную в левом верхнем углу) по кадастровому номеру. Важно, чтобы земельный участок имел вид разрешенного использования &laquo;для жилищного строительства&raquo;, &laquo;для строительства блокированного жилого дома&raquo; или подобные (в крайнем случае может быть указано &laquo;для строительства многоквартирного жилого дома&raquo;). В то же время записи &laquo;для индивидуального жилищного строительства&raquo;, &laquo;для дачного строительства&raquo;, &laquo;для садоводства&raquo; могут создать ряд существенных проблем покупателю и застройщику, вплоть до юридической ответственности за нецелевое использование земельного участка и принудительного сноса.</p>
<p align=\"justify\">
	Важно заметить, что законодательством не предусматривается возможность использование земель сельскохозяйственного назначения для строительства таунхаусов (в отличие от использования данных земель для строительства садовых и дачных домов &ndash; при наличии соответствующего вида разрешенного использования). Это может поставить под сомнение законность строительства таунхаусов на землях сельскохозяйственного назначения, равно как и на землях других категорий, отличных от земель поселений (населенных пунктов).</p>
<p align=\"justify\">
	Наконец, следует обратить внимание на то, установлены ли границы земельного участка под таунхаусом. Детальное описание границ каждого из участков является лучшей гарантией отсутствия земельных споров в дальнейшем.</p>
<p align=\"justify\">
	Как видно из всего указанного выше, приобретение таунхауса &ndash; важное решение, принять которое можно только обладая всей полнотой информации о покупке. Поэтому последняя (и, возможно, самая важная) рекомендация &ndash; доверить приобретение своего жилья специалистам.</p>
<p>
	Юрист группы компаний Риэлти-город<br />
	Силайчев Михаил</p>
', '<p align=\"justify\">
	В настоящее время все более популярными среди приобретаемых объектов недвижимости становятся таунхаусы &ndash; блокированные жилые дома, сочетающие в себе преимущества квартиры и загородного дома. Можно согласиться с тем, что таунхаусы давно стали самостоятельным объектом покупательского спроса.</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('21', 'Какой бывает совместная собственность?', '2', '<p>
	Смешению понятий &laquo;часть&raquo; и &laquo;доля&raquo; существенно способствует украинская правовая терминология. По-украински эти термины очень похожи. Так, &laquo;часть&raquo; &ndash; по-украински звучит как &laquo;частина&raquo;, а доля &ndash; &laquo;частка&raquo;. И хотя путать &laquo;частину&raquo; и &laquo;частку&raquo; недопустимо (как видно из вышеизложенного и будет также показано ниже), автору этой статьи за долгую практику приходилось не раз читать подготовленные нотариусами договоры с ошибками. Традиционно они начинались со слов: &laquo;За цим договором продавець продає, а покупець купує 1/2 (1/3, 1/4) частину наступного майна...&raquo;. В ответ на указание на ошибку (на самом деле продается не &laquo;частина&raquo;, а &laquo;частка&raquo;), иногда звучало &laquo;А яка різниця?!&raquo;. Хуже того, нотариусы часто настаивали на своей безграмотной формулировке в ущерб интересам сторон сделки, возможно, желая &laquo;не потерять лицо&raquo;. Между тем &laquo;різниця&raquo; зачастую бывает огромной.<br />
	Так, однажды клиенты автора этой статьи приобретали ни много ни мало, а целый завод в одном небольшом городе. Завод составлял определенную долю целостного имущественного комплекса, в который входил и жилой многоквартирный дом. Следовательно, жильцы этого жилого дома имели право преимущественной покупки завода. Чтобы соблюсти все нормы закона, покупатели завода обязаны были сначала предложить приобрести завод каждому жильцу дома (ст. 362 ГКУ). И лишь в случае их отказа они сами получали право приобрести завод. Понятно, что жильцы не собирались покупать завод, а покупатели &ndash; проходить многомесячную процедуру предварительного предложения завода жильцам. Но если бы жильцам завод не предложили, а они узнали бы о сделке (в маленьких городах это более чем вероятно) и имели достаточные правовые знания, они могли бы оспаривать сделку на основании несоблюдения их преимущественного права. И покупатели понесли бы достаточно ощутимые материальные потери, чтобы как-нибудь уладить дело.<br />
	Сделка завершилась удачно именно потому, что дело было в маленьком городке, и местные нотариусы, а также работники БТИ также совершенно не понимали, чем &laquo;частина&raquo; отличается от &laquo;частки&raquo;. В связи с этим они переоформили в БТИ запись о регистрации исходной сделки, убрав слово &laquo;частка&raquo;. Но когда аналогичный случай произошел в Киеве, где общая юридическая грамотность выше, для продажи &laquo;частки&raquo; пришлось предварительно делать договор о разделе общего имущества (о нем пойдет речь ниже), которым &laquo;частки&raquo; были выделены в натуре и, таким образом, общая собственность прекратилась. К счастью, в киевском случае участников общей долевой собственности было всего четыре, а не жилой многоквартирный дом. Это значительно упростило процедуру раздела общего имущества.<br />
	В связи с вышеизложенным, советуем участникам долевой собственности быть бдительными. Если, исходя из сути правоотношений, приобретается &laquo;частка&raquo;, то нужно правильно понимать, какие последствия это может иметь.</p>
', '<p>
	Главным правовым понятием по данной теме является общая собственность.<br />
	Основные положения, регулирующие понятие общей собственности, содержатся в гл. 26 Гражданского Кодекса Украины (ГКУ).<br />
	Особенности общей собственности на землю устанавливаются ст. 86&ndash;89 Земельного Кодекса Украины (ЗКУ), а общей собственности супругов и детей &ndash; главами 8 и 14 Семейного Кодекса Украины (СКУ).</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('22', 'Причины путаницы', '2', '<p>
	Смешению понятий &laquo;часть&raquo; и &laquo;доля&raquo; существенно способствует украинская правовая терминология. По-украински эти термины очень похожи. Так, &laquo;часть&raquo; &ndash; по-украински звучит как &laquo;частина&raquo;, а доля &ndash; &laquo;частка&raquo;. И хотя путать &laquo;частину&raquo; и &laquo;частку&raquo; недопустимо (как видно из вышеизложенного и будет также показано ниже), автору этой статьи за долгую практику приходилось не раз читать подготовленные нотариусами договоры с ошибками. Традиционно они начинались со слов: &laquo;За цим договором продавець продає, а покупець купує 1/2 (1/3, 1/4) частину наступного майна...&raquo;. В ответ на указание на ошибку (на самом деле продается не &laquo;частина&raquo;, а &laquo;частка&raquo;), иногда звучало &laquo;А яка різниця?!&raquo;. Хуже того, нотариусы часто настаивали на своей безграмотной формулировке в ущерб интересам сторон сделки, возможно, желая &laquo;не потерять лицо&raquo;. Между тем &laquo;різниця&raquo; зачастую бывает огромной.<br />
	Так, однажды клиенты автора этой статьи приобретали ни много ни мало, а целый завод в одном небольшом городе. Завод составлял определенную долю целостного имущественного комплекса, в который входил и жилой многоквартирный дом. Следовательно, жильцы этого жилого дома имели право преимущественной покупки завода. Чтобы соблюсти все нормы закона, покупатели завода обязаны были сначала предложить приобрести завод каждому жильцу дома (ст. 362 ГКУ). И лишь в случае их отказа они сами получали право приобрести завод. Понятно, что жильцы не собирались покупать завод, а покупатели &ndash; проходить многомесячную процедуру предварительного предложения завода жильцам. Но если бы жильцам завод не предложили, а они узнали бы о сделке (в маленьких городах это более чем вероятно) и имели достаточные правовые знания, они могли бы оспаривать сделку на основании несоблюдения их преимущественного права. И покупатели понесли бы достаточно ощутимые материальные потери, чтобы как-нибудь уладить дело.<br />
	Сделка завершилась удачно именно потому, что дело было в маленьком городке, и местные нотариусы, а также работники БТИ также совершенно не понимали, чем &laquo;частина&raquo; отличается от &laquo;частки&raquo;. В связи с этим они переоформили в БТИ запись о регистрации исходной сделки, убрав слово &laquo;частка&raquo;. Но когда аналогичный случай произошел в Киеве, где общая юридическая грамотность выше, для продажи &laquo;частки&raquo; пришлось предварительно делать договор о разделе общего имущества (о нем пойдет речь ниже), которым &laquo;частки&raquo; были выделены в натуре и, таким образом, общая собственность прекратилась. К счастью, в киевском случае участников общей долевой собственности было всего четыре, а не жилой многоквартирный дом. Это значительно упростило процедуру раздела общего имущества.<br />
	В связи с вышеизложенным, советуем участникам долевой собственности быть бдительными. Если, исходя из сути правоотношений, приобретается &laquo;частка&raquo;, то нужно правильно понимать, какие последствия это может иметь.</p>
', '<p>
	Смешению понятий &laquo;часть&raquo; и &laquo;доля&raquo; существенно способствует украинская правовая терминология. По-украински эти термины очень похожи. Так, &laquo;часть&raquo; &ndash; по-украински звучит как &laquo;частина&raquo;, а доля &ndash; &laquo;частка&raquo;.&nbsp;</p>
');
INSERT INTO `page` (pageID, title, parentID, content, shortcontent)
VALUES ('23', 'Правовой режим общей совместной собственности (ст. 369-372 ГКУ)', '2', '<p>
	Сособственники имущества, находящегося в общей совместной собственности, совладельцы (&laquo;совместники&raquo;) владеют, пользуются и распоряжаются имуществом совместно, если иное не предусмотрено договоренностью между ними. В применении к жилому дому это означает, что все &laquo;совместники&raquo; имеют право пользоваться всеми помещениями жилого дома без ограничений.<br />
	Содержащаяся в законе оговорка &laquo;если иное не установлено договоренностью между ними&raquo;, предоставляет &laquo;совместникам&raquo; право договариваться между собой, кто каким помещением будет пользоваться исключительно или преимущественно. Но существенным отличием полномочий &laquo;совместников&raquo; от сособственников долевой собственности (&laquo;долевиков&raquo;) заключается в различных возможностях правовой защиты в случае, если договориться не удается.<br />
	Обычно граждане обращаются за защитой в суд. Если это &laquo;долевики&raquo;, которым не удалось договориться о порядке пользования общим имуществом, суд имеет правовое основание для того, чтобы установить этот порядок (пользование пропорционально долям, о котором говорилось выше &ndash; п. 3. ст. 358 ГКУ). Но если по такому же вопросу в суд обратится один из &laquo;совместников&raquo;, у суда не будет &laquo;долевого&raquo; критерия для установления порядка пользования общим имуществом. Ведь в совместном имуществе доли не определены, а закон устанавливает одно основание порядка пользования &ndash; договоренность сособственников. Поэтому &laquo;совместнику&raquo; придется хорошо потрудиться, чтобы обосновать свои права на пользование тем или иным имуществом.<br />
	Оговоримся, что в данном случае речь не идет о совместной собственности супругов: режим их собственности достаточно полно урегулирован СКУ. Режим общей совместной собственности является органичным для союзов, которые &laquo;совместили&raquo; свои жизни в одну добровольно &ndash; то есть, для супругов. Они согласились жить вместе и решать все вопросы по взаимному согласию. А если согласие не достигнуто, случается, что супруги разводятся. Последствие развода &ndash; раздел имущества, после которого прекращается совместный характер владения. Но это &laquo;уже совсем другая история...&raquo;.<br />
	Все другие лица, кроме супругов, независимо от того, являются ли они членами одной семьи или нет, объективно могут и должны претендовать на отдельное жизненное пространство. Поэтому, во избежание споров, мы рекомендуем (всем, кроме супругов) строительство общего дома осуществлять на основаниях общей долевой собственности. Тем более что закон (п. 4. ст. 368 ГКУ) позволяет членам одной семьи, которые совместно строят дом, устанавливать для будущего дома режим долевой собственности. Для этого нужно заключить соответствующий письменный договор.<br />
	Для распоряжения земельным участком или жилым домом, которые находятся в совместной собственности, необходимо нотариально удостоверенное согласие всех сособственников на такое распоряжение с указанием его существенных условий: цены, порядка оплаты и т. д. (п. 2 ст. 369). Также в документе может быть указано, что сособственник, уполномоченный заключать сделку, может по своему усмотрению определять ее условия.<br />
	Участники общей совместной собственности так же, как и &laquo;долевики&raquo;, имеют право на выделение в натуре своей доли. При этом доли каждого сособственника признаются равными, если иное не установлено договоренностью между ними или законом.</p>
', '<p>
	Сособственники имущества, находящегося в общей совместной собственности, совладельцы (&laquo;совместники&raquo;) владеют, пользуются и распоряжаются имуществом совместно, если иное не предусмотрено договоренностью между ними. В применении к жилому дому это означает, что все &laquo;совместники&raquo; имеют право пользоваться всеми помещениями жилого дома без ограничений.</p>
');


DROP TABLE IF EXISTS `region_center`;

CREATE TABLE `region_center` (
`region_centerID` int(11) NOT NULL AUTO_INCREMENT,
`title` varchar(200) NOT NULL,
`highwayID` int(11) NOT NULL DEFAULT '0',
primary key(region_centerID)
);

INSERT INTO `region_center` (region_centerID, title, highwayID)
VALUES ('8', 'п. Заокский', '3');
INSERT INTO `region_center` (region_centerID, title, highwayID)
VALUES ('9', 'Боровск', '4');
INSERT INTO `region_center` (region_centerID, title, highwayID)
VALUES ('7', 'Кашира', '2');
INSERT INTO `region_center` (region_centerID, title, highwayID)
VALUES ('10', 'Ожерелье', '2');
INSERT INTO `region_center` (region_centerID, title, highwayID)
VALUES ('11', 'Пурлово', '2');
INSERT INTO `region_center` (region_centerID, title, highwayID)
VALUES ('12', 'Падольск', '3');
INSERT INTO `region_center` (region_centerID, title, highwayID)
VALUES ('13', 'Щербинка', '3');
INSERT INTO `region_center` (region_centerID, title, highwayID)
VALUES ('14', 'д. Шахово', '5');
INSERT INTO `region_center` (region_centerID, title, highwayID)
VALUES ('15', 'Лесной городок', '6');
INSERT INTO `region_center` (region_centerID, title, highwayID)
VALUES ('16', 'д. Мостовское', '3');
INSERT INTO `region_center` (region_centerID, title, highwayID)
VALUES ('17', 'Тверь', '8');
INSERT INTO `region_center` (region_centerID, title, highwayID)
VALUES ('18', 'д.Никулино', '2');
INSERT INTO `region_center` (region_centerID, title, highwayID)
VALUES ('20', 'ДО Покровское', '6');
INSERT INTO `region_center` (region_centerID, title, highwayID)
VALUES ('21', 'д. Солманово', '6');


DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
`userID` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(200) NOT NULL,
primary key(userID)
);

INSERT INTO `user` (userID, name)
VALUES ('3', 'Выберите значение');
INSERT INTO `user` (userID, name)
VALUES ('4', 'Кузьмин А.М.');
INSERT INTO `user` (userID, name)
VALUES ('5', 'Бадайкин Алексей 8(915)360-20-49');
INSERT INTO `user` (userID, name)
VALUES ('6', 'Деменкова Анна 8(903)778-69-69');
INSERT INTO `user` (userID, name)
VALUES ('7', 'Ева 8(916) 668-34-39');
INSERT INTO `user` (userID, name)
VALUES ('8', 'Мавряшин Алексей');


