<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="banner header-text">
        <div class="owl-banner owl-carousel">
            <div class="banner-item-01">
                <div class="text-content">
                    <h4>Welcome</h4>
                    <h2>OE Administration</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner Ends Here -->

    <div class="banner">
        <div class="container">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="edit-video-tab" data-toggle="tab" href="#editVideo" role="tab"
                        aria-controls="home" aria-selected="true">Chỉnh Sửa Người Dùng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="list-video-tab" data-toggle="tab" href="#listVideo" role="tab"
                        aria-controls="profile" aria-selected="false">Danh Sách Người Dùng</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <!-- Chỉnh sửa -->
                <div class="container-width tab-pane fade show active" id="editVideo" role="tabpanel" aria-labelledby="edit-video-tab">
                    <form method="post" align="left">
                        
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inpTenDangNhap">Tên Đăng Nhập</label>
                                    <input name="userId" value="${user.userId}" type="text" class="form-control" id="inpTenDangNhap" placeholder="" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Password</label>
                                    <input name="password" value="${user.password}" type="password" class="form-control" id="inputPassword4" placeholder="" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inpFullname">Họ Tên</label>
                                <input name="fullname" value="${user.fullname}" type="text" class="form-control" id="inpFullname" placeholder="" required>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail4">Email</label>
                                <input name="email" value="${user.email}" type="email" class="form-control" id="inputEmail4" placeholder="" required>
                            </div>
                            <div class="form-group">
                                <div class="custom-control custom-switch">
                                    <input name="admin" ${user.admin ? 'checked' : ''} type="checkbox" class="custom-control-input" id="btnActive">
                                    <label class="custom-control-label" for="btnActive">Quyền</label>
                                </div>
                            </div>

                       
                        <button formaction="/luntpc04659_Assignment/admin/update-user" type="submit" class="btn btn-outline-warning float-right">Cập Nhật</button>
                        <button formaction="/luntpc04659_Assignment/admin/delete-user" type="submit" class="btn btn-outline-danger float-right">Xóa</button>
                    </form>
                </div>
                <!-- Danh sách -->
                <div class="tab-pane fade show" id="listVideo" role="tabpanel" aria-labelledby="list-video-tab">
                    <div class="card">
                        <div class="card-header">
                            Danh Sách Người Dùng
                        </div>
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">Tên Đăng Nhập</th>
                                        <!-- <th scope="col">Mật Khẩu</th> -->
                                        <th scope="col">Họ Tên</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Quyền</th>
                                        <th scope="col">Chỉnh Sửa</th>
                                    </tr>
                                </thead>
							<tbody>
								<c:forEach var="user" items="${users}">
									<tr>
										<th scope="row">${user.userId}</th>
										<td>${user.fullname}</td>
										<td>${user.email}</td>
										<td>${user.admin ? 'Admin' : 'Người Dùng'}</td>
										<td><a href="/luntpc04659_Assignment/admin/ad-edit-user/${user.userId}"><i class="fa fa-edit"></i></a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
                        </div>
                        <div class="card-footer text-muted">
                            <div class="row">
                                <div class="col-sm-5" align="left">
                                    <p>Tổng người dùng: 5</p>
                                </div>
                                <div class="col-sm-7" align="right">
                                    <button class="btn btn-primary"><i class="bi bi-chevron-double-left"></i></button>
                                    <button class="btn btn-primary"><i class="bi bi-chevron-left"></i></button>
                                    <button class="btn btn-primary"><i class="bi bi-chevron-right"></i></button>
                                    <button class="btn btn-primary"><i class="bi bi-chevron-double-right"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>