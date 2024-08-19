<?php
if (function_exists('opcache_reset')) {
    opcache_reset();
    echo "OPCache vidé.";
} else {
    echo "OPCache n'est pas activé.";
}
?>