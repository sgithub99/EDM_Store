<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
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

	<!-- Nav Bar Start -->
	<div class="nav"
		style="position: fixed; left: 0; right: 0; top: 0; z-index: 3;">
		<div class="container">
			<nav class="navbar navbar-expand-md bg-dark navbar-dark">
				<a href="#" class="navbar-brand">MENU</a>
				<button type="button" class="navbar-toggler" data-toggle="collapse"
					data-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse justify-content-between"
					id="navbarCollapse">
					<div class="navbar-nav mr-auto">
						<a href="loadProducts" class="nav-item nav-link active">Trang
							chủ</a>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-toggle="dropdown">Danh mục sản phẩm</a>
							<div class="dropdown-menu">
								<c:forEach items="${listCategories }" var="category">
									<c:choose>
										<c:when test="${category.cateId eq 1 }">
											<a href="listProductByCateId?cateId=${category.cateId }"
												class="dropdown-item"><i class="fas fa-mobile-alt"
												style="margin-left: 5px"></i> <span style="margin-left: 5px">${category.cateName }</span></a>
										</c:when>
										<c:when test="${category.cateId eq 2 }">
											<a href="listProductByCateId?cateId=${category.cateId }"
												class="dropdown-item"><i class="fas fa-laptop"></i>
												${category.cateName }</a>
										</c:when>
										<c:when test="${category.cateId eq 3 }">
											<a href="listProductByCateId?cateId=${category.cateId }"
												class="dropdown-item"><i class="fas fa-tablet-alt"
												style="margin-left: 3px"></i> <span style="margin-left: 3px">${category.cateName }</span></a>
										</c:when>
										<c:when test="${category.cateId eq 4 }">
											<a href="listProductByCateId?cateId=${category.cateId }"
												class="dropdown-item"><span style="margin-left: 3px"><img
													src="<c:url value="resources"/>/images/watch-icon.png"
													style="width: 14px; height: 22px"
													style="margin-left: 100px" /></span><span
												style="margin-left: 7px">${category.cateName }</span></a>
										</c:when>
										<c:when test="${category.cateId eq 5 }">
											<a href="listProductByCateId?cateId=${category.cateId }"
												class="dropdown-item"><i class="fas fa-headphones-alt"
												style="margin-left: 2px"></i> <span style="margin-left: 2px">${category.cateName }</span></a>
										</c:when>
									</c:choose>

								</c:forEach>
							</div>
						</div>
						<a href="checkout" class="nav-item nav-link">Thanh toán</a>

					</div>
					<div class="navbar-nav ml-auto">
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-toggle="dropdown"> <c:choose>
									<c:when test="${empty customerInfo }">
										Tài khoản 
										
									</c:when>
									<c:otherwise>${customerInfo.email }
									
									</c:otherwise>
								</c:choose>
							</a>
							<div class="dropdown-menu">
								<c:choose>
									<c:when test="${empty customerInfo }">
										<a href="initLogin" class="dropdown-item">Đăng nhập</a>
										<a href="initSignup" class="dropdown-item">Đăng ký</a>
									</c:when>
									<c:otherwise>
										<a href="myBill" class="dropdown-item">Đơn hàng</a>
										<a href="signout" class="dropdown-item">Đăng xuất</a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- Nav Bar End -->

	<!-- Bottom Bar Start -->
	<div class="bottom-bar"
		style="position: fixed; left: 0; right: 0; top: 36px; z-index: 2;">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-4">
					<div class="logo">
						<a href="loadProducts"> <img
							src="<c:url value="resources"/>/img/logo_estore1.png" alt="Logo">
						</a>
					</div>
				</div>
				<div class="col-md-5">
					<div class="search">
						<form action="searchProductByName" method="post">
							<input type="text" name="proName" placeholder="Tìm kiếm">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>

					</div>
				</div>
				<div class="col-md-3">
					<div class="user">
						<a href="listCart" class="btn cart">Giỏ hàng <i
							class="fa fa-shopping-cart"></i> <span>${TotalQuantity }</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Login Start -->

	<div class="limiter" style="margin-top: 168px; z-index: 1;">
		<div class="container">
			<div class="wrap-login100"
				style="margin: auto; margin-bottom: 100px;">
				<div class="login100-form-title"
					style="background-image: url(<c:url value="resources"/>/images/banner.jpg);">
					<span class="login100-form-title-1"> Đăng ký </span>
				</div>
				<h6 class="mx-auto text-center mt-3" style="color: red">${existEmail }</h6>
				<form:form class="login100-form validate-form"
					modelAttribute="customer" action="signup" method="POST">
					<div class="wrap-input100 validate-input m-b-26"
						data-validate="Yêu cầu nhập họ và tên">
						<span class="label-input100"
							style="font-family: 'Source Code Pro', monospace; left: -148px; width: 130px;">Họ
							và tên</span>
						<form:input class="input100" type="text" path="cusName"
							id="cusName" placeholder="Nhập họ và tên" required="required" />
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-26"
						data-validate="Yêu cầu nhập ngày sinh">
						<span class="label-input100"
							style="font-family: 'Source Code Pro', monospace; left: -148px; width: 130px;">Ngày
							sinh</span>
						<form:input class="input100" path="birthday" id="birthday"
							placeholder="Nhập ngày sinh" type="date" required="required" />
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-26"
						data-validate="Yêu cầu nhập email">
						<span class="label-input100"
							style="font-family: 'Source Code Pro', monospace; left: -148px; width: 130px;">Email</span>
						<form:input class="input100" path="email" id="email"
							placeholder="abc@gmail.com" type="email" required="required" />
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-26"
						data-validate="Yêu cầu nhập địa chỉ">
						<span class="label-input100"
							style="font-family: 'Source Code Pro', monospace; left: -148px; width: 130px;">Địa
							chỉ</span>
						<form:textarea class="input100" type="text" path="address"
							id="address" placeholder="Nhập địa chỉ" required="required" />
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18"
						data-validate="Yêu cầu nhập số điện thoại">
						<span class="label-input100"
							style="font-family: 'Source Code Pro', monospace; left: -148px; width: 130px;">Số
							điện thoại</span>
						<form:input class="input100" type="tel" path="phone" id="phone"
							placeholder="Nhập số điện thoại" required="required" />
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-18"
						data-validate="Yêu cầu nhập tên đăng nhập">
						<span class="label-input100"
							style="font-family: 'Source Code Pro', monospace; left: -148px; width: 130px;">Tên
							đăng nhập</span>
						<form:input class="input100" type="text" path="username"
							id="username" placeholder="Nhập tên đăng nhập"
							required="required" />
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-18"
						data-validate="Yêu cầu nhập mật khẩu">
						<span class="label-input100"
							style="font-family: 'Source Code Pro', monospace; left: -148px; width: 130px;">Mật
							khẩu</span>
						<form:input class="input100" type="password" id="password"
							path="password" placeholder="Nhập mật khẩu" required="required" />
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input mb-0"
						data-validate="Yêu cầu nhập lại mật khẩu">
						<span class="label-input100"
							style="font-family: 'Source Code Pro', monospace; left: -148px; width: 130px;">Nhập
							lại mật khẩu</span>
						<form:input class="input100" type="password" path=""
							onkeyup="checkPass(); return false;"
							placeholder=" Nhập lại mật khẩu" id="re_password"
							required="required" />

						<span class="focus-input100"></span>

					</div>
					<p id="confirmMessage"></p>
					<div class="flex-sb-m w-full p-b-30">
						<div>
							<a href="login" class="txt1"> Bạn đã có tài khoản ? Đăng nhập
							</a>
						</div>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">Đăng ký</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<!-- Login End -->

	<!-- Footer Start -->
	<div class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h2>Liên lạc</h2>
						<div class="contact-info">
							<p>
								<i class="fa fa-map-marker"></i>Km 10 Nguyễn Trãi, quận Hà Đông,
								Hà Nội
							</p>
							<p>
								<i class="fa fa-envelope"></i>estore@gmail.com
							</p>
							<p>
								<i class="fa fa-phone"></i>038.529.6775
							</p>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h2>Theo dõi tại</h2>
						<div class="contact-info">
							<div class="social">
								<a href=""><i class="fab fa-twitter"></i></a> <a href=""><i
									class="fab fa-facebook-f"></i></a> <a href=""><i
									class="fab fa-linkedin-in"></i></a> <a href=""><i
									class="fab fa-instagram"></i></a> <a href=""><i
									class="fab fa-youtube"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h2>Thông tin cửa hàng</h2>
						<ul>
							<li><a href="#">Về chúng tôi</a></li>
							<li><a href="#">Chính sách bảo mật</a></li>
							<li><a href="#">Điều khoản và điều kiện</a></li>
						</ul>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h2>Thông tin mua hàng</h2>
						<ul>
							<li><a href="#">Chính sách thanh toán</a></li>
							<li><a href="#">Chính sách vận chuyển</a></li>
							<li><a href="#">Chính sách hoàn trả</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="row payment align-items-center">
				<div class="col-md-6">
					<div class="payment-method">
						<h2>Chúng tôi chấp nhận:</h2>
						<img src="<c:url value="resources"/>/img/payment-method.png"
							alt="Payment Method" />
					</div>
				</div>
				<div class="col-md-6">
					<div class="payment-security">
						<h2>Được đảm bảo bởi:</h2>
						<img src="<c:url value="resources"/>/img/godaddy.svg"
							alt="Payment Security" /> <img
							src="<c:url value="resources"/>/img/norton.svg"
							alt="Payment Security" /> <img
							src="<c:url value="resources"/>/img/ssl.svg"
							alt="Payment Security" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->

	<!-- Footer Bottom Start -->
	<div class="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-6 copyright">
					<p>
						Copyright &copy; <a href="https://htmlcodex.com">HTML Codex</a>.
						All Rights Reserved
					</p>
				</div>

				<div class="col-md-6 template-by">
					<p>
						Template By <a href="https://htmlcodex.com">HTML Codex</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer Bottom End -->

	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value="resources"/>/lib/easing/easing.min.js"></script>
	<script src="<c:url value="resources"/>/lib/slick/slick.min.js"></script>

	<!-- Template Javascript -->
	<script src="<c:url value="resources"/>/js/main.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.2/dist/sweetalert2.all.min.js"></script>
	<script type="text/javascript">
		function checkPass() {
			var pass1 = document.getElementById('password');
			var pass2 = document.getElementById('re_password');
			var message = document.getElementById('confirmMessage');
			var goodColor = "#66cc66";
			var badColor = "#ff6666";
			if (pass1.value == pass2.value) {
				pass2.style.backgroundColor = goodColor;
				message.style.color = goodColor;
				message.innerHTML = "Mật khẩu khớp!"
			} else {
				pass2.style.backgroundColor = badColor;
				message.style.color = badColor;
				message.innerHTML = "Mật khẩu chưa khớp!"
			}
		}
		/* 		function validateForm() {
		 var cusName = document.getElementById("cusName").value;
		 var birthday = document.getElementById("birthday").value;
		 var email = document.getElementById("email").value;
		 var address = document.getElementById("address").value;
		 var phone = document.getElementById("phone").value;
		 var username = document.getElementById("username").value;
		 var password = document.getElementById("password").value;
		 var re_password = document.getElementById("re_password").value;

		 if (cusName == null || birthday == null || email == null
		 || address == null || phone == null || username == null
		 || password == null || re_password == null) {
		 return false;
		 } else {
		 sweetAlert();
		 }

		 }
		 function sweetAlert() {
		 Swal.fire({
		 position : 'middle',
		 icon : 'success',
		 title : 'Đăng ký tài khoản thành công',
		 showConfirmButton : false,
		 timer : 10000,
		 })
		 } */
	</script>
</body>
</html>