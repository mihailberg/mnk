<div class="b-form-search-left commercial">
    <div class="b-form-box">
        <div class="b-form-radio">
            <label class="margin"><input type="radio" name="rent" checked value="0">Продажа</label>
            <label><input type="radio" name="rent" value="1">Аренда</label>
        </div>
    </div>

    <div class="b-form-box">
        <div class="b-form-title-item">Тип/назначение объекта</div>
        <div class="b-form-inp">
            <span class="select_shadow assign_type left" id="two">Выбрать</span>
            <div id="assignPlace" class="advSearchPlace left"></div>
						<div class="cb"></div>
            <div id="typePlace"></div>

<?php /*
<!-- Офис/ангар, зем.участок,-->
<!--                Помещение свободного назначения/ангар, земельный участок,-->
<!--                Торговое помещение/ангар, земельный участок,-->
<!--                Помещение под ресторан/ангар, земельный участок,-->

<!--                Помещение под банк/кап.строение, ангар, земельный участок,-->
<!--                Помещние под мед.центр/кап.строение, ангар, земельный участок,-->
<!--                Помещение под салон красоты/ангар, зем.участок,-->
<!--                Помещение под бытовые услуги/ангар, зем.участок,-->


<!--                Склад/бизнес-центры, новостройка, жилой дом, особняк,-->
<!--                Производство/ бизнес-центры, новостройка, жилой дом, особняк,-->
<!--                Автосервис/биснес-центры, новостройка, жилой дом, особняк.-->
 */
            ?>
<script>

    $(document).ready(function(){

        $('.all_view_link').attr('href',function(){
           var rentCheck = $(this).val();
           return UpdateQueryString('rent',$('input[name="rent"]').val(),this.href);
        });


        $('input[name="rent"]').change(function(){
            var rentCheck = $(this).val();
            $('.all_view_link').attr('href',function(){
               return UpdateQueryString('rent',rentCheck,this.href);
            })
        });
    });


    var disabled = {

        'assign[value=1]': ['type[value=8]','type[value=9]'],//офис
        'assign[value=2]': ['type[value=8]','type[value=9]'],//Помещение свободного назначения
        'assign[value=3]': ['type[value=8]','type[value=9]'],//Торговые помещения
        'assign[value=4]': ['type[value=8]','type[value=9]'],//Помещения под ресторан/кафе
        'assign[value=5]': ['type[value=8]','type[value=9]','type[value=7]'],//Помещения под банк
        'assign[value=6]': ['type[value=8]','type[value=9]','type[value=7]'],//Помещения под мед.центры
        'assign[value=7]': ['type[value=8]','type[value=9]'],//Помещения под салон красоты
        'assign[value=8]': ['type[value=8]','type[value=9]'],//Помещения под бытовые услуги
        'assign[value=9]': ['type[value=1]','type[value=2]','type[value=4]','type[value=5]','type[value=6]'],//Склад
        'assign[value=10]':['type[value=1]','type[value=2]','type[value=4]','type[value=5]','type[value=6]'],//Производство
        'assign[value=11]':['type[value=1]','type[value=2]','type[value=4]','type[value=5]','type[value=6]'],//Автосервис
        'assign[value=12]':[],//иное

        'type[value=1]': ['assign[value=9]','assign[value=10]','assign[value=11]'],//Бизнес-центр (строящийся)
        'type[value=2]': ['assign[value=9]','assign[value=10]','assign[value=11]'],//Бизнес-центр (готовый)
        'type[value=3]': [],//Здание
        'type[value=4]': ['assign[value=9]','assign[value=10]','assign[value=11]'],//Новостройка
        'type[value=5]': ['assign[value=9]','assign[value=10]','assign[value=11]'],//Жилой дом
        'type[value=6]': ['assign[value=9]','assign[value=10]','assign[value=11]'],//Особняк
        'type[value=7]': ['assign[value=5]','assign[value=6]'],//Капитальное строение
        'type[value=8]': ['assign[value=1]','assign[value=2]','assign[value=3]','assign[value=4]','assign[value=5]','assign[value=6]','assign[value=7]','assign[value=8]'],//Ангар
        'type[value=9]': ['assign[value=1]','assign[value=2]','assign[value=3]','assign[value=4]','assign[value=5]','assign[value=6]','assign[value=7]','assign[value=8]'],//Земельный участок
        'type[value=10]': []//иное
    };
