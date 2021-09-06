<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QTV - Chi tiết sản phẩm</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<c:url value="resources"/>/css/stylesAdmin.css"
	rel="stylesheet" />

</head>
<body class="sb-nav-fixed">
	<%-- 	<h1>Admin Page</h1>
	<h2>Welcome: ${pageContext.request.userPrincipal.name}</h2>

	<form action="<c:url value="/j_spring_security_logout" />"
		method="post">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> <input type="submit" value="Logout" />
	</form> --%>

	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="">Trang chủ</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Quản lý</div>
						<a class="nav-link collapsed" href="initProductByAdmin"> Quản
							lý kho hàng </a> <a class="nav-link collapsed"
							href="initProducerByAdmin"> Quản lý nhà cung cấp </a> <a
							class="nav-link collapsed" href="initOrderByAdmin"> Quản lý
							đơn hàng </a>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-5">
					<a href="initProductByAdmin?pageIndex=${pageIndex}"
						class="btn btn-secondary mt-3"><i class="fas fa-backward"></i>
						Quay lại</a>
					<h1 class="mt-4">Thông tin sản phẩm</h1>
					<table class="table table-bordered" style="width: 1000px">
						<tr>
							<td scope="col">Mã sản phẩm</td>
							<td colspan="2">${product.proId }</td>
						</tr>
						<tr>
							<td scope="col">Tên sản phẩm</td>
							<td colspan="2">${product.proName }</td>
						</tr>
						<tr>
							<td scope="col">Giá</td>
							<td colspan="2"><fmt:formatNumber type="number"
									value="${product.price }" /></td>
						</tr>
						<tr>
							<td scope="col">Tên loại sản phẩm</td>
							<td colspan="2">${product.categoryId.cateName }</td>
						</tr>
						<tr>
							<td scope="col">Nhà sản xuất</td>
							<td colspan="2">${product.producerId.producerName }</td>
						</tr>
						<tr>
							<td scope="col">Ảnh</td>
							<td colspan="2"><img
								src="<c:url value="resources"/>/images/${product.imgUrl}"
								width="200" height="200" /></td>
						</tr>
						<tr>
							<td colspan="2">Mô tả</td>
							<td>${product.description }</td>
						</tr>
					</table>
					<div>
						<a class="btn btn-warning"
							href="initUpdateProduct?proId=${product.proId }&pageIndex=${pageIndex}"><i
							class="far fa-edit"></i> Chỉnh sửa sản phẩm</a> <a
							class="btn btn-danger" href="deleteProductByAdmin?proId=${product.proId}&pageIndex=${pageIndex}"
							onclick="return confirm('Bạn có chắc muốn xoá sản phẩm này khỏi kho hàng?')"><i class="fas fa-trash-alt"></i>
							Xoá sản phẩm</a>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<c:url value="resources"/>/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="<c:url value="resources"/>/assets/demo/chart-area-demo.js"></script>
	<script src="<c:url value="resources"/>/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="<c:url value="resources"/>/js/datatables-simple-demo.js"></script>



</body>
</html>
