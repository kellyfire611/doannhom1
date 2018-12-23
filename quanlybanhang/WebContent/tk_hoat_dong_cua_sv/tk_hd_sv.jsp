<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.O_KeHoach"%>
<%@page import="model.D_SinhVien"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="com.db4o.ObjectContainer"%>
<%@page import="model.O_BCHChiDoan"%>
<%@page import="model.O_SinhVien"%>
<%@page import="java.util.List"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.O_ChiDoan"%>
<%@page import="com.db4o.ObjectSet"%>
<%@page import="model.D_ChiDoan"%>
<%@page import="model.PUB_Lib"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>

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
		ObjectContainer db = conn.getDb();
		D_ChiDoan dcd = new D_ChiDoan();
		D_SinhVien dsv = new D_SinhVien();
		O_ChiDoan cd = dcd.found_O_ChiDoan(db, ma);
		List<O_SinhVien> svs = dcd.selectSinhVien_ChiDoan(db, ma);
		int i = 0;
		
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
		NumberFormat formatter = new DecimalFormat("###,###");
	%>

	<div class="row-fluid">
		<div class="span12">
			<div class="grid simple ">
				<div class="grid-title no-border">
					<span class="text-info" style="font-size: 24px;"> Thông Tin
						Chi Đoàn </span>
				</div>
				<div class="grid-body ">
					<table>
						<tbody>
							<tr>

								<th
									style="width: 300px; height: 30px; font-size: 14px; font-style: normal;"
									align="left">Mã Chi Đoàn : &nbsp;</th>
								<th>&nbsp;</th>

								<th
									style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
									align="left"><%=ma%></th>
								<th style="width: 300px; height: 30px; font-size: 14px;"
									align="left">Số Sinh Viên  : &nbsp;</th>
								<th>&nbsp;</th>
								<th
									style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
									align="left"><%=dcd.selectSinhVien_ChiDoan(db, ma).size()%></th>
							</tr>

							<tr>
								<th style="width: 300px; height: 30px; font-size: 14px;"
									align="left">Tên Chi Đoàn : &nbsp;</th>
								<th>&nbsp;</th>
								<th
									style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
									align="left"><%=cd.getTenchidoan()%></th>
								<th style="width: 300px; height: 30px; font-size: 14px;"
									align="left">Số Kế Hoạch  : &nbsp;</th>
								<th>&nbsp;</th>
								<th
									style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
									align="left"><%=dcd.selectKeHoach_ChiDoan(db, ma).size()%></th>
							</tr>
							<tr>
								
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
								class="icon-print"></i></a> <a href="#" onclick="test()"
							class="btn-social"><i class="icon-refresh"></i></a>
						</span>

					</div>


					<div class="grid-body ">
						<table cellpadding="0" cellspacing="0" border="0" class="table "
							id="example3" width="100%">

							<thead>
								<tr>

									<th></th>
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center">Mã Sinh Viên</th>
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center">Họ Tên</th>
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center">Địa Chỉ</th>
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center">Email</th>
									<th
										style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
										class="text-center">Số Kế Hoạch Tham Gia</th>


								</tr>
							</thead>
							<tbody>
							<tr>
								<%
									for (O_SinhVien sv : svs) {
										String masv = sv.getMa();
										String tensv = sv.getHoTen();
										List<O_KeHoach> khs = dsv.selectSinhVien_KeHoach(db, masv);
								%>
								
								<td>


									<button class="btn btnChiTiet"  id="btn<%=i%>"
										onclick="xem_chi_tiet('<%=i%>')" value="<%=i%>"
										style="padding: 2px 6px; padding-top: 2px;background-color: white;">
										<i class="icon-list"></i>
									</button>
								</td>
								

									<td class="text-center"><%=masv%></td>
									<td class="text-center"><%=tensv%></td>
									<td class="text-center"><%=sv.getDiaChi()%></td>
									<td class="text-center"><%=sv.getEmail()%></td>
									<td class="text-center"><%=khs.size()%></td>

								</tr>
								<tr id="trChiTiet_<%=i%>" style="display: none;" value='0'>
							<td></td>
							<td colspan="10">
								<table>
									<tr style="background-color: oldlace; color: orange;">
											
											<th align="center">Mã kế hoạch</th>
											<th align="center">Thời gian BĐ</th>
											<th align="center">Thời gian KT</th>
											<th align="center">Địa điểm</th>
											<th align="center">Nội dung</th>
											
											<th align="center">Duyệt</th>
											<th align="center"> Đã thực hiện</th>	
																
									</tr>
									
									
									<% 
									
									
									
									for ( O_KeHoach kehoach : khs) 
									{
								String makh=kehoach.getMakehoach();%>
							<tr class="">
								
								<td class="sorting_1">
									<% out.println(makh);%>
								</td>
								<td class=" sorting_1">
									<% 
									String date_bd = DATE_FORMAT.format(kehoach.getNgayBatDau());
									out.println(date_bd);%>
								</td>
								<td class=" sorting_1">
									<% 
									String date_kt = DATE_FORMAT.format(kehoach.getNgayKetThuc());
									out.println(date_kt);%>
								</td>
								<td class=" sorting_1">
									<% out.println(kehoach.getDiaDiem());%>
								</td>
								<td class=" sorting_1">
									<% out.println(kehoach.getNoiDung());%>
								</td>
								
								<td class=" sorting_1" align="center">
									<% if (kehoach.getDuyet()) { %>
										<span class="icon-ok"></span>
									<% } else { %>
										&nbsp;
									<% } %>
								</td>
								<td class=" sorting_1" align="center">
									<% if (kehoach.getDaThucHien()) { %>
										<span class="icon-ok"></span>
									<% } else { %>
										&nbsp;
									<% } %>									
								</td>
								
								
							</tr>
								<%} %>
								
										</table>
									
									
									</td>
								</tr>


								<%
								 i++;}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../moduls/footer.jsp"%>

</body>
<%
	conn.closeconnect();
%>
</html>
