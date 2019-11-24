<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
 <jsp:include page="header.jsp"></jsp:include>
  <meta charset="utf-8">
<title>Pooled Admin Panel Category Flat Bootstrap Responsive Web Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- Custom CSS -->
<link rel='stylesheet' type='text/css' href='<c:url value="/resources/css/styles.css" />'>
<link rel='stylesheet' type='text/css' href='<c:url value="/resources/css/style.css" />'>
<link rel="stylesheet"  type="text/css" href='<c:url value="/resources/css/morris.css"/>'> 
<!-- Graph CSS -->
<link  rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css"/>'>
<!-- jQuery -->
<script src='<c:url value="/resources/js/jquery-2.1.4.min.js"/>'></script>
<!-- //jQuery -->
<link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<!-- lined-icons -->
<link rel="stylesheet" type='text/css' href='<c:url value="/resources/css/icon-font.min.css"/>'> <!-- //lined-icons -->
</head> 
<body>
   <div class="page-container">
   <!--/content-inner-->
<div class="left-content" >
	
	<div class="row">
	<h3>Product</h3>
	<form id="formSanPham" >
	
	<div class="col-md-5 col-sm-12 form-group">
		<label for="tensanpham">Tên sản phẩm</label></br>
		<input type="text" id="tensanpham" name="tensanpham" class="form-control"placeholder="Nhập vào tên sản phẩm"/></br>
		<label for="giatien">Giá sản phẩm</label></br>
		<input type="text" id="giatien" name="giatien"class="form-control"placeholder="Nhập vào giá sản phẩm"/></br>
		<div class="form-group">
		<label for="danhmucsanpham">Danh mục sản phẩm</label>
		  <select name="danhmucsanpham" class="form-control" id="danhmucsanpham">
		   	<c:forEach var="value" items="${danhmuc }">
						<option value="${value.getMadanhmuc() }">${value.getTendanhmuc()}</option></br>
			</c:forEach>
		  </select>
		</div>
		<label for="mota">Mô tả</label></br>
		<textarea rows="5" type="text" id="mota" name="mota" class="form-control"placeholder="Nhập vào mô tả sản phẩm"></textarea></br>
		<label for="hinhsanpham">Hình ảnh</label></br>
		<input type="file"name="hinhsanpham"id="hinhsanpham" class="form-control"/></br>
		<span>Dành cho</span></br>
		<label class="radio-inline"><input type="radio" id="rdnam" name="gianhcho" value="nam" checked>Nam</label>
		<label class="radio-inline"><input type="radio" id="rdnu"name="gianhcho" value="nu">Nữ</label></br>
		</form>
		<div id="containerchitietsanpham">
			<div  class="chitietsanpham">
			<span>Chi tiết</span></br>
			 <label for="">Màu sản phẩm</label></br>
			 <select  name="mausanpham"class="form-control" id="mausanpham">
			   	<c:forEach var="value" items="${listmau }">
							<option value="${value.getMamau() }">${value.getTenmau()}</option></br>
				</c:forEach>
			  </select>
			   <label for="sizesanpham">Size sản phẩm</label></br>
			   <select name="sizesanpham"class="form-control" id="sizesanpham">
			   	<c:forEach var="value" items="${listsize }">
							<option value="${value.getMasize() }">${value.getSize()}</option></br>
				</c:forEach>
			  </select>
			  <label for="soluong">Số lượng</label></br>
			  <input min="1" value="1" type="number"name="soluong"id="soluong" class="form-control"/></br>
		  </div>
		  
		  <button class="btn btn-primary btn-chitiet ">Thêm chi tiết</button>
		
		</div>
		<div class="chitietsanpham" id="chitietsanpham">
			<span>Chi tiết</span></br>
			 <label for="">Màu sản phẩm</label></br>
			 <select  name="mausanpham"class="form-control" id="mausanpham">
			   	<c:forEach var="value" items="${listmau }">
							<option value="${value.getMamau() }">${value.getTenmau()}</option></br>
				</c:forEach>
			  </select>
			   <label for="">Size sản phẩm</label></br>
			   <select name="sizesanpham"class="form-control" id="sizesanpham">
			   	<c:forEach var="value" items="${listsize }">
							<option value="${value.getMasize() }">${value.getSize()}</option></br>
				</c:forEach>
			  </select>
			  <label for="soluong">Số lượng</label></br>
			  <input min="1" value="1" type="number"name="soluong"id="soluong" class="form-control"/></br>
		 	<button class="btn btn-primary btn-chitiet">Thêm chi tiết</button>
		  </div>
		  <p>
		  </br>
		<button id="btnThemSanPham"class="btn btn-primary ">Thêm sản phẩm</button>
		<button id="btnThemCapNhat"class="btn btn-primary hidden">Cập nhật sản phẩm</button>
		<button id="btnThoat"class="btn btn-primary hidden">Thoát</button>
		</p>
	</div>
	
	
	<div class="col-md-7 col-sm-12">
			<div style="float:right;">
				
				<button  id="xoa-sanpham" class="btn btn-info">Xóa</button>
			</div>
			<table id="table-sanpham" class="table" >
				<thead>
					<tr>
						<td>
							<div  class="checkbox">
		 						<label><input id="checkall" class="checkboxsanpham" type="checkbox" value=""></label>
							</div>
						</td>
						<td>Tên Sản Phẩm</td>
						<td>Giá</td>
						<td>Dành cho</td>
					</tr>
					
				</thead>
				<tbody>
					<c:forEach var="value" items="${listsp}">
							
										<tr>
												<td>
													<div class="checkbox">
		 											 <label><input class="checkboxsanpham" type="checkbox" value="${value.getMasanpham()}"></label>
													</div>
												</td>
												<td class="tensp"data-masp="${value.getMasanpham()}">${value.getTensanpham()  }</td>
												<td class="giatien" data-value="${value.getGiatien() }">${value.getGiatien() }</td>
												<td class="gianhcho" data-gianhcho="${value.getGianhcho()  }">${value.getGianhcho()  } </td>	
												<td class="btn btn-warning capnhatsanpham" data-id="${value.getMasanpham()}">Sửa</td>
										</tr>
							
							
							</c:forEach>
				</tbody>
			
			</table>
					<ul class="pagination pagination-sm">
						<c:forEach var="i" begin="1" end="${tongsopage }">
							<c:choose>
		                                <c:when test="${i == 1}">
		                                    <li class="paging-item active">
		                                        <a href="#">${i}</a>
		                                    </li>
		                                </c:when>
		                                <c:otherwise>
		                                    <li class="paging-item">
		                                        <a href="#">${i}</a>
		                                    </li>
		                                </c:otherwise>
		                       </c:choose>
			
						</c:forEach>
				
					</ul>
			
			
			</div>
		</div>
	</div>
	
							<!--notification menu end -->
							
							<div class="clearfix"> </div>				
						</div>
						<div class="profile_details w3l">		
								<ul>
									<li class="dropdown profile_details_drop">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<div class="profile_img">	
												<span class="prfil-img"><img src="images/in4.jpg" alt=""> </span> 
												<div class="user-name">
													<p>Malorum</p>
													<span>Administrator</span>
												</div>
												<i class="fa fa-angle-down"></i>
												<i class="fa fa-angle-up"></i>
												<div class="clearfix"></div>	
											</div>	
										</a>
										<ul class="dropdown-menu drp-mnu">
											<li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
											<li> <a href="#"><i class="fa fa-user"></i> Profile</a> </li> 
											<li> <a href="#"><i class="fa fa-sign-out"></i> Logout</a> </li>
										</ul>
									</li>
								</ul>
							</div>
							
				     <div class="clearfix"> </div>	
				</div>
