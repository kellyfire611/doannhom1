<%@page import="model.D_NguonKinhPhi"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.db4o.ObjectContainer"%>
<%@page import="model.PUB_Lib"%>
<%@page import="com.db4o.internal.Null"%>
<%@page import="java.util.List"%>
<%@page import="com.db4o.ObjectSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>

<%@page import="model.O_KeHoach"%>
<%@page import="model.D_KeHoach"%>
<%@page import="model.O_NguonKinhPhi"%>
<%@page import="model.O_HoTroKinhPhi"%>
<%@page import="model.O_ChiDoan"%>
<%@page import="model.D_ChiDoan"%>
<%@page import="model.D_LichTrinh"%>
<%@page import="model.O_SinhVien"%>
<%@page import="model.O_LichTrinh"%>
<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CẬP NHẬT KẾ HOẠCH</title>
<%@ include file="../moduls/I_CSS.html"%>
<script src="../assets/js/cap_nhat_ke_hoach.js" type="text/javascript"></script>
<style type="text/css">
.cell-dialog_1 {
	width: 40%;
	padding-left: 100px;
}
.cell-dialog_2 {
	width: 60%;
}
</style>
</head>
<body class="">
	<!-- BEGIN HEADER -->
	<%@ include file="../moduls/header.jsp"%>
	<%@ include file="../moduls/menubar.jsp"%>
	
	<!-- BEGIN BODY  -->
	
	<%
	PUB_Lib conn = new PUB_Lib();
	conn.connect();
	ObjectContainer db=conn.getDb();
	D_KeHoach kh = new D_KeHoach();
	D_ChiDoan cd = new D_ChiDoan();
	D_LichTrinh d_lt = new D_LichTrinh();
	D_NguonKinhPhi d_nkp= new D_NguonKinhPhi();
	
	
	ObjectSet<O_KeHoach> khs = kh.selectAllKeHoach(db);
	ObjectSet<O_ChiDoan> cds = cd.selectAllChiDoan(db);
	ObjectSet<O_LichTrinh> dsLichTrinh = d_lt.selectAllLichTrinh(db);
	ObjectSet<O_NguonKinhPhi> dsNguonKinhPhi = d_nkp.selectAllNguonKinhPhi(db);
	
	SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
	NumberFormat formatter = new DecimalFormat("###,###");
	
	System.out.print(khs.size());
	%>
	<div class="row-fluid">
		<div class="span12">
			<div class="grid simple ">
				<div class="grid-title no-border">
					<span class=".col-xs-12 .col-md-8" style="font-size: 20px;">
						Danh Sách Kế Hoạch
					</span> <span class=".col-xs-6 .col-md-4"> 
					<!-- <button class="btn btn-primary btn-xs btn-mini" type="button" onclick="ds_ke_hoach_mo_form_them()">Thêm kế hoạch</button> -->
					<a href="#" class="btn-social" title="Thêm kế hoạch" onclick="ds_ke_hoach_mo_form_them()"><i class="icon-plus-sign-alt"></i></a> 
					<a href="#" class="btn-social"><i class="icon-print"></i></a> 
					<a href="#" class="btn-social"><i class="icon-refresh"></i></a>
					</span>
				</div>
				<div class="grid-body ">
					<table id="table_data" cellpadding="0" cellspacing="0" border="0" class="table  dataTable" width="100%">
						<thead>
							<tr>
								<th></th>
								<th>Mã kế hoạch</th>
								<th>Thời gian BĐ</th>
								<th>Thời gian KT</th>
								<th>Địa điểm</th>
								<th>Nội dung</th>
								<th>Chi đoàn</th>
								<th>Duyệt</th>
								<th>Đã thực hiện</th>			
								<th>Sửa</th>
								<th>Xóa</th>
							</tr>
						</thead>
						<tbody>
							<% for (O_KeHoach kehoach : khs) {
								String makh=kehoach.getMakehoach();%>
							<tr class="">
								<td>
									<button class="btn btnChiTiet" id="btnChiTiet_<%=makh %>>" value="<%=makh%>" style="padding: 2px 6px; padding-top: 2px">
										<i class="icon-reorder"></i>
									</button>
								</td>
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
								<td class=" sorting_1">
									<a href="#" class="btn-social" title="Sửa kế hoạch" 
									onclick="ds_ke_hoach_mo_form_sua('<%=makh %>',
																	 '<%=date_bd %>',
																	 '<%=date_kt %>',
																	 '<%=kehoach.getDiaDiem() %>',
																	 '<%=kehoach.getNoiDung() %>',
																	 '<%=kehoach.getCuaChiDoan().getMachidoan()%>',
																	 <%=kehoach.getDuyet()%>,
																	 <%=kehoach.getDaThucHien()%>
										)">
									<i class="icon-edit"></i></a> 
								</td>
								<td class=" sorting_1">
									<a href="#" class="btn-social" title="Xóa kế hoạch"><i class="icon-trash"
									onclick="ds_ke_hoach_mo_form_xoa('<%=makh %>')"></i></a> 
								</td>
							</tr>
		<!-- Load danh sách chi tiết -->							
							<tr class="trChiTiet" id="trChiTiet_<%=makh %>" style="display: none;">
								<td>&nbsp;</td>
								<td colspan="10">								
								<div class="span10">
						          <ul class="nav nav-pills" id="tab-4">
						            <li class="active"><a href="#tab4NguonKinhPhi_<%=makh %>">Danh sách hỗ trợ kinh phí</a></li>
						            <li><a href="#tab4LichTrinh_<%=makh %>">Danh sách lịch trình</a></li>
						            <li><a href="#tab4DSSV_<%=makh %>"> Danh sách sinh viên </a></li>
						          </ul>
						          
						          <div class="tab-content">
				<!--DANH SÁCH NGUỒN KINH PHÍ  -->
					            <div class="tab-pane active" id="tab4NguonKinhPhi_<%=makh %>">
					            <table cellpadding="5" cellspacing="0" border="0" class="inner-table">
									<tbody>
										<tr>
											<th><a href="#" class="btn-social" title="Thêm hỗ trợ kinh phí vào kế hoạch" onclick="mo_form_them_ho_tro_kinh_phi('<%=makh %>')"><i class="icon-plus-sign-alt"></i></a></th>
											<th>Mã hỗ trợ kinh phí</th>											
											<th>Tên nguồn kinh phí</th>
											<th>Số tiền</th>											
											<th>Xóa</th>
										</tr>	
					              <% List<O_HoTroKinhPhi> kps = kehoach.getDsKinhPhi();
									if (kps.size() != 0) { %>
																		
										<% int stt_htkp=0; 
										for (O_HoTroKinhPhi kp : kps) {
											stt_htkp++;
										%>
											<tr>
												<td class="text-center"> <% out.println(stt_htkp);%></td>
												<td> <% out.println(kp.getMahotro());%></td>
												<td> <% out.println(kp.getTunguonkinhphi().getTenNguonKinhphi());%></td>
												<td class="text-right"> <% 
												String sotien = formatter.format(kp.getSotien());
												out.println(sotien);%></td>
												<td class=" sorting_1">
													<a href="#" class="btn-social" title="Xóa" onclick="remove_htkp_show_dialog('<%=makh %>','<%=kp.getMahotro() %>')"><i class="icon-remove"></i></a> 
												</td>
											</tr>
										<% } %>
										
																				
								<% } else {%>
										<tr>
											<td class="text-center" colspan="5"> Không tìm thấy thông tin nguồn kinh phí</td>
										</tr>								
								<% } %>
								</tbody>
								</table>
					            </div>
			<!--DANH SÁCH LỊCH TRÌNH  -->         
					            <div class="tab-pane" id="tab4LichTrinh_<%=makh %>">
					            <table cellpadding="5" cellspacing="0" border="0" class="inner-table">
										<tbody>
											<tr>
											    <th><a href="#" class="btn-social" title="Thêm lịch trình vào kế hoạch" onclick="mo_form_them_lich_trinh('<%=makh %>')"><i class="icon-plus-sign-alt"></i></a></th>
												<th>Mã lịch trình</th>
												<th>Tên công việc</th>
												<th>Thời gian BĐ</th>
												<th>Thời gian KT</th>
												<!-- <th>Sửa</th> -->
												<th>Xóa</th>
											</tr>
					              	<% List<O_LichTrinh> lts = kehoach.getDslichTrinh();
										if (lts.size() != 0) { %>
										
											<% int stt_lt =0; 
											for (O_LichTrinh lt : lts) { 
												stt_lt++;
											%>
												<tr>
													<td class="text-center"> <% out.println(stt_lt);%></td>
													<td> <% out.println(lt.getMalichtrinh());%></td>
													<td> <% out.println(lt.getTencongviec());%></td>
													<td class="text-center"> 
														<%
														String lt_ngay_bd = DATE_FORMAT.format(lt.getThoigianbatdau());
														out.println(lt_ngay_bd);
														%>
													</td>
													<td class="text-center"> 
														<%
														String lt_ngay_kt = DATE_FORMAT.format(lt.getThoigianketthuc());
														out.println(lt_ngay_kt);
														%>
													</td>
													<!-- <td class=" sorting_1">
														<a href="#" class="btn-social" title="Sửa"><i class="icon-edit"></i></a> 
													</td> -->
													<td class=" sorting_1">
														<a href="#" class="btn-social" title="Xóa" onclick="remove_lichtrinh_show_dialog('<%=makh %>','<%=lt.getMalichtrinh() %>')"><i class="icon-remove"></i></a>
													</td>
												</tr>
											<% } %>
											
																					
									<% } else {%>
										<tr>
											<td class="text-center" colspan="6"> Không tìm thấy thông tin lịch trình</td>
										</tr>
									<% } %>
									</tbody>
									</table>
					            </div>
				 <!--DANH SÁCH SINH VIÊN  -->  
					            <div class="tab-pane " id="tab4DSSV_<%=makh %>">
					            <table cellpadding="5" cellspacing="0" border="0" class="inner-table">
										<tbody>
											<tr>
												<th><a href="#" class="btn-social" title="Thêm sinh viên vào kế hoạch" onclick="mo_form_them_sinhvien('<%=makh %>','<%=kehoach.getCuaChiDoan().getMachidoan() %>')"><i class="icon-plus-sign-alt"></i></a></th>
												<th>Mã sinh viên</th>
												<th>Tên sinh viên</th>
												<th>Email</th>
												<th>SĐT</th>																	
												<th>Xóa</th>
											</tr>
					              <% List<O_SinhVien> svs = kehoach.getDssinhvien();
										if (svs.size() != 0) { %>
										
											<% int stt_sv=0; 
											for (O_SinhVien sv : svs) {
												 stt_sv++;
												 %>
												<tr>
													<td class="text-center"> <% out.println(stt_sv);%></td>
													<td> <% out.println(sv.getMa());%></td>
													<td> <% out.println(sv.getHoTen());%></td>
													<td> <% out.println(sv.getEmail());%></td>
													<td> <% out.println(sv.getSoDienThoai());%></td>			
												<!-- 	<td class=" sorting_1">
														<a href="#" class="btn-social" title="Sửa"><i class="icon-edit"></i></a> 
													</td> -->
													<td class=" sorting_1">
														<a href="#" class="btn-social" title="Xóa" onclick="remove_sinhvien_show_dialog('<%=makh %>','<%=sv.getMa() %>')"><i class="icon-remove"></i></a> 
													</td>
												</tr>
											<% } %>
											
																					
									<% } else {%>
										<tr>
											<td class="text-center" colspan="6"> Không tìm thấy thông tin sinh viên</td>
										</tr>
									<% } %>
									</tbody>
									</table>
					            </div>
						          </div><!-- End div: .tab-content -->
						        </div><!--End div: .span10  -->						       
								</td>
							</tr>								
						<% } %>
					</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../moduls/footer.jsp"%>
