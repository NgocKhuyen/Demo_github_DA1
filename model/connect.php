<?php
    function pdo_get_connection() {
        $dburl = "mysql:host=localhost; dbname=phim; charset=utf8";
        $username = 'root';
        $password = '';

        try {
            $conn = new PDO($dburl, $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            // return 'Kết nối thành công';
            return $conn;
        } catch (PDOException $th) {
            throw $th;
        }
    }

    function pdo_execute($sql) {
        $sql_args = array_slice(func_get_args(), 1);
        try {
            $conn = pdo_get_connection();
            $stmt = $conn->prepare($sql);
            $stmt->execute($sql_args);
        } catch (PDOException $e) {
            throw $e;
        }
        finally{
            unset($conn);
        }
    }

    function pdo_query($sql) { // Đại diện cho câu truy vấn sql
        $sql_args = array_slice(func_get_args(), 1);
        try {
            $conn = pdo_get_connection();
            $stmt = $conn->prepare($sql);
            $stmt->execute($sql_args);

            $rows = $stmt->fetchAll();
            return $rows;
        } catch (PDOException $e) {
            throw $e;
        }
        finally {
            unset($conn);
        }
    }

    function pdo_query_one($sql) {
        $sql_args = array_slice(func_get_args(), 1);
        try {
            $conn = pdo_get_connection();
            $stmt = $conn->prepare($sql);
            $stmt->execute($sql_args);
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            return $row;
        } catch (PDOException $e) {
            throw $e;
        }
        finally {
            unset($conn);
        }
    }