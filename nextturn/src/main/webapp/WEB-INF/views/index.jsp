<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="include/header.jsp"%>
	<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<title>header</title>
		<!-- 서치박스 스크립트 -->
		<script src="https://kit.fontawesome.com/1aa6bb9bc2.js" crossorigin="anonymous"></script>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	
	<!-- foreach 문으로 만든 태그에서 외부CSS를 인식하지 못하여 여기에 꺼내놨어요 -->
	<style type="text/css">

	/*시그니처 컬러 컨트롤용*/
	.sg_color{  
		background-color: #131313;
	}
	
	/*미니테이블 3개 연달아 놓기*/
	.mini_board_all{
		display: flex;}
	
	/* 메인 이미지박스 */
		.main_image{
			box-sizing: border-box;
			width: 100%;
			height: 480px;
			background-color: #d2d7df;
		
			background: url('${path}/resources/img/blackangel.png') no-repeat;
			background-size: cover;    /*창 가로에 맞게, (하단 이미지 짤릴 수 있음)*/
			/*background-size: contain;*/  /*창안에 전부보이게*/
			background-position: 0px 0px;  /*좌로부터_위로부터 */
		}

		/*■■■■■■■■■ 섹션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		.section_wrap {
			width: 1400px;
			margin: 30px auto;
			
		}


	/*최근 플레이 게임*/
		.Recently_played_games_box {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    background-color: #2b2b2b;
		    border: 10px solid black;
		    border-radius: 20px;
		}

	/*■■■■■■■■■ 푸터 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

		div.footer_content{
			/*공사 가이드라인*/
			/*border-left: 3px solid white; 
			border-right: 3px solid white;*/
			width: 1400px; /* 모니터 좌우 1400 안에서 웹을 보여주겠다*/

			margin: 0 auto;
			height: 65px;
			box-sizing: border-box;
			display: flex;
			justify-content: space-between; /*여백을 똑같이 맞추겠다*/
			align-items: center; /* 수평 가운데 정렬*/
			background-color: #000000; /*헤더 전체 색상*/
			color: #c3c3c3;
			text-align: center;
			}

		.footer_wrap {
			background-color: #000000;
			height: 75px;
		}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* 작은 이미지박스가 있는 li박스들 */
		.small_img{
			width: 250px;
		    height: 250px;

		    background-color: white;
		    border: solid black 1px;
			    border-radius: 10px;
		} 
		

/*============붙여넣기===============================*/

	.board_wrap {
		width: 500px;
		margin: 20px;
	}


/*■■■■■■ 상단부 (자유게시판 타이틀■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

	
	.header_text {/*자유게시판 글자*/
    font-size: 20px;
    color: white;
    
	}

/*■■■■ 호버버튼들 스타일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.hover_btn {
		background-color: #949494;  /*로그인 버튼 색상 (노 호버)*/
		color: #f1f1f1;
		outline: none; /* 파란색 테두리 사라짐 */
		border-radius: 5px;
	}
	.hover_btn:hover {
		background-color: #2B2B2B; /*호버시 회원가입 버튼 색상*/
		color: #f1f1f1;
		outline: none; /* 파란색 테두리 사라짐 */
	}

	
/*■■■■ 최신순 조회순 댓글순 추천순 div영역 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.board_title{
		/*시그니처 컬러 적용*/
		padding: 5px 15px;
		display: flex;
		justify-content: space-between;  /*양쪽 정렬*/
		align-items: center;	         /* 상하 가운데 정렬*/
		border-radius: 10px 10px 0 0;
		}
	.orderby_btn {
	    padding: 4px 10px;
   		font-size: 13px;
   		color: #f1f1f1;
	}
