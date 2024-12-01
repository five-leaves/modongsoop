<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/head.jsp" %>
<body>
    <div class="forest-container">
		<%@include file="../includes/header.jsp" %>
		<div class="row">
			<h1 class="mb-4">동호회 설정</h1>
        <form action="/club/modify" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        	
			<div class="form-group mb-4">
				    <label for="profileImage" class="form-label h3">프로필 이미지</label>
				    <div class="profile-upload">
				        <!-- 이미지 미리보기 -->
				        <a id="previewWrapper" class="mb-3">
				            <c:choose>
							    <c:when test="${empty clubDto.clubProfile}">
							        <img id="previewImage" src="/resources/img/club_placeholder.png" alt="미리보기 이미지" class="img-thumbnail" style="width: 150px; ">
							    </c:when>
							    <c:otherwise>
							        <img id="previewImage" src="/display?fileName=${clubDto.clubProfile}" alt="미리보기 이미지" class="img-thumbnail" style="width: 150px; ">
							    </c:otherwise>
							</c:choose>
				        </a>
				        
				        <!-- 파일 입력 -->
				        <input type="file" id="uploadFile" name="uploadFile" class="form-control hide" accept="image/*" />
				        <input type="hidden" id="clubProfile" name="clubProfile" value=""/>
				    </div>
				    <button id="defaultProfileBtn" type="button" class="btn-forest">기본 이미지 등록</button>
				</div>
            <div class="form-group mb-4">
                <label for="clubName" class="form-label h3">동호회 이름 *</label>
                <input type="text" id="clubName" name="clubName" class="form-control" value="<c:out value="${clubDto.clubName}" />" required>
            </div>
            <div class="form-group mb-4">
                <label for="clubDescription" class="form-label h3">동호회 소개 *</label>
                <textarea id="clubContent" name="clubContent" class="form-control" required><c:out value="${clubDto.clubContent}" /></textarea>
            </div>
            <div class="form-group category-select mb-4">
                <label for="categoryNo" class="form-label h3">카테고리</label>
                <select id="categoryNo" name="categoryNo" class="form-control" required>
                    <c:forEach items="${categoryList}" var="category">
                    	<option value='<c:out value="${category.categoryNo}" />'><c:out value="${category.categoryName}" /></option>
                    </c:forEach>
                </select>
            </div>
 
            <div class="form-group mb-5">
			    <label for="ageToggle" class="form-label h3">나이 제한</label>
			    
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
            <button id="regBtn" type="submit" class="btn-forest mb-4 w-100">동호회 수정</button>
        </form>
        <!-- 동호회 삭제 -->
        <form action="/club/remove" method="POST">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="clubNo" value="<c:out value='${clubDto.clubNo}'/>" />
            <button type="submit" id="deleteButton" class="btn-forest w-100">동호회 삭제</button>
        </form>
    </div>
    
<script>
$(document).ready(function () {
    // 나이제한 초기값
	const ageLimit = <c:out value='${clubDto.ageMin}' /> || <c:out value='${clubDto.ageMax}' /> ;
    if (ageLimit) {
        $('#ageToggle').prop('checked', true);
        $('#ageSelectWrapper').css('display', 'flex'); // 나이 제한 Select 보이기
        $('#ageMin').val('${clubDto.ageMin}');
        $('#ageMax').val('${clubDto.ageMax}');
    }
    
    // 카테고리 초기값
	$('#categoryNo').val(<c:out value='${clubDto.categoryNo}'/>);
	
	//체크박스 변경 이벤트
	$('#ageToggle').on('change', function () {
	    if ($(this).is(':checked')) {
	    	$('#ageSelectWrapper').css('display', 'flex'); // 나이 제한 Select 보이기
	        $('#ageMin, #ageMax').val(2000);
	    } else {
	    	$('#ageSelectWrapper').hide(); // 나이 제한 Select 숨기기
	    	$("#ageWarning").hide();
	    	$('#ageMin, #ageMax').val(0);
	    }
	});
	
	$("#ageMin, #ageMax").change(function () {
		// "제한 없음"은 0으로 처리
	    if ($("#ageMin").val() == '0' || $("#ageMax").val() == '0') {
	        $("#ageWarning").hide(); // 경고 메시지 숨김
	        return;
	    }
	
	    // 최소 나이가 최대 나이보다 큰 경우 경고 메시지 표시
	    if ($("#ageMin").val() > $("#ageMax").val()) {
	        $("#ageWarning").show();
	    } else {
	        $("#ageWarning").hide();
	    }
	});
	
	$("#regBtn").click(function(e) {
		// "제한 없음" 건너뛰기
		if ($("#ageMin").val() == '0' || $("#ageMax").val() == '0') {
	        $("#ageWarning").hide(); // 경고 메시지 숨김
	        return;
	    }
	    // 최소 나이가 최대 나이보다 큰 경우 경고 메시지 표시
	    if ($("#ageMin").val() > $("#ageMax").val()) {
			alert("최소 나이는 최대 나이보다 클 수 없습니다.");
			e.preventDefault();
			return;
	    }
	})
	
	// 기본 이미지 등록
	$('#defaultProfileBtn').click(function (e) {
		e.preventDefault();
		$('#clubProfile').val('');
		$('#previewImage').attr('src', "/resources/img/club_placeholder.png");
	});
	
	// 파일 입력 클릭 이벤트 트리거
	$('#previewImage').click(function () {
	 	$('#uploadFile').click(); 
	});
	
	// 파일 선택 후 업로드, 미리보기
	$('#uploadFile').change(function(e){
	
		let formData = new FormData();
		
		let inputFile = $("input[name='uploadFile']");
		
		let files = inputFile[0].files;
		
		console.log(files);
		
		//add filedate to formdata
		for(let i = 0; i < files.length; i++){
			formData.append("uploadFile", files[i]);
		}
		
		const csrfHeaderName ="${_csrf.headerName}"; 
		const csrfTokenValue="${_csrf.token}";
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			beforeSend: function (xhr) {
	            // CSRF 토큰을 헤더에 추가
	            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	        },
			success: function(result){
				console.log("success: ", result);
				showUploadedFile(result);
			}
		});
		
	})
	
	let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	let maxSize = 5242880; //5MB
	
	function checkExtension(fileName, fileSize) {
	
		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
	
		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	// 파일 미리보기
	function showUploadedFile(uploadResultArr) {	 
		let fileCallPath = "";
	    $(uploadResultArr).each(function(i, obj){
	    	console.log(obj);
		    if(obj.image){
		        fileCallPath = encodeURIComponent(obj.filePath);
		    }
	   });
	   
	   console.log("fileCallPath: " + fileCallPath);
	   $('#previewImage').attr('src', '/display?fileName=' + fileCallPath);
	   $('#clubProfile').val(fileCallPath);
	 }

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
});
</script>
</body>
<%@include file="../includes/foot.jsp" %>