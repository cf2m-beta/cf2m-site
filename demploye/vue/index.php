<?php
    include_once '../include/config.php';
    include_once '../include/html-head.php';
?>
<body>
<div id="wrapper">
<?php 
    include_once '../controleur/header.php'; 
?>    
<div id="content"><?php print $content;?></div>
    
<?php
    include_once '../include/footer.php';
?>