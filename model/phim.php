<?php
    // Hiện thị phim nhiều lượt view nhất
    function get_all_phim($limit) {
        $sql = "SELECT * from phim ORDER BY view DESC LIMIT 0," .$limit;
        return pdo_query($sql);
    }

    // Hiển thị phim mới nhất
    function get_all_phim_decu() {
        $sql = "SELECT * from phim ORDER BY id DESC";
        return pdo_query($sql);
    }
        