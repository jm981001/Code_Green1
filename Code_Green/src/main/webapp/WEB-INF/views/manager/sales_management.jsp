<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="apple-touch-icon.png" rel="apple-touch-icon">
    <link rel="icon" href="/Code_Green/resources/img/favicon.png">
    <link href="favicon.png" rel="icon">
    <title>매출관리 페이지</title>
  <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
</head>
<body>
     <header class="header--mobile">
        <div class="header__left">
            <button class="ps-drawer-toggle"><i class="icon icon-menu"></i></button><img src="" alt="">
        </div>
        <div class="header__center"><a class="ps-logo" href="#"><img src="img/logo.png" alt=""></a></div>
        <div class="header__right"><a class="header__site-link" href="#"><i class="icon-exit-right"></i></a></div>
    </header>
   
    <div class="ps-site-overlay"></div>
    <main class="ps-main">
    
     <jsp:include page="../inc/manager_menu.jsp"></jsp:include>
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>정산페이지</h3>
<!--                     <p>Martfury Categories</p> -->
                </div>
                <div class="header__center">
                    <form class="ps-form--search-bar" action="sales_management" method="get">
<!--                         <input class="form-control" type="text" placeholder="Search something" /> -->
<!--                         <button><i class="icon-magnifier"></i></button> -->
                    </form>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-dashboard ps-items-listing">
                <div class="ps-section__left">
                    <div class="table-responsive">
                    

                    
                    
                      <div class="ps-card"> 
                        <div class="ps-card__header">
                        <br>
                            <h4>매출 집계</h4>
                        </div>
                    
                    
                     <div class="ps-card__content">
                       <div class="table-responsive">
                        <table class="table ps-table">
                            <thead>
                                  <label for="date">날짜를 선택하세요:
							  		<input type="date"
							         id="date"
							         max="2077-06-20"
							         min="2077-06-05"
							         value="2077-06-15">
							</label>
                                <tr>
                                   
                                    <th>이번달매출</th><br>
                                    <th>이번주매출</th><br>
                                    <th>오늘매출</th><br>
                                    <th>수수료</th><br>
                                    <th>순수익</th><br>
                                    </table>
<!--                                     <th><input type="button"value="오늘매출"></th> -->
                                    
                                    <th></th>
                              
                                </tr>
                            </thead>
                            <tbody>
                            <br>
                            
  								<tr>
                                	<td>${Total.brandtotal }</td>
                                	<td>${ItemInfo.item_name }</td>
                                    <td>${ItemInfo.item_info }</td>
                                    <td>${ItemInfo.item_stock }</td>
                                    <td>${ItemInfo.item_price }</td>
                                    <td>${ItemInfo.item_category }</td>
                                    <td>${ItemInfo.item_packing }</td>
                                    <td>${ItemInfo.item_date}</td>
                                 </tr> 
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div>
                                        </div>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                

    <script src="/Code_Green/resources/plugins_manager/jquery.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/popper.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/jquery.matchHeight-min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/select2/dist/js/select2.full.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.min.js"></script>
    <script src="/Code_Green/resources/js/main_manager.js"></script>
</body>

</html>