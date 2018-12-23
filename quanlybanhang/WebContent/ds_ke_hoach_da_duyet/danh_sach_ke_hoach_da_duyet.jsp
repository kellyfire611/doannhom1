
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
	<%=request.getParameter("ds_khdaduyet_tuthang") %>
	<%

	
   String tuthang = "1";
String denthang = "12";
String tunam = "2010";
String dennam = "2015";
  PUB_Lib conn = new PUB_Lib();
  conn.connect();
  ObjectContainer db = conn.getDb();
  
  B_ThongKe tk = new B_ThongKe();
  D_KeHoach kh = new D_KeHoach();
//ObjectSet<O_KeHoach> khs = tk.DS_KeHoachDaDuyet(db, Integer.parseInt(tuthang), Integer.parseInt(tunam), Integer.parseInt(denthang), Integer.parseInt(dennam));
  ObjectSet<O_KeHoach> khs = tk.DS_KeHoachDaDuyet(db, 1,2010, 12,2015);

  
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
					<div class="span12">

						<form action="../ds_ke_hoach_da_duyet/" method="post">
							<table>
								<tr>
									<td style=" width: 150px;height: 50px;">Từ tháng</td>
									<th style=" width: 200px;height: 50px;"><a clasa="alert alert-info" style=" width: 60%;" value ="<% %>"></a>
									</th>
									<td style=" width: 150px;height: 50px;">Đên Tháng</td>
									<th style=" width: 200px;height: 50px;"><a clasa="alert alert-info" style=" width: 60%;" value ="<% %>"></a></th>
								</tr>
								<tr>
									<td style=" width: 150px;height: 50px;">Từ năm</td>
									<th style=" width: 200px;height: 50px;"><a clasa="alert alert-info" style=" width: 60%;" value ="<% %>"></a></th>
									<td style=" width: 150px;height: 50px;">Đến Năm</td>
									<th style=" width: 200px;height: 50px;"><a clasa="alert alert-info" style=" width: 60%;" value ="<% %>"></a></th>
								</tr>
								<tr>
								<th> 
								<td></td>
								<td style=" width: 150px;height: 50px;">Kế hoạch cần tìm	</td>
									<th style=" width: 200px;height: 50px;">
									<a clasa="alert alert-info" style=" width: 60%;">ádadsadas</a>
									</th>
									<th></th>
									<th></th>
								</tr>
								<tr>
									<th style=" width: 150px;height: 50px;"></th>
									<th style=" width: 150px;height: 50px;"><button type="submit" class="btn btn-info"><i class='icon-search'></i>Tim</button></th>
									<th></th>
									<th></th>
								</tr>
							</table>
						</form>
					</div>
					<div>
						<table id="table_data" cellpadding="0" cellspacing="0" border="0"
							class="table  dataTable" width="100%">
							<thead>
								<tr>

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
							<tbody id="tbody_tk_khdaduyet">
									<% for (O_KeHoach kehoach : khs) {
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
						<% } %>


							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../moduls/footer.jsp"%>
</body>
</html>