</script>

            <div class="b-form-dialog-box two">
                <span><b>Выберите тип и/или назначение объекта</b></span>
                <div class="cb"></div>

                <div class="tipob">
                    <span class="caption">Тип объекта</span>
                        <label class="select_box"><input type="checkbox" class="type" name="type[]" value="1">Бизнес-центр (строящийся)</label>
                        <label class="select_box"><input type="checkbox" class="type" name="type[]" value="2">Бизнес-центр (готовый)</label>
                        <label class="select_box"><input type="checkbox" class="type" name="type[]" value="3">Здание</label>
                        <label class="select_box"><input type="checkbox" class="type" name="type[]" value="4">Новостройка</label>
                        <label class="select_box"><input type="checkbox" class="type" name="type[]" value="5">Жилой дом</label>
                        <label class="select_box"><input type="checkbox" class="type" name="type[]" value="6">Особняк</label>
                        <label class="select_box"><input type="checkbox" class="type" name="type[]" value="7">Капитальное строение</label>
                        <label class="select_box"><input type="checkbox" class="type" name="type[]" value="8">Ангар</label>
                        <label class="select_box"><input type="checkbox" class="type" name="type[]" value="9">Земельный участок</label>
                        <label class="select_box"><input type="checkbox" class="type" name="type[]" value="10">иное</label>
                    <div class="cb" style="width:100px;">
                        <br /><br />
                        <input type="button" class="close" value = "Выбрать" />
                    </div>
                    <?php /*
                    foreach ($type as $k => $v) {
                        echo "<label class='select_box'><input type='checkbox' class='type' name='type[]' value='" . $k . "'/>" . $v . "</label>";
                    } */
                    ?>
                </div>
                <div class="naznach">
                    <span class="caption">Назначение</span>
                        <label class="select_box"><input type="checkbox" class="assign" name="assign[]" value="1">Офис</label>
                        <label class="select_box"><input type="checkbox" class="assign" name="assign[]" value="2">Помещение свободного назначения</label>
                        <label class="select_box"><input type="checkbox" class="assign" name="assign[]" value="3">Торговые помещения</label>
                        <label class="select_box"><input type="checkbox" class="assign" name="assign[]" value="4">Помещения под ресторан/кафе</label>
                        <label class="select_box"><input type="checkbox" class="assign" name="assign[]" value="5">Помещения под банк</label>
                        <label class="select_box"><input type="checkbox" class="assign" name="assign[]" value="6">Помещения под мед.центры</label>
                        <label class="select_box"><input type="checkbox" class="assign" name="assign[]" value="7">Помещения под салон красоты</label>
                        <label class="select_box"><input type="checkbox" class="assign" name="assign[]" value="8">Помещения под бытовые услуги</label>
                        <label class="select_box"><input type="checkbox" class="assign" name="assign[]" value="9">Склад</label>
                        <label class="select_box"><input type="checkbox" class="assign" name="assign[]" value="10">Производство</label>
                        <label class="select_box"><input type="checkbox" class="assign" name="assign[]" value="11">Автосервис</label>
                        <label class="select_box"><input type="checkbox" class="assign" name="assign[]" value="12">иное</label>
                    <?php /*
                    foreach ($assign as $k => $v) {
                        echo "<label class='select_box'><input type='checkbox' class='assign' name='assign[]' value='" . $k . "'/>" . $v . "</label>";
                    } */
                    ?>
                </div>
                <div class="cb"></div>
            </div>
        </div>
        <div class="cb"></div>
    </div>


    <div class="b-form-box district">
        <div class="b-form-title-item">Округ</div>
        <div class="b-form-check">
            <span class="niceCheck"><input type="checkbox" name="district[]" value="0" class="b-check"/></span> <label
                class="labelCheckbox">Все</label>
            <span class="niceCheck"><input type="checkbox" name="district[]" value="1" class="b-check"/></span> <label
                class="labelCheckbox">ЦАО</label>
            <span class="niceCheck"><input type="checkbox" name="district[]" value="2" class="b-check"/></span> <label
                class="labelCheckbox">САО</label>
            <span class="niceCheck"><input type="checkbox" name="district[]" value="3" class="b-check"/></span> <label
                class="labelCheckbox">ЗАО</label>
            <span class="niceCheck"><input type="checkbox" name="district[]" value="4" class="b-check"/></span> <label
                class="labelCheckbox">ВАО</label>
            <span class="niceCheck"><input type="checkbox" name="district[]" value="5" class="b-check"/></span> <label
                class="labelCheckbox">ЮАО</label>
            <span class="niceCheck"><input type="checkbox" name="district[]" value="6" class="b-check"/></span> <label
                class="labelCheckbox">СВАО</label>
            <span class="niceCheck"><input type="checkbox" name="district[]" value="7" class="b-check"/></span> <label
                class="labelCheckbox">СЗАО</label>
            <span class="niceCheck"><input type="checkbox" name="district[]" value="8" class="b-check"/></span> <label
                class="labelCheckbox">ЮЗАО</label>
            <span class="niceCheck"><input type="checkbox" name="district[]" value="9" class="b-check"/></span> <label
                class="labelCheckbox">ЮВАО</label>

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
        <div class="b-form-title-item line-height">Площадь</div>
        <div class="b-form-inp">
            от <input type="text" name="square[from]"> м<sup>2</sup>&nbsp;&nbsp;&nbsp; до <input name="square[to]"
                                                                                                 type="text">
            м<sup>2</sup>
        </div>
        <div class="cb"></div>
    </div>
    <div class="b-form-box pricesell">
        <div class="b-form-title-item line-height">Стоимость</div>
        <div class="b-form-inp margin5">
            <select name="currency">
                <?php foreach ($currencyList as $k => $v) { ?>
                <option value="<?php echo $k;?>" <?php if ($k == $currency) {
                    echo "selected";
                }?>><?php echo $v;?></option>
                <?php } ?>
            </select>
            от <input type="text" name="price[from]">&nbsp;&nbsp;&nbsp; до <input type="text" name="price[to]">
        </div>
        <div class="cb"></div>
    </div>
    <div class="b-form-box pricesell">
        <div class="b-form-title-item">Стоимость за 1м<sup>2</sup></div>
        <div class="b-form-inp margin5">
            <select name="currency">
                <?php foreach ($currencyList as $k => $v) { ?>
                <option value="<?php echo $k;?>" <?php if ($k == $currency) {
                    echo "selected";
                }?>><?php echo $v;?></option>
                <?php } ?>
            </select>
            от <input type="text" name="price_m[from]">&nbsp;&nbsp;&nbsp; до <input type="text" name="price_m[to]">
        </div>
        <div class="cb"></div>
    </div>
    <div class="b-form-box pricerent">
        <div class="b-form-title-item line-height">Ежемесячная арендная ставка</div>
        <div class="b-form-inp margin8">
            <select name="currency">
                <?php foreach ($currencyList as $k => $v) { ?>
                <option value="<?php echo $k;?>" <?php if ($k == $currency) {
                    echo "selected";
                }?>><?php echo $v;?></option>
                <?php } ?>
            </select>
            от <input type="text" name="price[from]">&nbsp;&nbsp;&nbsp; до <input type="text" name="price[to]">
        </div>
        <div class="cb"></div>
    </div>
		<div class="b-form-box pricerent">
			<div class="b-form-title-item">Арендная ставка за 1м<sup>2</sup> в год</div>
			<div class="b-form-inp  margin8">
                <select name="currency">
                                <?php foreach ($currencyList as $k => $v) { ?>
                                <option value="<?php echo $k;?>" <?php if ($k == $currency) {
                                    echo "selected";
                                }?>><?php echo $v;?></option>
                                <?php } ?>
                            </select>
				от <input type="text" name="price_m[from]">&nbsp;&nbsp;&nbsp; до <input type="text" name="price_m[to]">
			</div>
			<div class="cb"></div>
		</div>



