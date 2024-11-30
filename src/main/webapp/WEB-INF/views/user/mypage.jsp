<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <style>
        /* Import Google Fonts */
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');

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
            padding: 20px;
            border-radius: 10px;
            width: 400px;
        }

        .logo img {
            width: 50px;
            margin-bottom: 20px;
        }

        .title {
            font-size: 24px;
            font-weight: bold;
            color: #4D774E;
            margin-bottom: 30px;
        }

        .profile-image {
            background: url('<%= request.getContextPath() %>/resources/img/logo.png') no-repeat center/cover;
            border-radius: 50%;
            width: 100px;
            height: 100px;
            margin: 0 auto 20px auto;
        }

        .form-group {
            text-align: left;
            margin-bottom: 20px; /* 입력창들 간 간격을 적당히 늘림 */
            width: 90%;
            margin: 0 auto;
        }

        .form-group label {
            font-size: 14px;
            color: #979797;
            display: block;
            margin-bottom: 5px;
            width: 100%;
            box-sizing: border-box;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #979797;
            border-radius: 5px;
            background-color: #FFFFFF;
            color: #000000;
            box-sizing: border-box;
        }

        .btn {
            width: 90%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            border: none;
            margin: 15px auto; /* 버튼들 간 간격을 더 넓게 설정 */
            box-sizing: border-box;
            display: block;
        }

        .btn-profile {
            background-color: #6EBE71;
            color: #FFFFFF;
        }

        .btn-logout {
            background-color: #FFFFFF;
            color: #000000;
            border: 1px solid #D8D8D8;
        }

        .btn-delete {
            background-color: #FFFFFF;
            color: #FF0000;
            border: 1px solid #D8D8D8;
        }

        .form-button-spacing {
            margin-top: 30px; /* 입력창들과 버튼들 간의 간격을 더 넓게 설정 */
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="<%= request.getContextPath() %>/resources/img/logo.png" alt="로고">
        </div>
        <div class="profile-image"></div>
        <h1 class="title">마이페이지</h1>

        <div class="form-group">
            <label for="username">아이디</label>
            <input type="text" id="username" readonly value="<sec:authentication property='principal.user.username'/>">
        </div>
        <div class="form-group">
            <label for="birth">생년월일</label>
            <input type="text" id="birth" readonly value="<sec:authentication property='principal.user.birth'/>">
        </div>
        <div class="form-group">
            <label for="nickname">닉네임</label>
            <input type="text" id="nickname" readonly value="<sec:authentication property='principal.user.nickname'/>">
        </div>

        <button class="btn btn-profile" onclick="location.href='<%= request.getContextPath() %>/user/modifyProfile'">프로필 수정</button>
        <button class="btn btn-logout" onclick="location.href='<%= request.getContextPath() %>/user/main'">로그아웃</button>
        <button class="btn btn-delete" onclick="location.href='<%= request.getContextPath() %>/user/main'">회원탈퇴</button>
    </div>
</body>
</html>