<?php   
include_once "model/connect.php";
include_once "model/theloai.php";
include_once "model/phim.php";
include_once "model/global.php";


include_once "view/header.php";

if(!isset($_GET['pg'])) {
    $dstheloai = get_all_theloai();
    $phimmoi = get_all_phim(SO_LUONG_PHIM_HOME);
    $phimdecu = get_all_phim_decu();
    // echo var_dump($dstheloai);
    include_once "view/home.php";
}else {

    switch ($_GET['pg']) {
        case 'home':
            include_once "view/home.php";   
            break;
        case 'phim':
            include_once "view/phim.php";   
            break;    
        case 'detail':
            include_once "view/detail.php";
            break; 
            
        default:
            include_once "view/home.php";
            break;
    }
}

include_once "view/footer.php";

?>