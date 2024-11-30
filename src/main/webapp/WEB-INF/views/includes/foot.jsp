<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
	
  $("#btn-logout").on("click", function(e){

    e.preventDefault();
    $("form").submit();
    alert("로그아웃 되습니다.");

  });

</script>

</body>
</html>