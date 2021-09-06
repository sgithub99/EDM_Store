<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Admin</title>
<!-- Favicon -->
<link href="<c:url value="resources"/>/img/favicon.ico" rel="icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link href="<c:url value="resources"/>/lib/slick/slick.css"
	rel="stylesheet">
<link href="<c:url value="resources"/>/lib/slick/slick-theme.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="<c:url value="resources"/>/css/style.css" rel="stylesheet">

<!-- Adding new login template -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="resources"/>/css/util.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value="resources"/>/css/main.css">
</head>
<body>
	<%-- 
	<form name='loginForm'
		action="<c:url value='j_spring_security_login' />" method='POST'>
		<table>
			<tr>
				<td>User:</td>
				<td><input type='text' name='username'></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='password' /></td>
			</tr>
			<tr>
				<td colspan='2'><input name="submit" type="submit"
					value="login" /></td>
			</tr>
		</table>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form> --%>

	<!-- Login Start -->
	<div class="limiter">
		<div class="container">
			<div class="wrap-login100"
				style="margin: auto; margin-bottom: 100px; margin-top: 100px">
				<div class="login100-form-title"
					style="background-image: url(<c:url value="resources"/>/images/bg-01.jpg);">
					<span class="login100-form-title-1"
						style="font-family: 'Source Code Pro', monospace"> Đăng
						nhập </span>
				</div>

				<form name='loginForm' class="login100-form validate-form"
					method="POST" action="<c:url value='j_spring_security_login' />">
					<div class="wrap-input100 validate-input m-b-26"
						data-validate="Email is required">
						<span class="label-input100"
							style="font-family: 'Source Code Pro', monospace; left: -148px; width: 130px;">Tên
							đăng nhập</span> <input class="input100" name='username'
							style="font-family: 'Source Code Pro'," type="text"
							placeholder="Nhập tên đăng nhập" /> <span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18"
						data-validate="Password is required">
						<span class="label-input100"
							style="font-family: 'Source Code Pro', monospace; left: -148px; width: 130px;">Mật
							khấu</span> <input class="input100" name='password'
							style="font-family: 'Source Code Pro'," type="password"
							placeholder="Nhập mật khẩu" /> <span class="focus-input100"></span>
					</div>


					<div class="container-login100-form-btn">
						<input class="login100-form-btn" name="submit" type="submit" value="Đăng nhập" />
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</div>
		</div>
	</div>

	<!-- Login End -->

	<!-- Footer Start -->

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value="resources"/>/lib/easing/easing.min.js"></script>
	<script src="<c:url value="resources"/>/lib/slick/slick.min.js"></script>

	<!-- Template Javascript -->
	<script src="<c:url value="resources"/>/js/main.js"></script>
</body>
</html>