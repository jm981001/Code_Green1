<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
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

<title>레시피 작성</title>
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

<script type="text/javascript" src="/Code_Green/resources/js/jquery-3.6.1.js"> </script>
<script type="text/javascript">


	function myItem(value) {
		
		let subForm = document.getElementById('sub_form');
		
		let input = document.createElement('input');
		
		input.type   = 'hidden';
		
		input.name  = 'item_idx';
		
		input.value  = value;
		
		subForm.appendChild(input);
		
// 		subForm.submit(); //form Submit

	}

	


// 	function myItem(value) {
// 		let item_idx = parseInt(value, 10);
		
// 		$.ajax({
// 			url: "recipe_writePro.bo",
// 			type: "POST",
// 			data: {
// 				item_idx : item_idx				
// 			},
// 			success: function(){
// 				alert("레시피 등록이 완료되었습니다.");
// 				location.href = "recipe_main.bo";
// 			},
// 			fail: function () {
// 				alert("레시피 등록이 실패되었습니다. 다시 시도해 주세요.");
// 			}
// 		});
// 	}

</script>
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
                            	<h2>레시피</h2>
                            </div>
                        </div>
                        <!-- 블로그 헤더 끝  -->
                        
                        <!-- 블로그 본문 시작  -->
              		<div class="ps-post__content">
                   		<div class="ps-block--vendor-dashboard">
                    		<div class="ps-block__content">
	                        	<div class="table-responsive">
                    				<form action="recipe_writePro.bo" method="post" enctype="multipart/form-data" id="sub_form">
	                           		 <table class="table ps-table ps-table--vendor">
	                                    <tr>
	                                        <td>작성자</td>
	                                        <td><input type="text" id="board_id" name="board_id" value="${sessionScope.sId }" readonly="readonly" style="width: 70%"></td>
	                                    </tr>
	                                    <tr>
	                                        <td>제목</td>
	                                        <td><input type="text" id="board_subject" name="board_subject" style="width: 70%" required="required"></td>
	                                    </tr>
	                                    <tr>
	                                    	<td>내용</td>
	                                    	<td colspan="2">
	                                    		<textarea name="board_content" id="board_content" name="board_content" rows="15" cols="60" style="width: 70%" cols="60" required="required" placeholder=
"* 썸네일, 본문에 업로드할 사진 한장씩 올려주세요.
* 내용엔 간단한 설명글을 올려주세요."></textarea>
	                                    		
	                                    	</td>
	                                    </tr>
	                                   <tr>
	                                   		<td>사용한 상품</td>
	                                   		<td>
		                                   		<select class="form-select" aria-label="Default select example" onchange="myItem(this.value)" style="float: none;">
												  	<option value="">선택하세요</option>
	                                   				<c:forEach  var="myItem" items="${myItem }">
												  		<option value="${myItem.item_idx }">${myItem.item_idx } ${myItem.item_name }</option>
			                                   		</c:forEach>
												</select>
	                                   		</td>
	                                   </tr>
	                                   <!-- 파일 업로드 부분 -->
	                                    <tr>
	                                    	<td>썸네일</td>
	                                    	<td colspan="2"><input type="file" id="파일선택1" name="file_1" required="required"></td>
	                                    </tr>
	                                    <tr>
	                                    	<td>본문 사진</td>
	                                    	<td colspan="2"><input type="file" id="파일선택2" name="file_2" required="required"></td>
	                                    </tr>
										<tr> 
											<td colspan="2">
												<input type="submit" value="글 등록" id="submitBtn">
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