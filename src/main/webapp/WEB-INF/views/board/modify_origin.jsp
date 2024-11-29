<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
    
    .title-font {
    	color: #84540f;
    }
</style>

<div class="container mt-5">
    <!-- 숲 테마 헤더 -->
    <div class="forest-header mb-4">
        <h1>🌲 Forest Board 🌳</h1>
        <p>숲 속 친구들과 함께하는 동호회 </p>
    </div>

    <!-- 메인 카드 -->
    <div class="forest-container">
        <form role="form" action="/board/modify" method="post">
            <!-- Hidden Inputs -->
            <input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>">
            <input type="hidden" name="amount" value="<c:out value='${cri.amount }'/>">
            <input type="hidden" name="type" value="<c:out value='${cri.type }'/>">
            <input type="hidden" name="keyword" value="<c:out value='${cri.keyword }'/>">

            <!-- Form Fields -->
            <div class="mb-3 cute-border">
                <label class="form-label fw-bold">🌿 Board Number</label>
                <input type="text" class="form-control" name="boardNo" value="<c:out value='${board.boardNo}'/>" readonly>
            </div>

            <div class="mb-3 cute-border">
                <label class="form-label fw-bold">🍃 Title</label>
                <input type="text" class="form-control" name="boardTitle" value="<c:out value='${board.boardtitle}'/>">
            </div>

            <div class="mb-3 cute-border">
                <label class="form-label fw-bold">🍄 Content</label>
                <textarea class="form-control" rows="5" name="boardContent"><c:out value="${board.boardContent}"/></textarea>
            </div>

            <div class="mb-3 cute-border">
                <label class="form-label fw-bold">🦊 Nickname</label>
                <input type="text" class="form-control" name="nickname" value="<c:out value='${board.nickname}'/>" readonly>
            </div>

            <div class="mb-3 cute-border">
                <label class="form-label fw-bold">🌼 Registration Date</label>
                <input type="text" class="form-control" name="regDate" value="<fmt:formatDate pattern='yyyy/MM/dd' value='${board.regdate }' />" readonly>
            </div>

            <div class="mb-3 cute-border">
                <label class="form-label fw-bold">🌻 Last Update</label>
                <input type="text" class="form-control" name="updateDate" value="<fmt:formatDate pattern='yyyy/MM/dd' value='${board.updateDate }' />" readonly>
            </div>

            <!-- Buttons -->
            <div class="d-flex justify-content-between">
                <button type="submit" data-oper="modify" class="btn btn-forest">
                    <i class="fa fa-pencil forest-icon"></i> Modify
                </button>
                <button type="submit" data-oper="remove" class="btn btn-danger">
                    <i class="fa fa-trash"></i> Remove
                </button>
                <button type="submit" data-oper="list" class="btn btn-info">
                    <i class="fa fa-list"></i> List
                </button>
            </div>
        </form>
    </div>
</div>

<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
        var formObj = $("form");
        $('button').on("click", function (e) {
            e.preventDefault();
            var operation = $(this).data("oper");
            if (operation === 'remove') {
                formObj.attr("action", "/board/remove");
            } else if (operation === 'list') {
                formObj.attr("action", "/board/list").attr("method", "get");

                var pageNumTag = $("input[name='pageNum']").clone();
                var amountTag = $("input[name='amount']").clone();
                var keywordTag = $("input[name='keyword']").clone();
                var typeTag = $("input[name='type']").clone();

                formObj.empty();
                formObj.append(pageNumTag, amountTag, keywordTag, typeTag);
            }
            formObj.submit();
        });
    });
</script>
