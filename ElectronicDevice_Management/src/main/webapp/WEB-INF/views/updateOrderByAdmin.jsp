<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xác nhận đơn hàng</title>
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
					<a
						href="detailOrderByAdmin?orderId=${order.orderId}&pageIndex=${pageIndex}"
						class="btn btn-secondary mt-3"><i class="fas fa-backward"></i>
						Quay lại</a>
					<h1 class="mt-4">Xác nhận đơn hàng</h1>
					<form:form modelAttribute="order"
						action="updateOrderByAdmin?pageIndex=${pageIndex}" method="post">
						<table class="table table-bordered" style="width: 1000px">

							<tr>
								<td>Mã đơn hàng</td>
								<td><form:input path="orderId" type="number"
										readonly="true" /></td>
							</tr>
							<tr>
								<td>Ngày thanh toán</td>
								<td><form:input path="dateOfPayment" type="date"
										readonly="true" /></td>
							</tr>
							<tr>
								<td>Tên khách hàng</td>
								<td><form:input path="cusName" type="text" readonly="true" /></td>
							</tr>
							<tr>
								<td>Mã khách hàng</td>
								<td><form:input path="cusId.cusId" type="number" readonly="true" /></td>
							</tr>
							<tr>
								<td>Địa chỉ</td>
								<td><form:textarea path="address" readonly="true" /></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><form:textarea path="email" readonly="true" /></td>
							</tr>
							<tr>
								<td>Số điện thoại</td>
								<td><form:input path="phone" type="tel" readonly="true" /></td>
							</tr>
							<tr>
								<td>Trạng thái</td>
								<td><form:select path="status">
										<form:option value="true" label="Xác nhận đơn hàng" />
										<form:option value="false" label="Chờ vận chuyển" />
									</form:select></td>
							</tr>
						</table>
						<div>
							<button type="submit" class="btn btn-success">
								<i class="fas fa-check-square"></i> Xác nhận đơn hàng
							</button>
						</div>

					</form:form>
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
