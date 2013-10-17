<script type="text/javascript">
	$(document).ready(function(){

        var msk='';
        var mo='';
        var url = window.location.href.split('/');

        if (window.location.hash == "#mo") {
            var value = 1;
            $('.typeHidden').attr('value',value);

            $('.changebox_s.moscow').removeClass('active');
            $('.changebox_s.mo').addClass('active');

//            $('.district').css('display','none');
//            $('.metroplace').css('display','none');
//            $('.highwayplace').css('display','block');

//            msk = $('.changebox_s.moscow').html();
//            $('.changebox_s.moscow').html('');


//            $('.mmetro').advSearchFilter('#mmetroPlace');

        } else {
            var value = 0;
            $('.typeHidden').attr('value',value);
            $('.changebox_s.mo').removeClass('active');
            $('.changebox_s.moscow').addClass('active');

//            $('.district').css('display','block');
//            $('.metroplace').css('display','block');
//            $('.highwayplace').css('display','none');

//            mo = $('.changebox_s.mo').html();
 //           $('.changebox_s.mo').html('');

   //         $('.highway').advSearchFilter('#highwayPlace');
        }

        $('.changebox.moscow_tab').click(function () {
            var current = $('.typeHidden').attr('value');
            var value = $(this).attr('id');
            //Если другая вкладка
            if(current!=value){
                window.location.hash = 'msk';
                $('.typeHidden').attr('value',value);

                $('.changebox_s.mo').removeClass('active');
                $('.changebox_s.moscow').addClass('active');

//                $('.district').css('display','block');
//                $('.metroplace').css('display','block');
//                $('.highwayplace').css('display','none');
            }
        });

        $('.changebox.mo_tab').click(function () {
            var current = $('.typeHidden').attr('value');
            var value = $(this).attr('id');
            //Если другая вкладка
            if(current!=value){
                window.location.hash = 'mo';
                $('.typeHidden').attr('value',value);

                $('.changebox_s.moscow').removeClass('active');
                $('.changebox_s.mo').addClass('active');

//                $('.district').css('display','none');
//                $('.metroplace').css('display','none');
//                $('.highwayplace').css('display','block');
            }
        });
	});
</script>

