<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Bootstrap & Custom Fonts -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

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
				<c:out value="${board.boardTitle}" />
			</p>
			<!-- Layout -->
			<div class="row">
				<!-- Sidebar -->
				<div class="col-md-3 sidebar">
					<div class="profile">
						<img src="/path/to/profile.jpg" alt="Profile">
						<p>동호회명</p>
					</div>
					<button class="btn btn-join w-100">동호회 가입</button>
					<p>멤버 수: 10명</p>
					<p>리더: 홍길동</p>


					<!-- Main Content -->
					<div class="col-md-9">
						<div class="main-content">
							<h5>게시물 제목</h5>


							<div class="mb-3 cute-border content-content">
								<h5 class="form-label fw-bold">게시물 상세 내용</h5>
								<p class="form-control-static">
									<c:out value="${boardDto.boardContent}" />
								</p>

								<a href="/board/modify" class="btn btn-secondary btn-sm"> <i
									class="fa fa-pencil"></i> 수정
								</a>

								<!-- 댓글 -->
								<div class="comment-box">
									<input type="text" placeholder="댓글을 작성하세요">
									<button class="btn btn-forest">보내기</button>
								</div>

								<div class="comment-list">
									<div class="comment-item">댓글 작성자1: 댓글 내용</div>
									<div class="comment-item">댓글 작성자2: 댓글 내용</div>
								</div>
							</div>
						</div>
					</div>
				</div>