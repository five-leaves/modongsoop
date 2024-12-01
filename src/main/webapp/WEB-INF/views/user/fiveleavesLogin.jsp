<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <style>
        /* Import Google Fonts */
        @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Nanum+Pen+Script&display=swap');

        /* Global styles */
        body {
            font-family: 'Nanum Pen Script', cursive, sans-serif;
            background-color: #E3F2E4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            text-align: center;
            width: 100%;
            max-width: 350px;
        }

        .logo {
            margin-bottom: 20px;
        }

        .logo img {
            width: 80px;
        }

        /* Title with font explicitly applied */
        h1 {
            font-family: 'Nanum Pen Script', cursive, sans-serif;
            font-size: 36px;
            color: #4D774E;
            margin-bottom: 30px;
            letter-spacing: 1px;
        }

        input[type="text"], input[type="password"], button {
            width: 100%;
            max-width: 350px;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            font-size: 16px;
            font-family: 'Nanum Pen Script', cursive, sans-serif;
            box-sizing: border-box;
        }

        input[type="text"], input[type="password"] {
            border: 1px solid #979797;
        }

        input[type="text"]::placeholder, input[type="password"]::placeholder {
            color: #979797;
            font-family: 'Nanum Pen Script', cursive, sans-serif;
        }

        .checkbox-container {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            margin-bottom: 15px;
        }

        .checkbox-container input[type="checkbox"] {
            margin-right: 10px;
        }

        .checkbox-container label {
            font-family: 'Nanum Pen Script', cursive, sans-serif;
            font-size: 16px;
        }

        .login-btn {
            background-color: #6EBE71;
            color: #FFFFFF;
            border: none;
            font-family: 'Nanum Pen Script', cursive, sans-serif;
        }
        
    </style>
</head>
<body>
    <div class="container">
        <!-- Logo -->
        <div class="logo">
            <img src="<%= request.getContextPath() %>/resources/img/logo.png" alt="로고">
        </div>

        <!-- Title -->
        <h1>로그인</h1>

        <!-- Form -->
        <form role="form" method="post" action="/login">
            <!-- ID Input -->
            <input type="text" name="username" placeholder="아이디" autofocus>

            <!-- Password Input -->
            <input type="password" name="password" placeholder="비밀번호">

            <!-- Auto-login -->
            <div class="checkbox-container">
                <input type="checkbox" id="auto-login" name="remember-me">
                <label for="auto-login">자동 로그인</label>
            </div>

            <!-- Login Button -->
            <button type="submit" class="login-btn">로그인</button>
            
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
     
        </form>

    </div>
    
    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

	<script>
	
		$(".login-btn").on("click", function(e){
			
			e.preventDefault();
			$("form").submit();
			
		});
	
	</script>
	
	<!-- 로그인 실패 메시지 -->
    <script>
    
        // URL에 error 파라미터가 포함되어 있는지 확인
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('error')) {
            alert('아이디 혹은 비밀번호를 확인해주세요.');
        }
        
    </script>
    
</body>
</html>