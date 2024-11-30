<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/head.jsp"%>


<style>
body {
	font-family: "Nanum Pen Script", cursive;
	background: linear-gradient(to bottom, #e8f5e9, #c8e6c9);
	color: #4d774e;
}

.container {
	max-width: 1200px;
	margin: auto;	
	padding: 20px;
	max-height: none; /* 댓글 목록의 최대 높이를 설정하지 않음*/
	overflow-y: auto; /* 댓글이 많아지면 스크롤바가 생기도록 함*/
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px;
	background-color: #8d6e63;
	color: white;
	border-radius: 10px;
	margin-bottom: 20px;
}

.header .logo {
	display: flex;
	align-items: center;
	gap: 10px;
}

.header .logo img {
	height: 40px;
}

.sidebar {
	background: #f3f9f1;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

.main-content {
	padding: 20px;
	background: #f9fbe7;
	border-radius: 10px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
	max-height: none; /* 댓글 목록의 최대 높이를 설정하지 않음*/
}

.btn-join {
	background: #81c784;
	color: white;
	border: none;
	padding: 10px 15px;
	border-radius: 30px;
	transition: all 0.3s ease;
}

.btn-join:hover {
	background: #66bb6a;
	transform: scale(1.05);
}

.comment-box {
	margin-top: 20px;
	display: flex;
	align-items: center;
	gap: 10px;
	justify-content: flex-end; /*오른쪽 정렬*/
}

.comment-box input {
	flex-grow: 1;
	padding: 10px;
	border-radius: 10px;
	border: 1px solid #a5d6a7;
	resize: vertical; /*사용자가 입력창을 늘릴수 있게함*/
}

.comment-list {
	margin-top: 10px;
	padding: 10px 0;
	border-top: 1px solid #81c784;
	max-height: none; /* 댓글 목록의 최대 높이를 설정하지 않음*/
	overflow-y: auto; /* 댓글이 많아지면 스크롤바가 생기도록 함*/
}

.comment-item {
	padding: 10px 0;
	border-bottom: 1px dashed #81c784;
}

.profile {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
	margin-bottom: 20px;
}

.profile img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	background-color: #c8e6c9;
}

.content-content {
	max-height: none; /* 댓글 목록의 최대 높이를 설정하지 않음*/
}

</style>
<body>
<div class="container">
	<%@ include file="../includes/header.jsp" %>
	<!-- Header -->
	<div class="header">
		<div class="logo">
			<img src="/path/to/logo.png" alt="Logo">
			<h3>FOREST</h3>
		</div>
		<div>
			<a href="#" class="btn btn-light">로그아웃</a> <span>닉네임</span> <a
				href="#" class="btn btn-light">프로필</a>
		</div>
	</div>

	<!-- 게시글 영역 -->
	<div class="forest-container">
		<div class="content-title">
			<h5 class="form-label fw-bold">게시물 제목</h5>
			<p class="form-control-static">
				<c:out value="${boardDto.boardTitle}" />
			</p>
			<!-- Layout -->
			<div class="row">
				<!-- Sidebar -->
				<div class="col-md-3 sidebar">
					<div class="profile">
						<img src="/path/to/profile.jpg" alt="Profile">
						<p>동호회명 <c:out value="${boardDto.clubNo}"/></p>
					</div>
					<button class="btn btn-join w-100">동호회 가입</button>
					<p>멤버 수: 10명</p>
					<p>리더: 홍길동</p>
				</div>

				<!-- Main Content -->
				 <input type='hidden' value="<c:out value="${boardDto.boardNo}"/>" />
				<div class="col-md-9">
					<div class="main-content">
						<h5><c:out value="${boardDto.boardTitle}"/></h5>

						<div style="text-align: right;"><c:out value="${boardDto.nickname}"/></div>
						<div class="mb-3 cute-border content-content">
							<p class="form-control-static">
								<c:out value="${boardDto.boardContent}" />
							</p>

							<button data-oper='modify'
							class="btn btn-default"
							onclick="location.href='/board/modify?boardNo=<c:out value="${boardDto.boardNo}"/>'">수정</button>
							<button data-oper='list'
							class="btn btn-info"
							onclick="location.href='/board/list'">목록</button>

							<form id='operForm' action="/board/modify" method="get">
								<input type='hidden' id='boardNo' name='boardNo' value='<c:out value="${boardDto.boardNo}"/>'>
							</form>

							<!--
							<div class="comment-box">
								<input type="text" placeholder="댓글을 작성하세요">
								<button class="btn btn-forest">보내기</button>
							</div>

							<div class="comment-list">
								<div class="comment-item">댓글 작성자1: 댓글 내용</div>
								<div class="comment-item">댓글 작성자2: 댓글 내용</div>
							</div> -->

							<!-- 댓글 -->
							<div class="comment-box">
								<!-- <input type="text" id="commentInput" placeholder="댓글을 작성하세요"> -->
								<!-- <button id="commentSubmit" class="btn btn-forest">보내기</button> -->
								<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글작성</button>
							</div>
							<!-- 댓글출력 영역 -->
							<div class="comment-list">
								<ul class="chat" id="commentList">
									<!-- <li class="left clearfix" data-replyNo='12'>
									</li> -->
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 책코드 -->
<!--
<div class='row'>
	<div class="col-lg-12">
		 /.panel
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Reply
			</div>
			
			/.panel-heading
			<div clss="panel-heading">
			<i class="fa fa-comments fa-fw"></i> Reply
				<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
			</div>
			<div class="panel-body">
				<ul class="chat">
					 start reply
					<li class="left clearfix" data-replyNo='replyNo'>
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong>
								<small class="pull-right text-muted">2018-01-01 13:13</small>
							</div>
							<p>Good job!</p>
						</div>
					</li>
					 end reply
				</ul>
				./end ul
			</div>
			./panel .chat-panel
		</div>
	</div>
	./end row
</div> -->

<!--  Modal  -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel" aria-hidden="true">
	 <div class="modal-dialog">
	 	<div class="modal-content">
	 		<div class="modal-header">
	 			<button type="button" class="close" data-dimiss="modal"
	 					aria-hidden="true">&times;</button>
	 			<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
	 		</div>
	 		<div class="modal-body">
	 			<div class="form-group">
	 				<label>ReplyContent</label>
	 				<input  class="form-control" name='replyContent' value='New Reply!!!!'>
	 			</div>
	 			<div class="form-group">
	 				<label>UserNo</label>
	 				<input class="form-control" name='userNo' value='userNo'>
	 			</div>
	 			<div class="form-group">
	 				<label>Reply Date</label>
	 				<input class="form-control" name='replyDate' value=''>
	 			</div>
	 		</div>
	 		<div class="modal-footer">
	 			<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
	 			<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
	 			<button id='modalRegisterBtn' type='button' class='btn btn-default' data-dismiss='modal'>Register</button>
	 			<button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
	
		showList(1);
		function showList(page){
			replyService.getList({boardNo:boardNoValue, page: page||1}, function(list) {
				let str="";
				if(list==null||list.length==0){
					replyUL.html("");
					return;
				}
				
				for (let i = 0, len =list.length || 0; i<len; i++) {
					str+="<li class='left clearfix' data-replyno='"+list[i].replyNo+"'>";
					str+="	<div><div class='header'><strong class='primary-font'>"+list[i].userNo+"</strong>";
					str+="		<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
					str+="		<p>"+(list[i].replyContent || "댓글이 없습니다")+"</p></div></li>";
					console.log(list[i]);
				}
				/* for (let i=0, len = list.length||0; i<len; i++) {
					str+=`
						<li class='left clearfix' data-replyNo='${list[i].replyNo}'>
							<div>
								<div class='header'>
									<strong class='primary-font'>${list[i].userNo}</strong>
									<small class='pull-right text-muted'>${replyService.displayTime(list[i].replyDate)}</small>
								</div>
								<p>${list[i].reply}</p>
							</div>
						</li>
						`;
				} */
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
		
		$("#addReplyBtn").on("click", function(e){
			
			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});
		
		modalRegisterBtn.on("click",function(e){
			let reply= {
					replyContent:modalInputReplyContent.val(),
					userNo:modalInputUserNo.val(),
					boardNo:boardNoValue
			};
			replyService.add(reply, function(result) {
				alert(result);
				
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
		});
		
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