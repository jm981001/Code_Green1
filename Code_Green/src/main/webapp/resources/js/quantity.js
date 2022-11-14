// #quan 자리에 수량 표시하는 태그 id 적으면됨 
//<input type="text" id="quan" value="1" placeholder="1">


$(".up").on("click", function() {
	let quantity = $("#quan").val();
	$("#quan").val(++quantity); // .up 자리에 +버튼 클래스 이름 입력
});
$(".down").on("click", function() {
	let quantity = $("#quan").val();
	if (quantity > 1) { // .down 자리에 -버튼 클래스 이름 입력 (0밑으로 안내려감)
		$("#quan").val(--quantity);
	}
});



//<script src="/Code_Green/resources/js/quantity.js"></script>
//
//</body>위에 붙여넣기