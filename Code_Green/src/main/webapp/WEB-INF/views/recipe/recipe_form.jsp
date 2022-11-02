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
</head>
<body>
	<!-- 헤더 삽입 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더 삽입 -->

	<!-- ----------------------------------바디 시작------------------------------------  -->
	<form action="recipe_detail.jsp" method="post">
		<div id="write">
			<div>
				<h4>레시피 제목</h4>
				<input type="text" name="" id="" value="" placeholder="예) 소고기 미역국 끓이기" style="width: 400px">
			</div>
			<div>
				<h4>요리소개</h4>
				<textarea name="" id="" class="" placeholder="요리 소개글" style="height: 100px; width: 400px; resize: none;"></textarea>
			</div>
			<div>
				<h4>만들어봐요</h4>
				<textarea name="" id="" class="" placeholder="자유 양식으로 쓰세요" style="height: 100px; width: 400px; resize: none;"></textarea>
			</div>
			<div>
				<h4>팁</h4>
				<textarea name="" id="" class="" placeholder="팁 쓰세요" style="height: 100px; width: 400px; resize: none;"></textarea>
			</div>
			<div>
				<h4>재료</h4>
				<input type="text" name="" id="" value="" placeholder="" style="width: 400px">
			</div>
			<div>
				<h5>사진</h5>
				<input type="file" name="" id="" value="">
			</div>
			<div class="modal-footer">
				  <input type="submit" value="완료">
				  <input type="button" value="수정" onclick="">
				  <input type="button" value="취소" onclick="history.back()">
			</div>
		</div>			
	</form>

	<!-- ----------------------------------바디 끝--------------------------------------  -->


	<!-- 푸터 삽입 -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- 푸터 삽입 -->

</body>
</html>