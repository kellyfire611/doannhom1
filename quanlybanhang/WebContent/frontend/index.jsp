<!DOCTYPE html>
<html lang="en">

<head>
	<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
	<%@page import="java.util.List"%>
	<%@page import="com.db4o.internal.Null"%>
	<%@page import="com.db4o.ObjectSet"%>
	<%@page import="com.db4o.ObjectContainer"%>
	<%@page import="model.PUB_Lib"%>

	<%@page import="model.O_SanPham"%>
	<%@page import="model.D_SanPham"%>
	<meta charset="utf-8" />
	<title>Giới thiệu</title>
	<%@include file="./layouts/includes/head-css.html"%>
</head>

<body class="animsition">
	<%
		PUB_Lib conn = new PUB_Lib();
		conn.connect();
        ObjectContainer db=conn.getDb();
        D_SanPham d = new D_SanPham();
        O_SanPham o = new O_SanPham();

        ObjectSet<O_SanPham> lstSanPham = d.selectAll(db);
		int i=0;
		%>

	<!-- Header -->
	<%@include file="./layouts/includes/header.html"%>

	<!-- Slider -->
	
		<img src="assets/images/slide-01.jpg" width="100%" />
	
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1" style="background-image: url(assets/images/slide-03.jpg);">
					<!-- <div class="item-slick1"> -->
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									Gia dụng Cần Thơ
								</span>
							</div>

							<div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">
									Siêu giảm giá 2018
								</h2>
							</div>

							<div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
								<a href="product.html" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									Mua ngay
								</a>
							</div>
						</div>
					</div>
				</div>

				<div class="item-slick1" style="background-image: url(assets/images/slide-04.jpg);">
					<!-- <div class="item-slick1"> -->
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="rollIn" data-delay="0">
								<span class="ltext-101 cl2 respon2">
									Có đầy đủ mặt hàng, đang giảm giá tết 2019
								</span>
							</div>

							<div class="layer-slick1 animated visible-false" data-appear="lightSpeedIn" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">
									Quần áo, đồ gia dụng
								</h2>
							</div>

							<div class="layer-slick1 animated visible-false" data-appear="slideInUp" data-delay="1600">
								<a href="product.html" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									Mua ngay
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Product -->
	<section class="bg0 p-t-23 p-b-140">
		<div class="container">
			<div class="p-b-10">
				<h3 class="ltext-103 cl5">
					Danh sách Sản phẩm
				</h3>
			</div>

			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
						Tất cả mặt hàng
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".women">
						Gia dụng
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".men">
						Giày dép
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".bag">
						Quần áo
					</button>
				</div>
			</div>

			<div class="row isotope-grid">
				<%
					for (O_SanPham item : lstSanPham) {
				%>
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="/quanlybanhang/assets/images/products/<%= item.getSp_hinhanh() %>" alt="IMG-PRODUCT" width="100%" height="315px">
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="/quanlybanhang/" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									<%=item.getSp_ten()%>
								</a>

								<span class="stext-105 cl3">
									<%=item.getSp_giaBan() %> vnđ
								</span>

								<span class="stext-105 cl3">
										<%=item.getSp_mota() %>
									</span>
									
								<span class="stext-105 cl3">
										<%=item.getSp_nhasanxuat() %>
									</span>
								
								<span class="stext-105 cl3">
									còn <%=item.getSp_soluongton() %>
								</span>
							</div>
						</div>
					</div>
				</div>
				<%
							i++;
						}
					%>

			</div>
		</div>
	</section>

	<!-- Footer -->
	<%@include file="./layouts/includes/footer.html"%>

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<%@include file="./layouts/includes/scripts.html"%>
	
	<% conn.closeconnect(); %>
</body>

</html>