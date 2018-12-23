
<%@page import="model.D_KeHoach"%>
<%@page import="model.O_KeHoach"%>
<%@page import="com.db4o.ObjectSet"%>
<%@page import="model.B_ThongKe"%>
<%@page import="com.db4o.ObjectContainer"%>
<%@page import="model.PUB_Lib"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<script src="../assets/js/tk_kh.js" type="text/javascript"></script>
</head>
<body>
<%@include file="../moduls/header.jsp"%>
<%@include file="../moduls/menubar.jsp"%>

<%
  
  PUB_Lib conn = new PUB_Lib();
  conn.connect();
  ObjectContainer db = conn.getDb();
  
  B_ThongKe tk = new B_ThongKe();
  D_KeHoach kh = new D_KeHoach();
  ObjectSet<O_KeHoach> khs = kh.selectAllKeHoach(db);
  
  SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
  NumberFormat formatter = new DecimalFormat("###,###");
%>
	<div class="row-fluid">
		<div class="span12">
			<div class="grid simple ">
				<div class="grid-title no-border">
					<span class="text-info" style="font-size: 24px;"> THỐNG KÊ KẾ HOẠCH </span>
				</div>
				<div class="grid-body ">
					<div >
						<ul class="nav nav-pills" id="tab-4">
							<li class="active"><a href="#tkkehoach">Kế Hoạch</a></li>
							<li><a href="#ds_khdaduyet"> Kế Hoạch Đã Duyệt</a></li>
							<li><a href="#ds_khchuaduyet"> Kế Hoạch Chưa Duyệt</a></li>
							<li><a href="#ds_khdathuchien"> Kế Hoạch Đã Thực Hiện</a></li>
							<li><a href="#ds_khchuathuchien"> Kế Hoạch Chưa Thực Hiện</a></li>
							
						</ul>
					
						<div class="tab-content">
<!-- ---------ALL KH -->
							<div class="tab-pane active" id="tkkehoach">
							<table id="table_data" cellpadding="0" cellspacing="0" border="0" class="table  dataTable" width="100%">	
						<thead>
							<tr style="color: rgb(76, 158, 217);" >
							
								<th>Mã kế hoạch</th>
								<th>Thời gian BĐ</th>
								<th>Thời gian KT</th>
								<th>Địa điểm</th>
								<th>Nội dung</th>
								<th>Chi đoàn</th>
								<th>Duyệt</th>
								<th>Đã thực hiện</th>			
								
							</tr>
						</thead>
						<tbody>
							<% for (O_KeHoach kehoach : khs) {
								String makh=kehoach.getMakehoach();%>
							<tr color: rgb(76, 158, 217);>
							
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
								<td class=" sorting_1">
									<% out.println(kehoach.getCuaChiDoan().getTenchidoan());%>
								</td>
								<td class=" sorting_1" align="center">
									<% if (kehoach.getDuyet()) { %>
										<span class="icon-ok" style="color: #0B9C8F"></span>
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
						<% } %>
					</tbody>
				</table>
			</div>
<!-- --KH DA DUYET		 -->				
							<div class="tab-pane" id="ds_khdaduyet">
								<div class="row-fluid">
									<div class="span12">
										
									<div>
									<table id="table_data" cellpadding="0" cellspacing="0" border="0" class="table  dataTable" width="100%">	
						<thead>
							<tr style="color: rgb(76, 158, 217);">
							
								<th>Mã kế hoạch</th>
								<th>Thời gian BĐ</th>
								<th>Thời gian KT</th>
								<th>Địa điểm</th>
								<th>Nội dung</th>
								<th>Chi đoàn</th>
								<th>Duyệt</th>
								<th>Đã thực hiện</th>			
								
							</tr>
						</thead>
						<tbody>
							<% for (O_KeHoach kehoach : khs) {
								String makh=kehoach.getMakehoach();
								if(kehoach.getDuyet()){
								%>
								
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
								<td class=" sorting_1">
									<% out.println(kehoach.getCuaChiDoan().getTenchidoan());%>
								</td>
								<td class=" sorting_1" align="center">
									<% if (kehoach.getDuyet()) { %>
										<span class="icon-ok"  style="color: #0B9C8F"></span>
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
						<% } }%>
						</tbody>		
									</table>
									
									</div>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="ds_khchuaduyet">
								<div class="row-fluid">
									<div class="span12">
										
									<div>
									<table id="table_data" cellpadding="0" cellspacing="0" border="0" class="table  dataTable" width="100%">	
						<thead>
							<tr style="color: rgb(76, 158, 217);">
							
								<th>Mã kế hoạch</th>
								<th>Thời gian BĐ</th>
								<th>Thời gian KT</th>
								<th>Địa điểm</th>
								<th>Nội dung</th>
								<th>Chi đoàn</th>
								<th>Duyệt</th>
								<th>Đã thực hiện</th>			
								
							</tr>
						</thead>
						<tbody>
							<% for (O_KeHoach kehoach : khs) {
								String makh=kehoach.getMakehoach();
								if(!kehoach.getDuyet()){
								%>
								
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
								<td class=" sorting_1">
									<% out.println(kehoach.getCuaChiDoan().getTenchidoan());%>
								</td>
								<td class=" sorting_1" align="center">
									<% if (kehoach.getDuyet()) { %>
										<span class="icon-ok"  style="color: #0B9C8F"></span>
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
						<% } }%>
						</tbody>		
									</table>
									
									</div>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="ds_khdathuchien">
								<div class="row-fluid">
									<div class="span12">
									<table id="table_data" cellpadding="0" cellspacing="0" border="0" class="table  dataTable" width="100%">	
						<thead>
							<tr style="color: rgb(76, 158, 217);">
							
								<th>Mã kế hoạch</th>
								<th>Thời gian BĐ</th>
								<th>Thời gian KT</th>
								<th>Địa điểm</th>
								<th>Nội dung</th>
								<th>Chi đoàn</th>
								<th>Duyệt</th>
								<th>Đã thực hiện</th>			
								
							</tr>
						</thead>
						<tbody>
							<% for (O_KeHoach kehoach : khs) {
								String makh=kehoach.getMakehoach();
								if(kehoach.getDaThucHien()){
								%>
								
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
								<td class=" sorting_1">
									<% out.println(kehoach.getCuaChiDoan().getTenchidoan());%>
								</td>
								<td class=" sorting_1" align="center">
									<% if (kehoach.getDuyet()) { %>
										<span class="icon-ok"  style="color: #0B9C8F"></span>
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
						<% } }%>
						</tbody>		
									</table>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="ds_khchuathuchien">
								<div class="row-fluid">
									<div class="span12">
										<table id="table_data" cellpadding="0" cellspacing="0" border="0" class="table  dataTable" width="100%">	
						<thead>
							<tr style="color: rgb(76, 158, 217);">
							
								<th>Mã kế hoạch</th>
								<th>Thời gian BĐ</th>
								<th>Thời gian KT</th>
								<th>Địa điểm</th>
								<th>Nội dung</th>
								<th>Chi đoàn</th>
								<th>Duyệt</th>
								<th>Đã thực hiện</th>			
								
							</tr>
						</thead>
						<tbody>
							<% for (O_KeHoach kehoach : khs) {
								String makh=kehoach.getMakehoach();
								if(!kehoach.getDaThucHien()){
								%>
								
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
								<td class=" sorting_1">
									<% out.println(kehoach.getCuaChiDoan().getTenchidoan());%>
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
						<% } }%>
						</tbody>		
									</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../moduls/footer.jsp"%>
</body>
</html>