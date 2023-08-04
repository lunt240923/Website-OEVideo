<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Start form -->
<div class="banner">
	<div class="container form-login shadow p-3 mb-5 bg-white rounded">
		<h3>
			CHỈNH SỬA <em>THÔNG TIN</em>
		</h3>
		<form action="${url}/luntpc04659_Assignment/user/edit-profile" method="post">
			<div class="form-group">
				<label class="font-weight-bold" for="inpAccount">Tên Đăng
					Nhập</label> <input name="userId" type="text" class="form-control" id="inpAccount"
					aria-describedby="emailHelp" value="${user.userId}" placeholder="" readonly>

			</div>
			<div class="form-group">
				<label class="font-weight-bold" for="inpPassword">Mật Khẩu</label> <input
					name="password" type="password" class="form-control" id="inpPassword"
					placeholder="" value="${user.password}" readonly>
			</div>
			<div class="form-group">
				<label class="font-weight-bold" for="inpEmail">Email</label> <input
					name="email" type="email" class="form-control" id="inpEmail" value="${user.email}" required placeholder="">
			</div>
			<div class="form-group">
				<label class="font-weight-bold" for="inpFullname">Họ Tên</label> <input
					name="fullname" type="text" class="form-control" id="inpFullname" value="${user.fullname}" required placeholder="">
			</div>
			<small class="form-text text-danger">${error}</small>
			<button type="submit" class="btn btn-primary">Lưu</button>


		</form>
	</div>
</div>
<!-- End form -->