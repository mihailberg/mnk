function UpdateQueryString(key, value, url) {
    if (!url) url = window.location.href;
    var re = new RegExp("([?|&])" + key + "=.*?(&|#|$)(.*)", "gi");

    if (re.test(url)) {
        if (typeof value !== 'undefined' && value !== null)
            return url.replace(re, '$1' + key + "=" + value + '$2$3');
        else {
            var hash = url.split('#');
            url = hash[0].replace(re, '$1$3').replace(/(&|\?)$/, '');
            if (typeof hash[1] !== 'undefined' && hash[1] !== null)
                url += '#' + hash[1];
            return url;
        }
    }
    else {
        if (typeof value !== 'undefined' && value !== null) {
            var separator = url.indexOf('?') !== -1 ? '&' : '?',
                hash = url.split('#');
            url = hash[0] + separator + key + '=' + value;
            if (typeof hash[1] !== 'undefined' && hash[1] !== null)
                url += '#' + hash[1];
            return url;
        }
        else
            return url;
    }
}
var uniqCount = [];
function uniqImgCount(){

    var i = 0;

    $('#product_carousel').find('li a img').each(function(){
        uniqCount[++i] = encodeURI($(this).attr('src'));
    });
    console.log($(uniqCount).length);
    console.log($(uniqCount));
    console.log($($.unique(uniqCount)));
    console.log($.unique(uniqCount).length);
}

function mycarousel_initCallback(carousel)
  {
      // Disable autoscrolling if the user clicks the prev or next button.
      carousel.buttonNext.bind('click', function() {
          carousel.startAuto(0);
//          uniqImgCount();
      });

      carousel.buttonPrev.bind('click', function() {
          carousel.startAuto(0);
      });

      // Pause autoscrolling if the user moves with the cursor over the clip.
      carousel.clip.hover(function() {
          carousel.stopAuto();
      }, function() {
          carousel.startAuto();
      });
};



jQuery(document).ready(function () {

    jQuery(".labelCheckbox").click(function () {
        var el = $(this).prev();
        /*jQuery('#'+jQuery(this).attr('for')).parent('.niceCheck');*/

        changeCheck(el);
        return false;
    });
    jQuery(".niceCheck").mousedown(
        /* при клике на чекбоксе меняем его вид и значение */
        function () {
            changeCheck(jQuery(this));
        });
    jQuery(".formReset").click(function () {
        jQuery(".niceCheck").each(function () {
            if ($(this).children('input').attr('checked')) {
                changeCheck(jQuery(this));
            }
        });
        return true;
    });


    jQuery(".niceCheck").each(
        /* при загрузке страницы нужно проверить какое значение имеет чекбокс и в соответствии с ним выставить вид */
        function () {
            changeCheckStart(jQuery(this));

        });

    jQuery("footer li:last-child").css("margin", "0");
});

function changeCheck(el)
    /*
     функция смены вида и значения чекбокса
     el - span контейнер дял обычного чекбокса
     input - чекбокс
     */ {

    var el = el,
        input = el.find("input").eq(0);

    if (!input.attr("checked")) {
        el.css("background-position", "0 -20px");
        input.attr("checked", true)
    } else {
        el.css("background-position", "0 0");
        input.attr("checked", false)
    }
    return true;
}

function changeCheckStart(el)
    /*
     если установлен атрибут checked, меняем вид чекбокса
     */ {
    var el = el,
        input = el.find("input").eq(0);
    if (input.attr("checked")) {
        el.css("background-position", "0 -17px");
    }
    return true;
}

/* обработчик кнопки он-лайн консультанта из верхнего меню */
function openConsult()
{
  $('body').removeClass('redhlp_closeChat').addClass('redhlp_openChat');
  $('.rh-inner.rh-reset').css('display','none');
  $('#rh-chat').css('display','block');
}

/* обработчик для кнопок верхнего меню заказать звонок и оставить заявку */
function openDialog(id,title,height)
{
  $('body').css('overflow','hidden');
  $('#'+id).dialog({
      draggable:false,
      resizable:false,
      width:400,
      height:height,
      modal:true
  });
  $('#'+id).prev().find('.ui-dialog-title').text(title);
  $('#'+id).prev().find('.ui-dialog-titlebar-close').attr('onclick','closeDialog();');
}

function closeDialog()
{
  $('body').css('overflow','visible');
}

/* обработчик для кнопки оставить заявку */
function sendCallBack()
{
  var error = 0,
      name = $('[name="callBackName"]'),
      mail = $('[name="callBackMail"]'),
      phone = $('[name="callBackPhone"]'),
      msg = $('[name="callBackMsg"]'),
      responseBox = $('#callBackResponse');

  responseBox.text('');

  if(name.val() == ''){
    error++;
    name.prev().css('color','#f00');
  }else
    name.prev().css('color','#222');

  if(mail.val() == ''){
    error++;
    mail.prev().css('color','#f00');
  }else
    mail.prev().css('color','#222');

  if(msg.val() == ''){
    error++;
    msg.prev().css('color','#f00');
  }else
    msg.prev().css('color','#222');

  if(error == 0){
    $.ajax({
      type: 'POST',
      url: '/php/sendForm.php',
      data: {
        name: name.val(),
        mail: mail.val(),
        phone: phone.val(),
        msg: msg.val()
      },
      success: function(responseText){
          if(responseText == 'good'){
            responseBox.css('color','green').text('Заявка отправлена');
          }else{
            responseBox.css('color','red').text('Произошла ошибка. Сообщите администратору!');
          }
      }
    });
    name.attr('value','');
    mail.attr('value','');
    phone.attr('value','');
    msg.attr('value','');
  }

}

/* обработчик для кнопки заказать звонок */
function sendOrderCall()
{
  var error = 0,
      name = $('[name="orderCallName"]'),
      phone = $('[name="orderCallPhone"]'),
      msg = $('[name="orderMsg"]'),
      responseBox = $('#orderCallResponse');

  responseBox.text('');

  if(name.val() == ''){
    error++;
    name.prev().css('color','#f00');
  }else
    name.prev().css('color','#222');

  if(phone.val() == ''){
    error++;
    phone.prev().css('color','#f00');
  }else
    phone.prev().css('color','#222');

  if(error == 0){
    $.ajax({
      type: 'POST',
      url: '/php/sendForm.php',
      data: {
        name: name.val(),
        phone: phone.val(),
          msg: msg.val(),
      },
      success: function(responseText){
          if(responseText == 'good'){
            responseBox.css('color','green').text('Заявка отправлена');
          }else{
            responseBox.css('color','red').text('Произошла ошибка. Сообщите администратору!');
          }
      }
    });
    name.attr('value','');
    phone.attr('value','');
  }
}