<!--heder end here-->
		<ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a> <i class="fa fa-angle-right"></i></li>
            </ol>
<!--four-grids here-->
		<div class="four-grids">
					<div class="col-md-3 four-grid">
						<div class="four-agileits">
							<div class="icon">
								<i class="glyphicon glyphicon-user" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>User</h3>
								<h4> 24,420  </h4>
								
							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-agileinfo">
							<div class="icon">
								<i class="glyphicon glyphicon-list-alt" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>Clients</h3>
								<h4>15,520</h4>

							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-w3ls">
							<div class="icon">
								<i class="glyphicon glyphicon-folder-open" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>Projects</h3>
								<h4>12,430</h4>
								
							</div>
							
						</div>
					</div>
					<div class="col-md-3 four-grid">
						<div class="four-wthree">
							<div class="icon">
								<i class="glyphicon glyphicon-briefcase" aria-hidden="true"></i>
							</div>
							<div class="four-text">
								<h3>Old Projects</h3>
								<h4>14,430</h4>
								
							</div>
							
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
<!--//four-grids here-->
<!--agileinfo-grap-->
<div class="agileinfo-grap">
<div class="agileits-box">
<header class="agileits-box-header clearfix">
<h3>Statistics</h3>
	<div class="toolbar">
		<div class="pull-left">
			<div class="btn-group">
				<a href="#" class="btn btn-default btn-xs">Daily</a>
				<a href="#" class="btn btn-default btn-xs active">Monthly</a>
				<a href="#" class="btn btn-default btn-xs">Yearly</a>
			</div>
		</div>
		<div class="pull-right">
			<div class="btn-group">
			  <a aria-expanded="false" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
				Export <i class="fa fa-angle-down"></i>
			  </a>
			  <ul class="dropdown-menu pull-right" role="menu">
				<li><a href="#">Export as PDF</a></li>
				<li><a href="#">Export as CSV</a></li>
				<li><a href="#">Export as PNG</a></li>
				<li class="divider"></li>
				<li><a href="#">Separated link</a></li>
			  </ul>
			</div>
			<a href="#" class="btn btn-primary btn-xs"><i class="fa fa-cog"></i></a>
		</div>
	</div>