/*■■■■ 언더라인 애니메이션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.orderby_btn, .insert_btn{
		display: inline-block;

	}
	
	.ani_underline:after {   /*밑줄효과 after 니까 부모 뒤에 오니까 밑으로 내려가서 밑줄이 된다 //before 였으면 윗줄이 된다*/
			content: '';  /* 내용없는상태로 대기 */
			display: block;
			width: 0%; /*가로라인 0% 길이만큼 (호버했을때 길게 늘릴 예정)*/
			height: 1px;  /*두께*/
			background-color: #fff;  /*#fff 흰색*/
			transition: width 0.2s;  /*라인이 0.2초만에 그려짐*/
		    margin: 3px 0px 0px 0px;  /*라인의 위치 수정*/
	}
   
	.ani_underline:hover:after { /*쿨링크에 호버했을때 효과 width 100% 까지 라인 생성*/
			width:100%;
			
	}


/*■■■■ 게시글 등록 버튼 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.insert_btn{
	    padding: 4px 10px;
   		font-size: 12px;
   		color: #f1f1f1;
   		font-weight: lighter;
   		/*background-color: #2080b3;*/
		}



/*■■■■ 테이블 스타일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.board_table{
	    width: 100%;  /*테이블 가로길이*/
		border-spacing: 0px; /*테이블 테두리 제거*/
		padding: 0px 10px 10px 10px;
				
	}
	
	
	.board_table tr td{
		font-size: 12px;
		padding: 5px 0px;
		border-bottom: 1px solid #d0d0d0;
		text-align: center;
		background: #f7f7f7;
	}

	.board_table td:nth-child(2) {
		text-align: left;
		padding: 0 0 0 10px;
	}
	.board_table tr:nth-child(1) { /* 제목표시줄 */
		height: 35px;
		font-weight: bolder;
	}

	.new {
			padding: 0px 5px;
			color: orangered;
			font-weight: bold;
			animation-name: twinkle;  /*설정할 애니메이션 이름*/
			animation-iteration-count: infinite; /*애니메이션의 반복 횟수*/
			animation-duration: 1s; /*애니메이션의 실행시간*/
		}

		@keyframes twinkle {
			0% {opacity: 0;}
			100% {opacity: 1;}

			from {opacity: 0;}
			to {opacity: 1;}
		}


	.table_div{
    	border-radius: 0 0 10px 10px;
   	    background: #f7f7f7;
	}
		
