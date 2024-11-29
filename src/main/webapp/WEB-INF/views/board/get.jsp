<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
}

.comment-box input {
	flex-grow: 1;
	padding: 10px;
	border-radius: 10px;
	border: 1px solid #a5d6a7;
}

.comment-list {
	margin-top: 10px;
	padding: 10px 0;
	border-top: 1px solid #81c784;
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
	height: 370px;
}
</style>

<body>
	<div class="container">
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
							<p>
								동호회명
								<c:out value="${boardDto.clubNo}" />
							</p>
						</div>
						<button class="btn btn-join w-100">동호회 가입</button>
						<p>멤버 수: 10명</p>
						<p>리더: 홍길동</p>
					</div>

					<!-- Main Content -->
					<div class="col-md-9">
						<div class="main-content">
							<h5>
								<c:out value="${boardDto.boardTitle}" />
							</h5>
							<div>
								작성자 번호:
								<c:out value="${boardDto.userNo}" />
							</div>
							<div class="mb-3 cute-border content-content">
								<p class="form-control-static">
									<c:out value="${boardDto.boardContent}" />
								</p>
								<button data-oper='modify' class="btn btn-default"
									onclick="location.href='/board/modify?boardNo=<c:out value="${boardDto.boardNo}"/>'">수정</button>
								<button data-oper='list' class="btn btn-info"
									onclick="location.href='/board/list'">목록</button>

								<form id='operForm' action="/board/modify" method="get">
									<input type='hidden' id='boardNo' name='boardNo'
										value='<c:out value="${boardDto.boardNo}"/>'>
								</form>

								<!-- 댓글 -->
								<div class="comment-box">
									<input type="text" id="replyInput" placeholder="댓글을 작성하세요">
									<button class="btn btn-forest" id="replySubmit">보내기</button>
								</div>

								<div class="comment-list" id="commentList">
									<!-- 댓글 아이템 -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id='operForm' action="/board/modify" method="get">
		<input type='hidden' id='boardNo' name='boardNo' value='<c:out value="${board.boardNo}"/>'>
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
		<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	</form>

	<script src="/resources/js/reply.js"></script>
	<script>
	$(document).ready(function() {
		let boardNo = '<c:out value="${boardDto.boardNo}"/>';
		let commentList = $("#commentList");

		// 댓글 리스트 보여주기
		function loadComments() {
			replyService.getList({ boardNo: boardNo, page: 1 }, function(list) {
				let html = "";
				if (list && list.length > 0) {
					list.forEach(reply => {
						html += `
							<div class="comment-item" data-rno="${reply.reply_no}">
								<strong>${reply.replyer}</strong> <small>${reply.replyDate}</small>
								<p>${reply.reply}</p>
							</div>
						`;
					});
				} else {
					html = "<p>댓글이 없습니다.</p>";
				}
				commentList.html(html);
			})
		}


			let operForm=$("#opperForm");
			$("button[data-oper='modify']").on("click",function(e) {
				operForm.attr("action","/board/modify").submit();
			});

			// 댓글 작성
			$("#replySubmit").click(function() {
				let reply = $("#replyInput").val();
				if (!reply.trim()) {
					alert("댓글을 입력하세요!"); // ...안해...퉤!
					return;
				}
				replyService.add({ reply: reply, replyer: "익명", boardNo: boardNo }, function(result) {
					if (result === "success") {
						$("#replyInput").val("");
						loadComments();
					} else {
						alert("댓글 등록에 실패했습니다.");
					}
				});
			});
	})
	</script>
<%@include file="../includes/foot.jsp"%>
