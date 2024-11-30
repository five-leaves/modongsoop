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

.pagnation {
	display: flex; /* 가로로 나열*/
	list-style:none; /*기본 목록 스타일 제거*/
	padding: 0; /* 기본 여백 제거 */
	margin: 0; /* 기본 여백 제거 */
}

.pagnation li {
	margin: 0 5px; /* 각 페이지 번호 간격 조정*/
}

.pagnation a {
	text-decoration: none; /* 밑줄 제거 */
	color: #4d774e; /* 페이지 번호 색상 */
	padding: 5px 10px;
	border: 1px solid #4d774e; /* 테두리 추가 */
	border-radius: 5px;
	transition: background-color 0.3s ease; /* 호버 효과 추가 */
}

.pagnation a:hover {
	background-color: #c8e6c9; /* 호버 시 배경색*/
}

.pagnation .active a {
	background-color: #81c784; /* 현재 페이지 배경색 */
	color: white; /* 글자 색상 */
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
				<c:choose>
				    <c:when test="${empty clubDto.clubProfile}">
				        <img src="/resources/img/club_placeholder.png" alt="동호회 이미지" />
				    </c:when>
				    <c:otherwise>
				        <img src="/display?fileName=${clubDto.clubProfile}" alt="동호회 이미지" />
				    </c:otherwise>
				</c:choose>
				<p><c:out value="${clubDto.clubName}" /></p>
			</div>
			<!-- 동호회 멤버이면 버튼 숨기기 -->
			<c:choose> 
				<c:when test="${isMember == 0}">
					<form id="joinForm" action="/club/join" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<input type="hidden" name="clubNo" value="${param.clubNo}" />
						<button id="joinBtn" class="btn btn-join w-100">동호회 가입</button>
					</form>
				</c:when>
				<c:otherwise>
					<form id="withdrawForm" action="/club/withdraw" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<input type="hidden" name="clubNo" value="${param.clubNo}" />
						<button id="joinBtn" class="btn btn-join w-100">동호회 탈퇴</button>
					</form>
				</c:otherwise>
			</c:choose>
			<button id='regBtn' type="button" class="btn btn-join w-100">새글작성</button>
			<p>멤버 수: <c:out value="${clubMemberCount}"/></p>
			<p>리더: <c:out value="$clubDto" /></p>
		</div>

		<!-- Main Content -->
		<div class="main-content">
			<div>
				<input type="text" class="form-control mb-3" placeholder="글 내용 검색">
				<div class="mb-3">
					<div class="form-control" >
						동호회 소개 및 정보
						
							<div>나이제한: 
								<c:if test="${clubDto.ageMin != 0}"><span id="ageMin"><c:out value="${clubDto.ageMin}"/></span></c:if>
								~ <c:if test="${clubDto.ageMax != 0}"><span id="ageMax"><c:out value="${clubDto.ageMax}"/></span></c:if>
							</div>
						
						<div><c:out value="${clubDto.clubContent}"/></div>
					</div>
					
				</div>
			</div>

			<!-- Post Cards -->
			<div class="row">
				<c:forEach items="${list}" var="boardDto">
					<a class='move' href='<c:out value="${boardDto.boardNo}"/>'>
						<div class="post-card">
							<input type="hidden" value='<c:out value="${boardDto.boardNo}" />'/>
							<input type="hidden" value='<c:out value="${boardDto.clubNo}" />'/>
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
				
				<div class='pull-right'>
					<ul class="pagnation">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="paginate_button ${pageMaker.cri.pageNum==num ? "active":""}"><a href="${num}">${num}</a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="${pageMaker.endPage+1}">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!-- end Pagination -->

			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        처리가 완료되었습니다.
      </div>
      <div class="modal-footer">
<!--          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>-->
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<form id='actionForm' action="/board/list" method='get'>
	<input type="hidden" name="clubNo" value="${param.clubNo}" />
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}' />
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}' />
</form>

<script type="text/javascript">
	$(document).ready(function() {
	    let result = '<c:out value="${result}"/>';
	    let isClub = '<c:out value="${isClub}"/>';
	    let isJoin = '<c:out value="${isJoin}"/>';
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
			if (parseInt(result) > 0 && isClub !== '') {
				$(".modal-body").html(
						"동호회 등록 완료되었습니다.");
			}
			if (isJoin !== '') {
				$(".modal-body").html(
						"동호회 가입 완료되었습니다.");
			}
			$("#myModal").modal("show");
		}
		$('#regBtn').on("click", function() {
			self.location="/board/register";
		});
		let actionForm=$("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='boardNo' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/board/get");
			actionForm.submit();
		});
		
		// 가입시 나이제한 확인
		let userAge = '<c:out value="${userAge}"/>';
		userAge = userAge.slice(0, 4);
		$("#joinBtn").click(function (e) {
			if ($('#ageMin').val() <= userAge || userAge >= $('#ageMax').val()) {
				e.preventDefault(); // 폼 전송 중지
                alert("가입할 수 없습니다.");
				return;
			}
		})
			
	});
	</script>
	 
	<%@ include file="../includes/foot.jsp" %>
