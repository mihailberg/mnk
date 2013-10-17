<div class="b-form-search-left invest">
    <div class="b-form-box district">
        <div class="b-form-title-item">Округ</div>
        <div class="b-form-inp wd500" id="directionPlace">
            <span class="select_shadow addCB left" id="one">Выбрать</span>

            <div class="b-form-dialog-box one">
                <input type="button" class="close" value = "Выбрать" />
                <?php
                foreach ($invest as $k => $v) {
                    if (0 != $k)
                        echo "<label class='select_box'><input type='checkbox' class='direction' name='direction[]' value='" . $k . "'/>" . $v . "</label>";
                }
                ?>
            </div>

        </div>
        <div class="cb"></div>
    </div>

    <div class="b-form-box highway">
        <div class="b-form-title-item invest">Направление</div>
        <div class="b-form-inp wd500" id="highwayPlace">
                    <span class="select_shadow addCB left" id="two">Выбрать</span>
                    <div class="b-form-dialog-box two">
                        <input type="button" class="close" value = "Выбрать" />
                        <?php
                        foreach ($highway as $k => $v) {
                            echo "<label class='select_box'><input type='checkbox' class='highway' name='highway[]' value='" . $k . "'/>" . $v['title'] . "</label>";
                        }
                        ?>
                    </div>
        </div>
        <div class="cb"></div>
    </div>

    <div class="b-form-box">
        <div class="b-form-title-item">Тип проекта</div>
        <div class="b-form-inp">
					<div class="b-form-check">
						<span class="niceCheck"><input type="checkbox" name="typeall" value="1" class="b-check"></span><label class="labelCheckbox">Все</label>
						<div class="cb"></div>
					</div>
        </div>
        <div class="cb"></div>

        <?php
$iTypes = array('Выберите значение',
           'Жилые многоэтажные инвестпроекты',
           'Жилые малоэтажные инвестпроекты',
           'Инвестпроекты строительства аппартаментов',
           'Инвестпроекты гостиниц',
           'Инвестпроекты торговых центров',
           'Инвестпроекты офисно-деловых центров',
           'Коммерческая недвижимость',
           'Здания',
           'Производство',
           'Земельные участки',
           'Иное');

        foreach($iTypes as $k=>$i){
            if($k ==0) continue;
            echo '        <div class="b-form-title-item">&nbsp;</div>
                    <div class="b-form-inp">
                                <div class="b-form-check">
                                    <span class="niceCheck"><input type="checkbox" name="type[]" value="'.$k.'" class="b-check"></span><label class="labelCheckbox">'.$i.'</label>
                                    <div class="cb"></div>
                                </div>
                    </div>
                    <div class="cb"></div>';

        }

?>

    </div>

    <div class="b-form-box">
        <div class="b-form-title-item">Площадь участка</div>
        <div class="b-form-inp">
            от <input type="text" name="square[from]"> Га&nbsp;&nbsp;&nbsp; до <input name="square[to]" type="text"> Га
        </div>
        <div class="cb"></div>
    </div>
    <div class="b-form-box mkad_search">
        <div class="b-form-title-item">Растояние от МКАД</div>
        <div class="b-form-inp">
            от <input type="text" name="mkad[from]"> км&nbsp;&nbsp;&nbsp; до <input name="mkad[to]" type="text"> км
        </div>
        <div class="cb"></div>
    </div>

</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('.addCB').click(function(){
			var block = $(this).parent();
			$(block).after('<div class="cb"></div>');
		});

        if(window.location.hash == "#mo"){
            $('.typeHidden').attr('value',1);
            $('.b-form-box.mkad_search').css('display','block');
            $('.b-form-box.highway').css('display','block');
            $('.b-form-box.district').css('display','none');


        } else {
            $('.typeHidden').attr('value',0);
            $('.b-form-box.highway').css('display','none');
            $('.b-form-box.mkad_search').css('display','none');
            $('.b-form-box.district').css('display','block');
        }

        $('.tabjs').click(function(){
            var value = $(this).attr('id');
            $('.typeHidden').attr('value',value);
            if(1 == value){
                $('.b-form-box.mkad_search').css('display','block');
                $('.b-form-box.highway').css('display','block');
                $('.b-form-box.district').css('display','none');

                window.location.hash = 'mo';



            }else{
                $('.b-form-box.highway').css('display','none');
                $('.b-form-box.mkad_search').css('display','none');
                $('.b-form-box.district').css('display','block');
                window.location.hash = 'msk';
            }
        });
	});
</script>