<!DOCTYPE html>

<%@page import="java.util.List"%>
<%@page import="com.db4o.internal.Null"%>
<%@page import="com.db4o.ObjectSet"%>
<%@page import="com.db4o.ObjectContainer"%>
<%@page import="model.PUB_Lib"%>

<%@page import="model.O_NhanVien"%>
<%@page import="model.D_NhanVien"%>

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
        D_NhanVien d_kh = new D_NhanVien();
        O_NhanVien o_kh = new O_NhanVien();

        ObjectSet<O_NhanVien> lstNhanVien = d_kh.selectAll(db);
		int i=0;
		%>



	<div class="row-fluid">
		<div class="span12">
			<div class="grid simple ">
				<div class="grid-title no-border">
					<span class=".col-xs-12 .col-md-8">
						<h4>Danh sách Nhân viên</h4>
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
								<th>Tên nhân viên</th>
								<th>Giới tính</th>
								<th>Ngày sinh</th>
								<th>Địa chỉ</th>
								<th>Ngày bắt đầu làm việc</th>
								<th>Lương</th>
								<th></th>
							</tr>
						</thead>
						<tbody role="alert" aria-live="polite" aria-relevant="all">
							<%
								for (O_NhanVien kh : lstNhanVien) {
							%>
							<tr class="">
								<td>
									<button class="btn btnChiTiet" id="btn<%=i%>" value="<%=i%>" style="padding: 2px 6px; padding-top: 2px">
										<i class="icon-align-left"></i>
									</button>
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
											out.println(kh.getNv_ngaybatdaulamviec());
										%>
								</td>
								<td class=" sorting_1">
									<%
											out.println(kh.getNv_luong());
										%>
								</td>
								<td>
									<button style="background-color: white;" class="btn btn-social" onclick="sua_mo_form(<%=kh.getNd_ma()%>, '<%=kh.getNd_ten()%>', '<%=kh.getNd_diachi().getDuong()%>', '<%=kh.getNd_gioitinh()%>', '<%=kh.getNd_ngaysinh()%>', '<%=kh.getNv_ngaybatdaulamviec()%>', '<%=kh.getNv_luong()%>');"><i
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
	<div id="dialog_themNhanVien" title="THÊM NHÂN VIÊN" style="display: none; text-align: center;">
		<form name="frmThem" method="post">
			<table width="100%" border="0" class="" cellpadding="5px">
				<tr>
					<td align="left" class="cell-dialog">Mã nhân viên<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtMaNhanVien" name="txtMaNhanVien" class="input-large " type="number">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Tên nhân viên<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtTenNhanVien" name="txtTenNhanVien" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Giới tính Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtGioiTinhNhanVien" name="txtGioiTinhNhanVien" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Ngày sinh Khách hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtNgaySinhNhanVien" name="txtNgaySinhNhanVien" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Địa chỉ Nhân viên<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtDiaChiNhanVien" name="txtDiaChiNhanVien" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Ngày bắt đầu làm việc<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtNgayBatDauLamViecNhanVien" name="txtNgayBatDauLamViecNhanVien" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Lương<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtLuongNhanVien" name="txtLuongNhanVien" class="input-large " type="text">
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
			$("#dialog_themNhanVien").dialog({
				autoOpen: false,
				width: 800,
			});

			$("#dialog_suaNhanVien").dialog({
				autoOpen: false,
				width: 800,
			});
		});

		function them_mo_form() {
			$('#dialog_themNhanVien').dialog("open");
		};

		function sua_mo_form(txtMaNhanVien, txtTenNhanVien, txtDiaChiNhanVien, txtGioiTinhNhanVien,
			txtNgaySinhNhanVien, txtNgayBatDauLamViecNhanVien, txtLuongNhanVien) {
			$('#ID_Sua').val(txtMaNhanVien);

			$('#txtMaNhanVien_sua').val(txtMaNhanVien);
			$('#txtTenNhanVien_sua').val(txtTenNhanVien);
			$('#txtDiaChiNhanVien_sua').val(txtDiaChiNhanVien);
			$('#txtGioiTinhNhanVien_sua').val(txtGioiTinhNhanVien);
			$('#txtNgaySinhNhanVien_sua').val(txtNgaySinhNhanVien);
			$('#txtNgayBatDauLamViecNhanVien_sua').val(txtNgayBatDauLamViecNhanVien);
			$('#txtLuongNhanVien_sua').val(txtLuongNhanVien);
			$('#dialog_suaNhanVien').dialog("open");
		};

		function thuc_hien_them() {
			$('.dynamic-input-error').remove();
			var valid = true;

			var txtMaNhanVien = $.trim($('#txtMaNhanVien').val());
			var txtTenNhanVien = $.trim($('#txtTenNhanVien').val());
			var txtDiaChiNhanVien = $.trim($('#txtDiaChiNhanVien').val());
			var txtGioiTinhNhanVien = $.trim($('#txtGioiTinhNhanVien').val());
			var txtNgaySinhNhanVien = $.trim($('#txtNgaySinhNhanVien').val());
			var txtNgayBatDauLamViecNhanVien = $.trim($('#txtNgayBatDauLamViecNhanVien').val());
			var txtLuongNhanVien = $.trim($('#txtLuongNhanVien').val());

			if (txtMaNhanVien == '') {
				$('#txtMaNhanVien').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtTenNhanVien == '') {
				$('#txtTenNhanVien').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtDiaChiNhanVien == '') {
				$('#txtDiaChiNhanVien').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtGioiTinhNhanVien == '') {
				$('#txtGioiTinhNhanVien').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNgaySinhNhanVien == '') {
				$('#txtNgaySinhNhanVien').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNgayBatDauLamViecNhanVien == '') {
				$('#txtNgayBatDauLamViecNhanVien').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtLuongNhanVien == '') {
				$('#txtLuongNhanVien').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}

			if (valid) {
				$.ajax({
					type: "POST",
					url: "/quanlybanhang/admin/nhanvien/create-edit/",
					data: {
						'task': 'them',
						'MaNhanVien': txtMaNhanVien,
						'TenNhanVien': txtTenNhanVien,
						'DiaChiNhanVien': txtDiaChiNhanVien,
						'GioiTinhNhanVien': txtGioiTinhNhanVien,
						'NgaySinhNhanVien': txtNgaySinhNhanVien,
						'NgayBatDauLamViecNhanVien': txtNgayBatDauLamViecNhanVien,
						'LuongNhanVien': txtLuongNhanVien,
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

			var txtLoaiNhanVien = $.trim($('#txtLoaiNhanVien_sua').val());
			var txtMaNhanVien = $.trim($('#txtMaNhanVien_sua').val());
			var txtTenNhanVien = $.trim($('#txtTenNhanVien_sua').val());
			var txtDiaChiNhanVien = $.trim($('#txtDiaChiNhanVien_sua').val());
			var txtGioiTinhNhanVien = $.trim($('#txtGioiTinhNhanVien_sua').val());
			var txtNgaySinhNhanVien = $.trim($('#txtNgaySinhNhanVien_sua').val());
			var txtNgayBatDauLamViecNhanVien = $.trim($('#txtNgayBatDauLamViecNhanVien_sua').val());
			var txtLuongNhanVien = $.trim($('#txtLuongNhanVien_sua').val());

			if (txtLoaiNhanVien == '') {
				$('#txtLoaiNhanVien_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtMaNhanVien == '') {
				$('#txtMaNhanVien_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtTenNhanVien == '') {
				$('#txtTenNhanVien_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtDiaChiNhanVien == '') {
				$('#txtDiaChiNhanVien_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtGioiTinhNhanVien == '') {
				$('#txtGioiTinhNhanVien_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNgaySinhNhanVien == '') {
				$('#txtNgaySinhNhanVien_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNgayBatDauLamViecNhanVien == '') {
				$('#txtNgayBatDauLamViecNhanVien_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtLuongNhanVien == '') {
				$('#txtLuongNhanVien_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}

			if (valid) {
				$.ajax({
					type: "POST",
					url: "/quanlybanhang/admin/nhanvien/create-edit/",
					data: {
						'task': 'sua',
						'MaNhanVien': txtMaNhanVien,
						'TenNhanVien': txtTenNhanVien,
						'DiaChiNhanVien': txtDiaChiNhanVien,
						'GioiTinhNhanVien': txtGioiTinhNhanVien,
						'NgaySinhNhanVien': txtNgaySinhNhanVien,
						'NgayBatDauLamViecNhanVien': txtNgayBatDauLamViecNhanVien,
						'LuongNhanVien': txtLuongNhanVien,
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
				url: "/quanlybanhang/admin/nhanvien/delete/",
				data: {
					'task': 'xoa',
					'MaNhanVien': ma,
				},
				success: function (data) {
					location.reload();
				}
			});
		};
	</script>
</body>


</html>