$(document).ready(function(){
	var masp=0;
	
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
		var machitiet=$(this).attr("data-machitiet");
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
				soluong:soluong,
				machitiet:machitiet
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
	$(".xoa-giohang").click(function() {
		var self=$(this);
		var mamau=$(this).closest("tr").find(".mau").attr("data-mamau");
		var masize=$(this).closest("tr").find(".size").attr("data-size");
		var masp=$(this).closest("tr").find(".tensp").attr("data-masp");
		

		$.ajax({
			url:"/mini-shop/api/XoaGioHang",
			type:"GET",
			data:{
				masp:masp,
				masize:masize,
				mamau:mamau,
				
			},
			success: function(value){
				self.closest("tr").remove();
				GanTongTienGioHang();
							}	
	})
	})
	$("body").on("click",".paging-item",function(){
		$(".paging-item").removeClass("active");
		$(this).addClass("active");
		var sotrang=$(this).text();
		//5 là số sản phẩm đc hiện ra
		var spbd=(sotrang-1)*5;
		$.ajax({
			url:"/mini-shop/api/LaySanPhamLimit",
			type:"GET",
			data:{
				spbd:spbd,
				
			},
			success: function(value){
				var body=$("#table-sanpham").find("tbody");
				body.empty();
				body.append(value);
				
			}	
	})
	})
	$("#checkall").change(function () {
		if (this.checked) {
			$("#table-sanpham input").each(function () {
				$(this).attr("checked", true);
			})
		} else {
			$("#table-sanpham input").each(function () {
				$(this).attr("checked", false);
			})
		}
	})
	$("#xoa-sanpham").click(function() {
		$("#table-sanpham >tbody input:checked").each(function() {
			var masp=$(this).val();
			var This=$(this);
			$.ajax({
				url:"/mini-shop/api/XoaSanPham",
				type:"GET",
				data:{
					masp:masp,
					
				},
				success: function(value){
					This.closest("tr").remove("tr");
					
				}	
		})
		})
	})
	var files=[];
	var tenhinh="";
	$("#hinhsanpham").change(function(event) {
		files=event.target.files;
		tenhinh=event.target.files[0].name;
		forms=new FormData();
		forms.append("file",files[0]);
		$.ajax({
			url:"/mini-shop/api/UploadFile",
			type:"POST",
			data:forms,
			contentType:false,
			processData:false,
			enctype:"multipart/form-data",
			success: function(value){
				
				
			}	
	})
	})
	$("body").on("click",".btn-chitiet",function(){
		$(this).remove();
		var chitietclone=$("#chitietsanpham").clone().removeAttr("id");
		$("#containerchitietsanpham").append(chitietclone);
	})
	$("#btnThemSanPham").click(function(e) {
		e.preventDefault();
		var formdata=$("#formSanPham").serializeArray();
		json={};
		arraychitiet=[];
		
		$.each(formdata,function(i,field){
			json[field.name]=field.value;
		})
		$("#containerchitietsanpham >.chitietsanpham").each(function(){
			objectChitiet={};
			mausanpham=$(this).find("#mausanpham").val();
			sizesanpham=$(this).find("#sizesanpham").val();
			soluong=$(this).find("#soluong").val();
			objectChitiet["mausanpham"]=mausanpham;
			objectChitiet["sizesanpham"]=sizesanpham;
			objectChitiet["soluong"]=soluong;
			arraychitiet.push(objectChitiet);
			
		})
		json["chitietsanphamS"]=arraychitiet;
		json["hinhsanpham"]=tenhinh;
		alert(tenhinh);
		console.log(json);
		$.ajax({
			url:"/mini-shop/api/themsanpham",
			type:"POST",
			data:{
				datajson:JSON.stringify(json)
			},
			success: function(value){
				
				console.log(value);
			}	
	})
	})
	
	$("body").on("click", ".capnhatsanpham", function(){
		masp = $(this).attr("data-id");
		$("#btnThemCapNhat").removeClass("hidden");
		$("#btnThoat").removeClass("hidden");
		$("#btnThemSanPham").addClass("hidden");
		$.ajax({
			url: "/mini-shop/api/laydssanphamtheoma",
			type: "POST",
			data: {
				id: masp
			},
			success: function (value) {
				// hien nhung j json trả ve len thanh phan trong form
				console.log(value);
				$("#tensanpham").val(value.tensanpham);
				$("#giatien").val(value.giatien);
				$("#mota").val(value.mota);
				if(value.gianhcho=="nam"){
					$("#rdnam").prop("checked",true);
					
				}else{
					$("#rdnu").prop("checked",true);
				}
				//danhmucsapham không update
				$("#danhmucsanpham").empty();
				
				$("#containerchitietsanpham").empty();
				for(i=0;i<value.chiTietSanPhams.length;i++){
					var chitietclone=$("#chitietsanpham").clone().removeAttr("id");
					if(i<value.chiTietSanPhams.length){
						chitietclone.find(".btn-chitiet").remove();
					}
					
					chitietclone.find("#mausanpham").val(value.chiTietSanPhams[i].mauSanPham.mamau);
					chitietclone.find("#sizesanpham").val(value.chiTietSanPhams[i].sizeSanPham.masize);
					chitietclone.find("#soluong").val(value.chiTietSanPhams[i].soluong);
					$("#containerchitietsanpham").append(chitietclone);
				}
				
			
			}


		});
	$("#btnThemCapNhat").click(function(e) {
		e.preventDefault();
		var formdata=$("#formSanPham").serializeArray();
		json={};
		arraychitiet=[];
		
		$.each(formdata,function(i,field){
			json[field.name]=field.value;
		})
		$("#containerchitietsanpham >.chitietsanpham").each(function(){
			objectChitiet={};
			mausanpham=$(this).find("#mausanpham").val();
			sizesanpham=$(this).find("#sizesanpham").val();
			soluong=$(this).find("#soluong").val();
			objectChitiet["mausanpham"]=mausanpham;
			objectChitiet["sizesanpham"]=sizesanpham;
			objectChitiet["soluong"]=soluong;
			arraychitiet.push(objectChitiet);
			
		})
		json["masp"]=masp;
		json["chitietsanphamS"]=arraychitiet;
		json["hinhsanpham"]=tenhinh;
		console.log(json);
		$.ajax({
			url:"/mini-shop/api/capnhatsanpham",
			type:"POST",
			data:{
				datajson:JSON.stringify(json)
			},
			success: function(value){
				
				console.log(value);
			}	
	})
	})
	})
});