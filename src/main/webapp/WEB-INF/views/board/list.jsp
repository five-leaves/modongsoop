<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/head.jsp" %>

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
<body>
	<%@ include file="../includes/header.jsp" %>
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
				<c:forEach items="${list}" var="boardDto">
					<a href='/board/get?boardNo=<c:out value="${boardDto.boardNo}"/>'>
						<div class="post-card">
							<input type="hidden" value='<c:out value="${boardDto.boardNo}" />'/>
							<h5><c:out value="${boardDto.boardTitle}" /></h5>
							<div><c:out value="${boardDto.userNo}" /></div>
							<p><c:out value="${boardDto.boardContent}" /></p>
							<div class="post-footer">
								<!-- 왼쪽: 좋아요 -->
								<span> <i class="fa fa-heart"></i> 좋아요
								</span>
								<!-- 오른쪽: 생성일 -->
								<span>생성일 <fmt:formatDate pattern="yyyy-MM-dd" value="${boardDto.regdate}" /></span>
							</div>
						</div>
					</a>
			</c:forEach>

			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="myModalLabel">Modal title</h4>
										</div>
										<div class="modal-body">처리가 완료되었습니다.</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary">Save
												changes</button>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<!-- /.modal -->
<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		history.replaceState({},null,null);
		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}
			if (parseInt(result) > 0) {
				$(".modal-body").html(
						"게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
		$('#regBtn').on("click", function() {
			self.location="/board/register";
		});
	});
	</script>
	</body>     
	<%@ include file="../includes/foot.jsp" %>