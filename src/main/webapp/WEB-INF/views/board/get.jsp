<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/head.jsp"%>

<body>
<div class="forest-container container">
	<%@ include file="../includes/header.jsp" %>

	<div class="row">
		<%@ include file="../includes/sidebar.jsp" %>
		<!-- Main Content -->
		<input type='hidden' value="<c:out value="${boardDto.boardNo}"/>" />
		<div class="col-md-9 p-0">
			<div class="main-content">
				<h3><c:out value="${boardDto.boardTitle}"/></h3>
				<hr>
				<div class="mb-3 cute-border content-content">
					<p class="form-control-static"><c:out value="${boardDto.boardContent}" /></p>
					<div style="text-align: right;">작성자 <c:out value="${boardDto.nickname}"/></div>
					<hr>
					<button data-oper='modify'
						class="btn btn-forest"
						onclick="location.href='/board/modify?clubNo=${param.clubNo}&boardNo=<c:out value="${boardDto.boardNo}"/>'">수정</button>
					<button data-oper='list'
					class="btn btn-forest"
					onclick="location.href='/board/list?clubNo=${boardDto.clubNo}'">목록</button>
					
					<form id='operForm' action="/board/modify" method="get">
						<input type='hidden' id='boardNo' name='boardNo' value='<c:out value="${boardDto.boardNo}"/>'>
					</form>

					
					<!-- 댓글 -->
					<div class="comment-box mt-5">
						<button id='addReplyBtn' class='btn btn-forest'>댓글작성</button>
					</div>
					<!-- 댓글출력 영역 -->
					<div class="comment-list">
						<ul class="chat" id="commentList">
							<!-- <li class="left clearfix" data-replyNo='12'>
							</li> -->
						</ul>
						<script>
						function fn_replyDel(replyNo,boardNo) {
							if(confirm("삭제하시겠습니까?")) {
								location.href="/board/replyDel?clubNo="+${param.clubNo}+"&replyNo=" + replyNo + "&boardNo=" + boardNo;
							}
						}
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--  Modal  -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel" aria-hidden="true">
	 <div class="modal-dialog">
	 	<div class="modal-content">
	 		<div class="modal-header">
	 			<button type="button" class="close" data-dimiss="modal"
	 					aria-hidden="true">&times;</button>
	 			<h4 class="modal-title" id="myModalLabel">댓글 작성</h4>
	 		</div>
	 		<div class="modal-body">
	 			<div class="form-group">
	 				<label>댓글 내용</label>
	 				<input  class="form-control" name='replyContent' value='New Reply!!!!' maxlength=100>
	 			</div>
	 			<!--div class="form-group">
	 				<label>UserNo</label>
	 				<input class="form-control" name='userNo' value='userNo'>
	 			</div-->
	 			<div class="form-group">
	 				<label>Reply Date</label>
	 				<input class="form-control" name='replyDate' value=''>
	 			</div>
	 		</div>
	 		<div class="modal-footer">
	 			<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
	 			<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
	 			<button id='modalRegisterBtn' type='button' class='btn btn-default' data-dismiss='modal'>댓글등록</button>
	 			<button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
 	 			<!-- <button id='modalClassBtn' type='button' class='btn btn-default' data-dismiss='modal'>Close</button> -->		
	 		<!-- /.modal-content -->
	 	</div>
	 	<!-- /.modal-dialog -->
	 </div>
	 <!-- /.modal -->
</div>

<form id='operForm' action="/board/modify" method="get">
	<input type='hidden' id='boardNo' name='boardNo' value='<c:out value="${board.boardNo}"/>'>
	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
