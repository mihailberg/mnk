<? header('Content-Type: text/html; charset=utf-8');  ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- (c) Art. Lebedev Studio | http://www.artlebedev.ru/ -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang='ru-RU'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Расширенный поиск</title>
<link rel="stylesheet" type="text/css" href="metro.css" media="all"/>
<link rel="stylesheet" type="text/css" href="main.css" media="all"/>
<script type="text/javascript" src="http://www.cian.ru/nd/global/jquery-1.7.1.min.js"></script>
<!--[if lt IE 9]>
<script src="http://www.cian.ru/http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!--<script src="http://www.cian.ru/nd/global/excanvas.js"></script>-->
<script type="text/javascript" src="http://www.cian.ru/nd/global/jquery-ui-1.8.17.custom.min.js"></script>
<script type="text/javascript" src="http://www.cian.ru/nd/global/jquery.ui.datepicker-ru.js"></script>
<script type="text/javascript" src="http://www.cian.ru/nd/global/jquery.ba-bbq.min.js"></script>
<script type="text/javascript" src="extended_search.js"></script>
<script type="text/javascript" src="metro.js"></script>



</head>
<body>
<div id="extended_form" class="ex">
	<form id="extended_search_form_act" class="sf_form zf" rel="rent" onsubmit="" method="POST" action="">
		<div class="sf_body" style="">
					
		<span class="pseudo als_metro_toggle_scheme">Показать схему метро</span>
		<span class="metro_preloader" style="display: none;margin-left: 10px;">Загрузка схемы метро.<img src="http://www.cian.ru/nd/address/iframe/metro_preloader.gif" style="position: absolute;margin: -6px 0 0 6px;"></span>		



							
		<div class="ex_location_type" rel="location_metro" style="margin-left: 10px;display: inline;">
			
		</div>	
													
		<div class="ex_location_type" rel="location_metro" style="margin-top: 10px;">
			<div class="metrobox ex_location_type" rel="location_metro"></div>	
			
			<div class="als_metro_circle_triggers" style="display: none;">
				<span class="als_metro_wrapper">
				<span class="pseudo als_metro_select_circle als_metro_select_inside">Выделить кольцевые станции и станции внутри кольца</span>
				</span>
				
				<span class="als_metro_wrapper">
				<span class="pseudo als_metro_select_inside">Выделить станции внутри кольца</span>
				</span>
				
				<span class="als_metro_wrapper">
				<span class="pseudo als_metro_select_circle">Выделить кольцевые станции</span>
				</span>
				
			<div class="metro_selected_title" >
				Выбраны станции
			</div>
			<div class="metro_selected" style="display:none"></div>
			<span class="pseudo als_metro_deselect" style="font-size:14px;display:none;">Удалить выбранные станции</span>

				
			</div>
			<div style="clear: both;"></div>
		</div>

		<input type="submit" class="sf_submit" value="Показать предложения">
		</div>

	</form>
</div>
					




</body>
</html>
