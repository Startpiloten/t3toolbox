<?php
if($_GET['token'] == 'clearcache'){
    opcache_reset();
    echo ' OPcache clean';
}
?>