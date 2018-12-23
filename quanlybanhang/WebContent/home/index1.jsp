
<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<meta charset="utf-8" />
<title>QUẢN LÝ BÁN HÀNG</title>

<%@include file="../moduls/I_CSS.html"%>

</head>
<!-- END HEAD -->

<script src="../assets/js/vo.js" type="text/javascript"></script>

<!-- BEGIN BODY -->
<body class="">


<!-- BEGIN HEADER -->
<%@include file="../moduls/header.jsp" %>
<!-- END HEADER -->


<!-- BEGIN CONTAINER -->
<%@include file="../moduls/menubar.jsp" %>
	<div>
<!-- 
<div class="span4" align="center">
          <div class="grid simple">
            <div class="grid-title no-border">
              <h4>-</h4>
              <div class="tools"> <a href="javascript:;" class="collapse"></a> <a href="#grid-config" data-toggle="modal" class="config"></a> <a href="javascript:;" class="reload"></a> <a href="javascript:;" class="remove"></a> </div>
            </div>
            <div class="grid-body no-border">
              <div class="row-fluid">
                <h3>ĐĂNG NHẬP</span></h3>
                <p></p>
                <br>
                <form action="login" method="post" >
	                <div class="row-fluid">
	                
	                  <div class="input-prepend inside span12"> <span class="add-on"><i class="icon-instagram"></i> </span>
	                    <input name="username" class="span10" id="txtUserName" type="text" placeholder="Username">
	                  </div>
	                </div>
	                <div class="row-fluid">
	                  <div class="input-prepend inside span12"> <span class="add-on"><i class="icon-lock"></i></span>
	                    <input class="span10" id="txtPassWord" type="password" name="password" placeholder="Password">
	                  </div>
	                </div>
	                <br>
	                <div>
	                <button class="btn btn-success btn-cons" onclick="check_login()" type="button">Login</button>
	                </div>
                </form>
                <div class="row-fluid">
                 
                </div>
              </div>
            </div>
          </div>
       
	</div>
	
	 -->
	
	
	
		<div id="dialog_dn" title="ĐĂNG NHẬP"
		style="display: none; text-align: center;">
		<form action="login" method="post" >
	                <div class="row-fluid">
	                
	                  <div class="span12"> <span class="add-on"><i class="icon-instagram"></i> </span>
	                    <input name="username" class="span10" id="txtUserName" type="text" placeholder="Tài khoản">
	                  </div>
	                </div>
	                <div class="row-fluid">
	                  <div class="span12"> <span class="add-on"><i class="icon-lock"></i></span>
	                    <input class="span10" id="txtPassWord" type="password" name="password" placeholder="Mật khẩu">
	                  </div>
	                </div>
	                <br>
	                <div>
	                <button class="btn btn-success btn-cons" onclick="check_login()" type="button">Đăng nhập</button>
	                </div>
                </form>
	</div>
  <%@include file="../moduls/footer.jsp" %>
<!-- END CONTAINER --> 

<!-- END CHAT -->
<!-- END CONTAINER -->


</body>
</html>