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
<title>Cập Nhật Chi Đoàn</title>

<%@include file="../moduls/I_CSS.html"%>

<script src="../assets/js/cap_nhat_chi_doan.js" type="text/javascript"></script>

</head>
<body>
	<%@include file="../moduls/header.jsp"%>
	<%@include file="../moduls/menubar.jsp"%>

<% 
PUB_Lib conn = new PUB_Lib();
conn.connect();
ObjectContainer	db = conn.getDb();
D_ChiDoan dcd= new D_ChiDoan();
ObjectSet<O_ChiDoan> cds = dcd.selectAllChiDoan(db);

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
				<div class="grid-body ">
			
					<table cellpadding="0" cellspacing="0" border="0" class="table "
						id="example3" width="100%">
						<thead>
							<tr>
								<th style="width: 10px;"></th>
								<th
									style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
									class="text-center">Mã Chi Đoàn AAA</th>
								<th
									style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"
									class="text-center">Tên Chi Đoàn</th>
								<th class="text-center"></th>
							</tr>
						</thead>
						<tbody>
							<%for(O_ChiDoan cd:cds){ 
												String ma = cd.getMachidoan();
												
												%>
							<tr>
								<td class="text-center"><a class="btn "
									onclick="xem_chi_tiet('<%=ma %>')" value="<%=ma %>"
									style="padding: 2px 6px; padding-top: 2px; background-color: white; color: #0B9C8Fa">
										<i class="icon-align-left"></i>
								</a></td>
								<td class="text-center"><%=ma %></td>
								<td class="text-center"><%=cd.getTenchidoan() %></td>

								<td class="text-center"><a href="#" class="btn btn-social"
									onclick="sua_chi_doan_mo_form('<%=ma %>','<%=cd.getTenchidoan() %>')"
									style="background-color: white;"> <i style="color: #4C9ED9"
										class="icon-edit"> </i>
								</a></td>
							</tr>


							<!--  //---------------tr chi tiet -->


							<tr id="trChiTiet_<%=ma%>" style="display: none;"   value='0'>
								<td></td>
								<td class="details" colspan="10">
									<table cellpadding="5" cellspacing="0" border="0"
										style="padding-left: 50px;" class="inner-table">
										<thead>
											<tr>
												<th style="color: blue;">Mã số sinh viên</th>
												<th style="color: blue;">Họ tên Sinh Viên</th>
												<th style="color: blue;">Địa Chỉ</th>
												<th style="color: blue;">Email</th>

												<th style="color: blue;">SDT</th>

												<th>
													<form action="../cap_nhat_sinh_vien/*" method="get">
														<button type="submit" style="background-color: white;"
															class="btn btn-social">
															<i class="icon-edit" style="color: #F35958;"></i>
														</button>
														<input type="text" value="<%=ma%>" name="machidoan"
															style="visibility: hidden;">
														<form>
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
								<td></td>
							</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	---------them chi doan -->

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


	<%@include file="../moduls/footer.jsp"%>
</body>
<%conn.closeconnect(); %>
</html>
