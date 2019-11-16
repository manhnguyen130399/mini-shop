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
				old=document.referrer;
				
				window.location=old;
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
				
			}	
	}).done(function() {
		$.ajax({
			url:"/mini-shop/api/LaySoLuongGioHang",
			type:"GET",
			success: function(value){
				$("#giohang").find("div").addClass("circle-giohang");
				$("#giohang").find("div").html("<span>"+value+"</span>");
				
			}
	})
	})
	})
	
	GanTongTienGioHang();
	function GanTongTienGioHang(){
		var tongtiensp=0;
		$(".giatien").each(function() {
			var soluong = $(this).closest("tr").find(".soluong-giohang").val();
			var giatien=$(this).text();
			var tongtien=parseFloat(giatien)*soluong;
			tongtiensp+=tongtien;
			$("#tongtien").html(tongtiensp+" VND");
		})
	}
	
	$(".soluong-giohang").change(function () {
		
		var soluong=$(this).val();
		var giatien=$(this).closest("tr").find(".giatien").attr("data-value");
		GanTongTienGioHang();
	
		
		
//		var tongtien=soluong*parseInt(giatien);
//		
//		$(this).closest("tr").find(".giatien").html(tongtien+"");
		
		
		
		var mamau=$(this).closest("tr").find(".mau").attr("data-mamau");
		var masize=$(this).closest("tr").find(".size").attr("data-size");
		var masp=$(this).closest("tr").find(".tensp").attr("data-masp");
		$.ajax({
			url:"/mini-shop/api/CapNhatGioHang",
			type:"GET",
			data:{
				masp:masp,
				masize:masize,
				mamau:mamau,
				soluong:soluong,
				
			},
			success: function(value){
				
			}	
	})
	})
	


	
})