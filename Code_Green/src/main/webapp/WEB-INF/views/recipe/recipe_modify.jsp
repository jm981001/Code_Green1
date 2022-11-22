<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
 
 <!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=PT+Sans:400,700&display=swap" rel="stylesheet">

<!-- Css Styles -->
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
<link rel="stylesheet" href="/Code_Green/resources/plugins/nouislider/nouislider.min.css">
<link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
<link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
<link rel="stylesheet" href="/Code_Green/resources/css/recipe_style.css" type="text/css">
<script src="/Code_Green/resources/plugins_community/ckeditor5/build/ckeditor.js"></script>

<title>레시피 수정</title>
<style type="text/css">
.no-js .owl-carousel, .owl-carousel.owl-loaded {
		display: block;
}
*{
    box-sizing: border-box;
    outline: none; 
}
#write{
    width: 400px;
    margin: 50px auto;
    padding: 0 10px;
    margin-bottom: 10px;
}

a{
    text-decoration: none;
    color: #222;
}
button{
    background-color: #2db400;
    color: #fff;
}
h{
	margin-top: 5px;
}
</style>
</head>
<body>
	<!-- 헤더 삽입 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더 삽입 -->

	<!-- ----------------------------------바디 시작------------------------------------  -->
<!-- 블로그 바디 시작  -->
    <div class="ps-page--blog">
        <div class="container">
            <div class="ps-blog--sidebar">
                <div class="ps-blog__left">
                    <div class="ps-post--detail sidebar">
                    
                        <!-- 블로그 헤더 시작  -->
                        <div class="ps-post__header">
                       		<div class="colorheaderhead">
                            	<h2>레시피 수정</h2>
                            </div>
                        </div>
                        <!-- 블로그 헤더 끝  -->
                        
                        <!-- 블로그 본문 시작  -->
              		<div class="ps-post__content">
                   		<div class="ps-block--vendor-dashboard">
                    		<div class="ps-block__content">
	                        	<div class="table-responsive">
                    				<form action="recipe_modifyPro.bo?board_idx=${recipe.board_idx }" method="post" enctype="multipart/form-data">
		                           		<input type="hidden" name="file1" value="${recipe.file1}">  
	                    				<input type="hidden" name="file2" value="${recipe.file2}">  
	                           		 <table class="table ps-table ps-table--vendor">
	                                    <tr>
	                                        <td>작성자</td>
	                                        <td><input type="text" id="board_id" name="board_id" value="${sessionScope.sId }" readonly="readonly" style="width: 70%"></td>
	                                    </tr>
	                                    <tr>
	                                        <td>제목</td>
	                                        <td><input type="text" id="board_subject" name="board_subject" style="width: 70%" value="${recipe.board_subject }"></td>
	                                    </tr>
	                                    <tr>
	                                    	<td>내용</td>
	                                    	<td colspan="2">
	                                    		<textarea name="board_content" id="board_content" name="board_content" rows="15" cols="60" style="width: 70%" cols="60">${recipe.board_content }</textarea>
	                                    	</td>
	                                    </tr>
	                                   
	                                   <!-- 파일 업로드 부분 -->
	                                    <tr>
	                                    	<td>썸네일</td>
	                                    	<td colspan="2"><input type="file" id="파일선택1" name="file_1">기존파일 : ${recipe.file1 }</td>
	                                    </tr>
	                                    <tr>
	                                    	<td>본문 사진</td>
	                                    	<td colspan="2"><input type="file" id="파일선택2" name="file_2">기존파일 : ${recipe.file2 }</td>
	                                    </tr>
										<tr> 
											<td colspan="2">
												<input type="submit" value="글 수정" id="submitBtn">
											</td> 
										</tr>
	                            	</table>
                     			 </form> 
                     					
                       		   </div>
                        	</div>
                   		  </div>
                   		</div>
                    </div>
                </div>
              </div>
             </div>
            </div>
            
            
	<!-- ----------------------------------바디 끝--------------------------------------  -->


	<!-- 푸터 삽입 -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- 푸터 삽입 -->

</body>
</html>