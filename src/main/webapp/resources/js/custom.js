$(document).ready(function(){
	
	$("#cot1").click(function () {
		$(this).addClass("activiedlink")		
	})
	
	$("#btn").click(function () {
		var tendangnhap1=$("#tendangnhap").val();
		var matkhau1=$("#matkhau").val();
		$.ajax({
			url:"/mini-shop/api/KiemTraDangNhap",
			type:"GET",
			data:{
				tendangnhap:tendangnhap1,
				matkhau:matkhau1
			},
			success: function(value){
				if(value=="true")
				{
				$("#ketqua").text("Đăng nhập thành công");
				duongdanht=window.location.href;
				duongdan=duongdanht.replace("dangnhap/","");
				window.location=duongdan;
				}
			else{
				$("#ketqua").text("Đăng nhập thất bại");
			}
			}
			
		})	
	});
	$("#dangnhap").click(function () {
		$(this).addClass("actived");
		$("#dangky").removeClass("actived");
		$(".container-login-form").show();
		$(".container-signup-form").css("display","none");
		
	})
	$("#dangky").click(function () {
		$(this).addClass("actived");
		$("#dangnhap").removeClass("actived");
		$(".container-login-form").hide();
		$(".container-signup-form").show();	
	})
	$(".btn-gio-hang").click(function () {
		var mamau=$(this).closest("tr").find(".mau").attr("data-mamau");
		var tenmau=$(this).closest("tr").find(".mau").text();
		var masize=$(this).closest("tr").find(".size").attr("data-size");
		var tensize=$(this).closest("tr").find(".size").text();
		var tensp=$("#tensp").text();
		var masp=$("#tensp").attr("data-masp");
		var giatien=$("#giatien").attr("data-value");
		var soluong=$(this).closest("tr").find(".soluong").text();
		alert(tensp+masp+" "+giatien+" "+tenmau +tensize+soluong);
		
		$.ajax({
			url:"/mini-shop/api/ThemGioHang",
			type:"GET",
			data:{
				masp:masp,
				masize:masize,
				mamau:mamau,
				tensp:tensp,
				giatien:giatien,
				tenmau:tenmau,
				tensize:tensize,
				soluong:soluong
			},
			success: function(value){
				if(value=="true")
				{
				$("#ketqua").text("Đăng nhập thành công");
				duongdanht=window.location.href;
				duongdan=duongdanht.replace("dangnhap/","");
				window.location=duongdan;
				}
			else{
				$("#ketqua").text("Đăng nhập thất bại");
			}
			}
			
	})
	})
	
})