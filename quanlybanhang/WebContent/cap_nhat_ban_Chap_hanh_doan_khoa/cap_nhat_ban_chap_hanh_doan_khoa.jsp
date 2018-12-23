<%@page import="model.O_DoanKhoa"%>
<%@page import="model.D_DoanKhoa"%>
<%@page import="com.db4o.ObjectContainer"%>

<%@page import="java.util.List"%>


<%@page import="com.db4o.ObjectSet"%>

<%@page import="model.PUB_Lib"%>

<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<html>
<head>

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<meta charset="utf-8" />
<title>QUẢN LÝ HOẠT ĐỘNG ĐOÀN</title>

<%@include file="../moduls/I_CSS.html"%>

<script src="../assets/js/update_bch_khoa.js" type="text/javascript"></script>

</head>
<body>
<%@include file="../moduls/header.jsp"%>
	<%@include file="../moduls/menubar.jsp"%>

	<% PUB_Lib conn = new PUB_Lib();
	conn.connect();
	ObjectContainer	db = conn.getDb();
	D_DoanKhoa ddk = new D_DoanKhoa();
	ObjectSet<O_DoanKhoa> dks = db.queryByExample(new O_DoanKhoa());	

%>



	<div class="row-fluid">
		<div class="span12">
			<div class="grid simple ">
				<div class="grid-title no-border">
					<span class="text-info" style="font-size: 24px;"> Danh Sách
						Sinh Vien </span> <span class=".col-xs-6 .col-md-4"> <a href="#"
						class="btn-social" title="them sinh vien"
						onclick="them_doan_khoa_mo_form()"><i
							class="icon-plus-sign-alt"></i></a> <a href="#" class="btn-social"><i
							class="icon-print"></i></a> <a href="#" class="btn-social"><i
							class="icon-refresh"></i></a>
					</span>
					
				</div>


		 <div class="grid-body ">
             <table cellpadding="0" cellspacing="0" border="0" class="table " id="example3" width="100%" >

                <thead>
                  <tr>
							
								
									
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center">Mã Số </th>
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center"> Họ và Tên</th>
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center"> Chức Vụ</th>
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center"> Số Điện Thoại </th>
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center">  Địa Chỉ</th>
									<th class="text-center"></th>
								</tr>
							</thead>
							<tbody>
								<%for(O_DoanKhoa dk :dks){ 
												String ma = dk.getMa();
												
												%>
								<tr>
								
										<td class="text-center"><%=ma %></td>
									<td class="text-center"><%=dk.getHoTen() %></td>
									<td class="text-center"><%=dk.getChucVu()%></td>
									<td class="text-center"><%=dk.getSoDienThoai()%></td>
									<td class="text-center"><%=dk.getDiaChi() %></td>
									<td class="text-center">
								
									<a href="#" class="btn btn-social" onclick="sua_bch_khoa_mo_form('<%=ma %>',
																									'<%=dk.getHoTen() %>',
																									'<%=dk.getChucVu() %>',
																									'<%=dk.getDiaChi() %>',
																									'<%=dk.getSoDienThoai() %>'
																									)"
										style="background-color: white;"> 
										<i style="color: #4C9ED9" class="icon-edit"> </i>
									</a>
									</td>
								</tr>
								

								<%} %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<!-- =================== sua chi doan -->
		
	<div id="dialog_thembchkhoa" title="THÊM BAN CHẤP HÀNH ĐOÀN KHOA"
		style="display: none; text-align: center;">
		<form name="frmThembchdk" method="post">
			<table style="width: 100%; border: 0; " cellpadding="5px">
				<tr>
					<td align="left" class="cell-dialog">Mã Số<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input id="txtMabchdk"
						name="txtMabchdk" style="height: 30px; width: 300px;"
						type="text">
					
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Ho va Ten<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input id="txtTenbchdk"
						name="txtTenbchdk" style="height: 30px; width: 300px;"
						type="text"></td>
				</tr>
					<tr>
					<td align="left" class="cell-dialog">  Chức Vụ<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog">
					<select id="txtChucvu"
						name="txtChucvu" style="height: 30px; width: 300px;">
					<option></option>
					<option>Bí Thư</option>
					<option> Phó Bí Thư</option>
					<option> Ủy Viên</option>
					</select>
					</td>
				</tr>
					
				<tr>
					<td align="left" class="cell-dialog">Địa Chỉ<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input id="txtDC"
						name="txtDC" style="height: 30px; width: 300px;"
						type="text"></td>
				</tr>
					<tr>
					<td align="left" class="cell-dialog"> SDT<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input id="txtSDT"
						name="txtSDT" style="height: 30px; width: 300px;"
						type="text"></td>
				</tr>
				
				
				

				<tr>
					<td align="left" colspan="2" class="cell-dialog"><i>(<font
							color="red">*</font>) thông tin bắt buộc nhập
					</i></td>
				</tr>
				<tr>
					<td align="center" colspan="2" class="cell-dialog">
						<hr>
						<button type="button" class="btn btn-success btn-cons"
							onclick="thuc_hien_them_bch_khoa()">Thêm BCH </button>
						<button type="button" class="btn btn-success btn-cons"
							id="btnClosethem">Đóng</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	
	
	
