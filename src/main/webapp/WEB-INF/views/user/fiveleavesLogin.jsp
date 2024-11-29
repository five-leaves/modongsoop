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

        .signup-btn {
            background-color: #FFFFFF;
            color: #000000;
            border: 1px solid #D8D8D8;
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

        <!-- Signup Button -->
        <button class="signup-btn" onclick="location.href='/user/signup'">회원가입</button>
    </div>
    
    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

	<script>
	
		$(".login-btn").on("click", function(e){
			
			e.preventDefault();
			$("form").submit();
			
		});
	
	</script>
    
</body>
</html>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 화면</title>
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method='post' action="/login">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="userid" name="username" type="text" value="hwakyung" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="1234">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember-me" type="checkbox">자동 로그인
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="/club/list" class="btn btn-lg btn-success btn-block">Login</a>
                            </fieldset>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

	<script>
	
		$(".btn-success").on("click", function(e){
			
			e.preventDefault();
			$("form").submit();
			
		});
	
	</script>

</body>
</html> --%>