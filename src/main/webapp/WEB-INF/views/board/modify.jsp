<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/head.jsp"%>
<div class="forest-container">
	<%@include file="../includes/header.jsp" %>
	<div class="row">
		<h1 class="mb-4">게시글 수정</h1>
		<form id="modifyForm" action="/board/modify" method="post">
			<!-- 추가 -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
			<input type="hidden" name='clubNo' value='<c:out value="${boardDto.clubNo}"/>'>
			<input type="hidden" name='userNo' value='<c:out value="${boardDto.userNo}"/>'>
			<input type="hidden" name="_csrf" value="${_csrf.token}" />
			<input type="hidden" class="form-control" name='boardNo' value='<c:out value="${boardDto.boardNo}"/>'>
			<input type="hidden" class="form-control" name='nickname'	value='<c:out value="${boardDto.nickname}"/>' >
			<input type="hidden" class="form-control" name='clubName' value='<c:out value="${boardDto.clubName}"/>' >

			<div class="form-group">
				<label class="h3">제목</label> <input class="form-control" name='boardTitle'
					value='<c:out value="${boardDto.boardTitle}"/>'>
			</div>

			<div class="form-group mb-5">
				<label class="h3">내용</label>
				<textarea class="form-control" rows="5" name='boardContent'><c:out value="${boardDto.boardContent}" />
				</textarea>
			</div>

			<button type="submit" data-oper='modify' class="btn btn-forest">수정</button>
			<button type="submit" data-oper='remove' class="btn btn-forest">삭제</button>
			<button type="submit" data-oper='list' class="btn btn-forest">목록</button>
		</form>
	</div>
</div>
	
<script type="text/javascript">
$(document).ready(function() {
	var formObj=$("#modifyForm");
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
			if(loginUserNo != userNo.val()) {
				e.preventDefault();
				alert("수정 권한이 없습니다.");
				return;
			} else {
				let boardTitle=$("input[name='boardTitle']").clone().val();
				let boardContent=$("textarea[name='boardContent']").clone().val();
				let trimBoardTitle = boardTitle.replace(/\s+/g, "");
				let trimBoardContent = boardContent.replace(/\s+/g, "");
				let trimBoardTitleLen = trimBoardTitle.length;
				let trimBoardContentLen = trimBoardContent.length;
				if(boardTitle.length === 0 || boardContent.length === 0) {
					alert("제목과 내용을 반드시 입력 하세요");
					return;
				}
				if(!confirm("저장하시겠습니까?")) {
					return;
				}
			}
		}
		
		formObj.submit();
	});
});
</script>

</body>

<%@include file="../includes/foot.jsp"%>