
<!DOCTYPE html>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.O_KeHoach"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>

<%@page import="com.db4o.internal.Null"%>
<%@page import="model.O_SinhVien"%>
<%@page import="model.O_ChiDoan"%>
<%@page import="model.D_ChiDoan"%>
<%@page import="model.O_BCHChiDoan"%>
<%@page import="com.db4o.ObjectSet"%>
<%@page import="model.D_BCHChiDoan"%>
<%@page import="com.db4o.ObjectContainer"%>
<%@page import="model.PUB_Lib"%>
<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<html>
<head>

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<meta charset="utf-8" />
<title>QUẢN LÝ HOẠT ĐỘNG ĐOÀN</title>



<%@include file="../moduls/I_CSS.html"%>
<script src="../assets/js/tk_kh_sv.js" type="text/javascript"></script>

</head>
<!-- END HEAD -->

<!-- BEGIN BODY -->
<body class="">


	<!-- BEGIN HEADER -->
	<%@include file="../moduls/header.jsp"%>
	<!-- END HEADER -->


	<!-- BEGIN CONTAINER -->
	<%@include file="../moduls/menubar.jsp"%>


	<%
		PUB_Lib conn = new PUB_Lib();
		conn.connect();
		ObjectContainer db=conn.getDb();
		D_ChiDoan dcd= new D_ChiDoan();
		
		ObjectSet<O_ChiDoan> cds = dcd.selectAllChiDoan(db);
		int i=0;
		
		
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
		NumberFormat formatter = new DecimalFormat("###,###");
		
		%>

 <div class="row-fluid">
        <div class="span12">
          <div class="grid simple ">
            <div class="grid-title">
              <h4 style="color:blue">DANH SÁCH KẾ HOẠCH THEO CHI ĐOÀN</h4>
              <div class="tools"> <a href="javascript:;" class="collapse"></a> <a href="#grid-config" data-toggle="modal" class="config"></a> <a href="javascript:;" class="reload"></a> <a href="javascript:;" class="remove"></a> </div>
            </div>
            <div class="grid-body ">
              <div class="row-fluid">
                <table class="table table-hover table-condensed" id="example">
                  <thead>
                    <tr style="color: black; background-color: antiquewhite;">
                      <th style="width: 10%; align-content: center;"></th>
                     	<th style="width: 20%; align-content: center;" align="center">Mã Chi Đoàn</th>
						<th style="width: 25%; align-content: center;" align="center">Tên Chi Đoàn</th>
						<th  style="width: 20%; align-content: center;" align="center">Dang Sách Sinh Viên</th>
						<th style="width: 10%; align-content: center;" align="center">Số Kế Hoạch</th>
						<th></th>
                    </tr>
                  </thead>
                  <tbody>
                    
                    <%
								for (O_ChiDoan chidoan : cds) {
									
									String machidoan = chidoan.getMachidoan();
							%>
							<tr class="">
								<td>
									

									<button class="btn btnChiTiet" id="btn<%=i%>" onclick="xem_chi_tiet('<%=i %>')" value="<%=i%>" style="padding: 2px 6px; padding-top: 2px">
										<i class="icon-align-left"></i>
									</button>
								</td>
								<td class=" sorting_1">
									<%
										out.println(machidoan);
									%>
								</td>
								<td class=" sorting_1">
									<%
										out.println(chidoan.getTenchidoan());
									%>
								</td>
								<td>
									<%= dcd.selectSinhVien_ChiDoan(db,machidoan).size()%>		
								</td>
								<td>
									<%=dcd.selectKeHoach_ChiDoan(db, machidoan).size() %>
								</td>
								<td>
								
								<form action="../ds_hoat_dong_cua_sv/*" method="post">
								<button type="submit" style="background-color: white;" class="btn btn-social" ><i class="icon-paper-clip"></i></button>
								<input type="text" value="<%=machidoan%>" name="machidoan" style="visibility: hidden;">
								
								
								</form>
								
									
								</td>

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
									List<O_KeHoach> khs = dcd.selectKeHoach_ChiDoan(db, machidoan);
									
									for (O_KeHoach kehoach : khs) 
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
								<% } %>
								
								
								</table>
							
							</td>
								
							</tr>
							
							
							<% i++;} %>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>



	<%@include file="../moduls/footer.jsp"%>
	<!-- END CHAT -->

	<% conn.closeconnect(); %>
</body>


</html>