/*■■■■ 폰트 애니메이션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/	
	.ani {
	  /*-webkit-animation-name: movingPara;
        -webkit-animation-duration: 1s; */
        animation-name: movingPara;
        animation-duration: 1s;
        }
     @keyframes movingPara {
        from {	transform: translateX(500px);
	        	color:#00000000;} 
	        
        to {	transform: translateX(0px);
        		color: black;}
    }		
		
		
		
		
		
		
		
</style>
</head>
<body>
<!-- 회원가입시 최초1회 모달창 띄우는 기능 -->
<%@ include file="include/modal.jsp"%>




<!--■■■■■■ 섹션(주내용) ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<section>
		<div class="section_wrap">
	
		<!-- 메인 이미지 박스 -->
			<div class="main_image">
			<span style="font-size: 50px;"></span>
			</div>
			
		<!-- 게시글 목록 띄우기 -->
	<!-- 날짜나오는 것의 포맷을 바꾼다 -->
	<!-- 자바유틸 데이터를 now 라고 이름짓고, 포맷을 바꾼다, 바꾼녀석의 이름은 today -->
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
								<!-- mm을 대문자로 써야한다 -->
		<div class="mini_board_all">						
			<!-- ============================================================================================== -->
			<div class="board_wrap">
				<div class="board_title sg_color">
						<div class="header_text">공지사항</div>
						<div><a href="${path}/board/write" class="insert_btn ani_underline">게시글등록</a></div>
				</div><!-- board_title -->
				<div class="table_div">
					<table class="board_table">
						<tr>
							<td></td>
							<td>제목</td>
						
							<td style="width: 10%">작성자</td>
							<td style="width: 8%">작성일</td>
						</tr>
								 		
						<!-- formatDate 포맷해서 regdate 를 만들었음 -->
						<!-- 위에 시계날짜랑 같으면, 시간으로 나오고, 다르면 날짜로 나온다 -->
						<!-- regdate 를 년월일 만 뜨도록 바꾸는거다 showDTO의 자료가 아니고 새로 만든자료임-->
						<c:forEach items="${map.list}" var="showDTO">
						<fmt:formatDate value="${showDTO.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
						
						<%-- <c:forEach items="${board_item}" var="showDTO"> 처음에 연습한 소스 --%>
								<tr>
									<td style="color:red;">♥</td>
									<td>
										<a href="${path}/board/view/${showDTO.bno}">
											<c:if test="${showDTO.re_level != 0}">
												<c:forEach begin="1" end="${showDTO.re_level}">
													<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
												</c:forEach>
												<span style="font-weight: bold; color:green;">└답변▶:&nbsp;</span> 
											</c:if>				
										<span>${showDTO.title}</span>
										<span style="color:red">[${showDTO.replycnt}]</span>
										</a>
										
										<%-- 오늘 올라온 게시글에 새 게시글 깜빡이기 --%>
										<c:if test="${today == regdate}">
											<span class="new_color new">New!</span>
										</c:if>
									</td>
									<td style="width: 10%">${showDTO.writer}</td>
								<%--<td>${regdate}</td>	 --%>
							 		<td style="width: 10%">
										<c:choose>
											<%-- 투데이와 레그데이트의 날짜가 같으면, 오늘 올라온 거니까 시간으로 표시하고, 날짜가 다르면, 날짜로 보여줘라 --%>
											<c:when test="${today == regdate}">
												<fmt:formatDate value="${showDTO.regdate}" pattern="HH:mm"/>
											</c:when>
											<c:otherwise>
												<fmt:formatDate value="${showDTO.regdate}" pattern="MM-dd"/>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
						</c:forEach>
								
					</table>
				</div>	
				
			</div> <!-- board_wrap 게시판 -->
			
			<!-- ============================================================================================== -->
			<div class="board_wrap">
				<div class="board_title sg_color">
						<div class="header_text">자유게시판</div>
						<div><a href="${path}/board/write" class="insert_btn ani_underline">게시글등록</a></div>
				</div><!-- board_title -->
				<div class="table_div">
					<table class="board_table">
						<tr>
							<td></td>
							<td>제목</td>
						
							<td style="width: 10%">작성자</td>
							<td style="width: 8%">작성일</td>
						</tr>
								 		
						<!-- formatDate 포맷해서 regdate 를 만들었음 -->
						<!-- 위에 시계날짜랑 같으면, 시간으로 나오고, 다르면 날짜로 나온다 -->
						<!-- regdate 를 년월일 만 뜨도록 바꾸는거다 showDTO의 자료가 아니고 새로 만든자료임-->
						<c:forEach items="${map.list}" var="showDTO">
						<fmt:formatDate value="${showDTO.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
						
						<%-- <c:forEach items="${board_item}" var="showDTO"> 처음에 연습한 소스 --%>
								<tr>
									<td style="color:red;">♥</td>
									<td>
										<a href="${path}/board/view/${showDTO.bno}">
											<c:if test="${showDTO.re_level != 0}">
												<c:forEach begin="1" end="${showDTO.re_level}">
													<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
												</c:forEach>
												<span style="font-weight: bold; color:green;">└답변▶:&nbsp;</span> 
											</c:if>				
										<span>${showDTO.title}</span>
										<span style="color:red">[${showDTO.replycnt}]</span>
										</a>
										
										<%-- 오늘 올라온 게시글에 새 게시글 깜빡이기 --%>
										<c:if test="${today == regdate}">
											<span class="new_color new">New!</span>
										</c:if>
									</td>
									<td style="width: 10%">${showDTO.writer}</td>
								<%--<td>${regdate}</td>	 --%>
							 		<td style="width: 10%">
										<c:choose>
											<%-- 투데이와 레그데이트의 날짜가 같으면, 오늘 올라온 거니까 시간으로 표시하고, 날짜가 다르면, 날짜로 보여줘라 --%>
											<c:when test="${today == regdate}">
												<fmt:formatDate value="${showDTO.regdate}" pattern="HH:mm"/>
											</c:when>
											<c:otherwise>
												<fmt:formatDate value="${showDTO.regdate}" pattern="MM-dd"/>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
						</c:forEach>
								
					</table>
				</div>	
				
			</div> <!-- board_wrap 게시판 -->
			
			<!-- ============================================================================================== -->
			<div class="board_wrap">
				<div class="board_title sg_color">
						<div class="header_text">후기게시판</div>
						<div><a href="${path}/board/write" class="insert_btn ani_underline">게시글등록</a></div>
				</div><!-- board_title -->
				<div class="table_div">
					<table class="board_table">
						<tr>
							<td></td>
							<td>제목</td>
						
							<td style="width: 10%">작성자</td>
							<td style="width: 8%">작성일</td>
						</tr>
								 		
						<!-- formatDate 포맷해서 regdate 를 만들었음 -->
						<!-- 위에 시계날짜랑 같으면, 시간으로 나오고, 다르면 날짜로 나온다 -->
						<!-- regdate 를 년월일 만 뜨도록 바꾸는거다 showDTO의 자료가 아니고 새로 만든자료임-->
						<c:forEach items="${map.list}" var="showDTO">
						<fmt:formatDate value="${showDTO.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
						
						<%-- <c:forEach items="${board_item}" var="showDTO"> 처음에 연습한 소스 --%>
								<tr>
									<td style="color:red;">♥</td>
									<td>
										<a href="${path}/board/view/${showDTO.bno}">
											<c:if test="${showDTO.re_level != 0}">
												<c:forEach begin="1" end="${showDTO.re_level}">
													<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
												</c:forEach>
												<span style="font-weight: bold; color:green;">└답변▶:&nbsp;</span> 
											</c:if>				
										<span>${showDTO.title}</span>
										<span style="color:red">[${showDTO.replycnt}]</span>
										</a>
										
										<%-- 오늘 올라온 게시글에 새 게시글 깜빡이기 --%>
										<c:if test="${today == regdate}">
											<span class="new_color new">New!</span>
										</c:if>
									</td>
									<td style="width: 10%">${showDTO.writer}</td>
								<%--<td>${regdate}</td>	 --%>
							 		<td style="width: 10%">
										<c:choose>
											<%-- 투데이와 레그데이트의 날짜가 같으면, 오늘 올라온 거니까 시간으로 표시하고, 날짜가 다르면, 날짜로 보여줘라 --%>
											<c:when test="${today == regdate}">
												<fmt:formatDate value="${showDTO.regdate}" pattern="HH:mm"/>
											</c:when>
											<c:otherwise>
												<fmt:formatDate value="${showDTO.regdate}" pattern="MM-dd"/>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
						</c:forEach>
								
					</table>
				</div>	
				
			</div> <!-- board_wrap 게시판 -->
			
		
		</div><!-- 게시판 모음 종료 -->
			
			
			
			
			
			
		<!-- 최근 플레이한 게임 -->
			<div>
				<div><h1>최근 플레이한 게임</h1></div>
				<ul class="Recently_played_games_box">
					
					<!-- JSTL 자바 코드를 쓴다 -->
					<c:forEach items="${NewPdt}" var="pdt">
						<li>
							<a class="product_list"> 
								<img class="small_img" src="${path}/resources/img/game/${pdt.p_img}">   <!-- pdt는 바로위에 var pdt를 말함 -->
							</a>
						</li>
					</c:forEach>
				
					<!-- <li style="background: url(${path}/resources/img/game/gm001.jpg);background-size: cover"></li> -->
					
				</ul>
			</div>
		</div> <!-- header_wrap -->
	
	</section>

<!--■■■■■■ 푸터(하단부)■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<footer>
		<div class="footer_wrap">
			<div class="footer_content">
				Copyright © Next Turn Corp. All rights reserved.
			</div>
		</div>
	</footer>
</body>

<!-- jQuery 문법
$('선택자').옵션();
$('#test').css('color','green');
$=jQuery  (Q는 꼭 대문자로 써야한다)
('#test') = 선택자(id가 test
.css() = 옵션(글자색을 녹색);

jQuery 이벤트문법(클릭, 포커스) -->


<!-- 제이쿼리 (열기/끄기) ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> <!-- 제이쿼리 동작하게 해주는 코드 -->
	<script type="text/javascript">
			

	</script>
</html>