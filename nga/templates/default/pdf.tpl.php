<!DOCTYPE html>
<?php
$GLOBALS['currentFlat'] = $currentFlat = current($Data->table->getData());
$withLogo = (!empty($_GET['withLogo'])) ? (int) $_GET['withLogo'] : 0;

include_once($_SERVER['DOCUMENT_ROOT'] . '/nga/tables/settings.php');
$quotes = $tableSettings->getData();
$GLOBALS['quotes'] = $quotes;
include ($_SERVER['DOCUMENT_ROOT'] . '/nga/tables/region.php');

$GLOBALS['rData'] = $rData = $region->getData();
include ($_SERVER['DOCUMENT_ROOT'] . '/nga/tables/subway_stations.php');
$subway_stations->perPage = 1000;
$GLOBALS['mData'] = $mData = $subway_stations->getData();
?><html lang="en">
    <head>
        <meta charset="utf-8">
        <title><?php echo $currentFlat['name']; ?></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <style>
            h1 {
                font-size: 36px;
                line-height: 63px;
                color: #3c1b00;
                font-size: 36px;
                line-height: 63px;
                color: #000;
                font-family: 'Bannikova-Italic';
            }
            td{vertical-align: top;}

            body,td,div,b,p{
                font-size:18px;
                font-family: Arial;
                color:#663300;
            }
            h1{
                color:#663300;
            }
            .contacts{
                color:#999;
                font-size:14px;
            }

        </style>
    </head>

    <body style="margin: 0px;" width="1000px">
        <table border="0" cellpadding="5">
            <tr>
                <td width="150">
                    <?php if ($withLogo == 1) { ?><img src="<?php echo $_SERVER['DOCUMENT_ROOT']; ?>/images/themes/default/logopdf.jpg" /><?php } ?></td>
                <td style="vertical-align:bottom;padding-bottom: 14px;">
                    <table>
                        <tr><td class="contacts">ФИО: </td><td class="contacts"><?php echo $Data->User->getFio(); ?></td></tr>
                        <tr><td class="contacts">Телефон: </td><td class="contacts"><?php echo $Data->User->getPhone(); ?></td></tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <?php
        for ($i = 0; $i <= 19; $i++) {
            if (empty($currentFlat['image_' . $i])) {
                break;
            }
            ?>
            <div style="float:left;width:300px;padding: 5px;height:300px;"><img class="thumbOpen" width="300" src="<?php echo $_SERVER['DOCUMENT_ROOT'] . $currentFlat['image_' . $i]; ?>" alt="<?php echo $currentFlat['image_' . $i]; ?>" /></div>
            <?php
        }
        ?>
        <div style="clear:both;"></div>
        <br />
        <h1>Лот №<?php echo $GLOBALS['currentFlat']['identifier']; ?></h1>


        <h3>Стоимость кв. м.: </h3>
        <?php echo number_format($GLOBALS['currentFlat']['price_square']); ?> руб.<br />
        <?php echo strtr(number_format($GLOBALS['currentFlat']['price_square'] / $GLOBALS['quotes'][2]['value']), array(',' => ' ')); ?> $<br />
        <?php echo strtr(number_format($GLOBALS['currentFlat']['price_square'] / $GLOBALS['quotes'][3]['value']), array(',' => ' ')); ?> €<br />

        <h3>Полная стоимость: </h3>
        <?php echo number_format($GLOBALS['currentFlat']['price']); ?> руб.<br />
        <?php echo strtr(number_format($GLOBALS['currentFlat']['price'] / $GLOBALS['quotes'][2]['value']), array(',' => ' ')); ?> $<br />
        <?php echo strtr(number_format($GLOBALS['currentFlat']['price'] / $GLOBALS['quotes'][3]['value']), array(',' => ' ')); ?> €<br />
        <br />
        <b>Состояние - </b><?php echo ($GLOBALS['currentFlat']['decorated'] == 1) ? 'с отделкой' : 'без отделки'; ?><br />
        <br />
        <img align="absmiddle" src="/images/themes/default/m_icon.gif">&nbsp; <?php echo $mData[$GLOBALS['currentFlat']['stationID']]['name']; ?><br /><br />

        <b>От метро - </b><?php echo $GLOBALS['currentFlat']['metro_remoteness']; ?><br /><br />

        <b>Количество комнат - </b><?php echo $GLOBALS['currentFlat']['room']; ?><br /><br />
        <br />
        <h3>Описание</h3>
        <div>
            <?php echo $GLOBALS['currentFlat']['description']; ?>
        </div>
    </body>
</html>