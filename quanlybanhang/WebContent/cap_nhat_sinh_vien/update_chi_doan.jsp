
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
<script src="../assets/js/tamp.js" type="text/javascript"></script>

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
		%>



	<div class="row-fluid">
		<div class="span12">
			<div class="grid simple ">
				<div class="grid-title no-border">
					<span class=".col-xs-12 .col-md-8">
						<h4>DANH SÁCH CHI ĐOÀN</h4>
					</span>
					 <span class=".col-xs-6 .col-md-4"> 					 
					 
					  <a class="btn-social" id="anbch">
					  <i class="icon-collapse-alt"></i>
					  </a>
						<a href="#" class="btn-social" title="Thêm chi doan" onclick="them_chi_doan_mo_form()">
						<i class="icon-plus-sign-alt"></i></a> 
					 <a class="btn-social"><i class="icon-print"></i></a> 
					 <a  class="btn-social"><i class="icon-refresh"></i></a>
					</span>
				</div>
				<div class="grid-body" id="grid-body_bch" value="0" style="display: normal">
					<table id="table_data" cellpadding="0" cellspacing="0" border="0" class="table  dataTable" width="100%">
						<thead>
							<tr style="color: black; background-color: rgba(86, 54, 248, 0.07);">
								<th class="text-center"></th>
								<th class="text-center">Mã Chi Đoàn</th>
								<th class="text-center">Tên Chi Đoàn</th>								
								<th class="text-center">Sửa</th>
							</tr>
						</thead>
						<tbody role="alert" aria-live="polite" aria-relevant="all">
							<%
								for (O_ChiDoan cd : cds) {
									String ma = cd.getMachidoan();
							%>							
							<tr>
								<td class="text-center"><a class="btn btnChiTiet" onclick="xem_chi_tiet('<%=ma %>')"
									value="<%=ma %>" style="padding: 2px 6px; padding-top: 2px; background-color: white; color: #0B9C8Fa">
										<i class="icon-align-left"></i>
								</a></td>
								<td class="text-center"><%=ma %></td>
								<td class="text-center"><%=cd.getTenchidoan() %></td>

								<td class="text-center">
							
								<a href="#" class="btn btn-social" onclick="sua_chi_doan_mo_form('<%=ma %>',
																								'<%=cd.getTenchidoan() %>')"
									style="background-color: white;"> 
									<i style="color: #4C9ED9" class="icon-edit"> </i>
								</a>
								<a href="#" class="btn-social" title="Xóa kế hoạch"><i class="icon-trash"
									onclick="mo_form_xoa('<%=ma %>')"></i></a> 
								</td>
							</tr>
							
							<tr id="trChiTiet_<%=ma%>" style="display: none;" value='0'>
									<td></td>
									<td class="details" colspan="10">
										<table cellpadding="5" cellspacing="0" border="0"
											style="padding-left: 50px;" class="inner-table">
											<thead>
												<tr style="background-color: rgb(240, 254, 255);">
													<th  style="color: blue;">Mã số sinh viên</th>
													<th style="color: blue;">Họ tên Sinh Viên</th>
													<th style="color: blue;">Địa Chỉ</th>
													<th style="color: blue;">Email</th>

													<th style="color: blue;">SDT</th>

													<th>
															<form action="../cap_nhat_sinh_vien/*" method="get">
																	<button type="submit" style="background-color: white;" class="btn btn-social" ><i class="icon-edit" style="color: #F35958;"></i></button>
																	<input type="text" value="<%=ma%>" name="machidoan" style="visibility: hidden;">
															</form>
													</th>

												</tr>
											</thead>

											<tbody>
												<%		List<O_SinhVien> svs = dcd.selectSinhVien_ChiDoan(db, ma);
												for (O_SinhVien sv : svs) {
																			
											%>

												<tr>
													<td><%=sv.getMa()	%></td>
													<td><%=sv.getHoTen()%></td>
													<td><%=sv.getDiaChi()%></td>
													<td><%=sv.getEmail() %></td>
													<td><%=sv.getSoDienThoai() %></td>
													<td></td>
												</tr>


												<%
								} 
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
	                    <button type="button" class="btn btn-success btn-cons" id="btnClose">Đóng</button>
	                </td>
	            </tr>
	        </table>
	    </form>
	</div> 
	<div id="dialog_suachidoan" title="CAP NHAT CHI ĐOÀN" style="display: none; text-align: center;">
		<form name="frmsuaChiDoan" method="post">
			<table width="100%" border="0" class="" cellpadding="5px">
				<tr>
					<td align="left" class="cell-dialog">Mã Chi doan<font
						color="red"></font></td>
					<td align="left" class="cell-dialog"><input id="txtMaChiDoan_sua"
						disabled="disabled" name="txtMaChiDoan_sua"
						style="height: 30px; width: 300px;" type="text"></td>
				</tr>
				<tr>
					<td align="left" class="cell-dialog">Tên Chi Đoàn<font
						color="red">*</font></td>
					<td align="left" class="cell-dialog"><input id="txtTenChiDoan_sua"
						name="txtTenChiDoan_sua" style="height: 30px; width: 300px;"
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
							onclick="thuc_hien_cap_nhat_chi_doan()">Thực hiện</button>
						<button type="button" class="btn btn-success btn-cons"
							id="btnCloseSua">Đóng</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dialog_xoa"  class="dialog" title="Xóa Chi Đoàn" style="display: none; text-align: center;">
	<div style="font-size: 15pt; text-align: left;">Bạn có chắc muốn xóa chi đoàn <span style="font-weight: bold" id="ma_Xoa"></span> ?</div>
	<div class="alert-error">		
		<b>Chú ý:</b>&nbsp;xóa chi đoàn cũng đồng nghĩa với việc xóa các danh sách liên quan.		
	</div>
	<hr>
	<button class="btn btn-danger btn-cons" type="button" id="btn_accept_del" onclick="xoa()">Đồng ý</button>
	<button class="btn btn-white btn-cons" id="btn_cancel_del" type="button" onclick="close_dialog_xoa()">Bỏ qua</button>
</div>
	<% conn.closeconnect(); %>
</body>


</html>



