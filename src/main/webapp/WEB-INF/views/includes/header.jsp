<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!-- Header -->
<header class="forest-header mb-4">
    <h1>FOREST</h1>
    <div class="d-flex justify-content-between align-items-center">
        <!-- 동호회 검색 -->
        <form class="d-flex search-bar" role="search" action="/club/search" method="get">
        <div class="input-group">
        	<label for="clubName"></label>
			<input type="text" class="form-control" placeholder="동호회 검색" aria-label="Search" id="clubName" name="clubName" required>
			<button class="btn btn-forest" type="submit" id="button-addon2">검색</button>
		</div>
        </form>

        <!-- 사용자 정보 -->
        <div class="d-flex align-items-center ms-4">
            <img src="/resources/img/profile_placeholder.png" alt="프로필 이미지" class="rounded-circle me-2" style="width: 40px; height: 40px;">
            <span class="me-3">닉네임</span>
            <form role="form" method='post' action="/includes/header">
	        	<a href="/user/main" id="btn-logout" class="btn btn-forest ms-3">로그아웃</a>
	        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        </form>
        </div>
    </div>
</header>