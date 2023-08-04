<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

    <title>OE Administration</title>

    <!-- Bootstrap core CSS -->
    <link href="/luntpc04659_Assignment/views/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Switch checkbox -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
<!-- Icon Bootstrap 5 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
    <!-- My CSS -->
	<style type="text/css">
<%@ include file="/views/assets/css/style.css"%>
</style>
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/luntpc04659_Assignment/views/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/luntpc04659_Assignment/views/assets/css/templatemo-sixteen.css">
    <link rel="stylesheet" href="/luntpc04659_Assignment/views/assets/css/owl.css">

</head>

<body>

    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <!-- ***** Preloader End ***** -->

    <!-- Header -->
    <header class="">
        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand" href="/luntpc04659_Assignment/admin/ad-home">
                    <h2>Online<em> Entertainment</em></h2>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="/luntpc04659_Assignment/admin/ad-home">Trang Chủ
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/luntpc04659_Assignment/admin/ad-video">Video</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/luntpc04659_Assignment/admin/ad-user">Người Dùng</a>
                        </li>
                        <li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> Tài Khoản </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								
								<a class="dropdown-item"
									href="/luntpc04659_Assignment/user/home">Trở về</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item"
									href="/luntpc04659_Assignment/user/change-password">Đổi Mật
									Khẩu</a> <a class="dropdown-item"
									href="/luntpc04659_Assignment/user/forgot-password">Quên
									Mật Khẩu</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item"
									href="/luntpc04659_Assignment/user/edit-profile">Cập Nhật
									Thông Tin</a>
								
								<div class="dropdown-divider"></div>
								<c:if test="${sessionScope.user != ''}">
									<a class="dropdown-item" href="/luntpc04659_Assignment/logout">Đăng
										Xuất</a>
								</c:if>
							</div></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <!-- Page Content -->
    
    <jsp:include page="${view}"></jsp:include>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="inner-content">
                        <p>Copyright &copy; 2023 Online Entertainment Co., Ltd.

                            - Design: <a rel="nofollow noopener" href="" target="_blank">Lukky Nguyen</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>



    <!-- Bootstrap core JavaScript -->
    <script src="/luntpc04659_Assignment/views/vendor/jquery/jquery.min.js"></script>
    <script src="/luntpc04659_Assignment/views/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Additional Scripts -->
    <script src="/luntpc04659_Assignment/views/assets/js/custom.js"></script>
    <script src="/luntpc04659_Assignment/views/assets/js/owl.js"></script>
    <script src="/luntpc04659_Assignment/views/assets/js/slick.js"></script>
    <script src="/luntpc04659_Assignment/views/assets/js/isotope.js"></script>
    <script src="/luntpc04659_Assignment/views/assets/js/accordions.js"></script>


    <script language="text/Javascript">
        cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
        function clearField(t) {                   //declaring the array outside of the
            if (!cleared[t.id]) {                      // function makes it static and global
                cleared[t.id] = 1;  // you could use true and false, but that's more typing
                t.value = '';         // with more chance of typos
                t.style.color = '#fff';
            }
        }
    </script>


</body>

</html>