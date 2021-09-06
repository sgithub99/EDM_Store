<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
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
<title>Chi tiết sản phẩm</title>
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
						<input type="text" placeholder="Tìm kiếm">
						<button>
							<i class="fa fa-search"></i>
						</button>
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

	<div class="breadcrumb-wrap" style="margin-top: 168px; z-index: 1;">
		<div class="container">
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="loadProducts">Trang
						chủ</a></li>
				<li class="breadcrumb-item"><a
					href="listProductByProducerId?producerId=${product.producerId.producerId }&proId=${product.proId}">${product.producerId.producerName}</a>
				</li>
				<li class="breadcrumb-item active">Chi tiết sản phẩm</li>
			</ul>
		</div>
	</div>

	<!-- Product Detail Start -->
	<div class="product-detail">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="product-detail-top" style="padding: 20px">
						<div class="row align-items-center">
							<div class="col-md-5">
								<div class="">
									<img src="<c:url value="resources"/>/images/${product.imgUrl}"
										width="400" height="400" /> <a href=""></a>


								</div>
							</div>
							<div class="col-md-7">
								<div class="product-content">
									<div class="title">
										<h2>${product.proName }</h2>
									</div>
									<div class="price">
										<h4>Giá:</h4>
										<p>
											<fmt:formatNumber type="number" value="${product.price }" />
											Đ
										</p>
									</div>
									<div>
										<h2>${product.producerId.producerName }</h2>
									</div>
									<!-- <div class="quantity">
										<h4>Quantity:</h4>
										<div class="qty">
											<button class="btn-minus">
												<i class="fa fa-minus"></i>
											</button>
											<input type="text" value="1">
											<button class="btn-plus">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div> -->

									<div class="action">
										<a class="btn" href="addToCart?proId=${product.proId }"><i
											class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row product-detail-bottom">
						<div class="col-lg-12">
							<ul class="nav nav-pills nav-justified">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="pill" href="#description">Mô tả</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="pill"
									href="#reviews">Đánh giá</a></li>
							</ul>

							<div class="tab-content">
								<div id="description" class="container tab-pane active">
									<h4>Chi tiết sản phẩm</h4>
									<p>${product.description }</p>
								</div>
								<div id="reviews" class="container tab-pane fade">
									<div class="reviews-submitted">
										<div class="reviewer">
											Phasellus Gravida - <span>01 Jan 2020</span>
										</div>
										<div class="ratting">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
										<p>Sed ut perspiciatis unde omnis iste natus error sit
											voluptatem accusantium doloremque laudantium, totam rem
											aperiam.</p>
									</div>
									<div class="reviews-submit">
										<h4>Give your Review:</h4>
										<div class="ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i>
										</div>
										<div class="row form">
											<div class="col-sm-6">
												<input type="text" placeholder="Name">
											</div>
											<div class="col-sm-6">
												<input type="email" placeholder="Email">
											</div>
											<div class="col-sm-12">
												<textarea placeholder="Review"></textarea>
											</div>
											<div class="col-sm-12">
												<button>Submit</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


				</div>

				<!-- Side Bar Start -->
				<!-- Side Bar End -->
			</div>
		</div>
	</div>
	<!-- Product Detail End -->

	<!-- Brand Start -->
	<%-- 	<div class="brand">
		<div class="container">
			<div class="brand-slider">
				<div class="brand-item">
					<img src="<c:url value="resources"/>/img/brand-1.png" alt="">
				</div>
				<div class="brand-item">
					<img src="<c:url value="resources"/>/img/brand-2.png" alt="">
				</div>
				<div class="brand-item">
					<img src="<c:url value="resources"/>/img/brand-3.png" alt="">
				</div>
				<div class="brand-item">
					<img src="<c:url value="resources"/>/img/brand-4.png" alt="">
				</div>
				<div class="brand-item">
					<img src="<c:url value="resources"/>/img/brand-5.png" alt="">
				</div>
				<div class="brand-item">
					<img src="<c:url value="resources"/>/img/brand-6.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- Brand End --> --%>

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
</body>
</html>