</div>
<script type="text/javascript">
	$(document).ready(function () {
		if (window.location.hash == "#mo") {
			$('.b-form-box.city').css('display', 'block');
			$('.b-form-box.district').css('display', 'none');
            $('.typeHidden').attr('value', 1);
		} else {
            $('.b-form-box.city').css('display', 'none');
            $('.b-form-box.district').css('display', 'block');
            $('.typeHidden').attr('value', 0);
        }

		$('.tabjs').click(function () {
			var value = $(this).attr('id');
			$('.typeHidden').attr('value', value);
			if (1 == value) {
				$('.b-form-box.city').css('display', 'block');
				$('.b-form-box.district').css('display', 'none');
                window.location.hash = 'mo';
			} else {
				$('.b-form-box.city').css('display', 'none');
				$('.b-form-box.district').css('display', 'block');
                window.location.hash = 'msk';
			}
		});




        function typeAssignCheck(){
            for(var input in disabled){
                var currentDis = false;
                for(var check in disabled[input]){

                    var t =$('input.'+disabled[input][check]);
                    //Check list
                    if(t.attr('checked')=='checked'&&t.attr('disabled')!='disabled'){
                        //disable input
                        currentDis = true;
                    }
                }

                if(currentDis){
                    $('dl.advSearchCloud[rel='+$('input.'+input).attr('value')+']').remove();
                    $('input.'+input).attr('disabled','disabled');
                    $('input.'+input).parent('label').addClass('label_disabled');
                    $('input.'+input).attr('checked',false);

                } else {
                    $('input.'+input).parent('label').removeClass('label_disabled');
                    $('input.'+input).attr('disabled',false);
                }
            }
        }

        $('input.assign').change(function(){
            typeAssignCheck();
            return true;
        });
        $('input.type').change(function(){
            typeAssignCheck();
            return true;
        });

		$('.b-form-box.pricerent').hide();
		$('.b-form-radio input').click(function () {
			if ($(this).attr('value') == 1) {
				$('.b-form-box.pricesell').hide();
				$('.b-form-box.pricerent').show();
			} else {
				$('.b-form-box.pricerent').hide();
				$('.b-form-box.pricesell').show();
			}
		});

	});
</script>