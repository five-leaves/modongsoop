<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- Header -->
<header class="forest-header mb-4">
    <div class="d-flex align-items-center me-auto">
        <img class="logo me-3" src="/resources/img/logo.png" alt="로고">
        <div class="title me-4">모동숲</div>
    </div>

    <!-- 동호회 검색 -->
    <form class="d-flex search-bar" role="search" action="/club/search" method="get">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="동호회 검색" aria-label="Search" id="clubName" name="clubName" required>
            <button class="btn btn-forest" type="submit" id="button-addon2">검색</button>
        </div>
    </form>

    <!-- 사용자 정보 -->
    <div class="user-info d-flex align-items-center ms-auto">
        <img src="/resources/img/profile_placeholder.png" alt="프로필 이미지" class="rounded-circle me-2 profile-img">
        <span class="me-3">${nickname}</span>
        <form role="form" method='post' action="/includes/header">
	        	<button class="btn btn-logout" onclick="logoutHandler()">로그아웃</button>
	        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>
</header>
