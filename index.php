<?php
    include_once 'include/config.php';
    include 'include/html-head.php';
    session_start();
?>
<body>
  <div id="wrapper">
    <div id="header">
    </div>
    
    <div id="content">
        <a href="./demploye/">Demandeur d'emploi</a>
        <a href="./employe/">Employeur</a>
    </div>
<?php
    include 'include/footer.php';
?>
