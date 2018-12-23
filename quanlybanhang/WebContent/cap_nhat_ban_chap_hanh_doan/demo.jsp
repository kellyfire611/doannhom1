
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
<title>Insert title here</title>

<%@include file="../moduls/I_CSS.html"%>



</head>


<body>

	<!-- BEGIN HEADER -->
	<%@include file="../moduls/header.jsp"%>
	<!-- END HEADER -->


	<!-- BEGIN CONTAINER -->
	<%@include file="../moduls/menubar.jsp"%>
	<%
//String machidoan = request.getAttribute("ma").toString();
	String		machidoan = "cd02";
	PUB_Lib conn = new PUB_Lib();
		conn.connect();
		ObjectContainer db=conn.getDb();
		D_ChiDoan cd = new D_ChiDoan();
		List<O_SinhVien> svs = cd.selectSinhVien_ChiDoan(db, machidoan);	
		int i=0;
		%>
<div>
	<div class="row-fluid">
        <div class="span12">
          <div class="grid simple ">
            <div class="grid-title">
             	<div class="tools"> <a href="javascript:;" class="collapse"></a> <a href="#grid-config" data-toggle="modal" class="config"></a> <a href="javascript:;" class="reload"></a> <a href="javascript:;" class="remove"></a> </div>
            	</div>
           		 <div class="grid-body ">
        			<div class="row-fluid">
        				<span class="span10">
        					<label>Mã Chi Đoàn : </label> <label style="font: bold;"><% %></label>
        					<label>Tên Chi Đoàn: </label> <label style="font: bold;"><% %></label>
        				</span>
       				</div>
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
              <h4>Table <span class="semi-bold">Styles</span></h4>
              <div class="tools"> <a href="javascript:;" class="collapse"></a> <a href="#grid-config" data-toggle="modal" class="config"></a> <a href="javascript:;" class="reload"></a> <a href="javascript:;" class="remove"></a> </div>
            </div>
            <div class="grid-body ">
              <div class="row-fluid">
                <table class="table table-hover table-condensed" id="example">
                  <thead>
                    <tr>
                    	
                      	<th>Mã Sinh Viên</th>
						<th>Họ Tên Sinh Viên</th>
						<th>Địa Chỉ</th>
						<th>Kế hoạch tham gia</th>
						<th></th>
                    </tr>
                  </thead>
                  <tbody>
                 <% for(O_SinhVien sv :svs){
                	
                	  %>
                	  <tr >
                  
                      <td valign="middle"><%=sv.getMa()%></td>
                      <td valign="middle"><span class="muted"><%=sv.getHoTen()%></span></td>
                      <td><span class="muted"><%=sv.getDiaChi()%></span></td>
                      <td valign="middle"><div class="progress progress-success">
                          <div data-percentage="0%" id="project-progress" style="width: 45%;" class="bar"></div>
                        </div>
                        </td>
                        <td><button class="btn">chon</button></td>
                    </tr>
                    
                	  
                	  <%
                  } %> 
                    <tr >
                  
                      <td valign="middle">Early Bird</td>
                      <td valign="middle"><span class="muted">Redesign project template</span></td>
                      <td><span class="muted">$4,500</span></td>
                      <td valign="middle"><div class="progress progress-success">
                          <div data-percentage="0%" id="project-progress" style="width: 45%;" class="bar"></div>
                        </div>
                        </td>
                        <td><button class="btn">chon</button></td>
                    </tr>
                    <tr>
                      
                      <td>Angry Birds&nbsp;&nbsp;&nbsp;<span class="label label-important">ALERT!</span></td>
                      <td><span class="muted">Something goes here</span></td>
                      <td><span class="muted">$9,000</span></td>
                      <td><div class="progress progress-danger">
                          <div data-percentage="0%" id="project-progress" style="width: 100%;" class="bar"></div>
                        </div></td>
                          <td><div class="checkbox check-default">
                          <input type="checkbox" value="3" id="checkbox4">
                          <label for="checkbox4"></label>
                        </div></td>
                    </tr>
                    <tr>
                    
                      <td>PHP Login page</td>
                      <td valign="middle"><span class="muted">A project in business and science is typically defined</span></td>
                      <td><span class="muted">$5,400</span></td>
                      <td><div class="progress progress-info">
                          <div data-percentage="0%" id="project-progress" style="width: 65%;" class="bar"></div>
                        </div></td>
                          <td><div class="checkbox check-default">
                          <input type="checkbox" value="3" id="checkbox4">
                          <label for="checkbox4"></label>
                        </div></td>
                    </tr>
                
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
	</div>


<% conn.closeconnect(); %>


	<%@include file="../moduls/footer.jsp"%>
</body>

</html>