<?php
    include_once '../include/config.php';
    include '../include/html-head.php';
?>
<body>
<div id="wrapper">
<?php 
    include '../controleur/header.php'; 
?>    
<div id="content"><?php print $content;?></div>
    
<?php
    include '../include/footer.php';
?>