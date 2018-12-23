<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<html>

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
	                <button class="btn btn-success btn-cons" onclick="check_login()" type="button">Đăng nhập</button>
	                </div>
                </form>
                <div class="row-fluid">
                 
                </div>
              </div>
            </div>
          </div>
</html>