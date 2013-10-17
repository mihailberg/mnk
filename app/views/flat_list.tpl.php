<?php
/**
 * @var $this Flat
 */
?><div id="searchResult">
  <?php
  if (!is_array($searchResult) || count($searchResult) == 0) {
      echo 'По вашему запросу ничего не найдено.</div>';
      return;
  }
  ?>
  <div class="searchResultTable">
      <?php
          $page = $this->page;

          $nav_block = '';


          $page_num = 1;
          if ($resultCount > $this->perPage) {
              echo ' <span class="found">Найдено: ' . $resultCount . '</span>';
              $page_num = floor($resultCount / $this->perPage);
              if (($resultCount % $this->perPage) != 0)
                  $page_num++;

              $start = 1;
              $end = 9;

              $current = $page;
              $start = (($current - 4) > 1) ? ($current - 4) : 1;
              $end = ($page_num < 10) ? $page_num : ($start + 9);


              $disabled = ($page == 1) ? ' class="disabled"' : '';
              $qs = (!empty($_SERVER['QUERY_STRING'])) ? '?'.$_SERVER['QUERY_STRING']:'';


              $url = '/gorodskaja-nedvizhimost/'.mb_strtolower($this->getAction()).'/page';

              $nav_block = '<div class="pagination"><ul>';
              $nav_block.= '<li' . $disabled . '>';
              if(!$disabled)  $nav_block.=  '<a href="' . $url . ($current - 1) .$qs . '">';
                  else $nav_block.='<span>';

              $nav_block.=  '&laquo;';
              if(!$disabled)  $nav_block.=  '</a>';
              else $nav_block.='</span>';
              $nav_block.=  '</li>';

              for ($i = $start; $i <= $end; $i++) {
                  $a = ($i == $page) ? ' class="active"' : '';
                  $nav_block .= '<li' . $a . '><a href="' . $url . $i .$qs .' ">' . $i . "</a></li> ";
              }
              $disabled = ($page == $page_num) ? ' class="disabled"' : '';

              $nav_block.= '<li' . $disabled . '>';
              if(!$disabled)  $nav_block.=  '<a href="' . $url . ($current + 1) . $qs . '">';
                  else $nav_block.='<span>';

              $nav_block.=  '&raquo;';
              if(!$disabled)  $nav_block.=  '</a>';
              else $nav_block.='</span>';
              $nav_block.=  '</li>';

              $nav_block .= '</ul></div>';
            echo $nav_block;
          }
          ?>

    <div class="row Caption">
      <div class="col c1">&nbsp;</div>
      <div class="col c2">id</div>
      <div class="col c3">Стоимость(<?php echo $currencyList[$currency];?>)</div>
      <div class="col c4">Метро</div>
      <div class="col c5">Улица</div>
      <div class="col c6">Количество<br>комнат</div>
      <div class="col c7">Площадь&nbsp;м<sup>2</sup></div>
      <div class="col c8">Этаж<br>Этажность</div>
      <div class="col c9">Тип дома</div>
      <div class="cb"></div>
    </div>
    <?php foreach ($searchResult as $gk) { ?>
          <?php if($gk['elite'] == 1){?>
            <a href="/elitnaja-nedvizhimost/flat/<?php echo $gk['tid']  ?>">
      <?php } else {?>
            <a href="/gorodskaja-nedvizhimost/flat/<?php echo $gk['tid']  ?>">
      <?php }?>

      <div class="row r">
          <div class="col c1"><?php if ((int)$gk['photoID'] > 0) {
              echo "<img src='/img/photo.png'>";
          } else {
              echo "&nbsp;";
          }?></div>
          <div class="col c2"><?php echo $gk['tid'];?></div>
          <div class="col c3"><?php echo number_format($gk['rub_price'], 0, '.', ' ');?></div>
          <div class="col c4"><?php echo (isset($metro[$gk['stationID']]['name']))?$metro[$gk['stationID']]['name']:'-';?></div>
          <div class="col c5"><?php echo $gk['address'];?></div>
          <div class="col c6" style="text-align: center;"><?php if ($gk['room'] == 0) {
              echo 'к';
          } else {
              echo $gk['room'];
          };?></div>
          <div class="col c7"><?php echo $gk['square'];?></div>
          <div class="col c8"><?php echo $gk['floor'] . "/" . $gk['floors'];?></div>
          <div class="col c9"><?php echo $house_types[$gk['type']];?></div>
      </div>
    </a>
    <?php } ?>
  </div>
    <?php
            if(isset($nav_block)) echo $nav_block;
        ?>
</div>