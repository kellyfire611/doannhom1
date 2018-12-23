
<%@page import="model.D_KeHoach"%>
<%@page import="model.O_KeHoach"%>
<%@page import="com.db4o.ObjectSet"%>
<%@page import="model.B_ThongKe"%>
<%@page import="com.db4o.ObjectContainer"%>
<%@page import="model.PUB_Lib"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<html>
<head>

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<meta charset="utf-8" />
<title>QUẢN LÝ HOẠT ĐỘNG ĐOÀN</title>

<%@include file="../moduls/I_CSS.html"%>
<script src="../assets/js/tk_kh.js" type="text/javascript"></script>
</head>
<body>
	<%@include file="../moduls/header.jsp"%>
	<%@include file="../moduls/menubar.jsp"%>

	<div class="row-fluid">
		<div class="span12">
			<div class="grid simple ">
				<div class="grid-title no-border">
					<span class="text-info" style="font-size: 24px;"> THỐNG KÊ KẾ HOẠCH</span>
				</div>
				<div class="grid-body ">
					

				
							<table>
								<tr>
									<th style="width: 200px;">Từ tháng</th>
									<th><select name="ds_khdaduyet_tuthang"
										id="ds_khdaduyet_tuthang">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
											<option>6</option>
											<option>7</option>
											<option>8</option>
											<option>9</option>
											<option>10</option>
											<option>11</option>
											<option>12</option>
									</select></th>
									<th style="width: 400px;">Đên Tháng</th>
									<th><select name="ds_khdaduyet_denthang"
										id="ds_khdaduyet_denthang">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
											<option>6</option>
											<option>7</option>
											<option>8</option>
											<option>9</option>
											<option>10</option>
											<option>11</option>
											<option>12</option>
									</select></th>
								</tr>
								<tr>
									<th style="width: 200px;">Từ năm</th>
									<th><select name="ds_khdaduyet_tunam"
										id="ds_khdaduyet_tunam">
											<option>2010</option>
											<option>2011</option>
											<option>2012</option>
											<option>2013</option>
											<option>2014</option>
											<option>2015</option>
											<option>2016</option>
											<option>2017</option>
											<option>2018</option>
											<option>2019</option>
											<option>2020</option>

									</select></th>
									<th style="width: 400px;">Đến Năm</th>
									<th><select name="ds_khdaduyet_dennam"
										id="ds_khdaduyet_dennam">
											<option>2010</option>
											<option>2011</option>
											<option>2012</option>
											<option>2013</option>
											<option>2014</option>
											<option>2015</option>
											<option>2016</option>
											<option>2017</option>
											<option>2018</option>
											<option>2019</option>
											<option>2020</option>
									</select></th>
								</tr>
								<th>Kế hoạch cần tìm	</th>
									<th> 
									<select name = "loaitk" id = "loaitk">
									<option value="0"> </option>
									<option value="1">Danh sách kế hoạch đã duyệt</option>
									<option value="2"> Danh sách kế hoạch chưa duyệt</option>
									<option value="3"> Danh sách kế hoạch đã thực hiện
									</option>
									<option value="4"> 
									Danh sách kế hoạch chưa thực hiện</option>
									</select>
									</th>
									<th><button class="btn btn-success btn-cons" onclick="tim_ds_khdaduyet()">Tìm  - <i class="icon-search"></i></button></th>
									<th></th>
								
							</table>
				<div style="height: 40px"></div>
					<div>
					<table>
						<thead>
							<tr style="color:blue">
							
								<th style="width: 150px;">Mã kế hoạch</th>
								<th style="width: 150px;">Thời gian BĐ</th>
								<th style="width: 150px;">Thời gian KT</th>
								<th style="width: 150px;">Địa điểm</th>
								<th style="width: 150px;">Nội dung</th>
								<th style="width: 150px;">Chi đoàn</th>
								<th style="width: 150px;">Duyệt</th>
								<th style="width: 150px;">Đã thực hiện</th>			
								
							</tr>
						</thead>
						<tbody id = "bodyds">
						
													
						
						</tbody>
					</table>
					</div>
				
				</div>
			</div>
		</div>
	</div>

	<%@include file="../moduls/footer.jsp"%>
</body>
</html>