(function ($) {
    window.advSearchPlaces = [];
    $.fn.advSearchFilter = function (placeId) {
        window.advSearchPlaces[this.selector] = this.selector;
        this.on('change', function (event) {
            if ($(this).attr("checked") == "checked") {
                name = $(this).parents('label').text();
                var $Item = $('<dl rel="' + $(this).val() + '" class="advSearchCloud"><dt>' + name + '</dt><dd><input type="hidden" name="' + $(this).attr('class') + '[]" value="' + $(this).val() + '" /></dd></dl>');
                $(placeId).append($Item);

                $Item.find('dd').on('click', function (event) {
                    v = $(this).children('input').val();
                    c1 = $(this).children('input').attr('name');
                    l =  c1.length;
                    c = c1.substr(0,l-2);

                    ch = $('input.'+c+'[value='+v+'][type="checkbox"]');
                    //Снять галочку
                    ch.attr('checked',false);
                    //Убить облачко
                    $Item.remove();
                });
            } else {
                $(placeId).children('dl[rel="' + $(this).val() + '"]').remove();
            }
            ;
        });

        $('input[type=reset]').on('click', function (event,test) {
            $('dl.advSearchCloud').remove();
            for(var p in window.window.advSearchPlaces){
                $(p).attr('checked',false);
            }
        });
    };
})(jQuery);