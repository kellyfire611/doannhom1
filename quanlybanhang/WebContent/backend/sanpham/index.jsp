<!DOCTYPE html>

<%@page import="java.util.List"%>
<%@page import="com.db4o.internal.Null"%>
<%@page import="com.db4o.ObjectSet"%>
<%@page import="com.db4o.ObjectContainer"%>
<%@page import="model.PUB_Lib"%>

<%@page import="model.O_SanPham"%>
<%@page import="model.D_SanPham"%>

<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<html>

<head>

	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

	<meta charset="utf-8" />
	<title>QUẢN LÝ BÁN HÀNG</title>



	<%@include file="../../moduls/I_CSS.html"%>

</head>
<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="">


	<!-- BEGIN HEADER -->
	<%@include file="../../moduls/header.jsp"%>
	<!-- END HEADER -->


	<!-- BEGIN CONTAINER -->
	<%@include file="../../moduls/menubar.jsp"%>


	<%
		PUB_Lib conn = new PUB_Lib();
		conn.connect();
        ObjectContainer db=conn.getDb();
        D_SanPham d = new D_SanPham();
        O_SanPham o = new O_SanPham();

        ObjectSet<O_SanPham> lstSanPham = d.selectAll(db);
		int i=0;
		%>



	<div class="row-fluid">
		<div class="span12">
			<div class="grid simple ">
				<div class="grid-title no-border">
					<span class=".col-xs-12 .col-md-8">
						<h4>Danh sách Khách hàng</h4>
					</span>
					<span class=".col-xs-6 .col-md-4">
						<a class="btn-social" id="anbch">
							<i class="icon-collapse-alt"></i>
						</a>
						<a class="btn-social" onclick="them_mo_form()">
							<i class="icon-plus-sign-alt"></i></a>

						<a class="btn-social"><i class="icon-print"></i></a>
						<a class="btn-social"><i class="icon-refresh"></i></a>
					</span>
				</div>
				<div class="grid-body" id="grid-body_bch" value="0" style="display: normal">
					<table id="table_data" cellpadding="0" cellspacing="0" border="0" class="table  dataTable" width="100%">
						<thead>
							<tr style="color: rgb(0, 0, 0); background-color: rgba(231, 231, 231, 0.13);">
								<th></th>
								<th>Loại sản phẩm</th>
								<th>Tên Sản phẩm</th>
								<th>Giá bán</th>
								<th>Mô tả</th>
								<th>Nhà sản xuất</th>
								<th>Hình ảnh</th>
								<th>Số lượng tồn</th>
								<th></th>
							</tr>
						</thead>
						<tbody role="alert" aria-live="polite" aria-relevant="all">
							<%
								for (O_SanPham item : lstSanPham) {
							%>
							<tr class="">
								<td>
									<button class="btn btnChiTiet" id="btn<%=i%>" value="<%=i%>" style="padding: 2px 6px; padding-top: 2px">
										<i class="icon-align-left"></i>
									</button>
								</td>
								<td class=" sorting_1">
									<%
											out.println(item.getSp_loaisp());
										%>
								</td>
								<td class=" sorting_1">
									<%
										out.println(item.getSp_ten());
									%>
								</td>
								<td class=" sorting_1">
									<%
										out.println(item.getSp_giaBan());
									%>
								</td>
								<td class=" sorting_1">
									<%
											out.println(item.getSp_mota());
										%>
								</td>
								<td class=" sorting_1">
									<%
											out.println(item.getSp_nhasanxuat());
										%>
								</td>
								<td class=" sorting_1">
									<img src="/quanlybanhang/assets/images/products/<%= item.getSp_hinhanh() %>" alt="IMG-PRODUCT" width="100px" height="100px">
								</td>
								<td class=" sorting_1">
									<%
											out.println(item.getSp_soluongton());
										%>
								</td>
								<td>
									<button style="background-color: white;" class="btn btn-social" onclick="sua_mo_form('<%=item.getSp_loaisp()%>', <%=item.getSp_ma()%>, '<%=item.getSp_ten()%>', '<%=item.getSp_giaBan()%>', '<%=item.getSp_mota()%>', '<%=item.getSp_nhasanxuat()%>', '<%=item.getSp_hinhanh()%>', '<%=item.getSp_soluongton()%>');"><i
										 class="icon-edit"></i></button>

									<button style="background-color: white;" class="btn btn-social" onclick="thuc_hien_xoa(<%=item.getSp_ma()%>)"><i
										 class="icon-remove"></i></button>
								</td>

							</tr>
							<%
							i++;
						}
					%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../../moduls/footer.jsp"%>
	<!-- END CHAT -->
	<!-- END CONTAINER -->
	<div id="dialog_themSanPham" title="THÊM SẢN PHẨM" style="display: none; text-align: center;">
		<form name="frmThem" method="post">
			<table width="100%" border="0" class="" cellpadding="5px">
				<tr>
					<td align="left" class="cell-dialog" width="200px">Loại sản phẩm<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtLoaiSanPham" name="txtLoaiSanPham" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Mã sản phẩm<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtMaSanPham" name="txtMaSanPham" class="input-large " type="number">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Tên Sản phẩm<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtTenSanPham" name="txtTenSanPham" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Giá bán<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtGiaBanSanPham" name="txtGiaBanSanPham" class="input-large " type="number">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Mô tả<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtMoTaSanPham" name="txtMoTaSanPham" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Nhà sản xuất<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtNhaSanXuatSanPham" name="txtNhaSanXuatSanPham" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Hình ảnh sản phẩm<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<select id="txtHinhAnhSanPham" name="txtHinhAnhSanPham" class="input-large ">
							<option value="product-image (1).jpg">Hình ảnh 1</option>
							<option value="product-image (2).jpg">Hình ảnh 2</option>
							<option value="product-image (3).jpg">Hình ảnh 3</option>
							<option value="product-image (4).jpg">Hình ảnh 4</option>
							<option value="product-image (5).jpg">Hình ảnh 5</option>
							<option value="product-image (6).jpg">Hình ảnh 6</option>
							<option value="product-image (7).jpg">Hình ảnh 7</option>
							<option value="product-image (8).jpg">Hình ảnh 8</option>
							<option value="product-image (9).jpg">Hình ảnh 9</option>
							<option value="product-image (10).jpg">Hình ảnh 10</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Số lượng tồn<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtSoLuongTonSanPham" name="txtSoLuongTonSanPham" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" colspan="2" class="cell-dialog">
						<i>(<font color="red">*</font>) thông tin bắt buộc nhập</i>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2" class="cell-dialog">
						<hr>
						<button type="button" class="btn btn-success btn-cons" onclick="thuc_hien_them()">Thực hiện</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	
	<% conn.closeconnect(); %>

	<script>
		$(document).ready(function () {
			$("#dialog_themSanPham").dialog({
				autoOpen: false,
				width: 800,
			});

			$("#dialog_suaSanPham").dialog({
				autoOpen: false,
				width: 800,
			});
		});

		function them_mo_form() {
			$('#dialog_themSanPham').dialog("open");
		};

		function sua_mo_form(txtLoaiSanPham, txtMaSanPham, txtTenSanPham, txtGiaBanSanPham, txtMoTaSanPham,
			txtNhaSanXuatSanPham, txtHinhAnhSanPham, txtSoLuongTonSanPham) {
			$('#ID_Sua').val(txtMaSanPham);

			$('#txtLoaiSanPham_sua').val(txtLoaiSanPham);
			$('#txtMaSanPham_sua').val(txtMaSanPham);
			$('#txtTenSanPham_sua').val(txtTenSanPham);
			$('#txtGiaBanSanPham_sua').val(txtGiaBanSanPham);
			$('#txtMoTaSanPham_sua').val(txtMoTaSanPham);
			$('#txtNhaSanXuatSanPham_sua').val(txtNhaSanXuatSanPham);
			$('#txtHinhAnhSanPham_sua').val(txtHinhAnhSanPham);
			$('#txtSoLuongTonSanPham_sua').val(txtSoLuongTonSanPham);
			$('#dialog_suaSanPham').dialog("open");
		};

		function thuc_hien_them() {
			$('.dynamic-input-error').remove();
			var valid = true;

			var txtLoaiSanPham = $.trim($('#txtLoaiSanPham').val());
			var txtMaSanPham = $.trim($('#txtMaSanPham').val());
			var txtTenSanPham = $.trim($('#txtTenSanPham').val());
			var txtGiaBanSanPham = $.trim($('#txtGiaBanSanPham').val());
			var txtMoTaSanPham = $.trim($('#txtMoTaSanPham').val());
			var txtNhaSanXuatSanPham = $.trim($('#txtNhaSanXuatSanPham').val());
			var txtHinhAnhSanPham = $.trim($('#txtHinhAnhSanPham').val());
			var txtSoLuongTonSanPham = $.trim($('#txtSoLuongTonSanPham').val());

			if (txtLoaiSanPham == '') {
				$('#txtLoaiSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtMaSanPham == '') {
				$('#txtMaSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtTenSanPham == '') {
				$('#txtTenSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtGiaBanSanPham == '') {
				$('#txtGiaBanSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNhaSanXuatSanPham == '') {
				$('#txtNhaSanXuatSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtMoTaSanPham == '') {
				$('#txtMoTaSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtHinhAnhSanPham == '') {
				$('#txtHinhAnhSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtSoLuongTonSanPham == '') {
				$('#txtSoLuongTonSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}

			if (valid) {
				$.ajax({
					type: "POST",
					url: "/quanlybanhang/admin/sanpham/create-edit/",
					data: {
						'task': 'them',
						'LoaiSanPham': txtLoaiSanPham,
						'MaSanPham': txtMaSanPham,
						'TenSanPham': txtTenSanPham,
						'GiaBanSanPham': txtGiaBanSanPham,
						'NhaSanXuatSanPham': txtNhaSanXuatSanPham,
						'MoTaSanPham': txtMoTaSanPham,
						'HinhAnhSanPham': txtHinhAnhSanPham,
						'SoLuongTonSanPham': txtSoLuongTonSanPham,
					},
					success: function (data) {
						location.reload();
					}
				});
			} else {
				return valid;
			}
		};

		function thuc_hien_sua() {
			$('.dynamic-input-error').remove();
			var valid = true;

			var txtLoaiSanPham = $.trim($('#txtLoaiSanPham_sua').val());
			var txtMaSanPham = $.trim($('#txtMaSanPham_sua').val());
			var txtTenSanPham = $.trim($('#txtTenSanPham_sua').val());
			var txtDiaChiSanPham = $.trim($('#txtDiaChiSanPham_sua').val());
			var txtGioiTinhSanPham = $.trim($('#txtGioiTinhSanPham_sua').val());
			var txtNgaySinhSanPham = $.trim($('#txtNgaySinhSanPham_sua').val());
			var txtDienThoaiSanPham = $.trim($('#txtDienThoaiSanPham_sua').val());
			var txtEmailSanPham = $.trim($('#txtEmailSanPham_sua').val());

			if (txtLoaiSanPham == '') {
				$('#txtLoaiSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtMaSanPham == '') {
				$('#txtMaSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtTenSanPham == '') {
				$('#txtTenSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtDiaChiSanPham == '') {
				$('#txtDiaChiSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtGioiTinhSanPham == '') {
				$('#txtGioiTinhSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNgaySinhSanPham == '') {
				$('#txtNgaySinhSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtDienThoaiSanPham == '') {
				$('#txtDienThoaiSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtEmailSanPham == '') {
				$('#txtEmailSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}

			if (valid) {
				$.ajax({
					type: "POST",
					url: "/quanlybanhang/admin/sanpham/create-edit/",
					data: {
						'task': 'sua',
						'LoaiSanPham': txtLoaiSanPham,
						'MaSanPham': txtMaSanPham,
						'TenSanPham': txtTenSanPham,
						'DiaChiSanPham': txtDiaChiSanPham,
						'GioiTinhSanPham': txtGioiTinhSanPham,
						'NgaySinhSanPham': txtNgaySinhSanPham,
						'DienThoaiSanPham': txtDienThoaiSanPham,
						'EmailSanPham': txtEmailSanPham,
					},
					success: function (data) {
						location.reload();
					}
				});
			} else {
				return valid;
			}
		};

		function thuc_hien_xoa(ma) {
			$.ajax({
				type: "POST",
				url: "/quanlybanhang/admin/sanpham/delete/",
				data: {
					'task': 'xoa',
					'MaSanPham': ma,
				},
				success: function (data) {
					location.reload();
				}
			});
		};
	</script>
</body>


</html>