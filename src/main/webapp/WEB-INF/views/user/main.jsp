<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모동숲 페이지</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #ffffff;
        }

        .container {
            text-align: center;
        }

        .logo {
            width: 100px;
            height: auto;
            margin-bottom: 20px;
        }

        .title {
            color: #1D743B;
            font-size: 24px;
            font-weight: bold;
            margin: 0;
        }

        .subtitle {
            color: #00962A;
            font-size: 20px;
            font-weight: bold;
            margin: 10px 0;
        }

        .btn {
            width: 200px;
            height: 50px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            margin: 10px 0;
            cursor: pointer;
            border: none;
        }

        .btn.login {
            background-color: #00962A;
            color: #FFFFFF;
        }

        .btn.signup {
            background-color: #FFFFFF;
            color: #00962A;
            border: 2px solid #DFEAF2;
        }

        .btn:hover {
            opacity: 0.9;
        }
    </style>
    <script>
        function navigateToLogin() {
            window.location.href = "/user/fiveleavesLogin";
        }

        function navigateToSignup() {
            window.location.href = "/user/signup";
        }
    </script>
</head>
<body>
    <div class="container">
        <!-- 로고 -->
        <img src="/resources/img/logo.png" alt="로고" class="logo">
        
        <!-- 제목 -->
        <h1 class="title">모여라 동호회 숲</h1>
        <h2 class="subtitle">모동숲</h2>
        
        <!-- 로그인 버튼 -->
        <button class="btn login" onclick="navigateToLogin()">로그인</button>
        
        <!-- 회원가입 버튼 -->
        <button class="btn signup" onclick="navigateToSignup()">회원가입</button>
    </div>
</body>
</html>
