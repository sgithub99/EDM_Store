<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Product</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<style>
.center {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.center-pagination {
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
<body>
	<div class="center">
		<nav class="navbar navbar-expand-lg navbar-light bg-light mb-5">
			<div class="container-fluid">
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Trang chủ</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Danh mục sản phẩm </a>

							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<c:forEach items="${listCategories }" var="category">
									<li><a class="dropdown-item"
										href="listProductByCateId?cateId=${category.cateId }">${category.cateName }</a></li>
								</c:forEach>
							</ul>
					</ul>
					<form class="d-flex">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
					<form class="d-flex" action="listCart" method = "get">
						<button class="btn btn-outline-dark" type="submit">
							<i class="bi-cart-fill me-1"></i> Cart <span
								class="badge bg-dark text-white ms-1 rounded-pill">${TotalQuantity }</span>
							<i class="bi-cart-fill me-1"></i> Price <span
								class="badge bg-dark text-white ms-1 rounded-pill"><fmt:formatNumber type="number" value="${TotalPrice}" /></span>
						</button>
					</form>
				</div>
			</div>
		</nav>
		<table border="1">
			<tr>
				<td>Mã sản phẩm</td>
				<td>Tên sản phẩm</td>
				<td>Giá</td>
				<td>Tên loại sản phẩm</td>
				<td>Nhà sản xuất</td>
				<td>Ảnh</td>
				<td>Chi tiết</td>
				<td>Thêm vào giỏ hàng</td>


			</tr>
			<c:forEach items="${listProducts }" var="product">
				<tr>
					<td>${product.proId }</td>
					<td>${product.proName }</td>
					<td><fmt:formatNumber type="number" value="${product.price }" /></td>
					<td>${product.categoryId.cateName }</td>
					<td>${product.producerId.producerName }</td>

					<c:if test="${product.categoryId.cateName == 'Điện thoại'}">
						<td><img
							src="<c:url value="resources"/>/images/DienThoai/${product.imgUrl}"
							width="200" height="200" /></td>
					</c:if>
					<c:if test="${product.categoryId.cateName == 'Máy tính'}">
						<td><img
							src="<c:url value="resources"/>/images/MayTinh/${product.imgUrl}"
							width="200" height="200" /></td>
					</c:if>
					<c:if test="${product.categoryId.cateName == 'Tablet'}">
						<td><img
							src="<c:url value="resources"/>/images/Tablet/${product.imgUrl}"
							width="200" height="200" /></td>
					</c:if>
					<c:if test="${product.categoryId.cateName == 'Đồng hồ'}">
						<td><img
							src="<c:url value="resources"/>/images/DongHo/${product.imgUrl}"
							width="200" height="200" /></td>
					</c:if>
					<c:if test="${product.categoryId.cateName == 'Phụ kiện'}">
						<td><img
							src="<c:url value="resources"/>/images/PhuKien/${product.imgUrl}"
							width="200" height="200" /></td>
					</c:if>

					<td><a href="detailProduct?proId=${product.proId }">Chi
							tiết</a></td>
					<td><a href="addToCart?proId=${product.proId }">Thêm vào
							giỏ hàng</a></td>
				</tr>

			</c:forEach>
		</table>
		<div class="center-pagination">
			<c:forEach items="${listPages }" var="page">
				<a href="loadProducts?pageIndex=${page}">${page}</a>&nbsp;&nbsp;&nbsp;
			</c:forEach>
		</div>


		<%-- 		<div class="center-pagination">
			<c:forEach items="${listPages }" var="page">
				<a href="loadProducts?pageIndex=${page}&cateId">${page}</a>&nbsp;&nbsp;&nbsp;
			</c:forEach>
		</div> --%>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>