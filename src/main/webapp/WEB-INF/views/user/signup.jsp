<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Nanum+Pen+Script&display=swap');

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
            flex-direction: column;
            align-items: center;
        }

        .logo {
            width: 50px;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 24px;
            color: #1D743B;
            margin-bottom: 20px;
        }

        .profile-circle {
            width: 120px;
            height: 120px;
            background-color: #D9D9D9;
            border-radius: 50%;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            margin-bottom: 15px;
        }

        .profile-circle img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: none;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
            width: 300px;
        }

        label {
            font-size: 14px;
            color: #1D743B;
            font-family: 'Nanum Pen Script', cursive, sans-serif;
            margin-bottom: 5px;
            align-self: flex-start;
        }

        input, select, button {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #DFEAF2;
            border-radius: 5px;
            font-family: 'Nanum Pen Script', cursive, sans-serif;
        }

        input::placeholder {
            color: #C4C4C4;
        }

        button {
            background-color: #6EBE71;
            color: #FFFFFF;
            font-weight: bold;
            cursor: pointer;
            font-family: 'Nanum Pen Script', cursive, sans-serif;
            width: 107%;
        }

        button:hover {
            background-color: #5AA860;
        }

        input[type="file"] {
            display: none;
        }

        /* 생년월일 드롭다운 레이아웃 */
        .birthdate-container {
            display: flex;
            gap: 10px;
            justify-content: space-between;
            width: 107%;
        }

        select {
            flex: 1;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 로고 -->
        <img src="<%= request.getContextPath() %>/resources/img/logo.png" alt="로고" class="logo">

        <h1>회원가입</h1>

        <!-- 프로필 이미지 -->
        <div class="profile-circle" onclick="document.getElementById('profileImageInput').click();">
            <img id="profileImagePreview" alt="프로필 이미지 미리보기">
        </div>
        <input type="file" id="profileImageInput" accept="image/*" onchange="previewProfileImage(event)">

        <!-- 회원가입 폼 -->
        <form id="signupForm" method="POST" action="/user/signup">
            <label for="username">아이디</label>
            <input type="text" id="username" name="username" placeholder="아이디">

            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" placeholder="비밀번호">

            <label for="birthdate">생년월일</label>
            <div class="birthdate-container">
                <select id="birthYear" name="birthYear">
                    <% for (int year = 1900; year <= 2024; year++) { %>
                        <option value="<%= year %>"><%= year %></option>
                    <% } %>
                </select>
                <select id="birthMonth" name="birthMonth">
                    <% for (int month = 1; month <= 12; month++) { %>
                        <option value="<%= month %>"><%= month %></option>
                    <% } %>
                </select>
                <select id="birthDay" name="birthDay">
                    <% for (int day = 1; day <= 31; day++) { %>
                        <option value="<%= day %>"><%= day %></option>
                    <% } %>
                </select>
            </div>

            <label for="nickname">닉네임</label>
            <input type="text" id="nickname" name="nickname" placeholder="닉네임">

            <button type="button" onclick="submitForm()">회원가입</button>
        </form>
    </div>

    <script>
        function previewProfileImage(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const preview = document.getElementById('profileImagePreview');
                    preview.src = e.target.result;
                    preview.style.display = 'block'; // 이미지 표시
                };
                reader.readAsDataURL(file);
            }
        }

        function validateForm() {
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value.trim();
            const nickname = document.getElementById('nickname').value.trim();
            const profileImage = document.getElementById('profileImageInput').files[0];

            if (!username) {
                alert('아이디를 입력해주세요.');
                return false;
            }
            if (!password) {
                alert('비밀번호를 입력해주세요.');
                return false;
            }
            if (!nickname) {
                alert('닉네임을 입력해주세요.');
                return false;
            }
            if (!profileImage) {
                alert('프로필 이미지를 업로드해주세요.');
                return false;
            }

            return true;
        }

        function submitForm() {
            if (!validateForm()) {
                return;
            }

            const form = document.getElementById('signupForm');
            const formData = new FormData(form);

            fetch('/uploadProfileImage', {
                method: 'POST',
                body: formData,
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('회원가입이 완료되었습니다.');
                    window.location.href = '/user/fiveleavesLogin';
                } else {
                    alert('회원가입 중 오류가 발생했습니다.');
                }
            })
            .catch(err => console.error(err));
        }
    </script>
</body>
</html>
