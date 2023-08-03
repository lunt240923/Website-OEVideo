<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-4">
	<div class="product-item">
		<a href="/luntpc04659_Assignment/user/description-video/${param.videoId}"><img
			src="/luntpc04659_Assignment/views/assets/images/${param.poster}.jpg"
			alt=""></a>
		<div class="down-content">
			<a href="/luntpc04659_Assignment/user/description-video">
				<h4>${param.title}</h4>
			</a>
			<!-- <p>Lorem ipsume dolor sit amet, adipisicing elite. Itaque,
				corporis nulla aspernatur.</p> -->
			<ul class="stars">
				<li><i class="">View</i></li>
				<li><i class="">${param.views}</i></li>
			</ul>
			<span>
				<ul class="stars">
					<li><i class="fa fa-heart"></i></li>
					<li><i class="fa fa-share" data-toggle="modal"
						data-target="#SendMail"></i></li>
				</ul>
			</span>
		</div>
	</div>
</div>