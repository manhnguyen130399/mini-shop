<%@page import="com.manhnguyen.entity.NhanVien"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Danh Muc</title>
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
			         <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">SẢN PHẨM <span class="caret"></span></a>
			          <ul class="dropdown-menu">		    
				         <c:forEach var="value" items="${danhmuc }">
							<li><a href="/mini-shop/sanpham/${value.getMadanhmuc() }/${value.getTendanhmuc()}">${value.getTendanhmuc()}</a></li>
							</c:forEach>
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
			<div class="col-sm-10 col-md-10">
				
					<div class="row">
						<span> ${tendanhmuc} </span>
						<c:forEach var="sanpham" items="${listsanpham}">
							<div class="col-md-4 col-sm-6">
								<a href="chitiet/${sanpham.getMasanpham()}">
									<div class="sanpham wow tada">
										<img alt="" src='<c:url value="/resources/image/${sanpham.getHinhsanpham()}.jpg"/>'>
										<br/>
										<span>${sanpham.getTensanpham()}</span>
										<br/>
										<span class="gia">${sanpham.getGiatien()}</span>
									</div>
								</a>
								
							</div>
						</c:forEach>
						
					
					</div>
	</div>
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