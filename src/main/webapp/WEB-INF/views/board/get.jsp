<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Bootstrap & Custom Fonts -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
    /* 숲 테마 스타일 */
    body {
        font-family: "Nanum Pen Script", cursive;
        font-weight: 400;
        font-style: normal;
        background: linear-gradient(to bottom, #e8f5e9, #c8e6c9);
        color: #4d774e;
    }

    .forest-container {
        background: #f3f9f1;
        border-radius: 20px;
        padding: 20px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    .forest-header {
        background: linear-gradient(to right, #81c784, #66bb6a);
        border-radius: 15px;
        color: white;
        padding: 15px;
        text-align: center;
    }

    .forest-header h1 {
        font-size: 2.5rem;
        font-weight: bold;
        text-shadow: 2px 2px #2e7d32;
    }

    .btn-forest {
        background: #a5d6a7;
        border: none;
        color: white;
        padding: 10px 20px;
        border-radius: 30px;
        transition: transform 0.3s, background 0.3s;
    }

    .btn-forest:hover {
        background: #81c784;
        transform: scale(1.1);
    }

    .forest-icon {
        color: #4caf50;
        margin-right: 10px;
    }

    .cute-border {
        border: 2px dashed #81c784;
        padding: 10px;
        border-radius: 10px;
    }

    .form-label {
        color: #84540f;
    }

    .comment-box {
        border: 1px solid #a5d6a7;
        border-radius: 8px;
        padding: 10px;
    }

    .comment-box input {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border-radius: 5px;
        border: 1px solid #81c784;
    }

    .comment-list {
        margin-top: 20px;
    }

    .comment-item {
        padding: 10px;
        border-bottom: 1px dashed #81c784;
    }

    .comment-item .author {
        font-weight: bold;
    }
    
    .content-title {
    	height: 80px;
    }
    
    .content-content {
    	height: 370px;
    }
</style>

<!-- <div class="container mt-5">
    숲 테마 헤더
    <div class="forest-header mb-4">
        <h1>🌲 Forest Board 🌳</h1>
        <p>숲 속 친구들과 함께하는 동호회</p>
    </div> -->

    <!-- 게시글 영역 -->
    <div class="forest-container">
        <div class="content-title">
            <h5 class="form-label fw-bold">게시물 제목</h5>
            <p class="form-control-static"><c:out value="${boardDto.boardTitle}"/></p>
        </div>

        <div class="mb-3 cute-border content-content">
            <h5 class="form-label fw-bold">게시물 상세 내용</h5>
            <p class="form-control-static"><c:out value="${boardDto.boardContent}"/></p>
        </div>

        <!-- 댓글 작성 영역 -->
        <div class="comment-box">
            <label for="comment-input" class="form-label">댓글을 작성하세요</label>
            <form action="/board/addComment" method="post">
                <input type="text" id="comment-input" name="comment" placeholder="댓글을 작성하세요" required>
                <button class="btn btn-forest" type="submit">
                    <i class="fa fa-comment forest-icon"></i> 보내기
                </button>
            </form>
        </div>

        <!-- 댓글 목록 -->
        <div class="comment-list">
            <!-- <c:forEach var="comment" items="${board.comments}">
                <div class="comment-item">
                    <p class="author"><c:out value="${comment.author}"/></p>
                    <p class="content"><c:out value="${comment.content}"/></p>
                </div>
            </c:forEach> -->
        </div>

        <!-- 버튼들 -->
        <div class="d-flex justify-content-between mt-4">
            <a href="/board/modify?boardNo=<c:out value='${boardDto.boardNo}'/>" class="btn btn-forest">
                <i class="fa fa-pencil forest-icon"></i> 수정
            </a>
            <a href="/board/delete?boardNo=<c:out value='${boardDto.boardNo}'/>" class="btn btn-danger">
                <i class="fa fa-trash"></i> 삭제
            </a>
            <a href="/board/list" class="btn btn-info">
                <i class="fa fa-list"></i> 목록
            </a>
        </div>
    </div>
</div>

