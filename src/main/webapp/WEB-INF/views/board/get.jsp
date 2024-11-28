<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/head.jsp"%>
<body>
	<%@include file="../includes/header.jsp"%>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">게시글 조회</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-heading">게시글 조회</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="form-group">
						<label>게시판번호</label> <input class="form-control" name='boardNo'
							value='<c:out value="${boardDto.boardNo}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>제목</label> <input class="form-control" name='boardTitle'
							value='<c:out value="${boardDto.boardTitle}"/>'
							readonly="readonly">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='boardContent'
							readonly="readonly"><c:out
								value="${boardDto.boardContent}" /></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='userNo'
							value='<c:out value="${boardDto.userNo}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>동호회</label> <input class="form-control" name='clubNo'
							value='<c:out value="${boardDto.clubNo}"/>' readonly="readonly">
					</div>
					<button data-oper='modify'
							class="btn btn-default"
							onclick="location.href='/board/modify?boardNo=<c:out value="${boardDto.boardNo}"/>'">수정</button>
					<button data-oper='list'
							class="btn btn-info"
							onclick="location.href='/board/list'">목록</button>
					<form id='operForm' action="/board/modify" method="get">
						<input type='hidden' id='boardNo' name='boardNo' value='<c:out value="${boardDto.boardNo}"/>'>
					</form>

				</div>
				<!--  end panel-body -->

			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->
</body>

<script type="text/javascript">
$(document).ready(function() {
	var operForm=$("#opperForm");
	$("button[data-oper='modify']").on("click",function(e) {
		operForm.attr("action","/board/modify").submit();
	});
	$("button[data-oper='list']").on("click",function(e){
		operForm.find('#boardNo').remove();
		operForm.attr("action","/board/list")
		operForm.submit();
	});
});
</script>

<%@include file="../includes/foot.jsp"%>