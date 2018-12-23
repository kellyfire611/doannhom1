$(document).ready(function() {	

	
	
});
 function check_login(){
	 $('.dynamic-input-error').remove();
	 var valid = true;
	 var username = $('#txtUserName').val();
	 var password = $('#txtPassWord').val();
	 
	 if (username=='') {
        $('#txtUserName').parent().append("<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập tên đăng nhập.</div>");
        valid = false;
     }
	 
	 if (password=='') {
        $('#txtPassWord').parent().append("<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập mật khẩu.</div>");
        valid = false;
     }
	 if (valid) {
		 $.ajax({
            type: "POST",
            url: "../authentication",
            data: {'task':'check_login',                    
                   'Username' : username,
                   'Password':password
            },             
            success: function (data) {
                if (data=="OK") {                
                	alert("Đăng nhập thành công!");
                	window.location.replace("../cap_nhat_chi_doan/*");
                } else {
                	alert("Tên đăng nhập hoặc mật khẩu không đúng!");
                	return false;
                }  
            }
        });
	 } else {
		 return valid;
	 }
 }