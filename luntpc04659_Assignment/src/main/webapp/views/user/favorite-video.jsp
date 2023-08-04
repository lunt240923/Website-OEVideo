<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- Page Content -->
<div class="page-heading products-heading header-text">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="text-content">
					<h4>new arrivals</h4>
					<h2>sixteen products</h2>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="products">
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="margin-bottom: 12px;">
				<h2>
					VIDEO <em>YÊU THÍCH</em>
				</h2>
			</div>
			<div class="col-md-12">
				<div class="filters-content">
					<div class="row grid">
						<c:forEach var="video" items="${favorites}" begin="0" end="5">
							<jsp:include page="/views/user/_videocard.jsp">
								<jsp:param value="${video.videoId}" name="videoId" />
								<jsp:param value="${video.title}" name="title" />
								<jsp:param value="${video.views}" name="views" />
								<jsp:param value="${video.poster}" name="poster" />
							</jsp:include>
						</c:forEach>

					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="col-md-12">
		<ul class="pages">
			<li><a href="#">1</a></li>
			<li class="active"><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
		</ul>
	</div>
</div>
</div>
</div>