<!-- DIALOG SỬA -->	
	<div id="dialog_suakehoach"  class="dialog" title="Cập nhật kế hoạch" style="display: none; text-align: center;">
	    <form name="frmSuaKeHoach" method="post">	        
	        <table width="100%" border="0" class="" cellpadding="5px">
	            <tr>
	                <td align="left" class="cell-dialog_1">Mã kế hoạch<font color="red"></font></td>
	                <td align="left" class="cell-dialog_2">
	                    <input id="txtMaKH_Sua" name="txtMaKH_Sua" class="input-large " type="text" readonly style={background-color:#F4F5F7;font-weight:bold;} >	                   
	                </td>
	            </tr>
	            <tr>
	                <td align="left" class="cell-dialog_1">Thời gian BĐ<font color="red">*</font></td>
	                <td  align="left" class="cell-dialog_2">
	                    <input type="text" class="datepicker" id="datTGBD_Sua" name="datTGBD_Sua">
                    	<span class="add-on"><span class="arrow"></span><i class="icon-th"></i></span>
	                </td>
	            </tr>
	            <tr>
	                <td align="left" class="cell-dialog_1">Thời gian KT<font color="red">*</font></td>
	                <td  align="left" class="cell-dialog_2">
                     <input type="text" class="datepicker" id="datTGKT_Sua" name="datTGKT_Sua">
                     <span class="add-on"><span class="arrow"></span><i class="icon-th"></i></span>
	                </td>
	            </tr>
	            <tr>
	                <td  align="left" class="cell-dialog_1">Địa điểm<font color="red">*</font></td>
	                <td  align="left" class="cell-dialog_2">
	                    <input id="txtDiaDiem_Sua" name="txtDiaDiem_Sua" class="input-large " type="text">
	                </td>
	            </tr>
	            <tr>
	                <td  align="left" class="cell-dialog_1">Nội dung<font color="red">*</font></td>
	                <td  align="left" class="cell-dialog_2">
	                    <input id="txtNoiDung_Sua" name="txtNoiDung_Sua" class="input-large " type="text">
	                </td>
	            </tr>
	            <tr>
	                <td  align="left" class="cell-dialog_1">Chi đoàn<font color="red">*</font></td>
	                <td  align="left" class="cell-dialog_2">
	                    <select id="cboChiDoan_Sua" name="cboChiDoan_Sua" style="width:50%">	
	                    <option value="">----Chọn chi đoàn---</option>	
	                    <% for (O_ChiDoan chidoan : cds) { %>
							<option value="<%=chidoan.getMachidoan()%>"><%=chidoan.getTenchidoan() %></option>
						<% } %>		                    			                    
		                 </select>
	                </td>
	            </tr>
	            <tr>
	                <td  align="left" class="cell-dialog_1">Duyệt<font color="red"></font></td>
	                <td  align="left" class="cell-dialog_2">
	                <input id="chkDuyet_Sua" name="chkDuyet_Sua" type="checkbox" value="1" checked="checked">
	                    <!-- <div class="checkbox check-danger">
	                      <input id="chkDuyet_Sua" name="chkDuyet_Sua" type="checkbox" value="1" checked="checked">
	                      <label for="checkbox6"></label>
	                    </div> -->	                   
	                </td>
	            </tr>
	             <tr>
	                <td  align="left" class="cell-dialog_1">Đã thực hiện<font color="red"></font></td>
	                <td  align="left" class="cell-dialog_2">
	                    <input id="chkDaThucHien_Sua" name="chkDaThucHien_Sua" type="checkbox" value="1" checked="checked">
	                    <!-- <div class="checkbox check-success">
	                      <input id="chkDaThucHien_Sua" name="chkDaThucHien_Sua" type="checkbox" value="1" checked="checked">
	                      <label for="checkbox2"></label>
	                    </div> -->
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
	                    <button type="button" class="btn btn-success btn-cons" onclick="thuc_hien_sua_ke_hoach()">Thực hiện</button>
	                    <button type="button" class="btn btn-success btn-cons" id="btnCloseSua">Đóng</button>
	                </td>
	            </tr>
	        </table>
	    </form>
	</div>

	<!-- DIALOG THÊM -->	
	<div id="dialog_themkehoach" class="dialog" title="Thêm kế hoạch" style="display: none; text-align: center;">     
	    <!--     <div class="grid-body "> -->
              <div class="row-fluid">
                <form id="commentForm">
	        	<div id="rootwizard" class="span12">
                    <div class="form-wizard-steps">
                      <ul class="wizard-steps form-wizard">
                        <li class="active" data-target="#step1"> <a href="#tab1" data-toggle="tab"> <span class="step">1</span> <span class="title">Thêm kế hoạch</span> </a> </li>
                        <li data-target="#step2" class=""> <a href="#tab2" data-toggle="tab"> <span class="step">2</span> <span class="title">Thêm hỗ trợ kinh phí</span> </a> </li>
                        <li data-target="#step3" class=""> <a href="#tab3" data-toggle="tab"> <span class="step">3</span> <span class="title">Thêm lịch trình</span> </a> </li>
                        <li data-target="#step4" class=""> <a href="#tab4" id='dssv_tab' data-toggle="tab"> <span class="step">4</span> <span class="title">Thêm danh sách sinh viên <br>
                          </span> </a> </li>
                      </ul>
                      <div class="clearfix"></div>
                    </div>
                    <div class="tab-content transparent">
          	<!-- STEP 1- THÊM KẾ HOẠCH -->  
                      <div class="tab-pane active" id="tab1"> <br>
                       <!--  <h4 class="semi-bold">Thêm kế hoạch</h4>
                        <br> -->
                        <table width="100%" border="0" class="" cellpadding="5px">
				            <tr>
				                <td align="left" class="cell-dialog_1">Mã kế hoạch<font color="red">*</font></td>
				                <td align="left" class="cell-dialog_2">
				                    <input id="txtMaKH_Them" name="txtMaKH_Them" class="input-large  them_ke_hoach_display" type="text" style={font-weight:bold;} >	                   
				                </td>
				            </tr>
				            <tr>
				                <td align="left" class="cell-dialog_1">Thời gian BĐ<font color="red">*</font></td>
				                <td align="left" class="cell-dialog_2">
				                    <input type="text" class="datepicker them_ke_hoach_display" id="datTGBD_Them" name="datTGBD_Them">
			                    	<span class="add-on"><span class="arrow"></span><i class="icon-th"></i></span>
				                </td>
				            </tr>
				            <tr>
				                <td align="left" class="cell-dialog_1">Thời gian KT<font color="red">*</font></td>
				                <td align="left" class="cell-dialog_2">
			                     <input type="text" class="datepicker them_ke_hoach_display" id="datTGKT_Them" name="datTGKT_Them">
			                     <span class="add-on"><span class="arrow"></span><i class="icon-th"></i></span>
				                </td>
				            </tr>
				            <tr>
				                <td  align="left" class="cell-dialog_1">Địa điểm<font color="red">*</font></td>
				                <td  align="left" class="cell-dialog_2">
				                    <input id="txtDiaDiem_Them" name="txtDiaDiem_Them" class="input-large them_ke_hoach_display" type="text">
				                </td>
				            </tr>
				            <tr>
				                <td  align="left" class="cell-dialog_1">Nội dung<font color="red">*</font></td>
				                <td  align="left" class="cell-dialog_2">
				                    <input id="txtNoiDung_Them" name="txtNoiDung_Them" class="input-large them_ke_hoach_display" type="text">
				                </td>
				            </tr>
				            <tr>
				                <td  align="left" class="cell-dialog_1">Chi đoàn<font color="red">*</font></td>
				                <td  align="left" class="cell-dialog_2">
				                    <select id="cboChiDoan_Them" name="cboChiDoan_Them" style="width:50%" class="them_ke_hoach_display">	
<!-- 				                    <option value="">----Chọn chi đoàn---</option>	 -->
				                    <% for (O_ChiDoan chidoan : cds) { %>
										<option value="<%=chidoan.getMachidoan() %>"><%=chidoan.getTenchidoan() %></option>
									<% } %>		                    			                    
					                 </select>
				                </td>
				            </tr>
				            <tr>
				                <td  align="left" class="cell-dialog_1">Duyệt<font color="red"></font></td>
				                <td  align="left" class="cell-dialog_2">
				                <input id="chkDuyet_Them" name="chkDuyet_Them" type="checkbox" value="1" class="them_ke_hoach_display">
				                    <!-- <div class="checkbox check-danger">
				                      <input id="chkDuyet_Them" name="chkDuyet_Them" type="checkbox" value="1" checked="checked">
				                      <label for="checkbox6"></label>
				                    </div> -->	                   
				                </td>
				            </tr>
				             <tr>
				                <td  align="left" class="cell-dialog_1">Đã thực hiện<font color="red"></font></td>
				                <td  align="left" class="cell-dialog_2">
				                    <input id="chkDaThucHien_Them" name="chkDaThucHien_Them" type="checkbox" value="1" class="them_ke_hoach_display">
				                    <!-- <div class="checkbox check-success">
				                      <input id="chkDaThucHien_Them" name="chkDaThucHien_Them" type="checkbox" value="1" checked="checked">
				                      <label for="checkbox2"></label>
				                    </div> -->
				                </td>
				            </tr>
				            
				            <tr>
				                <td align="left" colspan="1" class="cell-dialog">	                	
				                    <i>(<font color="red">*</font>) thông tin bắt buộc nhập</i>
				                </td>
				             	<td align="right" id="" class="message_success">
									<div class="alert-success"  id="td_message" style="display:none">
										<span class="icon-ok"></span>
										Thêm kế hoạch thành công									
									</div>
				             	</td>				             	
				            </tr>
				            <tr>
				                <td align="center" colspan="2" class="cell-dialog">	                	
				                    <hr>	                    
				                    <button type="button" class="btn btn-success btn-cons them_ke_hoach_display" onclick="thuc_hien_them_ke_hoach()">Lưu kế hoạch</button>
				                    <button type="button" class="btn btn-success btn-cons btnCloseThem" onclick="close_dialog_them()">Đóng</button>
				                </td>
				            </tr>
				        </table>
                      </div>
            <!-- STEP 2 THÊM NGUỒN KINH PHÍ-->  
                      <div class="tab-pane" id="tab2"> <br>
                        <!-- <h4 class="semi-bold">Thêm nguồn kinh phí</h4>
                        <br> -->
                        <table width="100%" border="0" class="" cellpadding="5px">
				            <tr>
				                <td align="left" class="cell-dialog_1">Mã hỗ trợ kinh phí<font color="red">*</font></td>
				                <td align="left" class="cell-dialog_2">
				                    <input id="txtMaHTKP_Them" name="txtMaHTKP_Them" class="input-large them_ht_kinhphi_display" type="text" style={font-weight:bold;} >	                   
				                </td>
				            </tr>				            
				            <tr>
				                <td  align="left" class="cell-dialog_1">Nguồn kinh phí<font color="red">*</font></td>
				                <td  align="left" class="cell-dialog_2">
				                    <select id="cboNguonKinhPhi_Them" name="cboNguonKinhPhi_Them" style="width:50%" class="them_ht_kinhphi_display">	
<!-- 				                    <option value="">----Chọn nguồn kinh phí---</option>	 -->
				                    <% for (O_NguonKinhPhi nkp : dsNguonKinhPhi) { %>
										<option value="<%=nkp.getMaNguonKinhphi() %>"><%=nkp.getTenNguonKinhphi() %></option>
									<% } %>		                    			                    
					                 </select>
				                </td>
				            </tr>
				            <tr>
				                <td  align="left" class="cell-dialog_1">Số tiền<font color="red">*</font></td>
				                <td  align="left" class="cell-dialog_2">
			                        <div class="controls">
			                          <input class="auto them_ht_kinhphi_display" type="text" data-a-dec="," data-a-sep="." name="txtSoTien_Them" id="txtSoTien_Them">
			                        </div>			                 
				                </td>
				            </tr>				             
				            <tr>
				                <td align="left" colspan="1" class="cell-dialog">	                	
				                    <i>(<font color="red">*</font>) thông tin bắt buộc nhập</i>
				                </td>
				                <td align="left" colspan="1" class="cell-dialog">	                	
				                   <button class="btn btn-primary btn-cons them_ht_kinhphi_display" id="btnAddHoTroKinhPhi" type="button" onclick='them_hotro_kinhphi()'>Thêm vào danh sách</button>
				                </td>				             	          
				            </tr>
				            <tr>				              
				             	<td align="right" id="" class="message_success" colspan="5">
									<div class="alert-success"  id="td_message_hotrokinhphi" style="display:none">
										<span class="icon-ok"></span>
										Thêm hỗ trợ kinh phí thành công									
									</div>
				             	</td>				             	
				            </tr>				            
				        </table>
				        <!-- <hr> -->
				        <!-- Danh sách hỗ trợ kinh phí -->
				        <table class="table table-bordered no-more-tables" id="tab_ds_ho_tro_kp">
							<thead>
								<tr class="">									
					            	<th class="text-center" width="12%">Mã nguồn hỗ trợ</th>
					            	<th class="text-center" width="25%">Tên nguồn kinh phí</th>
					            	<th class="text-center" width="15%">Số tiền</th>
					            	<th class="text-center" width="5%">Xóa</th>
								</tr>
							</thead>
							<tbody>
								<tr class="tr_hotrokp_null">
                                   <td>&nbsp;</td>
                                   <td>&nbsp;</td>
                                   <td>&nbsp;</td>
                                   <td>&nbsp;</td> 
                                </tr>																		                              
							</tbody>
						 </table> 
						 <hr>
						 <button type="button" class="btn btn-success btn-cons them_ht_kinhphi_display" id="btnLuuHoTroKinhPhi" onclick="thuc_hien_them_hotro_kinhphi()">Lưu</button>              		                    
		                 <button type="button" class="btn btn-success btn-cons btnCloseThem" onclick="close_dialog_them()">Đóng</button>                                                						   
                      </div>
             <!-- STEP 3 THÊM LỊCH TRÌNH-->  
                      <div class="tab-pane" id="tab3"> <br>
                       <!--  <h5 class="semi-bold blue">DANH SÁCH LỊCH TRÌNH</h5>
                        <br> -->
                        <table width="100%" border="0" class="" cellpadding="5px">
				            <tr>
				                <td align="left" class="cell-dialog_1">Mã lịch trình<font color="red">*</font></td>
				                <td align="left" class="cell-dialog_2">
				                    <input id="txtMaLichTrinh_Them" name="txtMaLichTrinh_Them" class="input-large them_lichtrinh_display" type="text" style={font-weight:bold;} >	                   
				                </td>
				            </tr>				            
				            <tr>
				                <td  align="left" class="cell-dialog_1">Tên công việc<font color="red">*</font></td>
				                <td  align="left" class="cell-dialog_2">
				                    <input id="txtTenCongViec_Them" name="txtTenCongViec_Them" class="input-large them_lichtrinh_display" type="text" >	                   
				                </td>
				            </tr>
				            <tr>
				                <td  align="left" class="cell-dialog_1">Thời gian BĐ<font color="red">*</font></td>
				                <td  align="left" class="cell-dialog_2">
			                        <input type="text" class="datepicker them_lichtrinh_display" id="datLichTrinhBD_Them" name="datLichTrinhBD_Them">
				                    <span class="add-on"><span class="arrow"></span><i class="icon-th"></i></span>					               		               
				                </td>
				            </tr>
				            <tr>
				                <td  align="left" class="cell-dialog_1">Thời gian KT<font color="red">*</font></td>
				                <td  align="left" class="cell-dialog_2">
			                        <input type="text" class="datepicker them_lichtrinh_display" id="datLichTrinhKT_Them" name="datLichTrinhKT_Them">
				                    <span class="add-on"><span class="arrow"></span><i class="icon-th"></i></span>					               		               
				                </td>
				            </tr>				             
				            <tr>
				                <td align="left" colspan="1" class="cell-dialog">	                	
				                    <i>(<font color="red">*</font>) thông tin bắt buộc nhập</i>
				                </td>
				                <td align="left" colspan="1" class="cell-dialog">	                	
				                   <button class="btn btn-primary btn-cons them_lichtrinh_display" type="button" onclick='them_lich_trinh()'>Thêm vào danh sách</button>
				                </td>				             	          
				            </tr>
				            <tr>				              
				             	<td align="right" id="" class="message_success" colspan="5">
									<div class="alert-success"  id="td_message_lichtrinh" style="display:none">
										<span class="icon-ok"></span>
										Thêm lịch trình thành công									
									</div>
				             	</td>				             	
				            </tr>				            
				        </table>
				        <table class="table table-bordered no-more-tables" id="tab_ds_lich_trinh">
							<thead>
								<tr class="">									
					            	<th class="text-center" width="12%">Mã lịch trình</th>
					            	<th class="text-center" width="25%">Tên công việc</th>
					            	<th class="text-center" width="15%">Thời gian BĐ</th>
					            	<th class="text-center" width="15%">Thời gian BĐ</th>
					            	<th class="text-center" width="5%">Xóa</th>
								</tr>
							</thead>
							<tbody>
								<tr class="tr_lichtrinh_null">
                                   <td>&nbsp;</td>
                                   <td>&nbsp;</td>
                                   <td>&nbsp;</td>
                                   <td>&nbsp;</td> 
                                   <td>&nbsp;</td> 
                                </tr>																		                              
							</tbody>
						 </table> 
						 <hr>
						 <button type="button" class="btn btn-success btn-cons them_lichtrinh_display" id="btnLuuLichTrinh" onclick="thuc_hien_them_lich_trinh()">Lưu</button>              		                    
		                 <button type="button" class="btn btn-success btn-cons btnCloseThem" onclick="close_dialog_them()">Đóng</button>                                     			                   
                      </div>
             <!-- STEP 4 THÊM DANH SÁCH SINH VIÊN-->  
                      <div class="tab-pane" id="tab4"> <br>
                        <!-- <h4 class="semi-bold">Thêm danh sách sinh viên</h4>
                        <br> -->
                        <div class="alert-success"  id="td_message_sinhvien" style="display:none">
							<span class="icon-ok"></span>
							Thêm danh sách sinh viên thành công									
						</div>
                        <div id='div_dssv'>
                        
                        </div>
                        <hr>	  	
                        
	                    	<button type="button" class="btn btn-success btn-cons" id="btnThemSinhVien" onclick="thuc_hien_them_sinh_vien()">Thêm danh sách sinh viên</button>              		                    
		                    <button type="button" class="btn btn-success btn-cons btnCloseThem" onclick="close_dialog_them()">Đóng</button>                                                
                      </div>
                      <div>
                      	<input type="hidden" id="hidMaKeHoach" name="hidMaKeHoach" value=""/> 
                      	<input type="hidden" id="hidMaChiDoan" name="hidMaChiDoan" value=""/> 
                      </div>
                      <!-- <ul class="wizard wizard-actions">
                        <li class="previous first disabled" style="display:none;"><a href="javascript:;" class="btn">&nbsp;&nbsp;First&nbsp;&nbsp;</a></li>
                        <li class="previous disabled"><a href="javascript:;" class="btn">&nbsp;&nbsp;Previous&nbsp;&nbsp;</a></li>
                        <li class="next last" style="display:none;"><a href="javascript:;" class="btn btn-primary">&nbsp;&nbsp;Last&nbsp;&nbsp;</a></li>
                        <li class="next"><a href="javascript:;" class="btn btn-primary">&nbsp;&nbsp;Next&nbsp;&nbsp;</a></li>
                      </ul> -->
                    </div>
                  </div>
                 </form>
                </div>
             <!--   </div>   -->                
	</div>
<!-- DIALOG XÓA KẾ HOẠCH  -->
<div id="dialog_xoa_kehoach"  class="dialog" title="Xóa kế hoạch" style="display: none; text-align: center;">
	<div style="font-size: 15pt; text-align: left;">Bạn có chắc muốn xóa kế hoạch <span style="font-weight: bold" id="lblMaKH_Xoa"></span> ?</div>
	<div class="alert-error">		
		<b>Chú ý:</b>&nbsp;xóa kế hoạch cũng đồng nghĩa với việc xóa các danh sách liên quan.		
	</div>
	<hr>
	<button class="btn btn-danger btn-cons" type="button" id="btn_accept_del" onclick="xoa_ke_hoach()">Đồng ý</button>
	<button class="btn btn-white btn-cons" id="btn_cancel_del" type="button" onclick="close_dialog_xoa()">Bỏ qua</button>
</div>
<!-- DIALOG XÓA SINH VIÊN  -->
<div id="dialog_xoa_sv"  class="dialog" title="Xóa sinh viên" style="display: none; text-align: center;">
	<div style="font-size: 13pt; text-align: left;">Bạn có chắc muốn xóa sinh viên 
	<span style="font-weight: bold" id="lblMASV_Xoa"></span>
	ra khỏi kế hoạch <span style="font-weight: bold" id="lblMAKH_SV_Xoa"></span> ?
	</div>
	
	<hr>
	<button class="btn btn-danger btn-cons" type="button" id="" onclick="xoa_sv_ke_hoach()">Đồng ý</button>
	<button class="btn btn-white btn-cons" id="" type="button" onclick="close_dialog_xoa_sv()">Bỏ qua</button>
</div>
<!-- DIALOG XÓA HỖ TRỢ KINH PHÍ  -->
<div id="dialog_xoa_htkp"  class="dialog" title="Xóa nguồn hỗ trợ kinh phí" style="display: none; text-align: center;">
	<div style="font-size: 13pt; text-align: left;">Bạn có chắc muốn xóa hỗ trợ kinh phí 
	<span style="font-weight: bold" id="lblHTKP_Xoa"></span>
	ra khỏi kế hoạch <span style="font-weight: bold" id="lblMAKH_HTKP_Xoa"></span> ?
	</div>
	
	<hr>
	<button class="btn btn-danger btn-cons" type="button" id="" onclick="xoa_htkp_ke_hoach()">Đồng ý</button>
	<button class="btn btn-white btn-cons" id="" type="button" onclick="close_dialog_xoa_htkp()">Bỏ qua</button>
</div>
<!-- DIALOG XÓA LỊCH TRÌNH  -->
<div id="dialog_xoa_lichtrinh"  class="dialog" title="Xóa lịch trình" style="display: none; text-align: center;">
	<div style="font-size: 13pt; text-align: left;">Bạn có chắc muốn xóa lịch trình
	<span style="font-weight: bold" id="lblMALT_Xoa"></span>
	ra khỏi kế hoạch <span style="font-weight: bold" id="lblMAKH_LT_Xoa"></span> ?
	</div>
	
	<hr>
	<button class="btn btn-danger btn-cons" type="button" id="" onclick="xoa_lichtrinh_ke_hoach()">Đồng ý</button>
	<button class="btn btn-white btn-cons" id="" type="button" onclick="close_dialog_xoa_lichtrinh()">Bỏ qua</button>
</div>
<!-- DIALOG THÊM NGUỒN KINH PHÍ  -->
<div id="dialog_them_hotro_kinhphi"  class="dialog" title="Thêm hỗ trợ kinh phí" style="display: none; text-align: center;">
	<table width="100%" border="0" class="" cellpadding="5px">
      <tr>
          <td align="left" class="cell-dialog_1">Mã hỗ trợ kinh phí<font color="red">*</font></td>
          <td align="left" class="cell-dialog_2">
          	  <input type="hidden" id="hdMaKH_HTKP_Them_f" name="hdMaKH_HTKP_Them_f" value="">
              <input id="txtMaHTKP_Them_f" name="txtMaHTKP_Them_f" class="input-large" type="text" style={font-weight:bold;} >	                   
          </td>
      </tr>				            
      <tr>
          <td  align="left" class="cell-dialog_1">Nguồn kinh phí<font color="red">*</font></td>
          <td  align="left" class="cell-dialog_2">
              <select id="cboNguonKinhPhi_Them_f" name="cboNguonKinhPhi_Them_f" style="width:60%" class="">	
<!-- 			<option value="">----Chọn nguồn kinh phí---</option>	 -->
              <% for (O_NguonKinhPhi nkp : dsNguonKinhPhi) { %>
				<option value="<%=nkp.getMaNguonKinhphi() %>"><%=nkp.getTenNguonKinhphi() %></option>
			  <% } %>		                    			                    
            </select>
          </td>
      </tr>
      <tr>
          <td  align="left" class="cell-dialog_1">Số tiền<font color="red">*</font></td>
          <td  align="left" class="cell-dialog_2">
                 <div class="controls">
                   <input class="auto " type="text" data-a-dec="," data-a-sep="." name="txtSoTien_Them_f" id="txtSoTien_Them_f">
                 </div>			                 
          </td>
      </tr>				             
      <tr>
          <td align="left" colspan="2" class="cell-dialog">	                	
              <i>(<font color="red">*</font>) thông tin bắt buộc nhập</i>
          </td>
          			             	          
       </tr>                           				           
   </table>
    <hr>
       <button type="button" class="btn btn-success btn-cons" id="btnLuuHoTroKinhPhi" onclick="thuc_hien_them_hotro_kinhphi_f()">Lưu</button>              		                    
	   <button type="button" class="btn btn-success btn-cons btnCloseThem" onclick="close_dialog_them_kinhphi()">Đóng</button> 
</div>
<!-- DIALOG THÊM LỊCH TRÌNH  -->
<div id="dialog_them_lichtrinh"  class="dialog" title="Thêm lịch trình" style="display: none; text-align: center;">
	<table width="100%" border="0" class="" cellpadding="5px">
       <tr>
           <td align="left" class="cell-dialog_1">Mã lịch trình<font color="red">*</font></td>
           <td align="left" class="cell-dialog_2">
            	<input type="hidden" id="hdMaKH_LT_Them_f" name="hdMaKH_LT_Them_f" value="">
               <input id="txtMaLichTrinh_Them_f" name="txtMaLichTrinh_Them_f" class="input-large" type="text" style={font-weight:bold;} >	                   
           </td>
       </tr>				            
       <tr>
           <td  align="left" class="cell-dialog_1">Tên công việc<font color="red">*</font></td>
           <td  align="left" class="cell-dialog_2">
               <input id="txtTenCongViec_Them_f" name="txtTenCongViec_Them_f" class="input-large" type="text" >	                   
           </td>
       </tr>
       <tr>
           <td  align="left" class="cell-dialog_1">Thời gian BĐ<font color="red">*</font></td>
           <td  align="left" class="cell-dialog_2">
                  <input type="text" class="datepicker" id="datLichTrinhBD_Them_f" name="datLichTrinhBD_Them_f">
               <span class="add-on"><span class="arrow"></span><i class="icon-th"></i></span>					               		               
           </td>
       </tr>
       <tr>
           <td  align="left" class="cell-dialog_1">Thời gian KT<font color="red">*</font></td>
           <td  align="left" class="cell-dialog_2">
                  <input type="text" class="datepicker" id="datLichTrinhKT_Them_f" name="datLichTrinhKT_Them_f">
               <span class="add-on"><span class="arrow"></span><i class="icon-th"></i></span>					               		               
           </td>
       </tr>				             
       <tr>
           <td align="left" colspan="2" class="cell-dialog">	                	
               <i>(<font color="red">*</font>) thông tin bắt buộc nhập</i>
           </td>
           			             	          
       </tr>       			           
   </table>
    <hr>
       <button type="button" class="btn btn-success btn-cons"  onclick="thuc_hien_them_lich_trinh_f()">Lưu</button>              		                    
	   <button type="button" class="btn btn-success btn-cons btnCloseThem" onclick="close_dialog_them_lichtrinh()">Đóng</button> 
</div>
<!-- DIALOG THÊM SINH VIEN  -->
<div id="dialog_them_sinhvien"  class="dialog" title="Thêm danh sách sinh viên" style="display: none; text-align: center;">
	<div id='load_dssv_result'> </div>
    <hr>
    	<input type="hidden" id="hdMaKH_SV_Them_f" name="hdMaKH_SV_Them_f" value="">
       <button type="button" class="btn btn-success btn-cons" onclick="thuc_hien_them_sinhvien_f()">Lưu</button>              		                    
	   <button type="button" class="btn btn-success btn-cons" onclick="close_dialog_them_sinhvien()">Đóng</button> 
</div>
	<% conn.closeconnect(); %>
</body>
</html>