</header>
<div class="agileits-box-body clearfix">
<div id="hero-area"></div>
</div>
</div>
</div>
	<!--//agileinfo-grap-->
<!--photoday-section-->	
			
                        
                    	<div class="col-sm-4 wthree-crd">
                            <div class="card">
                                <div class="card-body">
                                    <div class="widget widget-report-table">
                                        <header class="widget-header m-b-15">
                                        </header>
                                        
                                        <div class="row m-0 md-bg-grey-100 p-l-20 p-r-20">
                                            <div class="col-md-6 col-sm-6 col-xs-6 w3layouts-aug">
                                                <h3>August 2016</h3>
                                                <p>REPORT</p>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-6 ">
                                                <h2 class="text-right c-teal f-300 m-t-20">$21,235</h2>
                                            </div>
                                        </div>
                                        
                                        <div class="widget-body p-15">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Name</th>
                                                        <th>Amount</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>2356</td>
                                                        <td>dummy text </td>
                                                        <td>6,200.00</td>
                                                    </tr>
                                                    <tr>
                                                        <td>4589</td>
                                                        <td>Lorem Ipsum</td>
                                                        <td>6,500.00</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td>3269</td>
                                                        <td>specimen book</td>
                                                        <td>6,800.00</td>
                                                    </tr>                                                    
                                                    <tr>
                                                        <td>5126</td>
                                                        <td>Letraset sheets</td>
                                                        <td>7,200.00</td>
                                                    </tr>
                                                    <tr>
                                                        <td>7425</td>
                                                        <td>PageMaker</td>
                                                        <td>5,900.00</td>
                                                    </tr>
                                                </tbody>
                                            </table>    
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-4 w3-agileits-crd">
						
                            <div class="card card-contact-list">
							<div class="agileinfo-cdr">
                                <div class="card-header">
                                    <h3>Contacts</h3>
                                </div>
                                <div class="card-body p-b-20">
                                    <div class="list-group">
                                        <a class="list-group-item media" href="">
                                             <div class="pull-left">
                                                <img class="lg-item-img" src="images/in1.jpg" alt="">
                                            </div>
                                            <div class="media-body">
                                                <div class="pull-left">
                                                	<div class="lg-item-heading">Lorem</div>
                                                	<small class="lg-item-text">lorem@gmail.com</small>
                                                </div>
                                                <div class="pull-right">
                                                	<div class="lg-item-heading">Ceo</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="list-group-item media" href="">
                                            <div class="pull-left">
                                                <img class="lg-item-img" src="images/in2.jpg" alt="">
                                            </div>
                                            <div class="media-body">
                                                <div class="pull-left">
                                                	<div class="lg-item-heading">Ipsum</div>
                                                	<small class="lg-item-text">ipsum@hotmail.com</small>
                                                </div>
                                                <div class="pull-right">
                                                	<div class="lg-item-heading">Director</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="list-group-item media" href="">
                                            <div class="pull-left">
                                                <img class="lg-item-img" src="images/in3.jpg" alt="">
                                            </div>
                                            <div class="media-body">
                                                <div class="pull-left">
                                                	<div class="lg-item-heading">Unknown</div>
                                                	<small class="lg-item-text">unknown@gmail.com</small>
                                                </div>
                                                <div class="pull-right">
                                                	<div class="lg-item-heading">Manager</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="list-group-item media" href="">
                                            <div class="pull-left">
                                                <img class="lg-item-img" src="images/in4.jpg" alt="">
                                            </div>
                                            <div class="media-body">
                                            	<div class="pull-left">
                                                	<div class="lg-item-heading">Specimen</div>
                                                	<small class="lg-item-text">specimen@hotmail.com</small>
                                                </div>
                                                <div class="pull-right">
                                                	<div class="lg-item-heading">Assistan</div>
                                                </div>
                                            </div>
                                        </a>
                                       
                                        
                                   	</div>
                                </div>
                            </div>
							</div>
                      	</div>
                    	<div class="col-sm-4 w3-agile-crd">
                            <div class="card">
                                <div class="card-body card-padding">
                                    <div class="widget">
                                        <header class="widget-header">
                                            <h4 class="widget-title">Activities</h4>
                                        </header>
                                        <hr class="widget-separator">
                                        <div class="widget-body">
                                            <div class="streamline">
                                                <div class="sl-item sl-primary">
                                                    <div class="sl-content">
                                                        <small class="text-muted">5 mins ago</small>
                                                        <p>Williams has just joined Project X</p>
                                                    </div>
                                                </div>
                                                <div class="sl-item sl-danger">
                                                    <div class="sl-content">
                                                        <small class="text-muted">25 mins ago</small>
                                                        <p>Jane has sent a request for access</p>
                                                    </div>
                                                </div>
                                                <div class="sl-item sl-success">
                                                    <div class="sl-content">
                                                        <small class="text-muted">40 mins ago</small>
                                                        <p>Kate added you to her team</p>
                                                    </div>
                                                </div>
                                                <div class="sl-item">
                                                    <div class="sl-content">
                                                        <small class="text-muted">45 minutes ago</small>
                                                        <p>John has finished his task</p>
                                                    </div>
                                                </div>
                                                <div class="sl-item sl-warning">
                                                    <div class="sl-content">
                                                        <small class="text-muted">55 mins ago</small>
                                                        <p>Jim shared a folder with you</p>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
						<div class="clearfix"></div>
                   
	<!--//photoday-section-->	
	<!--w3-agileits-pane-->	
	<div class="w3-agileits-pane">
		<div class="col-md-4 wthree-pan">
			<div class="panel panel-default">
			  <div class="panel-heading"> <i class="fa fa-bell fa-fw"></i> Notifications Panel </div>
			  <!-- /.panel-heading -->
			  <div class="panel-body">
				<div class="list-group"> 
					<a href="#" class="list-group-item"> <i class="fa fa-comment fa-fw"></i> New Comment <span class="pull-right text-muted small"><em>4 minutes ago</em> </span> </a> 
					<a href="#" class="list-group-item"> <i class="fa fa-twitter fa-fw"></i> 3 New Followers <span class="pull-right text-muted small"><em>12 minutes ago</em> </span> </a> 
					<a href="#" class="list-group-item"> <i class="fa fa-envelope fa-fw"></i> Message Sent <span class="pull-right text-muted small"><em>27 minutes ago</em> </span> </a> 
					<a href="#" class="list-group-item"> <i class="fa fa-tasks fa-fw"></i> New Task <span class="pull-right text-muted small"><em>43 minutes ago</em> </span> </a> 
					<a href="#" class="list-group-item"> <i class="fa fa-upload fa-fw"></i> Server Rebooted <span class="pull-right text-muted small"><em>11:32 AM</em> </span> </a>
					<a href="#" class="list-group-item"> <i class="fa fa-bolt fa-fw"></i> Server Crashed! <span class="pull-right text-muted small"><em>11:13 AM</em> </span> </a> 
					<a href="#" class="list-group-item"> <i class="fa fa-tasks fa-fw"></i> New Task <span class="pull-right text-muted small"><em>43 minutes ago</em> </span> </a> 
				</div>
				<!-- /.list-group --> 
				
			  </div>
			  <!-- /.panel-body --> 
			</div>
		  </div>
		<div class="col-md-8 agile-info-stat">
			<div class="stats-info stats-last widget-shadow">
						<table class="table stats-table ">
							<thead>
								<tr>
									<th>S.NO</th>
									<th>PRODUCT</th>
									<th>STATUS</th>
									<th>PROGRESS</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Lorem ipsum</td>
									<td><span class="label label-success">In progress</span></td>
									<td><h5>85% <i class="fa fa-level-up"></i></h5></td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Aliquam</td>
									<td><span class="label label-warning">New</span></td>
									<td><h5>35% <i class="fa fa-level-up"></i></h5></td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td>Lorem ipsum</td>
									<td><span class="label label-danger">Overdue</span></td>
									<td><h5 class="down">40% <i class="fa fa-level-down"></i></h5></td>
								</tr>
								<tr>
									<th scope="row">4</th>
									<td>Aliquam</td>
									<td><span class="label label-info">Out of stock</span></td>
									<td><h5>100% <i class="fa fa-level-up"></i></h5></td>
								</tr>
								<tr>
									<th scope="row">5</th>
									<td>Lorem ipsum</td>
									<td><span class="label label-success">In progress</span></td>
									<td><h5 class="down">10% <i class="fa fa-level-down"></i></h5></td>
								</tr>
								<tr>
									<th scope="row">6</th>
									<td>Aliquam</td>
									<td><span class="label label-warning">New</span></td>
									<td><h5>38% <i class="fa fa-level-up"></i></h5></td>
								</tr>
							</tbody>
						</table>
					</div>
			</div>
		  <div class="clearfix"></div>
	  </div>
	  <!--//w3-agileits-pane-->	
