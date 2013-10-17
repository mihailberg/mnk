<div class="b-form-search-left">
	<div class="b-form-box">
		<div class="b-form-title-item">Стоимость</div>
		<div class="b-form-inp">
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
		<div class="b-form-title-item squareHouse line-height">Площадь дома</div>
		<div class="b-form-inp">
			от <input type="text" name="square[from]">&nbsp;&nbsp;&nbsp; до <input type="text" name="square[to]"> м<sup>2</sup>
		</div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box">
		<div class="b-form-title-item line-height">Площадь участка</div>
		<div class="b-form-inp">
			<div class="b-form-inp">
			от <input type="text" name="squareArea[from]">&nbsp;&nbsp;&nbsp; до <input type="text" name="squareArea[to]"> соток
		</div>
		</div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box">
		<div class="b-form-title-item">Растояние от МКАД</div>
		<div class="b-form-inp margin">
			<select class="field select form" name="mkad_remoteness" size="1">
				<option value="0" selected="selected">любое</option>
				<option value="1">До 10 км</option>
				<option value="2">10-20 км</option>
				<option value="3">20-30 км</option>
				<option value="4">30-50 км</option>
				<option value="5">50-75 км</option>
				<option value="6">75-100 км</option>
				<option value="7">Более 100 км</option>
			</select>
		</div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box">
		<div class="b-form-title-item">Шоссе</div>
		<div class="b-form-inp wd500" id="highwayPlace">
			<span class="select_shadow addCB left" id="one">Выбрать</span>
			<div class="b-form-dialog-box one">
                <input type="button" class="close" value = "Выбрать" />
			<?php
				foreach($highway as $k => $v){
					if(0 != $k)
						echo "<label class='select_box'><input type='checkbox' class='highway' name='highway[]' value='".$k."'/>".$v['title']."</label>";
				}
			?>
			</div>
		</div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box">
		<div class="b-form-title-item">ЖД направление</div>
        <div class="b-form-inp wd500" id="train_wayPlace">
            <span class="select_shadow addCB left" id="five">Выбрать</span>
            <div class="b-form-dialog-box five">
                <input type="button" class="close" value = "Выбрать" />
                <label class="select_box"><input type="checkbox" class="train_way"  name="train_way[]" value="1"/>Белорусское</label>
                <label class="select_box"><input type="checkbox" class="train_way"  name="train_way[]" value="2"/>Горьковское</label>
                <label class="select_box"><input type="checkbox" class="train_way"  name="train_way[]" value="3"/>Казанское</label>
                <label class="select_box"><input type="checkbox" class="train_way"  name="train_way[]" value="4"/>Киевское</label>
                <label class="select_box"><input type="checkbox" class="train_way"  name="train_way[]" value="5"/>Курское</label>
                <label class="select_box"><input type="checkbox" class="train_way"  name="train_way[]" value="6"/>Ленинградское</label>
                <label class="select_box"><input type="checkbox" class="train_way"  name="train_way[]" value="7"/>Павелецкое</label>
                <label class="select_box"><input type="checkbox" class="train_way"  name="train_way[]" value="8"/>Рижское</label>
                <label class="select_box"><input type="checkbox" class="train_way"  name="train_way[]" value="9"/>Савеловское</label>
                <label class="select_box"><input type="checkbox" class="train_way"  name="train_way[]" value="10"/>Ярославское</label>
                <label class="select_box"><input type="checkbox" class="train_way"  name="train_way[]" value="11"/>Кольцевое</label>
            </div>
        </div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box">
		<div class="b-form-title-item">Районы Подмосковья</div>
		<div class="b-form-inp wd500" id="regionPlace">
			<span class="select_shadow addCB left" id="two">Выбрать</span>
			<div class="b-form-dialog-box two">
                <input type="button" class="close" value = "Выбрать" />
			<?php
				foreach($region as $k => $v){
					echo '<label class="select_box"><input type="checkbox" class="region"  name="region[]" value="'.$k.'"/>'.$v['title'].'</label>';
				}
			?>
			</div>
		</div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box">
		<div class="b-form-title-item">Города Подмосковья</div>
		<div class="b-form-inp wd500" id="cityPlace">
			<span class="select_shadow addCB left" id="three">Выбрать</span>
			<div class="b-form-dialog-box three">
                <input type="button" class="close" value = "Выбрать" />
			<?php
				foreach($city as $k => $v){
                    echo '<label class="select_box"><input type="checkbox" class="city"  name="city[]" value="'.$k.'"/>'.$v['title'].'</label>';
				}
			?>
			</div>
		</div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box">
		<div class="b-form-title-item">Коттеджные поселки</div>
		<div class="b-form-inp wd500" id="cottage_setPlace">
			<span class="select_shadow addCB left" id="four">Выбрать</span>
			<div class="b-form-dialog-box four">
                <input type="button" class="close" value = "Выбрать" />
			<?php
				foreach($cottage_set as $k => $v){
                    echo '<label class="select_box"><input type="checkbox" class="cottage_set"  name="cottage_set[]" value="'.$k.'"/>'.$v['title'].'</label>';
				}
			?>
			</div>
		</div>
		<div class="cb"></div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){

        if(window.location.hash!=''){
            var value = window.location.hash;

            if($(value).length!== 0){
                $('.tabjs').removeClass('current');

                window.addGet = '?'+$('.tabjs#'+value).attr('rel');
                $('.all_view_link').attr('href',window.all_view_href+window.addGet);

                $('.typeHidden').attr('value',value.substr(1));

                $(value).addClass('current');

                if('#l4' == value){
                    $('.b-form-title-item.squareHouse.line-height').text('Площадь таунхауса');
                } else {
                    $('.b-form-title-item.squareHouse.line-height').text('Площадь дома');
                }
                if('#l2' == value){
                    $('.squareHouse').parent().css('display','none');
                } else {
                    $('.squareHousePrice2').css('display','block');
                    $('.squareHouse').parent().css('display','block');
                }
            } else {
                $('.tabjs').removeClass('current');
                $('#l0').addClass('current');
            }

        }
        var type = window.location.hash;

		$('.tabjs').click(function(){
			var value = $(this).attr('id');
            window.location.hash = value;
            type =
				$('.typeHidden').attr('value',value);
			if('l4' == value){
				$('.b-form-title-item.squareHouse.line-height').text('Площадь таунхауса');
			} else {
				$('.b-form-title-item.squareHouse.line-height').text('Площадь дома');
			}
			if('l2' == value){
				$('.squareHouse').parent().css('display','none');
			} else {
				$('.squareHousePrice2').css('display','block');
				$('.squareHouse').parent().css('display','block');
			}
		});
	});
</script>