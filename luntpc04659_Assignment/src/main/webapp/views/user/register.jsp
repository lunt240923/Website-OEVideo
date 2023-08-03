<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Start form -->
<div class="banner">
	<div class="container form-login shadow p-3 mb-5 bg-white rounded">
		<h3>
			ĐĂNG <em>KÝ</em>
		</h3>
		<form action="${url}/luntpc04659_Assignment/user/register" method="post">
			<div class="form-group">
				<label class="font-weight-bold" for="inpAccount">Tên Đăng
					Nhập</label> <input name="userId" type="text" class="form-control" id="inpAccount"
					aria-describedby="emailHelp" placeholder="" required>

			</div>
			<div class="form-group">
				<label class="font-weight-bold" for="inpPassword">Mật Khẩu</label> <input
					name="password" type="password" class="form-control" id="inpPassword"
					placeholder="" required>
			</div>
			<div class="form-group">
				<label class="font-weight-bold" for="inpPasswordConfirm">Xác
					Nhận Mật Khẩu</label> <input name="passwordConfirm" type="password" class="form-control"
					id="inpPasswordConfirm" placeholder="" required>
			</div>
			<div class="form-group">
				<label  class="font-weight-bold" for="inpEmail">Email</label> <input
					name="email" type="email" class="form-control" id="inpEmail" placeholder="" required>
			</div>
			<div class="form-group">
				<label  class="font-weight-bold" for="inpFullname">Họ Tên</label> <input
					name="fullname" type="text" class="form-control" id="inpFullname" placeholder="" required>
			</div>
			<small class="form-text text-danger">${error}</small>
			<button type="submit" class="btn btn-primary">Đăng Ký</button>
			<p>
				Bạn đã có tài khoản? <a class="noAccount" href="/luntpc04659_Assignment/user/login.html">Đăng
					nhập</a>
			</p>

		</form>
	</div>
</div>
<!-- End form -->