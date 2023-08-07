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
                        aria-controls="home" aria-selected="true">Chỉnh Sửa Video</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="list-video-tab" data-toggle="tab" href="#listVideo" role="tab"
                        aria-controls="profile" aria-selected="false">Danh Sách Video</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <!-- Chỉnh sửa -->
                <div class="tab-pane fade show active" id="editVideo" role="tabpanel" aria-labelledby="edit-video-tab">
                    <form align="left" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-4">
                                <img src="/luntpc04659_Assignment/views/assets/images/${video.poster}.jpg" alt="">
                                <div class="form-group">
                                    <label for="inpFile">Thêm ảnh</label>
                                    <input name="poster" type="file" accept=".png,.jpg" class="form-control-file" id="inpFile">
                                </div>
                            </div>
                            <div class="col-md-8">
								
                                <div class="form-group">
                                    <label for="inputEmail4">Youtube Id</label>
                                    <input name="videoId" value="${video.videoId}" type="text" class="form-control" id="inputEmail4" placeholder="" required>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword4">Tiêu Đề</label>
                                    <input name="title" value="${video.title}" type="text" class="form-control" id="inputPassword4" placeholder="" required>
                                </div>

                                <div class="form-group">
                                    <label for="inputAddress">Lượt Xem</label>
                                    <input name="views" value="${video.views}" type="number" class="form-control" id="inputAddress" placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="inputAddress">Lượt Xem</label>
                                    <input name="poster" value="${video.poster}" type="text" class="form-control" id="inputAddress" placeholder="">
                                </div>
                                
                                <div class="form-group">
                                    <label for="inpMoTa">Mô Tả</label>
                                    <textarea name="description" class="form-control" id="inpMoTa" rows="4">${video.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-switch">
                                        <input name="active" ${video.active ? 'checked' : ''} type="checkbox" class="custom-control-input" id="btnActive">
                                        <label class="custom-control-label" for="btnActive">Hoạt động</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button formaction="/luntpc04659_Assignment/admin/create-video" type="submit" class="btn btn-outline-success float-right">Thêm</button>
                        <button formaction="/luntpc04659_Assignment/admin/update-video" type="submit" class="btn btn-outline-warning float-right">Cập Nhật</button>
                        <button formaction="/luntpc04659_Assignment/admin/delete-video" type="submit" class="btn btn-outline-danger float-right">Xóa</button>
                    </form>
                </div>
                <!-- Danh sách -->
                <div class="tab-pane fade" id="listVideo" role="tabpanel" aria-labelledby="list-video-tab">
                    <div class="card">
                        <div class="card-header">
                            Danh Sách Video
                        </div>
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">Youtube Id</th>
                                        <th scope="col">Tiêu Đề</th>
                                        <th scope="col">Lượt xem</th>
                                        <th scope="col">Trạng Thái</th>
                                        <th scope="col">Chỉnh Sửa</th>
                                    </tr>
                                </thead>
                                <tbody>
								<c:forEach var="v" items="${videos}">
									<tr>
										<th scope="row">${v.videoId}</th>
										<td>${v.title}</td>
										<td>${v.views}</td>
										<td>${v.active ? 'Hoạt Động' : 'Ẩn'}</td>
										<td><a href="/luntpc04659_Assignment/admin/edit-video/${v.videoId}"><i
												class="fa fa-edit"></i></a></td>
									</tr>
								</c:forEach>

							</tbody>
                            </table>
                        </div>
                        <div class="card-footer text-muted">
                            <div class="row">
                                <div class="col-sm-5" align="left"><p>Tổng video: 5</p></div>
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