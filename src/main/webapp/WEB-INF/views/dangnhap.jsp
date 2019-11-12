<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body id="body-login">
	<div id="body-flex-login">
		<div id="container-login">
			<div id="container-login-left">
			
				<div id ="header-top-left" class="header-login">
					<span id="text-logo">Welcome</span>
					<br/>
					<span id="hint-text-logo">Hãy tạo nên phong cách của bạn cùng Minishop</span>
				</div>
				<div id="header-bot-left">
					<p><img alt="icon" src="../resources/image/icon.png"><span>Luôn cập nhật xu hướng thời trang mới nhất</span></p>
					<p><img alt="icon" src="../resources/image/icon.png"><span>Giảm 50% các mặt hàng cho khách vip</span></p>
					<p><img alt="icon" src="../resources/image/icon.png"><span>Tận tình tư vấn để tạo nên phong cách của bạn</span></p>
				</div>
			
			</div>
			<div id="container-login-right">
				<div id="header-top-right" class="header-login">
					<span class="actived" id="dangnhap">Đăng nhập</span> / <span id="dangky">Đăng kí</span>
				
				</div>
				<div id="container-center-login-right">
				
						<div class="container-login-form" id=" container-center-login-right">
							<p>
							<input id="tendangnhap" class="material-text-input input-icon-email" placeholder="Email" type="text" name="tendangnhap">
							</p>
							<input id="matkhau" class="material-text-input input-icon-pass" placeholder="Mật khẩu" type="password"name="matkhau">
							<br/>
							<input id="btn"class="material-button" type="submit"value="ĐĂNG NHẬP"  />
							<br/>
							
						
						</div>
						<div class="container-signup-form" id=" container-center-login-right">
							
							<form action="" method="post">
								<p>
								<input id="tendangnhap" class="material-text-input input-icon-email" placeholder="Email" type="text" name="tendangnhap1">
								</p>
								<p>
								<input id="matkhau" class="material-text-input input-icon-pass" placeholder="Mật khẩu" type="password"name="matkhau1">
								</p>
							
								<p>
								<input id="nhaplaimatkhau" class="material-text-input input-icon-pass" placeholder="Nhập lại mật khẩu" type="password"name="nhaplaimatkhau1">
								</p>
								
								
								<input id="btn"class="material-button" type="submit"value="ĐĂNG KÍ"  />
								<br/>	
							
							</form>
							
							
						
						</div>
						<span id="ketqua"></span>
						<span style="color: red;">${kiemtradangnhap }</span>
						
		
				</div>
				
				<div id="login-icon">
					<img alt="icon" src="../resources/image/fb.png">
					<img alt="icon" src="../resources/image/gg.png">
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>