<div class="b-form-search-left foreign">
    <div class="changebox_s moscow active district">
        <div class="b-form-box">
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
        <div class="b-form-box metroplace">
            <div class="b-form-title-item">Ближайшее метро</div>
            <div class="b-form-inp">
                  <span class="select_shadow left" id="two">Выбрать</span>
                  <div id="mmetroPlace" class="advSearchPlace left"></div>
                  <div class="cb"></div>
                  <div class="b-form-dialog-box two">
                      <input type="button" class="close" value = "Выбрать" />
                  <?php
                      if(is_array($metro)){
                          foreach($metro as $k => $v){
                            echo "<label class='select_box'><input type='checkbox' class='mmetro' name='mmetro[]' value='".$k."'/>".$v['name']."</label>";
                          }
                      }

                  ?>
                  </div>
                <div class="cb"></div>
            </div>
            <div class="cb"></div>
        </div>






        <div class="b-form-box regionCheckboxes">
            <div class="b-form-title-item">Район</div>
            <div class="b-form-check">
                <span class="niceCheck"><input type="checkbox" name="regionall" value = "1" class="b-check" /></span> <label class="labelCheckbox">Все</label>
                <span class="niceCheck"><input type="checkbox" name="region[]" value = "1" class="b-check" /></span> <label class="labelCheckbox">Остоженка</label>
                <span class="niceCheck"><input type="checkbox" name="region[]" value = "2" class="b-check" /></span> <label class="labelCheckbox">Арбат</label>
                <span class="niceCheck"><input type="checkbox" name="region[]" value = "3" class="b-check" /></span> <label class="labelCheckbox">Замоскворечье</label>
                <span class="niceCheck"><input type="checkbox" name="region[]" value = "4" class="b-check" /></span> <label class="labelCheckbox">Якиманка</label>
                <div class="cb"></div>
                <span class="niceCheck"><input type="checkbox" name="region[]" value = "5" class="b-check" /></span> <label class="labelCheckbox">Патриаршие</label>
                <span class="niceCheck"><input type="checkbox" name="region[]" value = "6" class="b-check" /></span> <label class="labelCheckbox">Тверская</label>
                <span class="niceCheck"><input type="checkbox" name="region[]" value = "7" class="b-check" /></span> <label class="labelCheckbox">Сретенка</label>
                <span class="niceCheck"><input type="checkbox" name="region[]" value = "8" class="b-check" /></span> <label class="labelCheckbox">Цветной бульвар</label>
                <span class="niceCheck"><input type="checkbox" name="region[]" value = "9" class="b-check" /></span> <label class="labelCheckbox">Чистые пруды</label>
                <div class="cb"></div>
            </div>
            <div class="cb"></div>
        </div>
        <div class="b-form-box rooms">
            <div class="b-form-title-item">Количество комнат</div>
            <div class="b-form-check">
                <span class="niceCheck"><input type="checkbox" name="room[]" value = "1" class="b-check" /></span> <label class="labelCheckbox">1</label>
                <span class="niceCheck"><input type="checkbox" name="room[]" value = "2" class="b-check" /></span> <label class="labelCheckbox">2</label>
                <span class="niceCheck"><input type="checkbox" name="room[]" value = "3" class="b-check" /></span> <label class="labelCheckbox">3</label>
                <span class="niceCheck"><input type="checkbox" name="room[]" value = "4" class="b-check" /></span> <label class="labelCheckbox">4</label>
                <span class="niceCheck"><input type="checkbox" name="room[]" value = "5" class="b-check" /></span> <label class="labelCheckbox">5</label>
                <span class="niceCheck"><input type="checkbox" name="room[]" value = "6" class="b-check" /></span> <label class="labelCheckbox">Более 5</label>
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
            <div class="b-form-title-item line-height">Площадь</div>
            <div class="b-form-inp">
                от <input type="text" name="square[from]"> м<sup>2</sup>&nbsp;&nbsp;&nbsp; до <input name = "square[to]" type="text"> м<sup>2</sup>
            </div>
            <div class="cb"></div>
        </div>



    </div>








    <div class="changebox_s mo">
        <div class="b-form-box rooms highwayplace">
            <div class="b-form-title-item">Направление</div>
            <div class="b-form-inp wd500" id="highwayPlace">
          			<span class="select_shadow left" id="one">Выбрать</span>
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
            <?php ?>
            <div class="cb"></div>
        </div>
        
        <div class="b-form-box">
       		<div class="b-form-title-item">Тип объекта</div>
       		<div class="b-form-inp margin">
                   <span class="niceCheck"><input type="checkbox" name="type[]" value = "1" class="b-check" /></span> <label class="labelCheckbox">дом</label>
                   <span class="niceCheck"><input type="checkbox" name="type[]" value = "2" class="b-check" /></span> <label class="labelCheckbox">земельный участок</label>
                   <span class="niceCheck"><input type="checkbox" name="type[]" value = "4" class="b-check" /></span> <label class="labelCheckbox">таунхаус</label>
       		</div>

       		<div class="b-form-title-item">&nbsp;</div>
       		<div class="b-form-inp margin"><span class="niceCheck"><input type="checkbox" class="b-check" name="cottage_set_only" value = "1" /></span> <label class="labelCheckbox" >только в коттеджных поселках</label></div>
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
                от <input type="text" name="priceMO[from]">&nbsp;&nbsp;&nbsp; до <input type="text" name="priceMO[to]">
            </div>
            <div class="cb"></div>
        </div>
        <div class="b-form-box">
            <div class="b-form-title-item line-height">Площадь</div>
            <div class="b-form-inp">
                от <input type="text" name="squareMO[from]"> м<sup>2</sup>&nbsp;&nbsp;&nbsp; до <input name = "squareMO[to]" type="text"> м<sup>2</sup>
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
    </div>


</div>