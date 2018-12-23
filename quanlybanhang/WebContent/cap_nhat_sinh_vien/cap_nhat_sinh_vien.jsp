<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="com.db4o.ObjectContainer"%>
<%@page import="model.O_BCHChiDoan"%>
<%@page import="model.O_SinhVien"%>
<%@page import="java.util.List"%>

<%@page import="model.O_ChiDoan"%>
<%@page import="com.db4o.ObjectSet"%>
<%@page import="model.D_ChiDoan"%>
<%@page import="model.PUB_Lib"%>

<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<html>
<head>

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<meta charset="utf-8" />
<title>QUẢN LÝ HOẠT ĐỘNG ĐOÀN</title>

<%@include file="../moduls/I_CSS.html"%>

<script src="../assets/js/them_sua_sinh_vien.js" type="text/javascript"></script>

</head>
<body>
<%@include file="../moduls/header.jsp"%>
	<%@include file="../moduls/menubar.jsp"%>

	<%  
	String ma = request.getParameter("machidoan");
	PUB_Lib conn = new PUB_Lib();
	conn.connect();
	ObjectContainer	db = conn.getDb();
	D_ChiDoan dcd= new D_ChiDoan();
	O_ChiDoan cd = dcd.found_O_ChiDoan(db, ma);
	List<O_SinhVien> svs = dcd.selectSinhVien_ChiDoan(db, ma);

%>

	<div class="row-fluid">
		<div class="span12">
			<div class="grid simple ">
				<div class="grid-title no-border">
					<span class="text-info" style="font-size: 24px;"> Thông Tin Chi Đoàn </span>
				</div>
				<div class="grid-body ">
				<table>
				<tbody>
				<tr>
						<th style="width: 300px; height: 30px; font-size: 14px;font-style: normal;" align="left">Mã Chi Đoàn  : &nbsp;</th><th>&nbsp;</th>
						
						<th style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);" align="left"><%=ma%></th>
					</tr>
					
					<tr>
						<th style="width: 300px; height: 30px; font-size: 14px;" align="left">Tên Chi Đoàn  : &nbsp;</th><th>&nbsp;</th>
						<th style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);" align="left"><%=cd.getTenchidoan()%></th>
					</tr>
				
        				</tbody>
				
					
				</table>
				</div>
			</div>
</div>

	<div class="row-fluid">
		<div class="span12">
			<div class="grid simple ">
				<div class="grid-title no-border">
					<span class="text-info" style="font-size: 24px;"> Danh Sách
						Sinh Vien </span> <span class=".col-xs-6 .col-md-4"> <a href="#"
						class="btn-social" title="them sinh vien"
						onclick="them_sinh_vien_mo_form()"><i
							class="icon-plus-sign-alt"></i></a> <a href="#" class="btn-social"><i
							class="icon-print"></i></a> <a href="#"  onclick="test()" class="btn-social"><i
							class="icon-refresh"></i></a>
					</span>
					
				</div>


		 <div class="grid-body ">
             <table cellpadding="0" cellspacing="0" border="0" class="table " id="example3" width="100%" >

                <thead>
                  <tr>
							
								
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center">Mã Sinh Viên</th>
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center"> Họ Tên</th>
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center">  Địa Chỉ</th>
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center"> Email</th>
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center"> Số ĐT</th>
									
									<th class="text-center"></th>
								</tr>
							</thead>
							<tbody>
								<%for(O_SinhVien sv:svs){ 
												String masv =sv.getMa();
												String tensv = sv.getHoTen();
												
												%>
								<tr>
								
									<td class="text-center"><%=masv %></td>
									<td class="text-center"><%=tensv %></td>
									<td class="text-center"><%=sv.getDiaChi() %></td>
									<td class="text-center"><%=sv.getEmail() %></td>
									<td class="text-center"><%=sv.getSoDienThoai() %></td>	
									<td class="text-center">
								
									<a  class="btn btn-social" onclick="sua_sinh_vien_mo_form('<%=masv %>',
																							'<%=tensv %>',
																							'<%=sv.getDiaChi() %>',
																							'<%=sv.getEmail() %>',
																							'<%=sv.getSoDienThoai() %>',
																							'<%=sv.getDiaChiFaceBook() %>',
																							'<%=sv.getSkype() %>')"
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
	</div>
		<!-- =================== sua chi doan -->
		
	<div id="dialog_themsinhvien" title="THÊM SINH VIEN"
		style="display: none; text-align: center;">
		<form name="frmThemSinhVien" method="post">
			<table width="100%" border="0" class="" cellpadding="5px">
				<tr>
					<td align="left" class="cell-dialog">Mã Sinh Vien<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input id="txtMaSV"
						name="txtMaSV" style="height: 30px; width: 300px;"
						type="text">
						<input id="txtmacd"
						name="txtmacd" value="<%=ma %>" style="height: 30px; width: 300px; visibility: hidden;"
						type="text" >
						</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Ho va Ten<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input id="txtTenSV"
						name="txtTenSV" style="height: 30px; width: 300px;"
						type="text"></td>
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
					<td align="left" class="cell-dialog">  Email<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input id="txtEmail"
						name="txtEmail" style="height: 30px; width: 300px;"
						type="text"></td>
				</tr>
					<tr>
					<td align="left" class="cell-dialog">Facebook</td>
					<td align="left" class="cell-dialog"><input id="txtfb"
						name="txtfb" style="height: 30px; width: 300px;"
						type="text"></td>
				</tr>
					<tr>
					<td align="left" class="cell-dialog"> Skype</td>
					<td align="left" class="cell-dialog"><input id="txtskype"
						name="txtskype" style="height: 30px; width: 300px;"
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
							onclick="thuc_hien_them_sinh_vien()">Thêm Sinh Vien</button>
						<button type="button" class="btn btn-success btn-cons"
							id="btnClosethem">Đóng</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dialog_suasinhvien" title="CẬP NHẬT SINH VIEN"
		style="display: none; text-align: center;">
		<form name="frmsuaSinhVien" method="post">
			<table width="100%" border="0" class="" cellpadding="5px">
				<tr>
					<td align="left" class="cell-dialog">Mã Sinh Vien<font
						color="red"></font></td>
					<td align="left" class="cell-dialog"><input  id="txtMaSV_sua"
						name="txtMaSV_sua" style="height: 30px; width: 300px" disabled="disabled"
						type="text">
						<input id="txtmacd"
						name="txtmacd" value="<%=ma %>" style="height: 30px; width: 300px; visibility: hidden;"
						type="text" >
						</td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Ho va Ten<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input id="txtTenSV_sua"
						name="txtTenSV_sua" style="height: 30px; width: 300px;"
						type="text"></td>
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
					<td align="left" class="cell-dialog">  Email<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input id="txtEmail_sua"
						name="txtEmail_sua" style="height: 30px; width: 300px;"
						type="text"></td>
				</tr>
					<tr>
					<td align="left" class="cell-dialog">Facebook</td>
					<td align="left" class="cell-dialog"><input id="txtfb_sua"
						name="txtfb_sua" style="height: 30px; width: 300px;"
						type="text"></td>
				</tr>
					<tr>
					<td align="left" class="cell-dialog"> Skype</td>
					<td align="left" class="cell-dialog"><input id="txtskype_sua"
						name="txtskype_sua" style="height: 30px; width: 300px;"
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
							onclick="thuc_hien_cap_nhat_sinh_vien()">Cập Nhật</button>
							<button type="button" class="btn btn-warning btn-cons"
							onclick="thuc_hien_xoa_sinh_vien()">Xóa</button>
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
