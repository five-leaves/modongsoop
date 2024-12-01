<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
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
		<p class="h3"><c:out value="${clubDto.clubName}" /></p>
	</div>
	
	<button id='regBtn' type="button" class="btn btn-forest w-100 mb-2">새글작성</button>
	
	<!-- 동호회 관리 버튼 -->
	<c:if test="${isLeader}">
		<form id="settingForm" action="/club/modify" method="get">
			<input type="hidden" name="clubNo" value="${param.clubNo}" />
			<button id="settingBtn" class="btn btn-forest w-100 mb-2">동호회 관리</button>
		</form>
	</c:if>
	
	<!-- 동호회 멤버이면 버튼 숨기기 -->
	<c:choose> 
		<c:when test="${isMember == 0}">
			<form id="joinForm" action="/club/join" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" name="clubNo" value="${param.clubNo}" />
				<button id="joinBtn" class="btn btn-forest w-100 mb-2">동호회 가입</button>
			</form>
		</c:when>
		<c:otherwise>
			<form id="withdrawForm" action="/club/withdraw" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" name="clubNo" value="${param.clubNo}" />
				<button id="withdrawBtn" class="btn btn-forest w-100 mb-2">동호회 탈퇴</button>
			</form>
		</c:otherwise>
	</c:choose>
	<br/>
	<div class="b-info">
		<p class="mb-2 h5">멤버 수: <c:out value="${clubMemberCount}"/></p>
		<p class="mb-0 h5">리더: <c:out value="${clubDto.nickname}" /></p>
	</div>
</div>