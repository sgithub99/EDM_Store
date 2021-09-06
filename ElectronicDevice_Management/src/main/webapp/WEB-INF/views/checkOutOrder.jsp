<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh toán đơn hàng</title>
<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

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
										<a href="initBill?cusId=${customerInfo.cusId }"
											class="dropdown-item">Đơn hàng</a>
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
	
	<!-- Bottom Bar End -->

	<!-- Breadcrumb End -->

	<!-- Checkout Start -->
	<div class="checkout" style="margin-top: 148px; z-index: 1;">
		<div class="container">
			<c:choose>
				<c:when test="${empty Cart }">
					<div style="margin-bottom: 300px">
						<div class="center">
							<h1>Bạn phải mua hàng rồi mới được thanh toán</h1>
						</div>
						<div class="cart-btn center">
							<a class="btn " href="loadProducts">Mua ngay</a>
						</div>
					</div>
				</c:when>
				<c:when test="${empty customerInfo}">
					<div style="margin-bottom: 300px">
						<h1>Bạn phải đăng nhập rồi mới được thanh toán</h1>
					</div>
				</c:when>
				<c:otherwise>

					<div class="row">
						<div class="col-lg-7">
							<div class="checkout-inner">
								<div class="billing-address">
									<h2>Thông tin khách hàng</h2>
									<form:form action="checkout" modelAttribute="order"
										onsubmit="return checkOutForm()" method="post">
										<div class="row">
											<div class="col-md-12">
												<label>Họ và tên</label>
												<form:input class="form-control" type="text" path="cusName"
													id="cusName" placeholder="Họ và tên" required="required" />
											</div>
											<div class="col-md-6">
												<label>E-mail</label>
												<form:input class="form-control" type="email" path="email"
													id="email" readonly="true" placeholder="E-mail" />
											</div>
											<div class="col-md-6">
												<label>Số điện thoại</label>
												<form:input class="form-control" path="phone" type="tel"
													id="phone" placeholder="Số điện thoại" required="required" />
											</div>
											<div class="col-md-12">
												<label>Địa chỉ</label>
												<form:textarea path="address" class="form-control"
													id="address" required="required" />
											</div>
											<button class="btn" type="submit"
												style="margin-left: 478px; color: #ffffff; background: #FF6F61">Thanh
												toán</button>
										</div>
									</form:form>
								</div>

								<!-- <div class="shipping-address">
									<h2>Shipping Address</h2>
									<div class="row">
										<div class="col-md-6">
											<label>First Name</label> <input class="form-control"
												type="text" placeholder="First Name">
										</div>
										<div class="col-md-6">
											<label>Last Name"</label> <input class="form-control"
												type="text" placeholder="Last Name">
										</div>
										<div class="col-md-6">
											<label>E-mail</label> <input class="form-control" type="text"
												placeholder="E-mail">
										</div>
										<div class="col-md-6">
											<label>Mobile No</label> <input class="form-control"
												type="text" placeholder="Mobile No">
										</div>
										<div class="col-md-12">
											<label>Address</label> <input class="form-control"
												type="text" placeholder="Address">
										</div>
										<div class="col-md-6">
											<label>Country</label> <select class="custom-select">
												<option selected>United States</option>
												<option>Afghanistan</option>
												<option>Albania</option>
												<option>Algeria</option>
											</select>
										</div>
										<div class="col-md-6">
											<label>City</label> <input class="form-control" type="text"
												placeholder="City">
										</div>
										<div class="col-md-6">
											<label>State</label> <input class="form-control" type="text"
												placeholder="State">
										</div>
										<div class="col-md-6">
											<label>ZIP Code</label> <input class="form-control"
												type="text" placeholder="ZIP Code">
										</div>
									</div>
								</div> -->
							</div>
						</div>
						<div class="col-lg-5">
							<div class="checkout-inner">
								<div class="checkout-summary">
									<h1>Tổng đơn hàng</h1>
									<p>
										Tổng sản phẩm<span>${TotalQuantity }</span>
									</p>
									<p class="sub-total">
										Phụ phí<span>0 Đ</span>
									</p>
									<p class="ship-cost">
										Phí ship<span>0 Đ</span>
									</p>
									<h2>
										Tổng tiền<span><fmt:formatNumber type="number"
												value="${TotalPrice}" /> Đ</span>
									</h2>
								</div>

								<!-- <div class="checkout-payment">
									<div class="payment-methods">
										<h1>Payment Methods</h1>
										<div class="payment-method">
											<div class="custom-control custom-radio">
												<input type="radio" class="custom-control-input"
													id="payment-1" name="payment"> <label
													class="custom-control-label" for="payment-1">Paypal</label>
											</div>
											<div class="payment-content" id="payment-1-show">
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing
													elit. Cras tincidunt orci ac eros volutpat maximus lacinia
													quis diam.</p>
											</div>
										</div>
										<div class="payment-method">
											<div class="custom-control custom-radio">
												<input type="radio" class="custom-control-input"
													id="payment-2" name="payment"> <label
													class="custom-control-label" for="payment-2">Payoneer</label>
											</div>
											<div class="payment-content" id="payment-2-show">
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing
													elit. Cras tincidunt orci ac eros volutpat maximus lacinia
													quis diam.</p>
											</div>
										</div>
										<div class="payment-method">
											<div class="custom-control custom-radio">
												<input type="radio" class="custom-control-input"
													id="payment-3" name="payment"> <label
													class="custom-control-label" for="payment-3">Check
													Payment</label>
											</div>
											<div class="payment-content" id="payment-3-show">
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing
													elit. Cras tincidunt orci ac eros volutpat maximus lacinia
													quis diam.</p>
											</div>
										</div>
										<div class="payment-method">
											<div class="custom-control custom-radio">
												<input type="radio" class="custom-control-input"
													id="payment-4" name="payment"> <label
													class="custom-control-label" for="payment-4">Direct
													Bank Transfer</label>
											</div>
											<div class="payment-content" id="payment-4-show">
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing
													elit. Cras tincidunt orci ac eros volutpat maximus lacinia
													quis diam.</p>
											</div>
										</div>
										<div class="payment-method">
											<div class="custom-control custom-radio">
												<input type="radio" class="custom-control-input"
													id="payment-5" name="payment"> <label
													class="custom-control-label" for="payment-5">Cash
													on Delivery</label>
											</div>
											<div class="payment-content" id="payment-5-show">
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing
													elit. Cras tincidunt orci ac eros volutpat maximus lacinia
													quis diam.</p>
											</div>
										</div>
									</div>
									<div class="checkout-btn">
										<button>Place Order</button>
									</div>
								</div> -->
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- Checkout End -->

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
		function checkOutForm() {
			var cusName = document.getElementById("cusName").value;
			var email = document.getElementById("email").value;
			var address = document.getElementById("address").value;
			var phone = document.getElementById("phone").value;

			if (cusName == null || email == null || address == null
					|| phone == null) {
				return false;
			} else {
				sweetAlert();
			}
		}
		function sweetAlert() {
			Swal.fire({
				position : 'middle',
				icon : 'success',
				title : 'Đặt hàng thành công',
				showConfirmButton : false,
				timer : 10000,
			})
		}
	</script>
</body>
</html>