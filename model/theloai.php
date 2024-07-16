<?php
    function get_all_theloai() {
        $sql = "SELECT id, name from theloai ORDER BY id DESC";
        return pdo_query($sql);
    }
    