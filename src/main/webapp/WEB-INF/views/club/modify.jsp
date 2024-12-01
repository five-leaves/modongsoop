<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>동호회 등록</title>
</head>
<body>
    <div class="forest-container">
        <div class="forest-header">
            <h1>동호회 설정</h1>
        </div>
        <form action="/club/modify" method="post" enctype="multipart/form-data">
        	<sec:csrfInput/>
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        	
        	<div class="form-group">
			    <label for="profileImage" class="form-label">프로필 이미지</label>
			    <div class="profile-upload">
			        <!-- 이미지 미리보기 -->
			        <div id="previewWrapper" class="mb-3">
			            <img id="previewImage" src="/resources/img/club_placeholder.png" alt="미리보기 이미지" class="img-thumbnail" style="max-width: 150px; ">
			        </div>
			        
			        <!-- 파일 입력 -->
			        <input type="file" id="uploadFile" name="uploadFile" class="form-control hide" accept="image/*" />
			    </div>
			</div>
            <div class="form-group">
                <label for="clubName" class="form-label">동호회 이름 *</label>
                <input type="text" id="clubName" name="clubName" class="form-control" value="<c:out value="${clubDto.clubName}" />" required>
            </div>
            <div class="form-group">
                <label for="clubDescription" class="form-label">동호회 소개 *</label>
                <textarea id="clubContent" name="clubContent" class="form-control" required><c:out value="${clubDto.clubContent}" /></textarea>
            </div>
            <div class="form-group category-select">
                <label for="categoryNo" class="form-label">카테고리</label>
                <select id="categoryNo" name="categoryNo" class="form-control" required>
                    <c:forEach items="${categoryList}" var="category">
                    	<option value='<c:out value="${category.categoryNo}" />'><c:out value="${category.categoryName}" /></option>
                    </c:forEach>
                </select>
            </div>
 
            <div class="form-group">
			    <label for="ageToggle" class="form-label">나이 제한</label>
			    
			    <!-- 체크박스 -->
			    <div class="form-check">
			        <input type="checkbox" id="ageToggle" class="form-check-input" />
			        <label for="ageToggle" class="form-check-label">제한 있음</label>
			    </div>
			
			    <!-- 나이 제한 Select -->
			    <div id="ageSelectWrapper" class="mt-3" style="display: none;">
			        <select id="ageMin" name="ageMin" class="form-control me-2">
			            <c:forEach var="i" begin="1920" end="2023" step = "1">
			            	<option value="<c:out value='${i}'/>"><c:out value="${i}"/></option>
			            </c:forEach>
			        </select>
			        ~
			        <select id="ageMax" name="ageMax" class="form-control ms-2">
			            <c:forEach var="i" begin="1920" end="2023" step = "1">
			            	<option value="<c:out value='${i}'/>"><c:out value="${i}"/></option>
			            </c:forEach>
			        </select>
			    </div>
			</div>
			<input type="hidden" name="clubNo" value="<c:out value='${clubDto.clubNo}'/>" />
            <button type="submit" class="btn-forest">동호회 수정</button>
        </form>
        <!-- 동호회 삭제 -->
        <form action="/club/remove" method="POST">
            <input type="hidden" name="clubNo" value="<c:out value='${clubDto.clubNo}'/>" />
            <button type="submit" id="deleteButton" class="btn-forest">동호회 삭제</button>
        </form>
    </div>
    
<script>
	const ageLimit = <c:out value='${clubDto.ageMin}' /> && <c:out value='${clubDto.ageMax}' /> ;
    $(document).ready(function () {
    	$('#ageMin').val('${clubDto.ageMin}');
    	$('#ageMax').val('${clubDto.ageMax}');
    	
    	if (ageLimit) {
    		$('#ageToggle').prop('checked', true);
    		$('#ageSelectWrapper').css('display', 'flex'); // 나이 제한 Select 보이기
    	}
    	
        // 토글 스위치 변경 이벤트
        $('#ageToggle').on('change', function () {
            if ($(this).is(':checked')) {
            	$('#ageSelectWrapper').css('display', 'flex'); // 나이 제한 Select 보이기
                $('#ageMin, #ageMax').val(2000);
            } else {
            	$('#ageSelectWrapper').css('display', 'none'); // 나이 제한 Select 숨기기
            	$('#ageMin, #ageMax').val(0);
            }
        });
    });
    
    $('#previewImage').click(function () {
        $('#uploadFile').click(); // 파일 입력 클릭 이벤트 트리거
    });
    

 	// 삭제 버튼 클릭 이벤트
    $('#deleteButton').on('click', function() {
		if (confirm('정말로 동호회를 삭제하시겠습니까?')) {
			const form = $('<form>', {
				method : 'POST',
				action : '/club/remove'
			});
			form.append($('<input>', {
				type : 'hidden',
				name : 'clubNo',
				value : $('input[name="clubNo"]').val()
			}));
			$('body').append(form);
			form.submit();
		}
	});
</script>
</body>
<%@include file="../includes/foot.jsp" %>