<?php
if (isset($_GET['from'])) {
    ?>
<div id="nav" class="alert alert-success">
    <a class="close" data-dismiss="alert" href="#">×</a>
    <?php
    switch ($_GET['from']) {
        case 'pdf':
            echo 'PDF-файл отправлен';
            break;
        case 'SaveList':
            echo 'Все записи сохранены.';
            break;
        case 'update':
            echo 'Запись отредактирована.';
            break;
        case 'insert':
            echo 'Запись добавлена.';
            break;
        case 'delete':
            echo 'Запись удалена.';
            break;
        default:
            break;
    }
    ?>

</div>
<?php } ?>

<div>
    <!--                <form name="REPLIER" method="POST" enctype="multipart/form-data" action="?action=savelist"> -->
    <?php if ($Data->action != 'search' && $Data->table->name != 'settings' && $Data->table->name != 'contacts' && $Data->actionAdd): ?>
    <a class="btn btn-success" href="?action=add&page=1<?php echo $safeGetUrl;?>">
        <i class="icon-plus-sign icon-white"></i> Добавить</a><br/><br/>
    <?php endif; ?>
    <!--	                <input type="submit" alt="Сохранить" value="Сохранить" />	-->


    <?php
    $ListData = $Data->table->getData();
    if ($Data->table->name === 'flat')
        $countheaders = 4; else
        $countheaders = 3;
    if ($ListData) {
        ?>
        <table id="list" class="table table-bordered table-striped">
            <thead>
            <tr>
                <th width="1%">№</th>
                <?php foreach ($Data->table as $f) { ?>
                <?php if ($f->ListShow) { ?>
                    <th><?php echo $f->getName(); ?></th>
                    <?php } ?>
                <?php } ?>
                <th colspan="<?php echo $countheaders; ?>"></th>
            </tr>
            </thead>
            <tbody>
                <?php
                $j = 0;
                foreach ($ListData as $v) {
                    echo '<tr>';
                    echo '<th>'.$v['tid'].'</th>';
                    foreach ($Data->table as $f) {
                        if ($f->ListShow) {
                            //ListEdit
                            //echo '<td>'.$f->getListEdit('id['.$v['tid'].']['.$f->sqlField.']',$v[$f->sqlField],30).'</td>';
                            //List
                            //$aName,$aValue,$aSize
                            $f->value = $v[$f->sqlField];
                            echo '<td>' . $f->getList() . '</td>';
                        }
                    }

                    if ($Data->table->name == 'settings'||$Data->table->name == 'contacts') {
                        echo '<td colspan="4">';
                        echo '<input type="hidden" name="id[' . $v['tid'] . '][ID]" value = "' . $v['tid'] . '" />';
                        echo '<a class="btn btn-small btn-primary" href="?page=1&action=edit&id=' . $v['tid'] . $safeGetUrl . '"><i class="icon-edit icon-white"></i> Редактировать</a>';
                        echo '</td>';

                        echo '</tr>';

                    } else {

                        echo '<td align="center">';
                        echo '<input type="hidden" name="id[' . $v['tid'] . '][ID]" value = "' . $v['tid'] . '" />';
                        echo '<a class="btn btn-small btn-info" href="?page=1&action=view&id=' . $v['tid'] . $safeGetUrl . '"><i class="icon-info-sign icon-white"></i> Просмотр</a></td>';

                        /*
                        //PDF
                        if ($Data->table->name == 'flat') {
                        */


                        /*
                            echo '<td>
                            <form id="form'.$v['tid'].'" class="form-inline">
                                <input type="hidden" name = "action" value = "pdf" />
                                <input type="hidden" name = "id" value = "'.$v['tid'].'" />
                                <input type="hidden" name = "get" value = "' . $_SERVER['QUERY_STRING'] . '" />

                                <input type="hidden" id="wl'.$v['tid'].'" name = "withLogo" value = "1" />

                                <input style="float:left;width:150px;" class="btn-small" type="text" id="email' . $v['tid'] . '" name = "email" value = "" placeholder="E-mail" />
                                <a style="float:left;margin-left:5px;" class="btn " href="#" onclick="$(\'#form'.$v['tid'].'\').submit();">PDF</a>
                            </form>
                            </td>';
                        //}
                        //*/
                        //Edit
                        echo '<td align="center"><a class="btn btn-small btn-primary" href="?page=1&action=edit&id=' . $v['tid'] . $safeGetUrl . '"><i class="icon-edit icon-white"></i> Редактировать</a></td>';
                        //Delete
                        echo '<td align="center"><a class="btn btn-small btn-danger" href="#"  onClick="deleteOnClick(\'?page=1&action=delete&id=' . $v['tid'] . $safeGetUrl . '\');"><i class="icon-remove-sign icon-white"></i> Удалить</a></td>';
                        echo '</tr>';
                    }
                }
                ?>
            </tbody>

            <tfoot>
            <tr>
                <th width="1%">№</th>
                <?php foreach ($Data->table as $f) { ?>
                <?php if ($f->ListShow) { ?>
                    <th><?php echo $f->getName(); ?></th>
                    <?php } ?>
                <?php } ?>
                <th colspan="<?php echo $countheaders; ?>"></th>
            </tr>

            </th>
            </tr>
            </tfoot>
        </table>


        <?php
        $page = (isset($_GET['page'])) ? (int)$_GET['page'] : 1;
        $perPage = 20;
        $nav_block = '';
        echo lib::PageNav($nav_block, $page, $perPage, $Data->table->foundRows);

        ?>


        <!--                    <div class=""><div class="span8"><div class="dataTables_info" id="example_info">Showing 1 to 25 of 57 entries</div></div><div class="span8"><div class="dataTables_paginate paging_bootstrap pagination"><ul><li class="prev disabled"><a href="#">← Previous</a></li><li class="active"><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li class="next"><a href="#">Next → </a></li></ul></div></div></div> -->
        <!--    <input type="submit" alt="Сохранить" value="Сохранить" />	-->
        <?php
    } else {
        if ($Data->action == 'search') {
            echo 'По вашему запросу ничего не найдено';
        } else {
            echo 'Нет элементов для отображения';
        }
    }
    ?>
    <!--</form>--></div>