<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/head.jsp"%>
<body>
	<div class="container forest-container">
		<%@include file="../includes/header.jsp"%>
		<!-- 검색 결과 -->
		<h2>검색 결과</h2>
		<c:if test="${not empty searchedClub}">
			<div class="row">
	        	<c:if test="${empty searchedClub}">
	        		<div class="col h4">없음</div>
	        	</c:if>
			    <c:forEach items="${searchedClub}" var="club">
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
		</c:if>

		<!-- 검색 결과가 없는 경우 -->
		<c:if test="${empty searchedClub}">
			<h3>검색 결과가 존재하지 않습니다.</h3>
		</c:if>
	</div>
</body>
<%@include file="../includes/foot.jsp" %>