<!DOCTYPE html>

<%@page import="java.util.List"%>
<%@page import="com.db4o.internal.Null"%>
<%@page import="com.db4o.ObjectSet"%>
<%@page import="com.db4o.ObjectContainer"%>
<%@page import="model.PUB_Lib"%>

<%@page import="model.O_SanPham"%>
<%@page import="model.D_SanPham"%>

<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<html>

<head>

	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

	<meta charset="utf-8" />
	<title>QUẢN LÝ BÁN HÀNG</title>



	<%@include file="../../moduls/I_CSS.html"%>

</head>
<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="">


	<!-- BEGIN HEADER -->
	<%@include file="../../moduls/header.jsp"%>
	<!-- END HEADER -->


	<!-- BEGIN CONTAINER -->
	<%@include file="../../moduls/menubar.jsp"%>


	<%
		PUB_Lib conn = new PUB_Lib();
		conn.connect();
        ObjectContainer db=conn.getDb();
        D_SanPham d = new D_SanPham();
        O_SanPham o = new O_SanPham();

        ObjectSet<O_SanPham> lstSanPham = d.selectAll(db);
		int i=0;
		%>



	<div class="row-fluid">
		<div class="span12">
			<div class="grid simple ">
				<div class="grid-title no-border">
					<span class=".col-xs-12 .col-md-8">
						<h4>Báo cáo doanh thu Đơn hàng</h4>
					</span>
					<span class=".col-xs-6 .col-md-4">
						<a class="btn-social" id="anbch">
							<i class="icon-collapse-alt"></i>
						</a>
						<a class="btn-social" onclick="them_mo_form()">
							<i class="icon-plus-sign-alt"></i></a>

						<a class="btn-social"><i class="icon-print"></i></a>
						<a class="btn-social"><i class="icon-refresh"></i></a>
					</span>
				</div>
				<div class="grid-body" id="grid-body_bch" value="0" style="display: normal">
					<form method="get" action="#" enctype="multipart/form-data">
					    <div class="form-group">
					        <label for="tuNgay">Từ ngày</label>
					        <input type="text" class="form-control" id="tuNgay" name="tuNgay">
					    </div>
					    <div class="form-group">
					        <label for="denNgay">Đến ngày</label>
					        <input type="text" class="form-control" id="denNgay" name="denNgay">
					    </div>
					    <button type="button" class="btn btn-primary" id="btnLapBaoCao">Lập báo cáo</button>
					</form>
					<div style="width: 600px !important;height: 600px !important;">
						<canvas id="chartOfobjChart" width="600" height="600"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../../moduls/footer.jsp"%>
	<!-- END CHAT -->
	<!-- END CONTAINER -->
	
	<% conn.closeconnect(); %>

	<script src="/quanlybanhang/assets/vendor/Chart.js/Chart.min.js"></script>
	<script>
		$(document).ready(function () {
			var objChart;
	        var $chartOfobjChart = document.getElementById("chartOfobjChart").getContext("2d");
	        $("#btnLapBaoCao").click(function(e) { 
	            e.preventDefault();
	            
	            var myLabels = ['20/12/2018', '21/12/2018', '22/12/2018', '23/12/2018', '24/12/2018'];
                var myData = ['500', '700', '900', '400', '300', '700'];
                
                myData.push(0); // creates a '0' index on the graph
                if (typeof $objChart !== "undefined") {
                    $objChart.destroy();
                }
                $objChart = new Chart($chartOfobjChart, {
                    // The type of chart we want to create
                    type: "bar",
                    data: {
                        labels: myLabels,
                        datasets: [{
                            data: myData,
                            borderColor: "#9ad0f5",
                            backgroundColor: "#9ad0f5",
                            borderWidth: 1
                        }]
                    },
                    // Configuration options go here
                    options: {
                        legend: {
                            display: false
                        },
                        title: {
                            display: true,
                            text: "Báo cáo đơn hàng"
                        },
                        responsive: true
                    }
                });
	            
	            
	            /*
	            $.ajax({
	                url: '/admin/thongke/doanhthu/donhang/',
	                type: "GET",
	                data: {
	                    tuNgay: $('#tuNgay').val(),
	                    denNgay: $('#denNgay').val(),
	                },
	                success: function (response) {
	                    var myLabels = ['20/12/2018', '21/12/2018', '22/12/2018', '23/12/2018', '24/12/2018'];
	                    var myData = ['500', '700', '900', '400', '300', '700'];
	                    $(response.data).each(function () {
	                        myLabels.push((this.thoiGian));
	                        myData.push(this.tongThanhTien);
	                    });
	                    myData.push(0); // creates a '0' index on the graph
	                    if (typeof $objChart !== "undefined") {
	                        $objChart.destroy();
	                    }
	                    $objChart = new Chart($chartOfobjChart, {
	                        // The type of chart we want to create
	                        type: "horizontalBar",
	                        data: {
	                            labels: myLabels,
	                            datasets: [{
	                                data: myData,
	                                borderColor: "#9ad0f5",
	                                backgroundColor: "#9ad0f5",
	                                borderWidth: 1
	                            }]
	                        },
	                        // Configuration options go here
	                        options: {
	                            legend: {
	                                display: false
	                            },
	                            title: {
	                                display: true,
	                                text: "Báo cáo đơn hàng"
	                            },
	                            responsive: true
	                        }
	                    });
	                }
	            });
	            */
	        });
		});

		function them_mo_form() {
			$('#dialog_themSanPham').dialog("open");
		};

		function sua_mo_form(txtLoaiSanPham, txtMaSanPham, txtTenSanPham, txtGiaBanSanPham, txtMoTaSanPham,
			txtNhaSanXuatSanPham, txtHinhAnhSanPham, txtSoLuongTonSanPham) {
			$('#ID_Sua').val(txtMaSanPham);

			$('#txtLoaiSanPham_sua').val(txtLoaiSanPham);
			$('#txtMaSanPham_sua').val(txtMaSanPham);
			$('#txtTenSanPham_sua').val(txtTenSanPham);
			$('#txtGiaBanSanPham_sua').val(txtGiaBanSanPham);
			$('#txtMoTaSanPham_sua').val(txtMoTaSanPham);
			$('#txtNhaSanXuatSanPham_sua').val(txtNhaSanXuatSanPham);
			$('#txtHinhAnhSanPham_sua').val(txtHinhAnhSanPham);
			$('#txtSoLuongTonSanPham_sua').val(txtSoLuongTonSanPham);
			$('#dialog_suaSanPham').dialog("open");
		};

		function thuc_hien_them() {
			$('.dynamic-input-error').remove();
			var valid = true;

			var txtLoaiSanPham = $.trim($('#txtLoaiSanPham').val());
			var txtMaSanPham = $.trim($('#txtMaSanPham').val());
			var txtTenSanPham = $.trim($('#txtTenSanPham').val());
			var txtGiaBanSanPham = $.trim($('#txtGiaBanSanPham').val());
			var txtMoTaSanPham = $.trim($('#txtMoTaSanPham').val());
			var txtNhaSanXuatSanPham = $.trim($('#txtNhaSanXuatSanPham').val());
			var txtHinhAnhSanPham = $.trim($('#txtHinhAnhSanPham').val());
			var txtSoLuongTonSanPham = $.trim($('#txtSoLuongTonSanPham').val());

			if (txtLoaiSanPham == '') {
				$('#txtLoaiSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtMaSanPham == '') {
				$('#txtMaSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtTenSanPham == '') {
				$('#txtTenSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtGiaBanSanPham == '') {
				$('#txtGiaBanSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNhaSanXuatSanPham == '') {
				$('#txtNhaSanXuatSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtMoTaSanPham == '') {
				$('#txtMoTaSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtHinhAnhSanPham == '') {
				$('#txtHinhAnhSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtSoLuongTonSanPham == '') {
				$('#txtSoLuongTonSanPham').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}

			if (valid) {
				$.ajax({
					type: "POST",
					url: "/quanlybanhang/admin/sanpham/create-edit/",
					data: {
						'task': 'them',
						'LoaiSanPham': txtLoaiSanPham,
						'MaSanPham': txtMaSanPham,
						'TenSanPham': txtTenSanPham,
						'GiaBanSanPham': txtGiaBanSanPham,
						'NhaSanXuatSanPham': txtNhaSanXuatSanPham,
						'MoTaSanPham': txtMoTaSanPham,
						'HinhAnhSanPham': txtHinhAnhSanPham,
						'SoLuongTonSanPham': txtSoLuongTonSanPham,
					},
					success: function (data) {
						location.reload();
					}
				});
			} else {
				return valid;
			}
		};

		function thuc_hien_sua() {
			$('.dynamic-input-error').remove();
			var valid = true;

			var txtLoaiSanPham = $.trim($('#txtLoaiSanPham_sua').val());
			var txtMaSanPham = $.trim($('#txtMaSanPham_sua').val());
			var txtTenSanPham = $.trim($('#txtTenSanPham_sua').val());
			var txtGiaBanSanPham = $.trim($('#txtGiaBanSanPham_sua').val());
			var txtMoTaSanPham = $.trim($('#txtMoTaSanPham_sua').val());
			var txtNhaSanXuatSanPham = $.trim($('#txtNhaSanXuatSanPham_sua').val());
			var txtHinhAnhSanPham = $.trim($('#txtHinhAnhSanPham_sua').val());
			var txtSoLuongTonSanPham = $.trim($('#txtSoLuongTonSanPham_sua').val());

			if (txtLoaiSanPham == '') {
				$('#txtLoaiSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtMaSanPham == '') {
				$('#txtMaSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtTenSanPham == '') {
				$('#txtTenSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtGiaBanSanPham == '') {
				$('#txtGiaBanSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtNhaSanXuatSanPham == '') {
				$('#txtNhaSanXuatSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtMoTaSanPham == '') {
				$('#txtMoTaSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtHinhAnhSanPham == '') {
				$('#txtHinhAnhSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}
			if (txtSoLuongTonSanPham == '') {
				$('#txtSoLuongTonSanPham_sua').parent().append(
					"<div class='dynamic-input-error'>&uarr;&nbsp;Vui lòng nhập thông tin</div>");
				valid = false;
			}

			if (valid) {
				$.ajax({
					type: "POST",
					url: "/quanlybanhang/admin/sanpham/create-edit/",
					data: {
						'task': 'sua',
						'LoaiSanPham': txtLoaiSanPham,
						'MaSanPham': txtMaSanPham,
						'TenSanPham': txtTenSanPham,
						'GiaBanSanPham': txtGiaBanSanPham,
						'NhaSanXuatSanPham': txtNhaSanXuatSanPham,
						'MoTaSanPham': txtMoTaSanPham,
						'HinhAnhSanPham': txtHinhAnhSanPham,
						'SoLuongTonSanPham': txtSoLuongTonSanPham,
					},
					success: function (data) {
						location.reload();
					}
				});
			} else {
				return valid;
			}
		};

		function thuc_hien_xoa(ma) {
			$.ajax({
				type: "POST",
				url: "/quanlybanhang/admin/sanpham/delete/",
				data: {
					'task': 'xoa',
					'MaSanPham': ma,
				},
				success: function (data) {
					location.reload();
				}
			});
		};
	</script>
</body>


</html>