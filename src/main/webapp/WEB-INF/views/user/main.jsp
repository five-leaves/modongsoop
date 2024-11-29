<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모동숲 로그인</title>
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
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 800px;
            width: 100%;
        }

        /* Logo Section */
        .logo {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logo img {
            width: 150px;
        }

        /* Content Section */
        .content {
            flex: 2;
            text-align: left;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
        }

        .title {
            font-size: 75px;
            color: #1D743B;
            margin: 0;
        }

        .subtitle {
            font-size: 50px;
            color: #00962A;
            margin: 5px 0 20px;
        }

        /* Buttons */
        .btn {
            width: 330px;
            padding: 12px;
            margin: 8px 0;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            border: none;
            font-family: 'Nanum Pen Script', cursive, sans-serif;
        }

        .btn-login {
            background-color: #6EBE71;
            color: #FFFFFF;
        }

        .btn-signup {
            background-color: #FFFFFF;
            color: #000000;
            border: 1px solid #D8D8D8;
        }

        .btn-login:hover {
            background-color: #5AA860;
        }

        .btn-signup:hover {
            background-color: #F5F5F5;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Logo Section -->
        <div class="logo">
            <img src="<%= request.getContextPath() %>/resources/img/logo.png" alt="로고">
        </div>

        <!-- Content Section -->
        <div class="content">
            <h1 class="title">모여라 동호회 숲</h1>
            <p class="subtitle">모동숲</p>
            <button class="btn btn-login" onclick="location.href='/user/fiveleavesLogin'">로그인</button>
            <button class="btn btn-signup" onclick="location.href='/user/signup'">회원가입</button>
        </div>
    </div>
</body>
</html>