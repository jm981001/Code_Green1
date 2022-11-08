<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
    <title>qna_modify</title>
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/slick/slick/slick.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/lightGallery-master/dist/css/lightgallery.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">


<body>
                                
<!-- ==========상품후기 작성=========================================================================================================     -->                                 

                                    <div class="row">
                                        <div class="col-xl-8 col-lg-7 col-md-12 col-sm-12 col-12 ">
                                            <form class="ps-form--review" action="QnaModifyPro.bo" method="post" name="modifyForm">
                                                <h4>PRODUCT REVIEW</h4>
                                                <p><sup>*</sup>상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
												<sup>*</sup>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 비건마켓 내 1:1 문의에 남겨주세요.</p>
                                                <div class="form-group form-group__rating">
                                                    <label>별점을 매겨주세요</label>
                                                    <select class="ps-rating" data-read-only="false">
                                                        <option value="0">0</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
<%--                                                 	<input type="text" id="qna_id" name="qna_id" value="${sessionScope.sId}" /> --%>
                                                	<input type="hidden" id="qna_idx" name="qna_idx" value="${qna.qna_idx}" />
                                                	<input type="hidden" id="item_idx" name="item_idx" value="${param.item_idx}" />
                                                    <input type="hidden" id="pageNum" name="pageNum" value="${param.pageNum }" />
                                                    <textarea class="form-control" id="qna_subject" name="qna_subject" rows="1" >${qna.qna_subject  }</textarea>
                                                    <textarea class="form-control" id="qna_content" name="qna_content" rows="6" >${qna.qna_content}</textarea>
                                                    
                                                </div>
                                                <div align="right">
	                                                <div class="form-group submit">
	                                                    <button class="ps-btn" type="submit">Submit Review</button>
	                                                </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                
 <!-- ==========상품후기 작성 끝=========================================================================================================     -->  
            
    
    

    <script src="/Code_Green/resources/plugins/jquery.min.js"></script>
    <script src="/Code_Green/resources/plugins/nouislider/nouislider.min.js"></script>
    <script src="/Code_Green/resources/plugins/popper.min.js"></script>
    <script src="/Code_Green/resources/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script src="/Code_Green/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/plugins/imagesloaded.pkgd.min.js"></script>
    <script src="/Code_Green/resources/plugins/masonry.pkgd.min.js"></script>
    <script src="/Code_Green/resources/plugins/isotope.pkgd.min.js"></script>
    <script src="/Code_Green/resources/plugins/jquery.matchHeight-min.js"></script>
    <script src="/Code_Green/resources/plugins/slick/slick/slick.min.js"></script>
    <script src="/Code_Green/resources/plugins/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
    <script src="/Code_Green/resources/plugins/slick-animation.min.js"></script>
    <script src="/Code_Green/resources/plugins/lightGallery-master/dist/js/lightgallery-all.min.js"></script>
    <script src="/Code_Green/resources/plugins/sticky-sidebar/dist/sticky-sidebar.min.js"></script>
    <script src="/Code_Green/resources/plugins/select2/dist/js/select2.full.min.js"></script>
    <script src="/Code_Green/resources/plugins/gmap3.min.js"></script>
    <!-- custom scripts-->
    <script src="/Code_Green/resources/js/main.js"></script>
</body>
</html>