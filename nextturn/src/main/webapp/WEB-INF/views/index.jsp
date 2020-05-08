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
		<script src="https://kit.fontawesome.com/825f57de13.js" crossorigin="anonymous"></script> <!-- 캐러셀 설치용 -->

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
		cursor: pointer; /*링크 걸꺼니까 손가락 모양으로*/
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
		
		
		
		
	/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■캐러셀 CSS 시작■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
/*GLOBALS*/
*{margin:0; padding:0; list-style:none;}
a{text-decoration:none; color:#666;}
a:hover{color:none;}
body, hmtl{background: #ecf0f1; font-family: 'Anton', sans-serif;}


#slider-wrap.active #next{right:0px;}
#slider-wrap.active #previous{left:0px;}

/*캐러셀 전환 ANIMATION*/
#slider-wrap ul, #pagination-wrap ul li{
    -webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -o-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -ms-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    transition: all 0.3s cubic-bezier(1,.01,.32,1);
}



#next{right:-50px; border-radius:7px 0px 0px 7px;}
#previous{left:-50px; border-radius:0px 7px 7px 7px;}

#wrapper{
    width:100%;
    margin: 0 auto;
    position:relative;
    color:#fff;
    text-shadow:rgba(0,0,0,0.1) 2px 2px 0px;    
}

/* 그림 움직이는창 크기  */
#slider-wrap{
    width:100%;
    height:450px;
    position:relative;
    overflow:hidden;
    align-items: center;
}

#slider-wrap ul#slider{
    width:100%;
    height:100%;
   
    position:absolute;
    top:0;
    left:0;    
}

#slider-wrap ul#slider li{
    float:left;
    position:relative;
    width:1400px;
    /* height:600px;   */
    height:100%;   
}

#slider-wrap ul#slider li > div{
    position:absolute;
    top:20px;
    left:35px;  
}

#slider-wrap ul#slider li > div h3{
    font-size:36px;
    text-transform:uppercase;  
}

#slider-wrap ul#slider li > div span{
    font-family: Neucha, Arial, sans serif;
    font-size:21px;
}

#slider-wrap ul#slider li img{
  display:block;
  height: 100%;
}


/*이미지 이전 앞으로 버튼 */
.btns{
	display: flex;
    align-items: center;
    justify-content: center;
        
    position:absolute;
    width:50px;
    height:60px;
    top:50%;
    margin-top:-25px;
    line-height:57px;
    cursor:pointer;
    background:rgba(0,0,0,0.1);
    z-index:100;
   
   
    -webkit-user-select: none;  
    -moz-user-select: none;
    -khtml-user-select: none;
    -ms-user-select: none;
   
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
    -o-transition: all 0.1s ease;
    -ms-transition: all 0.1s ease;
    transition: all 0.1s ease;
}

.btns:hover{
    background:rgba(0,0,0,0.3);
}

/*하단 점점점의 위치*/
#counter{
    top: 30px;
    right:35px;
    width:auto;
    position:absolute;
}


/*====================================================*/
.imgbox1 .imgbox2 .imgbox3 {
        width: 1200px;
        text-align: center;
        position: relative;
    }
.imgbox1::after {  /* 가상요소 after 배경화면 (배경만 투명도)*/
        width: 100%;
        height:100%;
        content: "";
        background: url(https://www.koreaboardgames.com/upload/uploaded/prd/268471587370580.jpg) no-repeat;
        background-size: 100%;
        background-position: 0px -260px;
     
        position: absolute;  /*relative 의 속성을 받아옴?*/
        top: 0;
        left:0;
        z-index: -1;  /* after 가상 요소를 뒤로 밀어준다 */
        opacity: 0.5;
    }

.imgbox2::after {  /* 가상요소 after 배경화면 (배경만 투명도)*/
        width: 100%;
        height:100%;
        content: "";
        background: url(https://www.koreaboardgames.com/upload/uploaded/prd/144771584322324.jpg) no-repeat;
        background-size: 100%;
        background-position: 0px -260px;
        
        position: absolute;  /*relative 의 속성을 받아옴?*/
        top: 0;
        left:0;
        z-index: -1;  /* after 가상 요소를 뒤로 밀어준다 */
        opacity: 0.5;
    }

.imgbox3::after {  /* 가상요소 after 배경화면 (배경만 투명도)*/
        width: 100%;
        height:100%;
        content: "";
        background: url(https://www.koreaboardgames.com/upload/uploaded/prd/923031577327499.jpg) no-repeat;
        background-size: 100%;
        background-position: 0px -260px;
        
        position: absolute;  /*relative 의 속성을 받아옴?*/
        top: 0;
        left:0;
        z-index: -1;  /* after 가상 요소를 뒤로 밀어준다 */
        opacity: 0.5;
    }

/*메인이미지 가운데로 오게*/
.center_img {
    /* background: url(https://www.koreaboardgames.com/upload/uploaded/prd/268471587370580.jpg); */
/*     background-position: center; */
    margin: 0px auto;
}

/*페이지 표시기 bar------------------------------------------------*/
#pagination-wrap{
    min-width:20px;
    /* margin-top:560px; */
    margin-left: auto;
    margin-right: auto;
    height:15px;
    position:relative;
    text-align:center;
}

#pagination-wrap ul {
    width:100%;
}

#pagination-wrap ul li{
    margin: 0 4px;
    display: inline-block;
    width:5px;
    height:5px;
    border-radius:50%;
    background:#fff;
    opacity:0.5;
    position:relative;
  top:0;
 }

