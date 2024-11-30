<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/head.jsp" %>
<body>
<!-- Clubs Section -->
    <div class="forest-container">
		<%@include file="../includes/header.jsp" %>
        <!-- 내가 가입한 동호회 -->
        <h2>내가 가입한 동호회</h2>
        <div class="row row-cols-2 row-cols-md-4 row-cols-lg-6 scroll-container">
        	<!-- 동호회 등록 -->
        	<div class="col">
	        	<a class="club-link" href='/club/register'>
		            <div class="club-card mb-2 d-flex">
		                <p class="h2">동호회 만들기</p>
		            </div>
		        </a>
	        </div>
            <!-- 동호회 카드 목록-->
            <c:forEach items="${myClubList}" var="club">
            	<div class="col">
            		<a class="club-link" href='/board/list?clubNo=<c:out value="${club.clubNo}" />'>
			            <div class="club-card mb-2">
			                <c:choose>
							    <c:when test="${empty club.clubProfile}">
							        <img src="/resources/img/club_placeholder.png" alt="동호회 이미지" />
							    </c:when>
							    <c:otherwise>
							        <img src="/display?fileName=${club.clubProfile}" alt="동호회 이미지" />
							    </c:otherwise>
							</c:choose>
			                <p class="h4 text-ellipsis-online"><c:out value="${club.clubName}" /></p>
			                <p class="mb-0">회원 수: <c:out value="${club.memberCount}"/></p>
			                <p class="mb-0">가입일: <fmt:formatDate pattern="yyyy.MM.dd" value="${club.regdate}"/></p>
			            </div>
			        </a>
	            </div>
	        </c:forEach>
        </div>
		<hr>
        <!-- 카테고리 -->
        <h2 class="mt-4">카테고리</h2>
        <div class="d-flex flex-wrap">
        	<button class="category-button active" onclick="location.href='?'">전체</button>
        	<c:forEach items="${categoryList}" var="category">
        		<button class="category-button" onclick="location.href='?categoryNo=<c:out value="${category.categoryNo}" />'"><c:out value="${category.categoryName}" /></button>
        	</c:forEach>
        </div>

        <!-- 전체 동호회 -->
        <h2 class="mt-5">전체 동호회</h2>
        <div class="row">
		    <c:forEach items="${allClubList}" var="club">
		        <div class="col-6 col-md-6 mb-4">
		            <a class="club-link" href='/board/list?clubNo=<c:out value="${club.clubNo}" />'>
		                <div class="club-card-lg  d-flex align-items-center">
		                    <c:choose>
		                        <c:when test="${club.clubProfile == '' || empty club.clubProfile}">
		                            <img src="/resources/img/club_placeholder.png" alt="동호회 이미지" class="club-img" />
		                        </c:when>
		                        <c:otherwise>
		                            <img src="/display?fileName=${club.clubProfile}" alt="동호회 이미지" class="club-img" />
		                        </c:otherwise>
		                    </c:choose>
		                    <div class="club-info ms-3">
		                        <p class="m-1 h2"><c:out value="${club.clubName}" /></p>
		                        <p class="m-1 text-ellipsis"><c:out value="${club.clubContent}" /></p>
		                        <p class="badge bg-category m-1"><c:out value="${club.categoryName}" /></p>
		                        <p class="m-1">회원 수: <c:out value="${club.memberCount}"/></p>
		                    </div>
		                </div>
		            </a>
		        </div>
		    </c:forEach>
		</div>

    </div>
</body>
<%@include file="../includes/foot.jsp" %>