<!-- script-for sticky-nav -->
		<script>
		$(document).ready(function() {
			 var navoffeset=$(".header-main").offset().top;
			 $(window).scroll(function(){
				var scrollpos=$(window).scrollTop(); 
				if(scrollpos >=navoffeset){
					$(".header-main").addClass("fixed");
				}else{
					$(".header-main").removeClass("fixed");
				}
			 });
			 
		});
		</script>
		<!-- /script-for sticky-nav -->
<!--inner block start here-->
<div class="inner-block">

</div>
<!--inner block end here-->
<!--copy rights start here-->
<div class="copyrights">
	 <p>© 2016 Pooled. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
</div>	
<!--COPY rights end here-->
</div>
</div>
  <!--//content-inner-->
			<!--/sidebar-menu-->
				<div class="sidebar-menu">
					<header class="logo1">
						<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> 
					</header>
						<div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
                           <div class="menu">
									<ul id="menu" >
										<li><a href="index.html"><i class="fa fa-tachometer"></i> <span>Dashboard</span><div class="clearfix"></div></a></li>
										
										
										 <li id="menu-academico" ><a href="inbox.html"><i class="fa fa-envelope nav_icon"></i><span>Product</span><div class="clearfix"></div></a></li>
									<li><a href="gallery.html"><i class="fa fa-picture-o" aria-hidden="true"></i><span>Gallery</span><div class="clearfix"></div></a></li>
									<li id="menu-academico" ><a href="charts.html"><i class="fa fa-bar-chart"></i><span>Charts</span><div class="clearfix"></div></a></li>
									 <li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span> Short Codes</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
										   <ul id="menu-academico-sub" >
										   <li id="menu-academico-avaliacoes" ><a href="icons.html">Icons</a></li>
											<li id="menu-academico-avaliacoes" ><a href="typography.html">Typography</a></li>
											<li id="menu-academico-avaliacoes" ><a href="faq.html">Faq</a></li>
										  </ul>
										</li>
									<li id="menu-academico" ><a href="errorpage.html"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i><span>Error Page</span><div class="clearfix"></div></a></li>
									  <li id="menu-academico" ><a href="#"><i class="fa fa-cogs" aria-hidden="true"></i><span> UI Components</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
										   <ul id="menu-academico-sub" >
										   <li id="menu-academico-avaliacoes" ><a href="button.html">Buttons</a></li>
											<li id="menu-academico-avaliacoes" ><a href="grid.html">Grids</a></li>
										  </ul>
										</li>
									 <li><a href="tabels.html"><i class="fa fa-table"></i>  <span>Tables</span><div class="clearfix"></div></a></li>
									<li><a href="maps.html"><i class="fa fa-map-marker" aria-hidden="true"></i>  <span>Maps</span><div class="clearfix"></div></a></li>
							        <li id="menu-academico" ><a href="#"><i class="fa fa-file-text-o"></i>  <span>Pages</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
										 <ul id="menu-academico-sub" >
											<li id="menu-academico-boletim" ><a href="calendar.html">Calendar</a></li>
											<li id="menu-academico-avaliacoes" ><a href="signin.html">Sign In</a></li>
											<li id="menu-academico-avaliacoes" ><a href="signup.html">Sign Up</a></li>
											

										  </ul>
									 </li>
									<li><a href="#"><i class="fa fa-check-square-o nav_icon"></i><span>Forms</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
									  <ul>
										<li><a href="input.html"> Input</a></li>
										<li><a href="validation.html">Validation</a></li>
									</ul>
									</li>
								  </ul>
								</div>
							  </div>
							  <div class="clearfix"></div>		
							</div>
							<script>
							var toggle = true;
										
							$(".sidebar-icon").click(function() {                
							  if (toggle)
							  {
								$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
								$("#menu span").css({"position":"absolute"});
							  }
							  else
							  {
								$(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
								setTimeout(function() {
								  $("#menu span").css({"position":"relative"});
								}, 400);
							  }
											
											toggle = !toggle;
										});
							</script>
<!--js -->
<script src='<c:url value="/resources/js/jquery.nicescroll.js"/>'></script>
<script src='<c:url value="/resources/js/scripts.js"/>'></script>
<!-- Bootstrap Core JavaScript -->
   <script src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>
   <!-- /Bootstrap Core JavaScript -->	   
<!-- morris JavaScript -->	
<script src='<c:url value="/resources/js/raphael-min.js"/>'></script>
<script src='<c:url value="/resources/js/morris.js"/>'></script>
<script src='<c:url value="/resources/js/custom.js" />'></script>
<script>
	$(document).ready(function() {
		//BOX BUTTON SHOW AND CLOSE
	   jQuery('.small-graph-box').hover(function() {
		  jQuery(this).find('.box-button').fadeIn('fast');
	   }, function() {
		  jQuery(this).find('.box-button').fadeOut('fast');
	   });
	   jQuery('.small-graph-box .box-close').click(function() {
		  jQuery(this).closest('.small-graph-box').fadeOut(200);
		  return false;
	   });
	   
	    //CHARTS
	    function gd(year, day, month) {
			return new Date(year, month - 1, day).getTime();
		}
		
		graphArea2 = Morris.Area({
			element: 'hero-area',
			padding: 10,
        behaveLikeLine: true,
        gridEnabled: false,
        gridLineColor: '#dddddd',
        axes: true,
        resize: true,
        smooth:true,
        pointSize: 0,
        lineWidth: 0,
        fillOpacity:0.85,
			data: [
				{period: '2014 Q1', iphone: 2668, ipad: null, itouch: 2649},
				{period: '2014 Q2', iphone: 15780, ipad: 13799, itouch: 12051},
				{period: '2014 Q3', iphone: 12920, ipad: 10975, itouch: 9910},
				{period: '2014 Q4', iphone: 8770, ipad: 6600, itouch: 6695},
				{period: '2015 Q1', iphone: 10820, ipad: 10924, itouch: 12300},
				{period: '2015 Q2', iphone: 9680, ipad: 9010, itouch: 7891},
				{period: '2015 Q3', iphone: 4830, ipad: 3805, itouch: 1598},
				{period: '2015 Q4', iphone: 15083, ipad: 8977, itouch: 5185},
				{period: '2016 Q1', iphone: 10697, ipad: 4470, itouch: 2038},
				{period: '2016 Q2', iphone: 8442, ipad: 5723, itouch: 1801}
			],
			lineColors:['#ff4a43','#a2d200','#22beef'],
			xkey: 'period',
            redraw: true,
            ykeys: ['iphone', 'ipad', 'itouch'],
            labels: ['All Visitors', 'Returning Visitors', 'Unique Visitors'],
			pointSize: 2,
			hideHover: 'auto',
			resize: true
		});
		
	   
	});
	</script>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>