<!-- 	--------------------- -->
	<div id="dialog_suabchkhoa" title="CẬP NHẬT BAN CHẤP HÀNH ĐOÀN KHOA"
		style="display: none; text-align: center;">
		<form name="frmsuaSinhVien" method="post">
			<table style="width: 100%; border: 0; " cellpadding="5px">
				<tr>
					<td align="left" class="cell-dialog">Mã Số <font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input disabled="disabled" id="txtMabchdk_sua"
						name="txtMabchdk_sua" style="height: 30px; width: 300px;"
						type="text">
					
					</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Ho va Ten<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input id="txtTenbchdk_sua"
						name="txtTenbchdk_sua" style="height: 30px; width: 300px;"
						type="text"></td>
				</tr>
					<tr>
					<td align="left" class="cell-dialog">  Chức Vụ Hiện Tại<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input disabled="disabled" id="txtChucvucn"
						name="txtChucvucn" style="height: 30px; width: 300px;"
						type="text"></td>
				</tr>
				
				<tr>
					<td align="left" class="cell-dialog"> Cập Nhật Chức Vụ<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog">
					<select id="txtChucvu_sua"
						name="txtChucvu_sua" style="height: 30px; width: 300px;">
					<option selected="selected"></option>
					<option>Bí Thư</option>
					<option> Phó Bí Thư</option>
					<option> Ủy Viên</option>
					</select>
					</td>
				</tr>
					
					
				<tr>
					<td align="left" class="cell-dialog">Địa Chỉ<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input id="txtDC_sua"
						name="txtDC_sua" style="height: 30px; width: 300px;"
						type="text"></td>
				</tr>
					<tr>
					<td align="left" class="cell-dialog"> SDT<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input id="txtSDT_sua"
						name="txtSDT_sua" style="height: 30px; width: 300px;"
						type="text"></td>
				</tr>
				


				<tr>
					<td align="left" colspan="2" class="cell-dialog"><i>(<font
							color="red">*</font>) thông tin bắt buộc nhập
					</i></td>
				</tr>
				<tr>
					<td align="center" colspan="2" class="cell-dialog">
						<hr>
						<button type="button" class="btn btn-success btn-cons"
							onclick="thuc_hien_cap_nhat_bch_khoa()">Cập Nhật</button>
							<button type="button" class="btn btn-warning btn-cons"
							onclick="thuc_hien_xoa_bch_khoa()">Xóa</button>
						<button type="button" class="btn btn-success btn-cons"
							id="btnClosesua">Đóng</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="../moduls/footer.jsp"%>

</body>
<%conn.closeconnect(); %>
</html>
