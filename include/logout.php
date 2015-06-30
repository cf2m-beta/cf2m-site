<?php

    session_start();
    session_destroy();
    header("Location: //localhost/cf2m-site/");
    exit;