#pagination-wrap ul li.active{
  width:12px;
  height:12px;
  top:3px;
    opacity:1;
    box-shadow:rgba(0,0,0,0.1) 1px 1px 0px;
}
/*■■■■■■■■■■■■■■■■■■■■■캐러셀 CSS 종료■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/ 

	
		
		
		
		
</style>
</head>
<body>
<!-- 회원가입시 최초1회 모달창 띄우는 기능 -->
<%@ include file="include/modal.jsp"%>




<!--■■■■■■ 섹션(주내용) ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<section>
		<div class="section_wrap">
	
		<!-- 메인 이미지 박스 -->
		<!-- 	<div class="main_image">
				<span style="font-size: 50px;"></span>
			</div> -->
				<div id="wrapper">
    				<div id="slider-wrap">
        				<a href="#">
            				<ul id="slider">
                				<li class="imgbox1">
                                    <img class="center_img" src="https://starlightgames.kr/data/file/main_banner/460655550_NXZlV3U6_460655550_p1riKAzT_2000778812_prEai9Jo_1891222122_KRArmpcG_EBA088EC9DB4EC96B4-9-EBB3B5EC82AC-2.jpg"></li>

                				<li class="imgbox2">
                                    <img class="center_img" src="https://starlightgames.kr/data/file/main_banner/460655550_dnrSCgOI_460655550_VKqsG43i_1970209990_dD07J15m_2000778812_OCoWeY7g_ECBD94EC9E84EBA994EC9DB8EC9B90EBB3B8.jpg"></li>

                				<li class="imgbox3">
                                    <img class="center_img" src="https://starlightgames.kr/data/file/main_banner/460655550_2SmNiOaQ_460655550_MO2p6frF_ED858CEC98A4ED8BB0EC9AB0-2.jpg"></li>
                                
                                <li class="imgbox4">
                                    <img class="center_img" src="https://starlightgames.kr/data/file/main_banner/460655550_LzWYcQrw_460655550_3CGZBmnk_1970209990_7L6BkFzI_2000778812_ZbVtA95m_ED8FACEBA5B4ED86A0EBA994EC9DB8EBB0B0EB8488.jpg"></li>
								
								<li class="imgbox5">
                                    <img class="center_img" src="https://starlightgames.kr/data/file/main_banner/460655550_mZJtyN5M_460655550_tuDXZRK9_1970209990_hOpDcrs9_0000000.jpg"></li>
                                
                                <li class="imgbox6">
                                    <img class="center_img" src="https://starlightgames.kr/data/file/main_banner/460655550_jAoR39tH_460655550_MO2p6frF_ED858CEC98A4ED8BB0EC9AB0.jpg"></li>    
                             
            				</ul>
        				</a>

        				<div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
        			    <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
        			    <div id="counter"></div>
        			         
        			    <div id="pagination-wrap">
            			    <ul>
            				</ul>
    				    </div>
    			     </div>
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
				<div class="board_title sg_color" id="noti_board_btn">
						<div class="header_text">공지사항</div>
						<div><a href="${path}/board/write" class="insert_btn ani_underline">게시글등록</a></div>
				</div><!-- board_title -->
				<div class="table_div">
					<table class="board_table">
						<tr>
							<td></td>
							<td>제목</td>
						
							<td style="width: 10%">작성자</td>
							<td style="width: 10%">작성일</td>
						</tr>
								 		
						<!-- formatDate 포맷해서 regdate 를 만들었음 -->
						<!-- 위에 시계날짜랑 같으면, 시간으로 나오고, 다르면 날짜로 나온다 -->
						<!-- regdate 를 년월일 만 뜨도록 바꾸는거다 showDTO의 자료가 아니고 새로 만든자료임-->
						<c:forEach items="${viewMap.listNoti}" var="showDTO">
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
									<td>${showDTO.writer}</td>
								<%--<td>${regdate}</td>	 --%>
							 		<td>
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
				<div class="board_title sg_color" id="free_board_btn">
						<div class="header_text">자유게시판</div>
						<div><a href="${path}/board/write" class="insert_btn ani_underline">게시글등록</a></div>
				</div><!-- board_title -->
				<div class="table_div">
					<table class="board_table">
						<tr>
							<td></td>
							<td>제목</td>
						
							<td style="width: 10%">작성자</td>
							<td style="width: 10%">작성일</td>
						</tr>
								 		
						<!-- formatDate 포맷해서 regdate 를 만들었음 -->
						<!-- 위에 시계날짜랑 같으면, 시간으로 나오고, 다르면 날짜로 나온다 -->
						<!-- regdate 를 년월일 만 뜨도록 바꾸는거다 showDTO의 자료가 아니고 새로 만든자료임-->
						<c:forEach items="${viewMap.listFree}" var="showDTO">
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
									<td>${showDTO.writer}</td>
								<%--<td>${regdate}</td>	 --%>
							 		<td>
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
				<div class="board_title sg_color" id="revi_board_btn">
						<div class="header_text">후기/리뷰</div>
						<div><a href="${path}/board/write" class="insert_btn ani_underline">게시글등록</a></div>
				</div><!-- board_title -->
				<div class="table_div">
					<table class="board_table">
						<tr>
							<td></td>
							<td>제목</td>
						
							<td style="width: 10%">작성자</td>
							<td style="width: 10%">작성일</td>
						</tr>
								 		
						<!-- formatDate 포맷해서 regdate 를 만들었음 -->
						<!-- 위에 시계날짜랑 같으면, 시간으로 나오고, 다르면 날짜로 나온다 -->
						<!-- regdate 를 년월일 만 뜨도록 바꾸는거다 showDTO의 자료가 아니고 새로 만든자료임-->
						<c:forEach items="${viewMap.listRevi}" var="showDTO">
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
									<td>${showDTO.writer}</td>
								<%--<td>${regdate}</td>	 --%>
							 		<td>
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
				<div><h1>최신 보드게임</h1></div>
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
	/* 게시판으로 이동 [a href 를 대신하는 ajax] */
	$(document).ready(function() {	
		$(document).on('click', '#noti_board_btn', function() {
				location.href = "${path}/board/list_notice"; //컨트롤러 호출
		});
		
		$(document).on('click', '#free_board_btn', function() {
			location.href = "${path}/board/list"; //컨트롤러 호출
		});
		
		$(document).on('click', '#revi_board_btn', function() {
			location.href = "${path}/board/list_review"; //컨트롤러 호출
		});
	});
	</script>
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■캐러셀 시작■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script type="text/javascript">

        $(document).ready(function() {

        $('.top_btn').click(function(){
        $('html, body').animate({scrollTop : 0}, 800);
        });

        });
        //current position
        var pos = 0;
        //number of slides
        var totalSlides = $('#slider-wrap ul li').length;
        //get the slide width
        var sliderWidth = $('#slider-wrap').width();


        $(document).ready(function(){
           
           
        /*****************
         BUILD THE SLIDER
        *****************/
            //set width to be 'x' times the number of slides
            $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
           
            //next slide    
            $('#next').click(function(){
                slideRight();
            });
           
            //previous slide
            $('#previous').click(function(){
                slideLeft();
            });
           
           

        /*************************
         //*> OPTIONAL SETTINGS
        ************************/
            //automatic slider
            var autoSlider = setInterval(slideRight, 3000); /*3000 이었음*/
           
            //for each slide
            $.each($('#slider-wrap ul li'), function() {

               //create a pagination
               var li = document.createElement('li');
               $('#pagination-wrap ul').append(li);    
            });
           
            //counter
            countSlides();
           
            //pagination
            pagination();
           
            //hide/show controls/btns when hover
            //pause automatic slide when hover
            $('#slider-wrap').hover(
              function(){ $(this).addClass('active'); clearInterval(autoSlider); },
              function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 30000000); }  /*3000 이었음*/
            );
           
           

        });//DOCUMENT READY
           


        /***********
         SLIDE LEFT
        ************/
        	function slideLeft(){
        	    pos--;
        	    if(pos==-1){ pos = totalSlides-1; }
        	    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
        	   
        	    //*> optional
        	    countSlides();
        	    pagination();
        	}


        /************
         SLIDE RIGHT
        *************/
        	function slideRight(){
        	    pos++;
        	    if(pos==totalSlides){ pos = 0; }
        	    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));
        	   
        	    //*> optional
        	    countSlides();
        	    pagination();
        	}



           
        /************************
         //*> OPTIONAL SETTINGS
        ************************/
        	function countSlides(){
        	    $('#counter').html(pos+1 + ' / ' + totalSlides);
        	}

        	function pagination(){
        	    $('#pagination-wrap ul li').removeClass('active');
        	    $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
        	}

/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■캐러셀 종료■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
</script>
	
</html>