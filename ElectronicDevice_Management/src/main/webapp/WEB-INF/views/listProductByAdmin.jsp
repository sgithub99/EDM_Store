<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang QL sản phẩm trong kho</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<c:url value="resources"/>/css/stylesAdmin.css"
	rel="stylesheet" />

</head>
<style>
.center-pagination {
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
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
						<a class="nav-link collapsed" href=initProductByAdmin> Quản lý
							kho hàng </a> <a class="nav-link collapsed"
							href="initProducerByAdmin"> Quản lý nhà cung cấp </a> <a
							class="nav-link collapsed" href="initOrderByAdmin"> Quản lý
							đơn hàng </a>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">

			<div class="container-fluid px-4">
				<div class="row mt-4">
					<div class="col-6">
						<h1>Danh sách sản phẩm</h1>
					</div>
					<div class="dropdown show col-3" style="padding-left: 18%">
						<a class="btn btn-secondary dropdown-toggle" href="#"
							role="button" id="dropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> Sắp xếp theo </a>

						<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<a class="dropdown-item"
								href="sortByLowerPriceByAdmin?pageIndex=${pageIndex}">Giá từ
								cao xuống thấp</a> <a class="dropdown-item"
								href="sortByHigherPriceByAdmin?pageIndex=${pageIndex}">Giá
								từ thấp đến cao</a> <a class="dropdown-item"
								href="sortByNewerProductByAdmin?pageIndex=${pageIndex}">Mới
								nhất</a> <a class="dropdown-item"
								href="sortByOlderProductByAdmin?pageIndex=${pageIndex}">Cũ
								nhất</a>
						</div>
					</div>
					<div class="col-3" style="padding-left: 9%">
						<a href="initInsertProductByAdmin?pageIndex=${pageIndex }"
							class="btn btn-primary"><i class="far fa-plus-square"></i>
							Thêm mới sản phẩm</a>
					</div>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">Tên sản phẩm</th>
							<th scope="col">Ảnh</th>
							<th scope="col">Giá</th>
							<th scope="col">Danh mục sản phẩm</th>
							<th scope="col">Nhà sản xuất</th>
							<th scope="col">Chi tiết</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listProducts }" var="product">
							<tr>
								<td>${product.proName }</td>
								<td><img
									src="<c:url value="resources"/>/images/${product.imgUrl}"
									width="30" height="30" /></td>
								<td><fmt:formatNumber type="number"
										value="${product.price } " /> đ</td>
								<td>${product.categoryId.cateName }</td>
								<td>${product.producerId.producerName }</td>


								<td><a class="btn btn-info"
									href="detailProductByAdmin?proId=${product.proId }&pageIndex=${pageIndex}&x=${x}">Xem</a></td>
							</tr>

						</c:forEach>

					</tbody>
				</table>
				<nav aria-label="Page navigation example" class="center-pagination">
					<ul class="pagination">
						<c:forEach items="${listPages }" var="page">
							<c:choose>
								<c:when test="${x eq 1}">
									<li class="page-item "><a class="page-link"
										href="initProductByAdmin?pageIndex=${page}&x=${x}">${page}</a></li>
								</c:when>
								<c:when test="${x eq 2}">
									<li class="page-item "><a class="page-link"
										href="sortByLowerPriceByAdmin?pageIndex=${page}&x=${x}">${page}</a></li>
								</c:when>
								<c:when test="${x eq 3}">
									<li class="page-item "><a class="page-link"
										href="sortByHigherPriceByAdmin?pageIndex=${page}&x=${x}">${page}</a></li>
								</c:when>
								<c:when test="${x eq 4}">
									<li class="page-item "><a class="page-link"
										href="sortByNewerProductByAdmin?pageIndex=${page}&x=${x}">${page}</a></li>
								</c:when>
								<c:when test="${x eq 5}">
									<li class="page-item "><a class="page-link"
										href="sortByOlderProductByAdmin?pageIndex=${page}&x=${x}">${page}</a></li>
								</c:when>
							</c:choose>

						</c:forEach>
						<%-- 	<c:forEach items="${listPages }" var="page">
							<li class="page-item"><a class="page-link"
								href="initProductByAdmin?pageIndex=${page}">${page}</a></li>
						</c:forEach> --%>

					</ul>

				</nav>


			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
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
