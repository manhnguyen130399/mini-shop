<%@page import="com.manhnguyen.entity.NhanVien"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="header.jsp"></jsp:include>
</head>
 
<body>


	<div id="header-ct" class="container-fluid ">
				<nav class="navbar navbar-default none_nav">
			  <div class="container-fluid">
			    <!-- Brand and toggle get grouped for better mobile display -->
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href="#"><img src='<c:url value="/resources/image/yame.png"/>' width="24px" height="24px"></a>
			    </div>
			
			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav navbar-center">
			         <li class ="active"><a  href="/mini-shop/">TRANG CHỦ</a></li>
			         <li class="dropdown open">
			         <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a href="#">Action</a></li>
			            <li><a href="#">Another action</a></li>
			            <li><a href="#">Something else here</a></li>
			            <li role="separator" class="divider"></li>
			            <li><a href="#">Separated link</a></li>
			            <li role="separator" class="divider"></li>
			            <li><a href="#">One more separated link</a></li>
			          </ul>
			        </li>
			        <li><a href="#">DỊCH VỤ</a></li>
			        <li><a href="#">LIÊN HỆ</a></li>
			       
			      </ul>
			  
			      <ul class="nav navbar-nav navbar-right">
			      
			       <c:choose>
			       	<c:when test="${dangnhap !=null}">
			       		  <li><a id="user" href="dangnhap/">${dangnhap}</a></li>
			       	</c:when>
			       	<c:otherwise>
			       		 <li><a href="/mini-shop/dangnhap/">ĐĂNG NHẬP</a></li>
			       	</c:otherwise>
			       </c:choose>
			        <li id="giohang"><a href="/mini-shop/giohang/"><img style="width: 24px; height: 24px;" src="<c:url value="/resources/image/shopping-cart.png" /> "/>
					       	<c:if test="${soluongsanphamgiohang >0}">
					        	 <div class="circle-giohang"><span >${soluongsanphamgiohang}</span></div>
					        </c:if>
					         <c:if test="${soluongsanphamgiohang <=0||soluongsanphamgiohang==null}">
					        	 <div><span >${soluongsanphamgiohang}</span></div>
					        </c:if>
			       </a></li>
			        
			      </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
			
	</div>
	
	<div class="container">
		<div class="row" style="margin-top: 16px">
			<div class="col-sm-2 col-md-2">
				<h3>DANH MỤC SẢN PHẨM</h3>
				<ul class="mymenu">
					<c:forEach var="value" items="${danhmuc }">
						<li><a href="#">${value.getTendanhmuc()}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="col-sm-8 col-md-8">
				
					<div class="col-sm-4 col-md-4">
						<img alt="" src='<c:url value="/resources/image/${chitietsp.getHinhsanpham()}.jpg"/>'>
					</div>
					
					<div class="col-sm-8 col-md-8">
						<h3 id="tensp" data-masp="${chitietsp.getMasanpham()}">${chitietsp.getTensanpham()}</h3>
						<h4 id="giatien" data-value="${chitietsp.getGiatien()}" style="color: red">${chitietsp.getGiatien()} VNĐ </h4>
						<table class="table">
							<thead>
							<tr>
								<td><h5>Màu sản phẩm </h5></td>
								<td><h5>Size sản phẩm</h5></td>
								<td><h5>Số lượng</h5></td>
								
								
							</tr>
							
							
							</thead>
							<tbody>
							<c:forEach var="chitietsanpham" items="${chitietsp.getChiTietSanPhams()}">
							
								<tr>
										<td class="mau" data-mamau="${chitietsanpham.getMauSanPham().getMamau()}">${chitietsanpham.getMauSanPham().getTenmau()} </td>
										<td class="size"data-size="${chitietsanpham.getSizeSanPham().getMasize()}"> ${chitietsanpham.getSizeSanPham().getSize()} </td>
										<td class="soluong">${chitietsanpham.getSoluong()}</td>
										<td><button data-machitiet="${chitietsanpham.getMachitietsanpham()}"class="btn-success btn-gio-hang">Giỏ hàng</button></td>
								</tr>
							</c:forEach>
							
							</tbody>
						
						</table>
					
					</div>
			</div>
			
			
			
			<div class="col-sm-2 col-md-2">
				<span>${chitietsp.getMota()}</span>
			
			</div>
		
		</div>
	
	
	</div>
	
	
	<div  id="footer" class="container-fluid">
		<div class="row">
			<div class="col-sm-4 col-md-4 wow flash">
				<p><span class="title-footer">THÔNG TIN SHOP</span>
			</p>
				<span>Yame là một thương hiệu thời trang đầy uy tín, luôn đảm bảo chất lượng sản phẩm tốt nhất cho khách hàng</span>
			</div>
			
			<div class="col-sm-4 col-md-4 wow flash">
				<p><span class="title-footer">LIÊN HỆ</span></p>
				<p><span>43 Nguyễn Trãi,Q1 ,TP.Hồ Chí Minh</span></p>
				<p><span>cuccutbietbay@gmail.vn</span></p>
				<p><span>04010811911</span></p>
			</div>
			
			<div class="col-sm-4 col-md-4 wow flash">
				<p><span class="title-footer">GÓP Ý</span></p>
				<form action="" method="post">
					<input  class="material-textinput" style="margin-bottom: 8px"" placeholder="Email" name="tenNhanVien">
					<textarea name="tuoi" rows="4" cols="50" placeholder="Ý kiến đóng góp"></textarea>
					<button class="material-button">Đồng ý</button>
					
				</form>
				
				
			</div>
		</div>
		
	
	</div>
	
	
	<jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>