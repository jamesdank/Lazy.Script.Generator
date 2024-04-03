<?php

# Database Config
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$mysqli = new mysqli("localhost", "root", "", "lazy_script_generator");
$mysqli->set_charset("utf8mb4");

$indent="&nbsp; &nbsp; ";

echo 
    "
    #!/bin/bash</br></br>

    ##############################################################################</br>
    # Colors #####################################################################</br>
    green='&#92;e[32m'</br>
    blue='&#92;e[34m'</br>
    clear='&#92;e[0m'</br>
    red='&#92;033[0;31m'</br>
    nc='&#92;033[0m'</br>
    ##############################################################################</br></br>

    function color_green() {</br>
        echo -ne &#36;green&#36;1&#36;clear</br>
    }</br>
    function color_blue() {</br>
        echo -ne &#36;blue&#36;1&#36;clear</br>
    }</br></br>

    function sub_menu() {</br>
    ".$indent."echo -e \" \"</br>
    ".$indent."read -rp \"Type 'main' to go back to the menu or '0' to exit: `echo &#36;'\n> '`\" menu</br></br>

    ".$indent."case \"&#36;menu\" in</br></br>

    ".$indent.$indent."main)</br>
    ".$indent.$indent."clear ;</br>
    ".$indent.$indent."main.menu ;;</br></br>

    ".$indent.$indent."0) </br>
    ".$indent.$indent."clear ;</br>
    ".$indent.$indent."exit 0 ;;</br></br>

    ".$indent.$indent."*) </br>
    ".$indent.$indent."clear ;</br>
    ".$indent.$indent."echo -e \"&#36;{red}Wrong option&#36;{nc}\" ;;</br>
    ".$indent.$indent."esac</br>
    }</br></br>

    function main.menu() {</br>
    ".$indent."echo -ne \"</br>
    ".$indent."Main Menu</br>
    ";

/* create a prepared statement */
$stmt = mysqli_stmt_init($mysqli);
mysqli_stmt_prepare($stmt, "SELECT 
    lazy_name,
    lazy_commands
    FROM lazy_script ORDER BY lazy_name
    ");

/* execute query */
mysqli_stmt_execute($stmt);

/* bind variables to prepared statement */
mysqli_stmt_bind_result($stmt, $name, $commands);

/* fetch values */
$i = 1;
while (mysqli_stmt_fetch($stmt)) {
    $commands=nl2br($commands);

    echo
        $indent."&#36;(color_green '".$i++.")') ".$name."</br>";
 }

 mysqli_stmt_close($stmt);

echo 
    $indent."&#36;(color_green '0)') Exit</br>".
    $indent."&#36;(color_blue 'Choose an option:') \"</br></br>".

    $indent."read A</br></br>".
            
    $indent.$indent."case &#36;A in</br></br>";

/* create a prepared statement */
$stmt = mysqli_stmt_init($mysqli);
mysqli_stmt_prepare($stmt, "SELECT 
    lazy_name,
    lazy_commands
    FROM lazy_script ORDER BY lazy_name
    ");

/* execute query */
mysqli_stmt_execute($stmt);

/* bind variables to prepared statement */
mysqli_stmt_bind_result($stmt, $name, $commands);
     
/* fetch values */
$i = 1;
while (mysqli_stmt_fetch($stmt)) {
    
    $arr = explode("\n", $commands);

    echo
    $indent.$indent.$i++ .")</br>";

    foreach ($arr as $value) {
        echo $indent.$indent.$value."</br>";
    }
}

echo 
    $indent.$indent."0)</br>".
    $indent.$indent."clear ;</br>".
    $indent.$indent."exit 0 ;;</br></br>".

    $indent.$indent."*)</br>". 
    $indent.$indent."clear ;</br>".
    $indent.$indent."echo -e \"&#36;{red}Wrong option&#36;{nc}\" ;;</br>".
    $indent.$indent."esac </br>}</br></br>main.menu";

mysqli_close($mysqli);

?>
