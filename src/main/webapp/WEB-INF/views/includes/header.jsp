<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!-- Header -->
<header class="forest-header mb-4">
    <h1>FOREST</h1>
    <div class="d-flex justify-content-between align-items-center">
        <!-- 동호회 검색 -->
        <form class="d-flex search-bar" role="search"">
        <div class="input-group">
			<input type="text" class="form-control" placeholder="동호회 검색" aria-label="Search">
			<button class="btn btn-forest" type="button" id="button-addon2">검색</button>
		</div>
        </form>

        <!-- 사용자 정보 -->
        <div class="d-flex align-items-center ms-4">
            <img src="/resources/img/profile_placeholder.png" alt="프로필 이미지" class="rounded-circle me-2" style="width: 40px; height: 40px;">
            <span class="me-3">닉네임</span>
	        <a href="/user/fiveleavesLogout" class="btn btn-forest ms-3">로그아웃</a>
        </div>
    </div>
</header>