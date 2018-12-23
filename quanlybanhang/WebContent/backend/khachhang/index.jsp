<!DOCTYPE html>

<%@page import="java.util.List"%>
<%@page import="com.db4o.internal.Null"%>
<%@page import="com.db4o.ObjectSet"%>
<%@page import="com.db4o.ObjectContainer"%>
<%@page import="model.PUB_Lib"%>

<%@page import="model.O_KhachHang"%>
<%@page import="model.D_KhachHang"%>

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
        D_KhachHang d_kh = new D_KhachHang();
        O_KhachHang o_kh = new O_KhachHang();

        ObjectSet<O_KhachHang> lstKhachHang = d_kh.selectAll(db);
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
								<th>Loại khách hàng</th>
								<th>Tên khách hàng</th>
								<th>Giới tính</th>
								<th>Ngày sinh</th>
								<th>Địa chỉ</th>
								<th>Số điện thoại</th>
								<th>Email</th>
								<th></th>
							</tr>
						</thead>
						<tbody role="alert" aria-live="polite" aria-relevant="all">
							<%
								for (O_KhachHang kh : lstKhachHang) {
							%>
							<tr class="">
								<td>
									<button class="btn btnChiTiet" id="btn<%=i%>" value="<%=i%>" style="padding: 2px 6px; padding-top: 2px">
										<i class="icon-align-left"></i>
									</button>
								</td>
								<td class=" sorting_1">
									<%
											out.println(kh.getKh_loaiKH());
										%>
								</td>
								<td class=" sorting_1">
									<%
										out.println(kh.getNd_ten());
									%>
								</td>
								<td class=" sorting_1">
									<%
										out.println(kh.getNd_gioitinh());
									%>
								</td>
								<td class=" sorting_1">
									<%
											out.println(kh.getNd_ngaysinh());
										%>
								</td>
								<td class=" sorting_1">
									<%
											out.println(kh.getNd_diachi().getDuong());
										%>
								</td>
								<td class=" sorting_1">
									<%
											out.println(kh.getKh_dienthoai());
										%>
								</td>
								<td class=" sorting_1">
									<%
											out.println(kh.getKh_email());
										%>
								</td>
								<td>
									<button style="background-color: white;" class="btn btn-social" onclick="sua_mo_form('<%=kh.getKh_loaiKH()%>', <%=kh.getNd_ma()%>, '<%=kh.getNd_ten()%>', '<%=kh.getNd_diachi().getDuong()%>', '<%=kh.getNd_gioitinh()%>', '<%=kh.getNd_ngaysinh()%>', '<%=kh.getKh_dienthoai()%>', '<%=kh.getKh_email()%>');"><i
										 class="icon-edit"></i></button>

									<button style="background-color: white;" class="btn btn-social" onclick="thuc_hien_xoa(<%=kh.getNd_ma()%>)"><i
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
	<div id="dialog_themKhachHang" title="THÊM KHÁCH HÀNG" style="display: none; text-align: center;">
		<form name="frmThem" method="post">
			<table width="100%" border="0" class="" cellpadding="5px">
				<tr>
					<td align="left" class="cell-dialog" width="200px">Loại Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtLoaiKhachHang" name="txtLoaiKhachHang" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Mã khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtMaKhachHang" name="txtMaKhachHang" class="input-large " type="number">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Tên Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtTenKhachHang" name="txtTenKhachHang" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Địa chỉ Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtDiaChiKhachHang" name="txtDiaChiKhachHang" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Giới tính Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtGioiTinhKhachHang" name="txtGioiTinhKhachHang" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Ngày sinh Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtNgaySinhKhachHang" name="txtNgaySinhKhachHang" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Điện thoại Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtDienThoaiKhachHang" name="txtDienThoaiKhachHang" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Email Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtEmailKhachHang" name="txtEmailKhachHang" class="input-large " type="text">
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

	<div id="dialog_suaKhachHang" title="SỬA KHÁCH HÀNG" style="display: none; text-align: center;">
		<form name="frmSua" method="post">
			<input type="hidden" value="" name="ID_Sua" style="visibility: hidden;">
			<table width="100%" border="0" class="" cellpadding="5px">
				<tr>
					<td align="left" class="cell-dialog" width="200px">Loại Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtLoaiKhachHang_sua" name="txtLoaiKhachHang_sua" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Mã khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtMaKhachHang_sua" name="txtMaKhachHang_sua" class="input-large " type="number" disabled>
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Tên Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtTenKhachHang_sua" name="txtTenKhachHang_sua" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Địa chỉ Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtDiaChiKhachHang_sua" name="txtDiaChiKhachHang_sua" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Giới tính Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtGioiTinhKhachHang_sua" name="txtGioiTinhKhachHang_sua" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Ngày sinh Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtNgaySinhKhachHang_sua" name="txtNgaySinhKhachHang_sua" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Điện thoại Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtDienThoaiKhachHang_sua" name="txtDienThoaiKhachHang_sua" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Email Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtEmailKhachHang_sua" name="txtEmailKhachHang_sua" class="input-large " type="text">
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
						<button type="button" class="btn btn-success btn-cons" onclick="thuc_hien_sua()">Thực hiện</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<% conn.closeconnect(); %>

	<script>
		$(document).ready(function () {
			$("#dialog_themKhachHang").dialog({
				autoOpen: false,
				width: 800,
			});

			$("#dialog_suaKhachHang").dialog({
				autoOpen: false,
				width: 800,
			});
		});

		function them_mo_form() {
			$('#dialog_themKhachHang').dialog("open");
		};

		function sua_mo_form(txtLoaiKhachHang, txtMaKhachHang, txtTenKhachHang, txtDiaChiKhachHang, txtGioiTinhKhachHang,
			txtNgaySinhKhachHang, txtDienThoaiKhachHang, txtEmailKhachHang) {
			$('#ID_Sua').val(txtMaKhachHang);

			$('#txtLoaiKhachHang_sua').val(txtLoaiKhachHang);
			$('#txtMaKhachHang_sua').val(txtMaKhachHang);
			$('#txtTenKhachHang_sua').val(txtTenKhachHang);
			$('#txtDiaChiKhachHang_sua').val(txtDiaChiKhachHang);
			$('#txtGioiTinhKhachHang_sua').val(txtGioiTinhKhachHang);
			$('#txtNgaySinhKhachHang_sua').val(txtNgaySinhKhachHang);
			$('#txtDienThoaiKhachHang_sua').val(txtDienThoaiKhachHang);
			$('#txtEmailKhachHang_sua').val(txtEmailKhachHang);
			$('#dialog_suaKhachHang').dialog("open");
		};

		function thuc_hien_them() {
			$('.dynamic-input-error').remove();
			var valid = true;

			var txtLoaiKhachHang = $.trim($('#txtLoaiKhachHang').val());
			var txtMaKhachHang = $.trim($('#txtMaKhachHang').val());
			var txtTenKhachHang = $.trim($('#txtTenKhachHang').val());
			var txtDiaChiKhachHang = $.trim($('#txtDiaChiKhachHang').val());
			var txtGioiTinhKhachHang = $.trim($('#txtGioiTinhKhachHang').val());
			var txtNgaySinhKhachHang = $.trim($('#txtNgaySinhKhachHang').val());
			var txtDienThoaiKhachHang = $.trim($('#txtDienThoaiKhachHang').val());
			var txtEmailKhachHang = $.trim($('#txtEmailKhachHang').val());

			if (txtLoaiKhachHang == '') {
				$('#txtLoaiKhachHang').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtMaKhachHang == '') {
				$('#txtMaKhachHang').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtTenKhachHang == '') {
				$('#txtTenKhachHang').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtDiaChiKhachHang == '') {
				$('#txtDiaChiKhachHang').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtGioiTinhKhachHang == '') {
				$('#txtGioiTinhKhachHang').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNgaySinhKhachHang == '') {
				$('#txtNgaySinhKhachHang').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtDienThoaiKhachHang == '') {
				$('#txtDienThoaiKhachHang').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtEmailKhachHang == '') {
				$('#txtEmailKhachHang').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}

			if (valid) {
				$.ajax({
					type: "POST",
					url: "/quanlybanhang/admin/khachhang/create-edit/",
					data: {
						'task': 'them',
						'LoaiKhachHang': txtLoaiKhachHang,
						'MaKhachHang': txtMaKhachHang,
						'TenKhachHang': txtTenKhachHang,
						'DiaChiKhachHang': txtDiaChiKhachHang,
						'GioiTinhKhachHang': txtGioiTinhKhachHang,
						'NgaySinhKhachHang': txtNgaySinhKhachHang,
						'DienThoaiKhachHang': txtDienThoaiKhachHang,
						'EmailKhachHang': txtEmailKhachHang,
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

			var txtLoaiKhachHang = $.trim($('#txtLoaiKhachHang_sua').val());
			var txtMaKhachHang = $.trim($('#txtMaKhachHang_sua').val());
			var txtTenKhachHang = $.trim($('#txtTenKhachHang_sua').val());
			var txtDiaChiKhachHang = $.trim($('#txtDiaChiKhachHang_sua').val());
			var txtGioiTinhKhachHang = $.trim($('#txtGioiTinhKhachHang_sua').val());
			var txtNgaySinhKhachHang = $.trim($('#txtNgaySinhKhachHang_sua').val());
			var txtDienThoaiKhachHang = $.trim($('#txtDienThoaiKhachHang_sua').val());
			var txtEmailKhachHang = $.trim($('#txtEmailKhachHang_sua').val());

			if (txtLoaiKhachHang == '') {
				$('#txtLoaiKhachHang_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtMaKhachHang == '') {
				$('#txtMaKhachHang_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtTenKhachHang == '') {
				$('#txtTenKhachHang_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtDiaChiKhachHang == '') {
				$('#txtDiaChiKhachHang_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtGioiTinhKhachHang == '') {
				$('#txtGioiTinhKhachHang_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNgaySinhKhachHang == '') {
				$('#txtNgaySinhKhachHang_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtDienThoaiKhachHang == '') {
				$('#txtDienThoaiKhachHang_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtEmailKhachHang == '') {
				$('#txtEmailKhachHang_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}

			if (valid) {
				$.ajax({
					type: "POST",
					url: "/quanlybanhang/admin/khachhang/create-edit/",
					data: {
						'task': 'sua',
						'LoaiKhachHang': txtLoaiKhachHang,
						'MaKhachHang': txtMaKhachHang,
						'TenKhachHang': txtTenKhachHang,
						'DiaChiKhachHang': txtDiaChiKhachHang,
						'GioiTinhKhachHang': txtGioiTinhKhachHang,
						'NgaySinhKhachHang': txtNgaySinhKhachHang,
						'DienThoaiKhachHang': txtDienThoaiKhachHang,
						'EmailKhachHang': txtEmailKhachHang,
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
				url: "/quanlybanhang/admin/khachhang/delete/",
				data: {
					'task': 'xoa',
					'MaKhachHang': ma,
				},
				success: function (data) {
					location.reload();
				}
			});
		};
	</script>
</body>


</html>