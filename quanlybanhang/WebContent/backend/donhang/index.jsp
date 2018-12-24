<!DOCTYPE html>

<%@page import="java.util.List"%>
<%@page import="com.db4o.internal.Null"%>
<%@page import="com.db4o.ObjectSet"%>
<%@page import="com.db4o.ObjectContainer"%>
<%@page import="model.PUB_Lib"%>

<%@page import="model.O_DonHang"%>
<%@page import="model.D_DonHang"%>

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
        D_DonHang d = new D_DonHang();
        O_DonHang o = new O_DonHang();

        ObjectSet<O_DonHang> lstDonHang = d.selectAll(db);
		int i=0;
		%>



	<div class="row-fluid">
		<div class="span12">
			<div class="grid simple ">
				<div class="grid-title no-border">
					<span class=".col-xs-12 .col-md-8">
						<h4>Danh sách Đơn hàng</h4>
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
								<th>Mã đơn hàng</th>
								<th>Ngày lập</th>
								<th>Ngày giao</th>
								<th>Nơi giao</th>
								<th>Tình trạng thanh toán</th>
								<th>Nhân viên duyệt đơn hàng</th>
								<th></th>
							</tr>
						</thead>
						<tbody role="alert" aria-live="polite" aria-relevant="all">
							<%
								for (O_DonHang item : lstDonHang) {
							%>
							<tr class="">
								<td>
									<button class="btn btnChiTiet" id="btn<%=i%>" value="<%=i%>" style="padding: 2px 6px; padding-top: 2px">
										<i class="icon-align-left"></i>
									</button>
								</td>
								<td class=" sorting_1">
									<%
											out.println(item.getDh_ma());
										%>
								</td>
								<td class=" sorting_1">
									<%
										out.println(item.getDh_ngaylap());
									%>
								</td>
								<td class=" sorting_1">
									<%
										out.println(item.getDh_ngaygiao());
									%>
								</td>
								<td class=" sorting_1">
									<%
											out.println(item.getDh_noigiao());
										%>
								</td>
								<td class=" sorting_1">
									<%
									if(item.getDh_trangthaithanhtoan() == "Đã thanh toán") {
										out.println("<span class=\"label label-success\">"+item.getDh_trangthaithanhtoan()+"</span>");
									}
									else {
											out.println("<span class=\"label label-danger\">"+item.getDh_trangthaithanhtoan()+"</span>");
									}
										%>
								</td>
								<td class=" sorting_1">
									<%
											out.println(item.getNv_duyet_donhang().getNd_ten());
										%>
								</td>
								<td>
									<button style="background-color: white;" class="btn btn-social" onclick="sua_mo_form('<%=item.getDh_ma()%>', <%=item.getDh_ngaylap()%>, '<%=item.getDh_ngaygiao()%>', '<%=item.getDh_noigiao()%>', '<%=item.getDh_trangthaithanhtoan()%>', '<%item.getNv_duyet_donhang().getNd_ten();%>');"><i
										 class="icon-edit"></i></button>

									<button style="background-color: white;" class="btn btn-social" onclick="thuc_hien_xoa(<%=item.getDh_ma()%>)"><i
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
	<div id="dialog_themDonHang" title="THÊM ĐƠN HÀNG" style="display: none; text-align: center;">
		<form name="frmThem" method="post">
			<table width="100%" border="0" class="" cellpadding="5px">
				<tr>
					<td align="left" class="cell-dialog" width="200px">Mã đơn hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtMaDonHang" name="txtMaDonHang" class="input-large " type="number">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Ngày lập<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtNgayLapDonHang" name="txtNgayLapDonHang" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Ngày giao<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtNgayGiaoDonHang" name="txtNgayGiaoDonHang" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Nơi giao đơn hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtNoiGiaoDonHang" name="txtNoiGiaoDonHang" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Tình trạng thanh toán<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<select id="txtTinhTrangThanhToanDonHang" name="txtTinhTrangThanhToanDonHang" class="input-large ">
							<option value="Đã thanh toán">Đã thanh toán</option>
							<option value="Chưa thanh toán">Chưa thanh toán</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Nhân viên duyệt đơn hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtNhanVienDuyetDonHang" name="txtNhanVienDuyetDonHang" class="input-large " type="text">
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

	<div id="dialog_suaDonHang" title="SỬA ĐƠN HÀNG" style="display: none; text-align: center;">
		<form name="frmSua" method="post">
			<table width="100%" border="0" class="" cellpadding="5px">
				<tr>
					<td align="left" class="cell-dialog" width="200px">Mã đơn hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtMaDonHang_sua" name="txtMaDonHang_sua" class="input-large " type="number">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Ngày lập<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtNgayLapDonHang_sua" name="txtNgayLapDonHang_sua" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Ngày giao<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtNgayGiaoDonHang_sua" name="txtNgayGiaoDonHang_sua" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Nơi giao đơn hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtNoiGiaoDonHang_sua" name="txtNoiGiaoDonHang_sua" class="input-large " type="text">
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Tình trạng thanh toán<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<select id="txtTinhTrangThanhToanDonHang_sua" name="txtTinhTrangThanhToanDonHang_sua" class="input-large ">
							<option value="Đã thanh toán">Đã thanh toán</option>
							<option value="Chưa thanh toán">Chưa thanh toán</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Nhân viên duyệt đơn hàng<font color="red">*</font>
					</td>
					<td align="left" class="cell-dialog">
						<input id="txtNhanVienDuyetDonHang_sua" name="txtNhanVienDuyetDonHang_sua" class="input-large " type="text">
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
			$("#dialog_themDonHang").dialog({
				autoOpen: false,
				width: 800,
			});

			$("#dialog_suaDonHang").dialog({
				autoOpen: false,
				width: 800,
			});
		});

		function them_mo_form() {
			$('#dialog_themDonHang').dialog("open");
		};

		function sua_mo_form(txtMaDonHang, txtNgayLapDonHang, txtNgayGiaoDonHang, txtNoiGiaoDonHang,
			txtTinhTrangThanhToanDonHang, txtNhanVienDuyetDonHang) {
			$('#ID_Sua').val(txtMaDonHang);

			$('#txtMaDonHang_sua').val(txtMaDonHang);
			$('#txtNgayLapDonHang_sua').val(txtNgayLapDonHang);
			$('#txtNgayGiaoDonHang_sua').val(txtNgayGiaoDonHang);
			$('#txtNoiGiaoDonHang_sua').val(txtNoiGiaoDonHang);
			$('#txtTinhTrangThanhToanDonHang_sua').val(txtTinhTrangThanhToanDonHang);
			$('#txtNhanVienDuyetDonHang_sua').val(txtNhanVienDuyetDonHang);
			
			$('#dialog_suaDonHang').dialog("open");
		};

		function thuc_hien_them() {
			$('.dynamic-input-error').remove();
			var valid = true;

			var txtMaDonHang = $.trim($('#txtMaDonHang').val());
			var txtNgayLapDonHang = $.trim($('#txtNgayLapDonHang').val());
			var txtNgayGiaoDonHang = $.trim($('#txtNgayGiaoDonHang').val());
			var txtNoiGiaoDonHang = $.trim($('#txtNoiGiaoDonHang').val());
			var txtTinhTrangThanhToanDonHang = $.trim($('#txtTinhTrangThanhToanDonHang').val());
			var txtNhanVienDuyetDonHang = $.trim($('#txtNhanVienDuyetDonHang').val());
			
			if (txtMaDonHang == '') {
				$('#txtMaDonHang').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNgayLapDonHang == '') {
				$('#txtNgayLapDonHang').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNgayGiaoDonHang == '') {
				$('#txtNgayGiaoDonHang').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNoiGiaoDonHang == '') {
				$('#txtNoiGiaoDonHang').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtTinhTrangThanhToanDonHang == '') {
				$('#txtTinhTrangThanhToanDonHang').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNhanVienDuyetDonHang == '') {
				$('#txtNhanVienDuyetDonHang').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}

			if (valid) {
				$.ajax({
					type: "POST",
					url: "/quanlybanhang/admin/donhang/create-edit/",
					data: {
						'task': 'them',
					
						'MaDonHang': txtMaDonHang,
						'NgayLapDonHang': txtNgayLapDonHang,
						'NgayGiaoDonHang': txtNgayGiaoDonHang,
						'NoiGiaoDonHang': txtNoiGiaoDonHang,
						'TinhTrangThanhToanDonHang': txtTinhTrangThanhToanDonHang,
						'NhanVienDuyetDonHang': txtNhanVienDuyetDonHang,
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

			var txtMaDonHang = $.trim($('#txtMaDonHang_sua').val());
			var txtNgayLapDonHang = $.trim($('#txtNgayLapDonHang_sua').val());
			var txtNgayGiaoDonHang = $.trim($('#txtNgayGiaoDonHang_sua').val());
			var txtNoiGiaoDonHang = $.trim($('#txtNoiGiaoDonHang_sua').val());
			var txtTinhTrangThanhToanDonHang = $.trim($('#txtTinhTrangThanhToanDonHang_sua').val());
			var txtNhanVienDuyetDonHang = $.trim($('#txtNhanVienDuyetDonHang_sua').val());

			if (txtMaDonHang == '') {
				$('#txtMaDonHang_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNgayLapDonHang == '') {
				$('#txtNgayLapDonHang_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNgayGiaoDonHang == '') {
				$('#txtNgayGiaoDonHang_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNoiGiaoDonHang == '') {
				$('#txtNoiGiaoDonHang_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtTinhTrangThanhToanDonHang == '') {
				$('#txtTinhTrangThanhToanDonHang_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNhanVienDuyetDonHang == '') {
				$('#txtNhanVienDuyetDonHang_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}

			if (valid) {
				$.ajax({
					type: "POST",
					url: "/quanlybanhang/admin/donhang/create-edit/",
					data: {
						'task': 'sua',
						'MaDonHang': txtMaDonHang,
						'NgayLapDonHang': txtNgayLapDonHang,
						'NgayGiaoDonHang': txtNgayGiaoDonHang,
						'NoiGiaoDonHang': txtNoiGiaoDonHang,
						'TinhTrangThanhToanDonHang': txtTinhTrangThanhToanDonHang,
						'NhanVienDuyetDonHang': txtNhanVienDuyetDonHang,
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
				url: "/quanlybanhang/admin/donhang/delete/",
				data: {
					'task': 'xoa',
					'MaDonHang': ma,
				},
				success: function (data) {
					location.reload();
				}
			});
		};
	</script>
</body>


</html>