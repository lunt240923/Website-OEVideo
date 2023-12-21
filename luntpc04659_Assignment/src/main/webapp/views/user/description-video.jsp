<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- Page Content -->
<!-- Banner Starts Here -->
<div class="banner header-text">
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<div class="card">
					<div class="embed-responsive embed-responsive-16by9">
						<iframe class="embed-responsive-item"
							src="https://www.youtube.com/embed/${video.videoId}" allowfullscreen></iframe>
					</div>
					<div class="card-body">
						<div class="row">
							<h5 class="card-title col-md-9" style="text-align: left;">${video.title}</h5>
							<ul class="stars col-md-3 row">
								<li class="col"><a href="/luntpc04659_Assignment/user/like-video/${video.videoId}"><i class="fa fa-heart"></i></a></li>
								<li class="col"><a href="#" data-toggle="modal"
									data-target="#SendMail"><i class="fa fa-share"></i></a></li>
							</ul>
						</div>

						<p style="text-align: left; font-weight: 500;" class="card-text">Mô
							Tả</p>
						<p style="text-align: left;" class="card-text">${video.description}</p>

					</div>
				</div>
			</div>
			<!-- Start aside video -->
			<div class="col-md-3 sub-video">
			<c:forEach var="v" items="${videos}">
			<div class="card mb-3">
					<div class="row no-gutters">
						<div class="col-md-6">
							<a href="/luntpc04659_Assignment/user/description-video/${v.videoId}"><img
								src="/luntpc04659_Assignment/views/assets/images/${v.poster}.jpg"
								class="card-img" alt="/luntpc04659_Assignment/views."></a>
						</div>
						<div class="col-md-6">
							<div class="card-body">
								<a href="#">
									<h5 class="card-title">${v.title}</h5>
								</a>
								<p class="card-text">
									<small class="text-muted">View ${v.views}</small>
								</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
				
				
				
			</div>
			<!-- End aside video -->
		</div>
	</div>
</div>
<!-- Banner Ends Here -->