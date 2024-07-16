<?php
include_once "model/connect.php"; // Gọi file kết nối cơ sở dữ liệu và hàm pdo_query_one

$id = isset($_GET['id']) ? $_GET['id'] : 0;

if ($id) {
    try {
        $sql = "SELECT p.name AS phim_name, tl.name AS ten_the_loai, p.view, p.img, p.price
                FROM phim p
                JOIN theloai tl ON p.idcate = tl.id
                WHERE p.id = ?";
        $tentheloai = pdo_query_one($sql, $id);
        $phim = pdo_query_one($sql, $id);

        if ($phim) {
            $name = $phim['phim_name'];
            $category = $tentheloai['ten_the_loai'];
            $view = $phim['view'];
            $img = $phim['img'];
            $price = $phim['price'];

        } else {
            echo "Phim không tồn tại.";
            exit;
        }
    } catch (PDOException $e) {
        echo "Lỗi: " . $e->getMessage();
        exit;
    }
} else {
    echo "ID phim không hợp lệ.";
    exit;
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết phim: <?php echo $name; ?></title>
</head>
<body>
    <div class="movie-details">
        <img src="./public/img/<?php echo $img; ?>" alt="<?php echo $name; ?>">
        <div class="movie-info">
            <h2><?php echo $name; ?></h2>
            <div class="info-group">
                <p class="category">Thể loại: <?php echo $category; ?></p>
                <!-- <p>Đạo diễn: <?php echo $director; ?></p>
                <p>Diễn viên: <?php echo $actors; ?></p> -->
            </div>
            
            <div class="info-group">
                <!-- <p>Lượt xem: <?php echo $view; ?></p>
                <p>Đánh giá: <?php echo $rating; ?></p> -->
                <p>Giá: <?php echo $price; ?></p>
            </div>

            <div class="info-group">
                <p>Lượt xem: <?php echo $view; ?></p>
                <!-- <p>Đánh giá: <?php echo $rating; ?></p>
                <p>Giá: <?php echo $price; ?></p> -->
            </div>
        </div>
    </div>
</body>
</html>