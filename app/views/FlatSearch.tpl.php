<div class="b-form-search-left">
	<div class="b-form-box district">
		<div class="b-form-title-item">Округ</div>
		<div class="b-form-check">
			<span class="niceCheck"><input type="checkbox" name="districtall" value = "1" class="b-check" /></span> <label class="labelCheckbox">Все</label>
			<span class="niceCheck"><input type="checkbox" name="district[]" value = "1" class="b-check" /></span> <label class="labelCheckbox">ЦАО</label>
			<span class="niceCheck"><input type="checkbox" name="district[]" value = "2" class="b-check" /></span> <label class="labelCheckbox">САО</label>
			<span class="niceCheck"><input type="checkbox" name="district[]" value = "3" class="b-check" /></span> <label class="labelCheckbox">ЗАО</label>
			<span class="niceCheck"><input type="checkbox" name="district[]" value = "4" class="b-check" /></span> <label class="labelCheckbox">ВАО</label>
			<span class="niceCheck"><input type="checkbox" name="district[]" value = "5" class="b-check" /></span> <label class="labelCheckbox">ЮАО</label>
			<span class="niceCheck"><input type="checkbox" name="district[]" value = "6" class="b-check" /></span> <label class="labelCheckbox">СВАО</label>
			<span class="niceCheck"><input type="checkbox" name="district[]" value = "7" class="b-check" /></span> <label class="labelCheckbox">СЗАО</label>
			<span class="niceCheck"><input type="checkbox" name="district[]" value = "8" class="b-check" /></span> <label class="labelCheckbox">ЮЗАО</label>
			<span class="niceCheck"><input type="checkbox" name="district[]" value = "9" class="b-check" /></span> <label class="labelCheckbox">ЮВАО</label>
			<div class="cb"></div>
		</div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box city">
		<div class="b-form-title-item">Город</div>
		<div class="b-form-inp">
			<span class="select_shadow left" id="one">Выбрать</span>
      <div id="cityPlace" class="advSearchPlace left"></div>
			<div class="cb"></div>
			<div class="b-form-dialog-box one">
                <input type="button" class="close" value = "Выбрать" />
			<?php
				foreach($city as $k => $v){
					echo "<label class='select_box'><input type='checkbox' class='city' name='city[]' value='".$k."'/>".$v['title']."</label>";
				}
			?>

			</div>
		</div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box">
		<div class="b-form-title-item">Количество комнат</div>
		<div class="b-form-check">
			<span class="niceCheck"><input type="checkbox" name="room[]" value="2" id="room2" class="b-check" /></span> <label class="labelCheckbox">1</label>
			<span class="niceCheck"><input type="checkbox" name="room[]" value="3" id="room3" class="b-check" /></span> <label class="labelCheckbox">2</label>
			<span class="niceCheck"><input type="checkbox" name="room[]" value="4" id="room4" class="b-check" /></span> <label class="labelCheckbox">3</label>
			<span class="niceCheck"><input type="checkbox" name="room[]" value="5" id="room5" class="b-check" /></span> <label class="labelCheckbox">4</label>
			<span class="niceCheck"><input type="checkbox" name="room[]" value="6" id="room6" class="b-check" /></span> <label class="labelCheckbox">5 и более</label>
			<div class="cb"></div>
		</div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box">
		<div class="b-form-title-item line-height">Площадь</div>
		<div class="b-form-inp">
		от <input type="text" name="square[from]"> м<sup>2</sup>&nbsp;&nbsp;&nbsp; до <input name = "square[to]" type="text"> м<sup>2</sup>
		</div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box">
		<div class="b-form-title-item">Тип дома</div>
		<div class="b-form-check">
			<span class="niceCheck"><input type="checkbox" name="btypeall" value = "1" class="b-check" /></span> <label class="labelCheckbox">Все</label>
			<span class="niceCheck"><input type="checkbox" name="btype[]" value = "1" class="b-check" /></span> <label class="labelCheckbox">Панельный</label>
			<span class="niceCheck"><input type="checkbox" name="btype[]" value = "2" class="b-check" /></span> <label class="labelCheckbox">Кирпичный</label>
			<span class="niceCheck"><input type="checkbox" name="btype[]" value = "3" class="b-check" /></span> <label class="labelCheckbox">Кирпично-монолитный</label>
			<span class="niceCheck"><input type="checkbox" name="btype[]" value = "4" class="b-check" /></span> <label class="labelCheckbox">Сталинский</label>
			<span class="niceCheck"><input type="checkbox" name="btype[]" value = "5" class="b-check" /></span> <label class="labelCheckbox">Иное</label>
			<div class="cb"></div>
		</div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box">
		<div class="b-form-title-item">Стоимость</div>
		<div class="b-form-inp margin">
			<select name="currency">
			<?php foreach($currencyList as $k=>$v){ ?>
			<option value="<?php echo $k;?>" <?php if($k == $currency){echo "selected";}?>><?php echo $v;?></option>
			<?php } ?>
			</select>
			от <input type="text" name="price[from]">&nbsp;&nbsp;&nbsp; до <input type="text" name="price[to]">
		</div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box">
		<div class="b-form-title-item ipt">Ипотека</div>
		<div class="b-form-inp margin-box"><span class="niceCheck"><input type="checkbox" class="b-check" name="ipoteka"  value = "1" /></span></div>
		<div class="cb"></div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
        //MO
		if(window.location.hash == "#mo"){
			$('.b-form-box.city').css('display','block');
			$('.b-form-box.district').css('display','none');
            $('.typeHidden').attr('value',1);
		} else {
            //MSK
            $('.b-form-box.city').css('display','none');
            $('.b-form-box.district').css('display','block');
            $('.typeHidden').attr('value',0);
        }

		$('.tabjs').click(function(){
			var value = $(this).attr('id');
			$('.typeHidden').attr('value',value);

			if(1 == value){     //MO
				$('.b-form-box.city').css('display','block');
                window.location.hash = 'mo';
				$('.b-form-box.district').css('display','none');

			}else{  //MSK
                window.location.hash = 'msk';
				$('.b-form-box.city').css('display','none');
				$('.b-form-box.district').css('display','block');

			}
		});
	});
</script>