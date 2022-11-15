<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>커뮤니티</title>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/slick/slick/slick.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/nouislider/nouislider.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/lightGallery-master/dist/css/lightgallery.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<script type="text/javascript">
	
	
	function checkReport(){
		if(${sessionScope.sId == null}){
			
			alert("로그인 후 사용가능합니다!");
			
		} else {
// 			$(".ps-btn-report").click(function(){
			$("#modal").fadeIn();
// 			});
			$("#modal_close_btn").click(function(){
				$("#modal").fadeOut();
			});
		} 
		
	}
		
	
	function checkS() {

		alert("신고가 완료되었습니다!\n관리자의 확인 후 처리됩니다. 감사합니다.");
		
	};
	
	function deleteCheck(){
		return confirm("삭제하시겠습니까?\n삭제 시 복구가 불가능합니다.");
	}
	
// 	추천기능
	$(function(){
			// 추천버튼 클릭시(추천 추가 또는 추천 제거)
			$("#bestcnt_update").click(function(){
				if(${sessionScope.sId == null}){
					
					alert("로그인 후 사용가능합니다!");
					
				} else {
					
					$.ajax({
						url: "BestCountUpdate.bo",
						type: "POST",
						data: {
							rf_board_idx: ${cBoard.board_idx},
							member_id: '${sessionScope.sId}'
						},
						success: function(){
							bestCount();
						},
					})
				}	
			})
			
			// 게시글 추천수
			function bestCount(){
				$.ajax({
					url: "BestCounting.bo",
					type: "POST",
					data:{
						rf_board_idx: ${cBoard.board_idx}
					},
					success: function(count){
						$(".bestcnt_count").html(count);
					},
				})
			};
		
		bestCount();	// 처음 시작했을때 실행되도록 해당 함수 호출
		
	});
	
	// 댓글목록 불러오기(로딩시 기본적으로 list 불러오기)
	$(document).ready(function(){
		getReplyList();			
	});

	// 댓글목록 출력
	function getReplyList(){
		
		$.ajax({
			url:"ReplyList.re",
			type:"POST",
			dataType:"json",
			data:{
				reply_bo_ref : ${cBoard.board_idx }		// 원본게시글번호 전달
			},
			success: function(result){
				var comments="";
				
				
				if(result.length < 1){
					comments = "등록된 댓글이 없습니다.";
				} else {
					
					$(result).each(function(){
						
						comments +=  '<h5>'+this.reply_id+'<small>' +this.reply_date+ '</small></h5>';
						comments +=  '<p>'+this.reply_content+'</p>';
						comments +=  '<a class="reply_write_btn" onclick="reReplyWrite()" >답글</a>';
                        <!-- 로그인한 사람과 댓글작성자가 같을 경우 삭제버튼 표시 -->
						if(('${sessionScope.sId}' == this.reply_id) || ('${sessionScope.sId}' == 'admin') ){
	                        comments +=  '<span id="reply_del_btn"><a class="ps-block__reply" href="replyDelete.re">  삭제</a></span>';
	                        }
						comments += '<div id="reReplyBox" style="display:none"><br>&nbsp;&nbsp;<input type="text" id ="rereBox"><input type="button" id="goReReply" value="작성"></div>';
                        comments += '<hr>';
					});
				};
				$("#replyList").html(comments);
				
			}
		});
	};	
	
	// 대댓글상자 숨김/표시 처리기능 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 질문하기!!!!!!이것때문에 고통받는중.. 아악!!!!!!!!
	function reReplyWrite(){
		 if ($('#reReplyBox').css('display') == 'none') {
	          $('#reReplyBox').css('display', 'block');
	     } else {
	            $('#reReplyBox').css('display', 'none');
	     }
	}
	
	
	// 댓글쓰기기능
	$(function(){		// 댓글쓰기 버튼 클릭시 수행
		$("#replyWrite").click(function(){
			if(${sessionScope.sId == null}){
				
				alert("로그인 후 사용가능합니다!");
				
			} else {
				
					if($("#reply_content").val() == '' || $("#reply_content").val() == null){
						
						alert("댓글 내용을 입력해주세요!");
						
					} else { 
					
					$.ajax({
						url:"ReplyWrite.re",
						type: "POST",
						dataType:"json",
						data:{
							reply_content : $("#reply_content").val(), 	// 댓글내용
							reply_id : '${sessionScope.sId}',				// 댓글작성자
							reply_bo_ref : ${cBoard.board_idx }		// 원본참조게시글번호	
						},
						success: function(result){
							getReplyList();					// 댓글목록불러오는 함수
							$("#reply_content").val('');	// 댓글칸 비우기
						}
						, error: function(error){
							console.log("에러 : " + error);
						}
					})
				 }
			  }
			})
	});
	
	// 오른쪽 사이드바에서 새글쓰기 버튼 클릭시
	function writeNew(){
		if(${sessionScope.sId != null || sessionScope.sId == 'admin'}){
			location.href="CommunityWrite.bo";	
		} else {
			alert("로그인 후 사용가능합니다!");
		}
 	};
	
</script>

