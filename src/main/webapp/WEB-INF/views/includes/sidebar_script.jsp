<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script>
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
	
	let params = new URLSearchParams(window.location.search);
	$('#regBtn').on("click", function(e) {
		// 회원이 아닌 경우 새글 작성 방지
		if (<c:out value="${isMember}"/> == 0) {
			e.preventDefault();
            alert("게시글을 작성할 수 없습니다. 동호회에 가입해주세요.");
			return;
		}
		self.location="/board/register?clubNo="+params.get('clubNo');
	});
	
	// 가입시 나이제한 확인
	let userAge = '<c:out value="${userAge}"/>';
	userAge = userAge.slice(0, 4);
	$("#joinBtn").click(function (e) {
		if (($('#ageMin').text() < userAge && $('#ageMin').text() != '') || (userAge > $('#ageMax').text() && $('#ageMax').text() != '')) {
			e.preventDefault(); // 폼 전송 중지
            alert("가입할 수 없습니다.");
			return;
		}
	})
	
	// 리더 동호회 탈퇴 방지
	$('#withdrawBtn').click(function (e) {
		if (confirm('정말로 동호회를 탈퇴하시겠습니까?')) {
			if ('<c:out value="${isLeader}"/>'!='false') {
				alert("회장은 탈퇴할 수 없습니다. 동호회를 삭제해주세요.");
				e.preventDefault();
				return;
			}
		}
	})
		
});
</script>