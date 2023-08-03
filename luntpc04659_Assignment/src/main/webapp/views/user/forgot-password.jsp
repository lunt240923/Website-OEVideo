<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Start form -->
<div class="banner">
	<div class="container form-login shadow p-3 mb-5 bg-white rounded">
		<h3>
			QUÊN <em>MẬT KHẨU</em>
		</h3>
		<form>
			<div class="form-group">
				<label class="font-weight-bold" for="inpAccount">Tài Khoản</label> <input
					type="text" class="form-control" id="inpAccount"
					aria-describedby="emailHelp" placeholder="">

			</div>
			<div class="form-group">
				<label class="font-weight-bold" for="inpPassword">Email</label> <input
					type="email" class="form-control" id="inpPassword" placeholder="">
			</div>

			<small class="form-text text-danger">${error}</small>
			<button type="submit" class="btn btn-primary">Gửi</button>

		</form>
	</div>
</div>
<!-- End form -->