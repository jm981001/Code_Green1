<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// 전달받은 오류 메세지(msg) 출력 후 이전페이지로 돌아가기
	alert("${best_alert}");
	document.location.href = "ItemDetail.bo?item_idx=${item_idx}&pageNum=${pageNum}&manager_brandname=${manager_brandname}&item_category=${item_category}"; 
</script>
</head>
<body>

</body>
</html>