<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/head.jsp"%>
<body>
	<%@include file="../includes/header.jsp"%>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">게시글 수정</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-heading">게시글 수정</div>
				<!-- /.panel-heading -->
				<div class="panel-body">

					<form role="form" action="/board/modify" method="post">
					
					<!-- 추가 -->
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
					<input type='hideen' name='amount' value='<c:out value="${cri.amount}"/>'>
						<div class="form-group">
							<label>게시판번호</label> <input class="form-control" name='boardNo'
								value='<c:out value="${boardDto.boardNo}"/>' readonly="readonly">
						</div>

						<div class="form-group">
							<label>제목</label> <input class="form-control" name='boardTitle'
								value='<c:out value="${boardDto.boardTitle}"/>'>
						</div>

						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name='boardContent'><c:out value="${boardDto.boardContent}" />
							</textarea>
						</div>

						<div class="form-group">
							<label>작성자</label> <input class="form-control" name='userNo'
								value='<c:out value="${boardDto.userNo}"/>' readonly="readonly">
						</div>

						<div class="form-group">
							<label>동호회</label> <input class="form-control" name='clubNo'
								value='<c:out value="${boardDto.clubNo}"/>' readonly="readonly">
						</div>
						
						<div class="form-group">
							<label>작성일</label> <input class="form-control" name='regdate'
								value='<fmt:formatDate pattern="yyyy/MM/dd" value= "${boardDto.regdate}"/>' readonly="readonly">
						</div>
						
						<div class="form-group">
							<label>수정일</label> <input class="form-control" name='updateDate'
								value='<fmt:formatDate pattern="yyyy/MM/dd" value= "${boardDto.updateDate}"/>' readonly="readonly">
						</div>
						
						<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
						<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
						<button type="submit" data-oper='list' class="btn btn-info">목록</button>
					</form>

				</div>
				<!--  end panel-body -->

			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->
	
<script type="text/javascript">
$(document).ready(function() {
	var formObj=$("form");
	$('button').on("click", function(e){
		e.preventDefault();
		var operation=$(this).data("oper");
		console.log(operation);
		
		if(operation==='remove'){
			formObj.attr("action","/board/remove");
		}else if(operation==='list'){
			//move to list
			formObj.attr("action","/board/list").attr("method","get");
			let pageNumTag=$("input[name='pageNum']").clone();
			let amountTag=$("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
		}
		formObj.submit();
	});
});
</script>

</body>

<%@include file="../includes/foot.jsp"%>