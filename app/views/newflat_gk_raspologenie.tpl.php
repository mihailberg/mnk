<script type="text/javascript">
    $(document).ready(function() {
        var myLatlng = new google.maps.LatLng(<?php echo $newFlat['latitude'];?>, <?php echo $newFlat['longitude'];?>);
        var mapOptions = {
          zoom: 14,
          center: myLatlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: '<?php echo $newFlat['title'];?>'
        });
      });
</script>


        <div style="padding:0px 24px;height:450px;">
            <div id="map_canvas" style="width: 100%; height: 100%; position: relative;">

            </div>
        </div>

        <div class="cb"><br /><br /></div>
<!-- GOOGLE MAP END -->
<div style="padding:24px;">
    <h2>Адрес:</h2>
    <p><?php echo nl2br($newFlat['address']);?></p>
    <h2>Как добраться:</h2>
    <div>
    <?php echo $newFlat['howget'];?>
    </div>
</div>