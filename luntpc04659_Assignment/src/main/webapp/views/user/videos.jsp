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
			<div class="col-md-12">
				<div class="filters">
					<ul>
						<li class="active" data-filter="*">All Products</li>
						<li data-filter=".des">Featured</li>
						<li data-filter=".dev">Flash Deals</li>
						<li data-filter=".gra">Last Minute</li>
					</ul>
				</div>
			</div>
			<div class="col-md-12">
				<div class="filters-content">
					<div class="row grid">

						<c:forEach var="v" items="${allvideo}">
							<jsp:include page="/views/user/_videocard.jsp">
								<jsp:param value="${v.videoId}" name="videoId" />
								<jsp:param value="${v.title}" name="title" />
								<jsp:param value="${v.views}" name="views" />
								<jsp:param value="${v.poster}" name="poster" />
							</jsp:include>
						</c:forEach>

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