</form>

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
$(document).ready(function(){
	let boardNoValue='<c:out value="${boardDto.boardNo}"/>';
	let replyUL=$(".chat");
	var loginUserNo = '<c:out value="${userNo}"/>'; // 로그인 유저 아이디
	
		showList(1);
		function showList(page){
			
			replyService.getBoardReplyList({boardNo:boardNoValue}, function(list) {
				function aa(){
					if(confirm("삭제?")) {
						location.href="/board/replyDel?replyNo=" + list[i].replyNo + "&boardNo=" + list[i].boardNo;
					}
				}

				let str="";
				if(list==null||list.length==0){
					replyUL.html("<li>댓글이 없습니다</li>");
					return;	
				}
				
				if(list.length==0) {
					str+="<p>댓글이 없습니다</p>";
				} else {
					for (let i = 0, len =list.length || 0; i<len; i++) {
						str+="<li class='left clearfix' data-replyno='"+list[i].replyNo+"'>";
						str+="	<div><strong class='primary-font'> ["+list[i].nickname+"]</strong>"
						if(loginUserNo == list[i].userNo) { // 로그인 유저와 댓글 작성자가 같을때만 삭제 버튼 출력
							str+="<button data-oper='replyDel' class='btn btn-default' onclick='fn_replyDel("+list[i].replyNo+","+list[i].boardNo+");'><b>삭제</b></button>";	
						}
						str+="<br><div>" + list[i].replyContent + "</div>";
						str+="	<div class='text-end'>(" + list[i].wrDate+")</div><hr>";
					}
				}
				replyUL.html(str);
				
			});//end function
		}//end showList
		
		let modal=$(".modal");
		let modalInputReplyContent=modal.find("input[name='replyContent']");
		let modalInputUserNo=modal.find("input[name='userNo']");
		let modalInputReplyDate=modal.find("input[name='replyDate']");
		
		let modalModBtn=$("#modalModBtn");
		let modalRemoveBtn=$("#modalRemoveBtn");
		let modalRegisterBtn=$("#modalRegisterBtn");
		
		let username =null;
		
		<sec:authorize access="isAuthenticated()">
			username='<set:authentication property="principal.username"/>';
		</sec:authorize>

		let csrfHeaderName="${_csrf.headerName}";
		let csrfTokenValue="${_csrf.token}"
			
		$("#addReplyBtn").on("click", function(e){
			modal.find("input").val("");
			modal.find("input[name='username']").val(username);
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});
		
		//Ajax spring security header...
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
		
		modalRegisterBtn.on("click",function(e){
	        let boardNoValue = '<c:out value="${boardDto.boardNo}"/>';
	        let userNoValue = loginUserNo;
			let reply= {
		        	  replyContent: modalInputReplyContent.val(),
		              userNo:userNoValue,
		              boardNo:boardNoValue
			};
			replyService.add(reply, function(result) {
				
				alert((result==='success')?'등록되었습니다':result);
				
				modal.find("input").val("");
				modal.modal("hide");
				
				showList(1);
			});
		});
		
		modalModBtn.on("click", function(e){
			let reply={replyNo:modal.data("replyno"), replyContent:modalInputReplyContent.val()};
			replyService.update(reply, function(result){
				alert(result);
				modal.modal("hide");
				showList(1);
			});
		});
		
		modalRemoveBtn.on("click", function(e){
			let replyNo=modal.data("replyno");
			replyService.remove(replyNo, function(result){
				alert(result);
				modal.modal("hide");
				showList(1);
			});
		});
		
		//댓글 조회 클릭 이벤트 처리
		/*
		$(".chat").on("click", "li", function(e){
			let replyNo=$(this).data("replyno");
			console.log(replyNo);
			
			replyService.get(replyNo, function(reply){
				modalInputReplyContent.val(reply.replyContent);
				modalInputUserNo.val(reply.userNo);
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly","readonly");
				modal.data("replyno", reply.replyNo);
				
				modal.find("button[id !='modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$(".modal").modal("show");
			});
		});*/
		
		//"Close"버튼 클릭시 모달 닫는 코드
		$('#modalCloseBtn').click(function(){
			$('#myModal').modal('hide'); //모달 숨기기
		});
		
		
		

			
/* 		//댓글 입력 이벤트
		$("#commentSubmit").on("click", function() {
			let commentContent=$("#commentInput").val();
			if(!commentContent){
				alert("댓글내용을 입력해주세요.");
				return;
			}
			replyService.add({replyContent: commentContent, userNo:4,boardNo:boardNoValue}, function(result) {
				alert("댓글이 등록되었습니다.");
				$("#commentInput").val(""); //입력창 초기화
				showList(1);//리스트 갱신
			});
		});
		
		//초기 댓글 리스트 로드
		showList(1); */
});
</script>

<!-- <script>
console.log("=========");
console.log("JS TEST");
let boardNoValue='<c:out value="${boardDto.boardNo}"/>';

replyService.get(30, function(data){
	console.log(data);
}) 

//30번 댓글 수정
replyService.update({
	replyNo:30,
	boardNo:boardNoValue,
	reply: "Modified Reply..."}
	, function(result) {
		alert("수정 완료...");
	}
);

//35번 댓글 삭제 테스트
replyService.remove(35, function(count) {
	console.log(count);
	
	if(conut==="success"){
		alert("REMOVED");
	}
}, function(err) {
	alert('ERROR...');
});

replyService.getList(
		{boardNo:boardNoValue, page:1}, 
		function(list){
			console.log("list: ", list)
			for(let i =0, len=list.length||0; i< len; i++){
				console.log(list[i]);
			}
		}
);

console.log(boardNoValue); */
//for replyService add test
replyService.add(
		{replyContent:"JS Test", userNo:4, boardNo:boardNoValue},
		function(result){
			alert("RESULT: "+result);
		}
);
</script> -->

<script type="text/javascript">
$(document).ready(function() {
	console.log(replyService);
});
</script>
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
