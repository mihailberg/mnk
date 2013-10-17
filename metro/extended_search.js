var myMetro;

$(function () {
    var $MetroSelected = $('.metro_selected');
    //alert($('input[name=location_trigger][value=location_metro]').attr('rel'));
    var oMetro = new als.Metro({
        city:'moscow',
        node:'.metrobox'
    });
    oMetro.show();

    oMetro.addEventListener('mapchange', function (e, station) {
        //console.dir(arguments);
        var m = oMetro.getCurrentList();
//		console.dir(m);

        $('.metro_selected_title, .metro_selected, .als_metro_deselect').toggle(m.length > 0);

        var h = $MetroSelected.height();

        $MetroSelected
            .css('height', h + 'px')
            .html('')
        ;
        $.each(m, function (i, val) {
            //var $Item = $('<span class="pseudo" style="margin: 10px" rel="'+ val.id +'">'+ val.name +'</span>');

            var $Item = $('<dl rel="' + val.id + '"><dt>' + val.name + '</dt><dd class="dd_location"></dd><input type="hidden" name="m[]" value="' + val.id + '"/></dl>');


            $Item.find('dd').click(function () {
                //console.log('удалить');
                oMetro.toggleStation(val.id, false);
                $Item.remove();
            });

            $MetroSelected.append($Item);
        });
        $MetroSelected.css('height', 'auto');

        var hew_h = $MetroSelected.height();


    });
    //oMetro.removeEventListener('stationchange',function(){})


    myMetro = oMetro;
    setTimeout(test, 500);

    $('.als_metro_toggle_scheme').click(function (e) {
        e.stopPropagation();
        var opened = $('.metrobox').hasClass('opened');
        if (!opened) {
            $(this).hide();
            $('.metro_preloader').show();
        }

        if (!opened) {
            oMetro.show(function () {
                oMetro.setSelectedStations($MetroSelected.find('dl').map(function () {
                    return $(this).attr('rel');
                }));
                oMetro.node.trigger('mapchange');
                $('.als_metro_toggle_scheme').html('Скрыть схему метро').show();
                $('.metro_preloader').hide();
            });
        } else {
            oMetro.hide();
            $('.als_metro_toggle_scheme').html('Показать схему метро');
            $('.metro_selected_title, .metro_selected, .als_metro_deselect').toggle($.trim($('.metro_selected').html()).length > 0);
        }
        setTimeout(test, 500);
    });



});
function test() {
    $('.als_metro_station').each(function(e){
        var station = $(this).attr('title');
        if( $.inArray(station, window.metroExcluded) == -1 ) {
            $(this).children().css('backgroundImage', 'url(/metro/moscow/metro_t_grey.png)');
            $(this).children().css('cursor', 'default');
        }
    });
}