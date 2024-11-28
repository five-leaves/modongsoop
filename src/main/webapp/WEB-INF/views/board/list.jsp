<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Bootstrap & Fonts -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
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

.left-panel {
	width: 25%;
	background: #f3f9f1;
	border-radius: 10px;
	padding: 15px;
	margin-right: 20px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

.left-panel button {
	width: 100%;
	margin-bottom: 10px;
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

.main-content {
	width: 75%;
	background: #f9fbe7;
	border-radius: 10px;
	padding: 15px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

.post-card {
	position: relative;
	padding-bottom: 40px;
	border: 1px solid #c8e6c9;
	border-radius: 10px;
	padding: 10px;
	margin-bottom: 15px;
}

.post-card h5 {
	font-size: 1.2rem;
}

.post-footer {
	position: absolute; 
	bottom: 10px; 
	left: 10px; 
	right: 10px;
	display: flex; 
	justify-content: space-between; 
	font-size: 0.9rem;
}

.post-footer i {
	color: #ff6f61;
}

.row {
	display: flex;
	flex-wrap: wrap;
}

.post-card {
	flex: 0 0 48%;
	margin: 1%;
	height: 200px;
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
		</div>

		<!-- Main Content -->
		<div class="main-content">
			<div>
				<input type="text" class="form-control mb-3" placeholder="글 내용 검색">
				<div class="mb-3">
					<div class="form-control" >동호회 소개 및 정보</div>
				</div>
			</div>

			<!-- Post Cards -->
			<div class="row">
				<div class="post-card">
					<h5>게시글</h5>
					<div class="post-footer">
						<span><i class="fa fa-heart"></i> 좋아요</span> <span>생성일</span>
					</div>
				</div>
				<div class="post-card">
					<h5>게시글</h5>
					<p>이곳에 게시글 내용을 추가하세요.</p>
					<div class="post-footer">
						<!-- 왼쪽: 좋아요 -->
						<span> <i class="fa fa-heart"></i> 좋아요
						</span>
						<!-- 오른쪽: 생성일 -->
						<span>생성일</span>
					</div>
				</div>
				<div class="post-card">
					<h5>게시글</h5>
					<div class="post-footer">
						<span><i class="fa fa-heart"></i> 좋아요</span> <span>생성일</span>
					</div>
				</div>
				<div class="post-card">
					<h5>게시글</h5>
					<div class="post-footer">
						<span><i class="fa fa-heart"></i> 좋아요</span> <span>생성일</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
