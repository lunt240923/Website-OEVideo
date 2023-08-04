<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
  <!-- Page Content -->
  <!-- Banner Starts Here -->
  <div class="banner header-text">
    <div class="owl-banner owl-carousel">
      <div class="banner-item-01">
        <div class="text-content">
          <h4>Best Offer</h4>
          <h2>New Arrivals On Sale</h2>
        </div>
      </div>
      <div class="banner-item-02">
        <div class="text-content">
          <h4>Flash Deals</h4>
          <h2>Get your best products</h2>
        </div>
      </div>
      <div class="banner-item-03">
        <div class="text-content">
          <h4>Last Minute</h4>
          <h2>Grab last minute deals</h2>
        </div>
      </div>
    </div>
  </div>
  <!-- Banner Ends Here -->

  <div class="latest-products">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="section-heading">
            <h2>Video Nổi Bật</h2>
            <a href="/luntpc04659_Assignment/user/view-all">Xem tất cả <i class="fa fa-angle-right"></i></a>
          </div>
        </div>
			<c:forEach var="video" items="${videos}" begin="0" end="5">
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
