<?php
echo "Halo! Aku berjalan dalam container :)";
echo "<br>";
echo 'Current PHP version: ' . phpversion();
echo "<br>";
echo "Plugins : <pre>";
print_r(get_loaded_extensions());
echo "<pre/>";