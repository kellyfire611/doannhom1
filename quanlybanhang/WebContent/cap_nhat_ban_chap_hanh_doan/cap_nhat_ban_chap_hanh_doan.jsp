
<!DOCTYPE html>

<%@page import="java.util.List"%>

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
<script src="../assets/js/cap_nhat_chi_doan.js" type="text/javascript"></script>

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
		D_ChiDoan cd = new D_ChiDoan();
		D_BCHChiDoan bchcd = new D_BCHChiDoan();
		O_BCHChiDoan bch = new O_BCHChiDoan();
		
		ObjectSet<O_ChiDoan> cds = cd.selectAllChiDoan(db);
		int i=0;
		%>



	<div class="row-fluid">
		<div class="span12">
			<div class="grid simple ">
				<div class="grid-title no-border">
					<span class=".col-xs-12 .col-md-8">
						<h4>Danh Sach Chi Doan</h4>
					</span>
					 <span class=".col-xs-6 .col-md-4"> 
					 
					 
				
                	
					 
					  <a  class="btn-social" id="anbch">
					  <i class="icon-collapse-alt"></i>
					  </a>
					 <a  class="btn-social"
									onclick="them_chi_doan_mo_form()">
									<i class="icon-plus-sign-alt"></i></a> 
					
					 <a class="btn-social"><i class="icon-print"></i></a> 
					 <a  class="btn-social"><i class="icon-refresh"></i></a>
					</span>
				</div>
				<div class="grid-body" id="grid-body_bch" value="0" style="display: normal">
					<table id="table_data" cellpadding="0" cellspacing="0" border="0" class="table  dataTable" width="100%">
						<thead>
							<tr style="color: rgb(0, 0, 0); background-color: rgba(231, 231, 231, 0.13);">
								<th></th>
								<th>Mã Chi Đoàn</th>
								<th>Tên Chi Đoàn</th>
								<th>Dang Sách Sinh Viên</th>
								<th></th>

							</tr>
						</thead>
						<tbody role="alert" aria-live="polite" aria-relevant="all">
							<%
								for (O_ChiDoan chidoan : cds) {
							%>
							<tr class="">
								<td>
									

									<button class="btn btnChiTiet" id="btn<%=i%>" value="<%=i%>" style="padding: 2px 6px; padding-top: 2px">
										<i class="icon-align-left"></i>
									</button>
								</td>
								<td class=" sorting_1">
									<%
										out.println(chidoan.getMachidoan());
									%>
								</td>
								<td class=" sorting_1">
									<%
										out.println(chidoan.getTenchidoan());
									%>
								</td>
								<td>
									<%=cd.selectSinhVien_ChiDoan(db, chidoan.getMachidoan()).size()%>		
								</td>
								<td>
								
								<form action="../cap_nhat_ban_chap_hanh_chi_doan/*" method="post">
								<button type="submit" style="background-color: white;" class="btn btn-social" ><i class="icon-edit"></i></button>
								<input type="text" value="<%=chidoan.getMachidoan()%>" name="machidoan" style="visibility: hidden;">
								
								
								</form>
								
									
								</td>

							</tr>
							
							<tr id="trChiTiet_<%=i%>" style="display: none;" value='0'>
							<td></td>
								<td class="details" colspan="10">
									<table cellpadding="5" cellspacing="0" border="0" style="padding-left: 50px;" class="inner-table">
										<thead>
											<tr style="color: rgb(11, 156, 143); background-color: rgba(205, 237, 255, 0.17);">
												<th>Mã số sinh viên</th>
												<th>Họ tên Sinh Viên</th>
												<th>Chức vụ</th>
											</tr>
										</thead>
										
											<tbody>
											<%		List<O_SinhVien> svs = cd.selectSinhVien_ChiDoan(db, chidoan.getMachidoan());
												for (O_SinhVien sv : svs) {

													O_BCHChiDoan bchtemp = bchcd.found_O_BCHChiDoan(db, sv.getMa());
													if(bchtemp!=null){
																																						
											%>

											<tr>
												<td>
													<%
														out.println(sv.getMa());
													%>
												</td>
												<td>
													<%
														out.println(sv.getHoTen());
													%>
												</td>
												<td>
													<%
														out.println(bchtemp.getChucVu());
													%>
												</td>
											</tr>


							<%
								} }
							%>
							
										</tbody>
									</table>
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

	<%@include file="../moduls/footer.jsp"%>
	<!-- END CHAT -->
	<!-- END CONTAINER -->
<div id="dialog_themchidoan" title="THÊM CHI ĐOÀN" style="display: none; text-align: center;">
	    <form name="frmThemChiDoan" method="post">	        
	        <table width="100%" border="0" class="" cellpadding="5px">
	            <tr>
	                <td align="left" class="cell-dialog">Mã Chi doan<font color="red">*</font></td>
	                <td align="left" class="cell-dialog">
	                    <input id="txtMaChiDoan" name="txtMaChiDoan" class="input-large " type="text" >	                   
	                </td>
	            </tr>
	            <tr>
	                <td align="left" class="cell-dialog">Tên Chi Đoàn<font color="red">*</font></td>
	                <td  align="left" class="cell-dialog">
	                   <input id="txtTenChiDoan" name="txtTenChiDoan" class="input-large " type="text">
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
	                    <button type="button" class="btn btn-success btn-cons" onclick="thuc_hien_them_chi_doan()">Thực hiện</button>
	                    <button type="button" class="btn btn-success btn-cons" id="btnCloseSua">Đóng</button>
	                </td>
	            </tr>
	        </table>
	    </form>
	</div> 
	
	<% conn.closeconnect(); %>
</body>


</html>



