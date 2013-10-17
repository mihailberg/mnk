<div class="b-form-search-left foreign">
	<div class="b-form-box">
		<div class="b-form-title-item">Страна</div>
		<div class="b-form-inp wd500" id="countryPlace">
			<span class="select_shadow left" id="one">Выбрать</span>
			<div class="b-form-dialog-box one">
                <input type="button" class="close" value = "Выбрать" />
			<?php
				foreach($country as $k => $v){
					echo "<label class='select_box'><input type='checkbox' class='country' name='country[]' value='".$k."'/>".$v['title']."</label>";
				}
			?>
			</div>
		</div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box">
		<div class="b-form-title-item">Тип объекта</div>
		<div class="b-form-inp">
			<select class="field select form select_type_obj" name="type" size="1">
                <?php foreach($foreignType as $k=>$v){
    echo '<option value = "'.$k.'">'.$v.'</option>';
                }?>
			</select>
		</div>
		<div class="cb"></div>
	</div>
	<div class="b-form-box rooms">
		<div class="b-form-title-item">Количество спален</div>
		<div class="b-form-check">
			<span class="niceCheck"><input type="checkbox" name="live_count[]" value = "1" class="b-check" /></span> <label class="labelCheckbox">1</label>
			<span class="niceCheck"><input type="checkbox" name="live_count[]" value = "2" class="b-check" /></span> <label class="labelCheckbox">2</label>
			<span class="niceCheck"><input type="checkbox" name="live_count[]" value = "3" class="b-check" /></span> <label class="labelCheckbox">3</label>
			<span class="niceCheck"><input type="checkbox" name="live_count[]" value = "4" class="b-check" /></span> <label class="labelCheckbox">4</label>
			<span class="niceCheck"><input type="checkbox" name="live_count[]" value = "5" class="b-check" /></span> <label class="labelCheckbox">5</label>
			<span class="niceCheck"><input type="checkbox" name="live_count[]" value = "6" class="b-check" /></span> <label class="labelCheckbox">Более 5</label>
			<div class="cb"></div>
		</div>
		<div class="cb"></div>
	</div>
    <div class="b-form-box">
      <div class="b-form-title-item">Стоимость</div>
      <div class="b-form-inp margin70">
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
        <div class="b-form-title-item line-height">Площадь</div>
        <div class="b-form-inp">
        от <input type="text" name="square[from]"> м<sup>2</sup>&nbsp;&nbsp;&nbsp; до <input name = "square[to]" type="text"> м<sup>2</sup>
        </div>
        <div class="cb"></div>
    </div>
</div>			