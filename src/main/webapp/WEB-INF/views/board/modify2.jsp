<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Bootstrap & Custom Fonts -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    body {
        font-family: "Nanum Pen Script", cursive;
        background: #f5f5f5;
        color: #4d774e;
        padding: 20px;
    }

    .container {
        max-width: 900px;
        margin: auto;
        background: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .header h1 {
        font-size: 1.8rem;
        font-weight: bold;
        color: #84540f;
    }

    .header img {
        height: 50px;
    }

    .form-section {
        margin-bottom: 20px;
    }

    .form-section h2 {
        font-size: 1.5rem;
        margin-bottom: 10px;
    }

    .image-box {
        width: 100%;
        height: 150px;
        border: 2px dashed #ddd;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 1rem;
        color: #999;
        border-radius: 5px;
        margin-bottom: 20px;
    }

    .options {
        display: flex;
        justify-content: space-between;
        gap: 10px;
        margin-bottom: 20px;
    }

    .options button {
        flex: 1;
        border: none;
        background: #e0e0e0;
        padding: 10px;
        font-size: 0.9rem;
        border-radius: 5px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .options button i {
        margin-right: 5px;
    }

    .form-control {
        font-size: 1rem;
        padding: 10px;
        margin-bottom: 10px;
    }

    .footer-buttons {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }

    .footer-buttons button {
        background: none;
        border: none;
        font-size: 2rem;
        cursor: pointer;
    }

    .footer-buttons button.approve {
        color: green;
    }

    .footer-buttons button.reject {
        color: red;
    }
</style>

<div class="container">
    <!-- Header -->
    <div class="header">
        <h1>FOREST 수정</h1>
    </div>

    <!-- Form -->
    <form action="/board/submit" method="post">
        <!-- Title -->
        <div class="form-section">
            <input type="text" class="form-control" name="title" placeholder="새로운 동호회 이름 입력" required>
        </div>

        <!-- Representative Image -->
        <div class="form-section">
            <h2>대표 사진</h2>
            <div class="image-box">대표 사진</div>
        </div>

        <!-- Privacy Options -->
      <!--   <div class="form-section">
            <h2>글 제목</h2>
            <div class="options">
                <button type="button">
                    <i class="fa fa-lock"></i> 비공개 글<br>게시글이 공개되지 않습니다.
                </button>
                <button type="button">
                    <i class="fa fa-unlock"></i> 공개 글<br>누구나 게시글을 볼 수 있습니다.
                </button>
            </div>
        </div> -->

        <!-- Content -->
        <div class="form-section">
            <h2>글 내용</h2>
            <textarea class="form-control" name="content" rows="5" placeholder="글 내용을 입력하세요"></textarea>
        </div>

        <!-- Footer Buttons -->
        <div class="footer-buttons">
            <button type="submit" class="reject">
                <i class="fa fa-times"></i>
            </button>
            <button type="submit" class="approve">
                <i class="fa fa-check"></i>
            </button>
        </div>
    </form>
</div>