<body>
    
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
    
   <!-- 블로그 바디 시작  -->
    <div class="ps-page--blog">
        <div class="container">
            <div class="ps-blog--sidebar">
                <div class="ps-blog__left">
                    <div class="ps-post--detail sidebar">
                    
                        <!-- 블로그 헤더 시작  -->
                        <div class="ps-post__header">
                        	<div class="colorheaderhead">
                            <h2>${cBoard.board_subject }</h2>
                            <p>
	                            [${cBoard.board_category }] 
	                    		<fmt:parseDate var="dateString" value="${cBoard.board_date}" pattern="yyyyMMdd" />
		                        / <fmt:formatDate value="${dateString }" pattern="yyyy.MM.dd" />
	                            / ${cBoard.board_id }
	                            / 조회수 ${cBoard.board_readcount }
	                            / 댓글(${cBoard.reply_cnt }) 
	                            / 추천수 <span class="bestcnt_count"></span>
                            </p>
                            </div>
                        </div>
                        <!-- 블로그 헤더 끝  -->
                        <!-- 블로그 본문 시작  -->
                        <div class="ps-post__content">
                        	<p>${cBoard.board_content }
                        </div>
                       	<!-- 태그를...쓸건가? -->
<!--                         <div class="ps-post__footer"> -->
<!--                             <p class="ps-post__tags">Tags:<a href="#">business</a><a href="#">technology</a></p> -->
<!--                         </div> -->



			   <!-- 신고하기 / 추천하기 버튼 시작 -->
				
				
				<div class="form-group-comm">
					<button class="ps-btn-report" onclick="checkReport()">신고</button>
						<div id="modal">
						   <div class="modal_content">
						   	  <button type="button" id="modal_close_btn">X</button><br>
						   	   <h3>신고하기</h3>
						   	  <form action="ReportBoard.re" method="post" onsubmit="checkS()">
						   	  	<input type="hidden" value="${cBoard.board_idx }" name="board_idx" id="board_idx">
						   	  	<input type="hidden" value="${param.pageNum }" name="pageNum" id="pageNum">
						   	  	<table>
						   	  		<tr>
						   	  			<td>게시판</td>
						   	  			<td><input type="text" value="커뮤니티" disabled="disabled" ></td>
						   	  		</tr>
						   	  		<tr>
						   	  			<td>신고글</td>
						   	  			<td><input type="text" value="${cBoard.board_subject }" name="report_subject" readonly="readonly"></td>
						   	  		</tr>
						   	  		<tr>
						   	  			<td>신고자</td>
						   	  			<td><input type="text" value="${sessionScope.sId }" name="reporter"  readonly="readonly"></td>
						   	  		</tr>
						   	  		<tr>
						   	  			<td>신고사유</td>
						   	  			<td><textarea name="report_content" id="report_content" cols="30" rows="3" placeholder="신고사유를 입력해주세요."></textarea></td>
						   	  		</tr>
						   	  		<tr>
						   	  			<td colspan="2"><input type="submit" value="신고서 제출"></td>
						   	  		</tr>
							   	  </table>
						   	  </form>
						   </div>	
						</div>
                    <button class="ps-btn-best" id="bestcnt_update">추천 <span class="bestcnt_count"></span></button>
                </div>
			   <!-- 신고하기 / 추천하기 버튼 끝 -->
			   <!-- ========================================= 댓글 영역 시작 ========================================= -->
			   
               <div class="ps-post-comments">
			   <!-- 댓글쓰기 영역 -->
	                    <h4>댓글 쓰기</h4>
	                    <div class="form-group">
	                        <textarea id="reply_content" class="form-control" rows="3" placeholder="댓글을 입력하세요" required="required"></textarea>
	                    </div>
	                    <div class="form-group submit">
	                        <button class="ps-btn" id="replyWrite"> 댓글쓰기</button>
	                    </div>
	            <!-- 댓글쓰기 영역 -->
                <h4> 댓글(${cBoard.reply_cnt }) </h4>
       
          
                
                <div class="ps-block--comment">
<!--                     <div class="ps-block__thumbnail"> -->
<!--                     	<img src="http://1.gravatar.com/avatar/af7935f33b10cec23f77b8d9717641df?s=70&amp;d=mm&amp;r=g"> -->
<!--                     </div> -->
	                    <div class="ps-block__content" id="replyList"></div>
                </div>
                
                
	         </div>
             <!-- ========================================= 댓글 영역 끝 ========================================= -->
                        
                        
                    </div>
                </div>
                
                <!-- 오른쪽 메뉴 시작  -->
                <div class="ps-blog__right">
                    <aside class="widget widget--blog widget--recent-post">
	                        <div class="widget__content">
		                        <a href="/Code_Green"><i class="fi fi-rr-home"></i> 메인 홈</a>
		                        <a href="CommunityList.bo"><i class="fi fi-rr-list"></i> 목록 보기</a>
		                        <a href="#" onclick="writeNew();"><i class="fi fi-rr-edit"></i> 새글 쓰기</a>
		                        <c:if test="${cBoard.board_id eq sessionScope.sId || cBoard.board_id eq 'admin'}">
			                        <a href="CommunityModify.bo?board_idx=${cBoard.board_idx }&pageNum=${param.pageNum }"><i class="fi fi-rr-scissors"></i> 글 수정</a>
			                        <a href="CommunityDelete.bo?board_idx=${cBoard.board_idx }&pageNum=${param.pageNum }" onclick="return deleteCheck();"><i class="fi fi-rr-cross-circle"></i> 글 삭제</a>
		                        </c:if>
	                        </div>
                    </aside>
                </div>
                <!-- 오른쪽 메뉴 끝  -->
                
            </div>
        </div>
        
    </div>
    
    <!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->
	<div id="back2top">
		<i class="icon icon-arrow-up"></i>
	</div>
	<!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->
    
    <!-- 푸터 삽입 -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- 푸터 삽입 -->
    
    ﻿
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
   ﻿
</body>

</html>