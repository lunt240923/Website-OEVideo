<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Start form -->
<div class="banner">
	<div class="container form-login shadow p-3 mb-5 bg-white rounded">
		<h3>
			ĐỔI <em>MẬT KHẨU</em>
		</h3>
		<form action="${url}/luntpc04659_Assignment/user/change-password" method="post">
			<div class="form-group">
				<label class="font-weight-bold" for="inpAccount">Tài Khoản</label> <input
					type="text" class="form-control" id="inpAccount"
					name="userId" value="${user.userId}" aria-describedby="emailHelp" placeholder="" readonly>
			</div>
			<div class="form-group">
				<label class="font-weight-bold" for="inpPassword">Mật Khẩu</label> <input
					name="password" type="password" class="form-control" id="inpPassword"
					placeholder="" required>
			</div>
			<div class="form-group">
				<label class="font-weight-bold" for="inpNewPassword">Mật
					Khẩu Mới</label> <input name="newPassword" type="password" class="form-control"
					id="inpNewPassword" placeholder="" required>
			</div>
			<div class="form-group">
				<label class="font-weight-bold" for="inpNewPasswordConfirm">Xác
					Nhận Mật Khẩu Mới</label> <input name="passwordConfirm" type="password" class="form-control"
					id="inpNewPasswordConfirm" placeholder="" required>
			</div>
			<small class="form-text text-danger">${error}</small>
			<button type="submit" class="btn btn-primary">Lưu</button>
			<p>
				<a href="/luntpc04659_Assignment/user/forgot-password">Quên mật khẩu?</a>
			</p>
		</form>
	</div>
</div>
<!-- End form -->