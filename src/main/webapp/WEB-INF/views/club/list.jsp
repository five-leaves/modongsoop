<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/head.jsp" %>
<body>
<!-- Clubs Section -->
    <div class="container forest-container">
		<%@include file="../includes/header.jsp" %>
        <!-- 내가 가입한 동호회 -->
        <h2>내가 가입한 동호회</h2>
        <div class="row row-cols-2 row-cols-md-4 g-4">
        	<!-- 동호회 등록 -->
        	<div class="col">
		            <div class="club-card mb-2">
		                <p>+</p>
		                <p>동호회 만들기</p>
		            </div>
	            </div>
            <!-- 동호회 카드 목록-->
            <c:forEach items="${myClubList}" var="club">
            	<div class="col">
		            <div class="club-card mb-2">
		                <img src=<c:out value="${club.clubProfile ? club.clubProfile : '/resources/img/club_placeholder.png'}"/> alt="동호회 이미지">
		                <p>동호회 이름</p>
		                <p class="badge bg-primary"><c:out value="${club.categoryName}" /></p>
		                <p>회원 수: <c:out value="${club.memberCount}"/></p>
		                <p class="mb-0">가입일: <fmt:formatDate pattern="yyyy.MM.dd" value="${club.regdate}"/></p>
		            </div>
	            </div>
	        </c:forEach>
        </div>
		<hr>
        <!-- 카테고리 -->
        <h2 class="mt-5">카테고리</h2>
        <div class="d-flex flex-wrap">
        	<button class="category-button active" onclick="location.href='?'">전체</button>
        	<c:forEach items="${categoryList}" var="category">
        		<button class="category-button" onclick="location.href='?categoryNo=<c:out value="${category.categoryNo}" />'"><c:out value="${category.categoryName}" /></button>
        	</c:forEach>
        </div>

        <!-- 신규 동호회 -->
        <h2 class="mt-5">전체 동호회</h2>
        <div class="row">
        	<c:forEach items="${allClubList}" var="club">
	            <div class="col-6 col-md-6 mb-4">
	                <div class="club-card">
	                    <img src=<c:out value="${club.clubProfile ? club.clubProfile : '/resources/img/club_placeholder.png'}"/> alt="동호회 이미지">
	                    <p><c:out value="${club.clubName}" /></p>
	                    <p class="text-muted">동호회 설명</p>
	                    <p class="badge bg-primary"><c:out value="${club.categoryName}" /></p>
	                    <p>회원 수: <c:out value="${club.memberCount}"/></p>
	                </div>
	            </div>
	        </c:forEach>
        </div>
    </div>
</body>
<%@include file="../includes/foot.jsp" %>