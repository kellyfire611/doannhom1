
<%@page import="model.O_KeHoach"%>
<%@page import="model.D_SinhVien"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QUẢN LÝ HOẠT ĐỘNG ĐOÀN</title>

<%@include file="../moduls/I_CSS.html"%>
<script src="../assets/js/update_bchchidoan.js" type="text/javascript"></script>


</head>


<body>

	<!-- BEGIN HEADER -->
	<%@include file="../moduls/header.jsp"%>
	<!-- END HEADER -->


	<!-- BEGIN CONTAINER -->
	<%@include file="../moduls/menubar.jsp"%>
	<%
	String machidoan = request.getParameter("machidoan");


	PUB_Lib conn = new PUB_Lib();
		conn.connect();
		ObjectContainer db=conn.getDb();
		D_BCHChiDoan bchcd = new D_BCHChiDoan();
		D_ChiDoan cd = new D_ChiDoan();
		O_ChiDoan ocd = new O_ChiDoan();
		D_SinhVien dsv = new D_SinhVien();
		List<O_SinhVien> svs = cd.selectSinhVien_ChiDoan(db, machidoan);	
		int tongkethoach =cd.selectKeHoach_ChiDoan(db, machidoan).size();
		ocd = cd.found_O_ChiDoan(db, machidoan);
		
		int i=0;
		%>
		

	<div class="row-fluid">
        <div class="span12">
          <div class="grid simple ">
            <div class="grid-title">
            <span class="text-info" style="font-size: 24px;">
						Thông Tin Chi Đoàn
			</span> 
			<span class=".col-xs-6 .col-md-4"> 
             	<div class="tools"> 
             	<a href="javascript:;" class="collapse"></a> 
             	<a href="#grid-config" data-toggle="modal" class="config"></a> 
             	<a href="javascript:;" class="reload"></a> <a href="javascript:;" class="remove"></a> 
             	</div>
            </span>
            </div>
           		 <div class="grid-body ">
        			<div class="row-fluid">
        				<span class="span10">
        				<table>
        					<tr>
        						<th align="left" style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);">Mã Chi Đoàn  : &nbsp</th><th>&nbsp</th>
        						
        						<th align="left"style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"><%=ocd.getMachidoan() %></th>
        					</tr>
        					
        					<tr>
        						<th align="left"style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);">Tên Chi Đoàn  : &nbsp</th><th>&nbsp</th>
        						<th align="left"style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"><%=ocd.getTenchidoan() %></th>
        					</tr>
        					<tr>
        						<th align="left"style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);">Số lượng kế hoạch đã thực hiện  : &nbsp</th><th>&nbsp</th>
        						
        						<th align="left"style="width: 300px; height: 30px; font-size: 14px; color: rgb(1, 39, 90);"><%=tongkethoach %></th> 
        					</tr>
        				</table>
        				</span>
       				</div>
       			</div>
       		</div>
       	</div>
	</div>

	<div>
 <div class="row-fluid">
        <div class="span12">
          <div class="grid simple ">
            <div class="grid-title">
             <span class="text-info" style="font-size: 24px;">
						Danh Sách Sinh Viên
			</span> 
              <div class="tools"> <a href="javascript:;" class="collapse"></a> <a href="#grid-config" data-toggle="modal" class="config"></a> <a href="javascript:;" class="reload"></a> <a href="javascript:;" class="remove"></a> </div>
            </div>
            <div class="grid-body ">
              <div class="row-fluid">
                <table class="table table-hover table-condensed" id="example">
                  <thead>
                    <tr class="text-info" >
                    	
                      	<th style="font-size: 14px;">Mã Sinh Viên</th>
						<th style="font-size: 14px;">Họ Tên Sinh Viên</th>
						<th style="font-size: 14px;">Địa Chỉ</th>
						<th style="font-size: 14px;">Kế hoạch tham gia</th>
						<th style="font-size: 14px;">BCH</th>
						<th></th>
                    </tr>
                  </thead>
                  <tbody>
                  <% for(O_SinhVien sv :svs){
                	
                	 
                	  int kh = (dsv.selectSinhVien_KeHoach(db, sv.getMa()).size());
                	  int kq =0;
                	  if(tongkethoach>0){
                	  kq	= (kh*100)/tongkethoach;
                	  }
                	 
                	 
						O_BCHChiDoan bchtemp = bchcd.found_O_BCHChiDoan(db, sv.getMa());
						if(bchtemp!=null){
                	  %>
                	 <tr >
                  
                      <td valign="middle"><%=sv.getMa()%>
                      </td>
                      <td valign="middle"><span class="muted"><%=sv.getHoTen()%></span>
                      </td>
                      <td><span class="muted"><%=sv.getDiaChi()%></span>
                      </td>
                      
                      <td valign="middle">
                          <%=kh %>
                      </td>
                      <td class="text-info"><i class="icon-ok"></i>
                     <%=bchtemp.getChucVu()%> 	
					  </td>
					  <td>	
							<a class="btn btn-social" id="tt_sv" value="<%=sv.getMa() %>" style="background-color: white;"
							 onclick="thong_tin_sinh_vien_mo_form('<%=sv.getMa() %>',
																	 '<%=sv.getHoTen() %>',
																	 '<%=sv.getDiaChi() %>',
																	 '<%=bchtemp.getChucVu() %>',
																	 '<%=kh %>'
										)">
							<i class="icon-edit" style="color: rgb(248, 161, 66);"></i>
							</a>
                       </td>
                    </tr>
                    
                	  
                	  <%
						} 
						else{
						%>
							
						 <tr >
                  
                      <td valign="middle"><%=sv.getMa()%>
                      </td>
                      <td valign="middle"><span class="muted"><%=sv.getHoTen()%></span>
                      </td>
                      <td><span class="muted"><%=sv.getDiaChi()%></span>
                      </td>
                      
                      <td valign="middle">
                   
                          <%=kh %>
                      </td>
                      
                        <td>
                        	
                        </td>
                        <td>	
                        	<a class="btn btn-social" id="tt_sv" value="<%=sv.getMa() %>" style="background-color: white;"
                        	onclick="thong_tin_sinh_vien_mo_form('<%=sv.getMa() %>',
																	 '<%=sv.getHoTen() %>',
																	 '<%=sv.getDiaChi() %>',
																	 '',
																	 '<%=kh %>'
										)"
                        	>
							<i class="icon-edit" style="color: rgb(248, 161, 66);"></i>
							</a>
                        </td>
                    </tr>	
							
							
						<%}
						
                  } %>
                  
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
	</div>
	

