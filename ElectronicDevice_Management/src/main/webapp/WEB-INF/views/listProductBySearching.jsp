<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Trang chủ</title>
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
	<!-- </div> -->
	<!-- Bottom Bar End -->

	<!-- Main Slider Start -->
	<div class="header" style="margin-top: 168px; z-index: 1;">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="header-img">
						<div class="img-item">
							<img src="<c:url value="resources"/>/img/cate1.png" /> <a
								class="img-text" href="">
								<p>Xem sản phẩm tại đây</p>
							</a>
						</div>
						<div class="img-item">
							<img src="<c:url value="resources"/>/img/cate2.jpg" /> <a
								class="img-text" href="">
								<p>Xem sản phẩm tại đây</p>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="header-slider normal-slider">
						<div class="header-slider-item">
							<img src="<c:url value="resources"/>/img/sliderr3.jpg"
								alt="Slider Image" />
							<div class="header-slider-caption">
								<p>Ghé thăm cửa hàng chúng tôi</p>
								<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Mua
									ngay</a>
							</div>
						</div>
						<div class="header-slider-item">
							<img src="<c:url value="resources"/>/img/sliderr5.jpg"
								alt="Slider Image" />
							<div class="header-slider-caption">
								<p>Tất cả các sản phẩm được nhập khẩu chính hãng</p>
								<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Mua
									ngay</a>
							</div>
						</div>
						<div class="header-slider-item">
							<img src="<c:url value="resources"/>/img/sliderr7.jpg"
								alt="Slider Image" />
							<div class="header-slider-caption">
								<p>Các chương trình khuyến mãi cực sốc</p>
								<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Mua
									ngay</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="header-img">
						<div class="img-item">
							<img src="<c:url value="resources"/>/img/cate5.jpg" /> <a
								class="img-text" href="">
								<p>Xem sản phẩm tại đây</p>
							</a>
						</div>
						<div class="img-item">
							<img src="<c:url value="resources"/>/img/cate6.jpg" /> <a
								class="img-text" href="">
								<p>Xem sản phẩm tại đây</p>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Main Slider End -->



	<!-- Recent Product End -->
	<h1>${loginSuccessfully}</h1>
	<!-- Review Start -->

	<c:choose>
		<c:when test="${listProducts.size() <= 0 }">
			<div class="container mb-5">
				<h1>Sản phẩm bạn tìm hiện không có</h1>
			</div>

		</c:when>
		<c:otherwise>

			<div class="product-view">
				<div class="container">
					<div class="col-lg-12">
						<div class="row">
							<!-- <div class="col-md-12">
								<div class="product-view-top">
									<div class="row">
										<div class="col-md-3">
												<div class="product-search">
										<input type="email" value="Search">
										<button>
											<i class="fa fa-search"></i>
										</button>
									</div>
										</div>
										<div class="col-md-3"></div>
										<div class="col-md-3">
											<div class="product-short">
												<div class="dropdown">
													<div class="dropdown-toggle" data-toggle="dropdown">Sắp
														xếp theo</div>
													<div class="dropdown-menu dropdown-menu-right">
														<a href="sortByLowerPrice" class="dropdown-item">Giá
															cao xuống thấp</a> <a href="sortByHigherPrice"
															class="dropdown-item">Giá thấp đến cao</a>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="product-price-range">
												<div class="dropdown">
													<div class="dropdown-toggle" data-toggle="dropdown">Khoảng
														giá</div>
													<div class="dropdown-menu dropdown-menu-right">
														<a href="#" class="dropdown-item">$0 to $50</a> <a
															href="#" class="dropdown-item">$51 to $100</a> <a
															href="#" class="dropdown-item">$101 to $150</a> <a
															href="#" class="dropdown-item">$151 to $200</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div> -->

							<c:forEach items="${listProducts }" var="product">
								<div class="col-md-4">
									<div class="product-item" id=${product.proId }>
										<div class="product-title" style="height: 70px;">
											<a href="detailProduct?proId=${product.proId }">${product.proName }</a>
										</div>
										<div class="product-image">
											<img
												src="<c:url value="resources"/>/images/${product.imgUrl}"
												width="300" height="300" />

										</div>
										<div class="product-price">
											<h3>
												<span><fmt:formatNumber type="number"
														value="${product.price }" /> Đ</span>
											</h3>
											<a class="btn" href="addToCart?proId=${product.proId }"><i
												class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

						<!-- Pagination Start -->
						<div class="col-md-12">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:forEach items="${listPages }" var="page">
										<c:choose>
											<c:when test="${x eq 1}">
												<li class="page-item "><a class="page-link"
													href="loadProducts?pageIndex=${page}">${page}</a></li>
											</c:when>
											<c:when test="${x eq 2}">
												<li class="page-item "><a class="page-link"
													href="sortByLowerPrice?pageIndex=${page}">${page}</a></li>
											</c:when>
											<c:when test="${x eq 3}">
												<li class="page-item "><a class="page-link"
													href="sortByHigherPrice?pageIndex=${page}">${page}</a></li>
											</c:when>
										</c:choose>
									</c:forEach>
								</ul>
							</nav>
						</div>
						<!-- Pagination Start -->
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<!-- Footer Start -->
	<div class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h2>Get in Touch</h2>
						<div class="contact-info">
							<p>
								<i class="fa fa-map-marker"></i>123 E Store, Los Angeles, USA
							</p>
							<p>
								<i class="fa fa-envelope"></i>email@example.com
							</p>
							<p>
								<i class="fa fa-phone"></i>+123-456-7890
							</p>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h2>Follow Us</h2>
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
						<h2>Company Info</h2>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Terms & Condition</a></li>
						</ul>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="footer-widget">
						<h2>Purchase Info</h2>
						<ul>
							<li><a href="#">Pyament Policy</a></li>
							<li><a href="#">Shipping Policy</a></li>
							<li><a href="#">Return Policy</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="row payment align-items-center">
				<div class="col-md-6">
					<div class="payment-method">
						<h2>We Accept:</h2>
						<img src="<c:url value="resources"/>/img/payment-method.png"
							alt="Payment Method" />
					</div>
				</div>
				<div class="col-md-6">
					<div class="payment-security">
						<h2>Secured By:</h2>
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
</body>
</html>