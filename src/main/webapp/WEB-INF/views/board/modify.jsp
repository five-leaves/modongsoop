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
					<input type='hideen' name='clubNo' value='<c:out value="${boardDto.clubNo}"/>'>
					<input type='hideen' name='userNo' value='<c:out value="${boardDto.userNo}"/>'>
					<input type="hidden" name="_csrf" value="${_csrf.token}" />
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
							<label>작성자</label> <input class="form-control" name='nickname'
								value='<c:out value="${boardDto.nickname}"/>' readonly="readonly">
						</div>

						<div class="form-group">
							<label>동호회</label> <input class="form-control" name='clubName'
								value='<c:out value="${boardDto.clubName}"/>' readonly="readonly">
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
	var loginUserNo = '<c:out value="${userNo}"/>'; // 로그인 유저 아이디
	
	$('button').on("click", function(e){
		e.preventDefault();
		var operation=$(this).data("oper");
		console.log(operation);
		let userNo=$("input[name='userNo']").clone();
		
		if(operation==='remove') {
			if(loginUserNo != userNo.val()) {
				alert("삭제 권한이 없습니다.");
				return;
			} else {
				if(!confirm("삭제하시겠습니까?")) return;
				else formObj.attr("action","/board/remove");
			}
		} else if(operation==='list') {
			//move to list
			formObj.attr("action","/board/list").attr("method","get");
			let pageNumTag=$("input[name='pageNum']").clone();
			let amountTag=$("input[name='amount']").clone();
			let boardNo=$("input[name='boardNo']").clone();
			let clubNo=$("input[name='clubNo']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(boardNo);
			formObj.append(clubNo);
		} else if(operation==='modify') {
			//let boardTitle=$("input[name='boardTitle']").clone().val();
			//let boardContent=$("input[name='boardContent']").clone().val();
			//let trimBoardTitle = boardTitle.replace(/\s+/g, "");
			//let trimBoardContent = boardContent.replace(/\s+/g, "");
			//let trimBoardTitleLen = trimBoardTitle.length;
			//let trimBoardContentLen = trimBoardContent.length;
			//if(boardTitle.length === 0 || boardContent.length === 0) {
			//	alert("제목과 내용을 반드시 입력 하세요");
			//	return;
			//}
			if(!confirm("저장하시겠습니까?")) {
				return;
			}
		}
		
		formObj.submit();
	});
});
</script>

</body>

<%@include file="../includes/foot.jsp"%>