<!-- DIALOG -->	
	<div id="dialog_ttsinhvien" title="Thông Tin Sinh Viên" style="display: none; text-align: center;">
	       <form name="frmttsv" method="post">
	        <table width="100%" border="0" class="" cellpadding="5px">
	            <tr>
	                <td align="left" class="cell-dialog">Mã Sinh viên<font color="red"></font></td>
	                <td align="left" class="cell-dialog">
	                    <input id="txtmasv" name="txtmasv" class="input-large " type="text" readonly style={background-color:#F4F5F7;font-weight:bold;} >	                   
	                </td>
	            </tr>
	            <tr>
	                <td align="left" class="cell-dialog">Họ Tên Sinh Viên<font color="red">*</font></td>
	                <td  align="left" class="cell-dialog">
	                    <input id="txttensv" name="txttensv" class="input-large " type="text" readonly style={background-color:#F4F5F7;font-weight:bold;} >
	                </td>
	            </tr>
	            <tr>
	                <td align="left" class="cell-dialog">Địa Chỉ<font color="red">*</font></td>
	                <td  align="left" class="cell-dialog">
                    <input id="txtdiachi" name="txtdiachi" class="input-large " type="text" readonly style={background-color:#F4F5F7;font-weight:bold;} >
	                </td>
	            </tr>
	            <tr>
	                <td  align="left" class="cell-dialog">Chức Vụ<font color="red">*</font></td>
	                <td  align="left" class="cell-dialog">
	                    <input id="txtchucvu" name="txtchucvu" class="input-large " type="text" readonly style={background-color:#F4F5F7;font-weight:bold;} >
	                </td>
	            </tr>
	               <tr>
	                <td  align="left" class="cell-dialog">Số kế hoạch đã tham gia<font color="red">*</font></td>
	                <td  align="left" class="cell-dialog">
	                    <input id="txtkh" name="txtkh" class="input-large " type="text" readonly style={background-color:#F4F5F7;font-weight:bold;} >
	                </td>
	            </tr>
	            
	    		<tr>
	    		 	<td align="left">Cập nhật chức vụ</td>
	    		 	<td align="left">
                  
		                  <select id="chonchucvu">
		                                    
		                    <option value="0" selected="selected"></option>
		                   
		                    <option value="Bí Thư">Bí Thư</option>
		                    <option value="Phó Bí Thư">Phó Bí Thư</option>
		                    <option value="Ủy Viên">Ủy Viên</option>
		                   
		                   
		                   
		                  </select>
               		</td>
	    		</tr>
	    		
	    		 <tr>
	                <td align="center" colspan="2" class="cell-dialog">	                	
	                    <hr>	                    
	                    <button type="button" class="btn btn-success btn-cons" onclick="thuc_hien_cap_nhat_bch()"> Cập nhật Chức Vụ</button>
	                    <button type="button" class="btn btn-warning  btn-cons" onclick="xoa_chuc_vu()"> Xóa Chức Vụ</button>
	                    <button type="button" class="btn btn-success btn-cons" id="btnCloseSua">Đóng</button>
	                </td>
	            </tr>
	    		
	    	
	   	     </table>
	    </form>
	</div>
	 <form style="visibility: hidden" action="../cap_nhat_ban_chap_hanh_chi_doan/*" method="post">	 
	 <input type="text" name="machidoan" value="<%=machidoan%>"> 
	 <button id="btncapnhat" type="submit" ></button>   </form>
<% conn.closeconnect(); %>


	<%@include file="../moduls/footer.jsp"%>
</body>

</html>