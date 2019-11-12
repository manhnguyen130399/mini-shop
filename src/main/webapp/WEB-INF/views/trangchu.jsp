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


	<div id="header" class="container-fluid ">
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
			         <li class ="active"><a  href="#">TRANG CHỦ</a></li>
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
			       		 <li><a href="dangnhap/">ĐĂNG NHẬP</a></li>
			       	</c:otherwise>
			       </c:choose>
			      
			        <li><a href="#"><img src='<c:url value="/resources/image/shopping-cart.png"/>' width="24px" height="24px" /></a></li>
			      </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
			<div class="event-header container wow bounceIn">
				<span>Ngày 17/10-23/10/2019</span>
				<br/>
				<span style="font-size: 50px">Mua 1 tặng 1</span>
				<br/>
				<button>Xem ngay</button>
			</div>
	</div>
	
	<div id="info" class="container">
		<div class="row">
			<div class="col-12 col-sm-4 col-md-4 wow fadeInLeft " data-wow-duration="2s">
				<img  class="icon" alt="" src='<c:url value="/resources/image/chatluong.jpg"/>' />
				<br/>
				<span style="font-size: 32px;font-weight: 500;">CHẤT LƯỢNG</span>
				<br/>
				<span>Chúng tôi cảm kết mang đến cho các bạn chất lượng sản phẩm</span>
			</div>
			
			<div class="col-12 col-sm-4 col-md-4 wow fadeInDown"data-wow-duration="2s" data-wow-delay="1s">
				<img  class="icon" alt="" src='<c:url value="/resources/image/tk.png"/>' />
				<br/>
				<span  style="font-size: 32px;font-weight: 500;">TIẾT KIỆM CHI PHÍ</span>
				<br/>
				<span>Cam kết giá rẻ nhất Việt Nam giúp bạn tiết kiệm hơn 20% cho từng sản phẩm</span>
			</div>
			
			<div class="col-12 col-sm-4 col-md-4 wow fadeInUp"data-wow-duration="2s" data-wow-delay="2s">
				<img  class="icon" alt="" src='<c:url value="/resources/image/gh.png"/>'/>
				<br/>
				<span  style="font-size: 32px;font-weight: 500;">GIAO HÀNG</span>
				<br/>
				<span>Cam kết giao hàng tận nơi trong ngày. Để mang sản phẩm đến cho khách hàng nhanh nhất</span>
			</div>
		</div>
		
	</div>
	
	<div id="title-sp" class="container-fluid">
		<span> SẢN PHẨM HOT </span>
		<div class="row" style="margin-top: 12px">
		
			<c:forEach var="sanpham" items="${listsanpham}">
				<div class="col-md-3 col-sm-6">
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