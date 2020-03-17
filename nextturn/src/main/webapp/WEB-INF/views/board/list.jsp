<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>

	<title>board</title>
	<!-- 서치박스 스크립트 -->
	<script src="https://kit.fontawesome.com/1aa6bb9bc2.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">

<style type="text/css">
/*  	div, span, table, tr, td, a{
	border: 1px solid green
}  */

	.board_wrap {
		width: 900px;
		height: 800px;
		margin: 30px auto;
	}


/*■■■■■■ 상단부 (자유게시판 타이틀■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.board_head{
		display: flex;
		align-items: center;
		justify-content: space-between;
	    border-bottom: 3px solid black;
	}
	
	.board_head span {/*자유게시판 글자*/
    font-size: 35px;
    font-weight: bold;
    margin: 20px 25px;
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
	.orderby_row{
		background-color: #131313;
		padding: 15px 15px;
		display: flex;
		justify-content: space-between;  /*양쪽 정렬*/
		align-items: center;	         /* 상하 가운데 정렬*/
		border-bottom: 3px solid black;
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
			
			content: '';
			display: block;
			width: 0%; /*가로라인 0% 길이만큼 (호버했을때 길게 늘릴 예정)*/
			height: 1px;  /*두께*/
			background-color: #fff;
			transition: width 0.2s;  /*라인이 0.2초만에 그려짐*/
	}
	.ani_underline:hover:after { /*쿨링크에 호버했을때 효과 width 100% 까지 라인 생성*/
			width:100%;

	}


/*■■■■ 게시글 등록 버튼 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.insert_btn{
	    padding: 4px 10px;
   		font-size: 15px;
   		color: #f1f1f1;
   		font-weight: lighter;
   		/*background-color: #2080b3;*/
    	border-radius: 10px;
		}



/*■■■■ 테이블 스타일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.board_table{
	    width: 100%;  /*테이블 가로길이*/
		border-spacing: 0px; /*테이블 테두리 제거*/
				
	}
	
	
	.board_table tr td{
		font-size: 12px;
		padding: 15px 0px;

		border-bottom: 1px solid #d0d0d0;
		text-align: center;
	}

	.board_table td:nth-child(2) {
		text-align: left;
	}
	.board_table tr:nth-child(1) { /* 제목표시줄 */
		background-color: #f1f1f1;
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


/*■■■■ 페이지 영역 (버튼 < 1 2 3 4 >) ■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.page{
		text-align: center;
	    padding: 15px 5px;
	    margin: 15px 0px;
	    
	}
	.page_btn{
		border: 1px solid #939393;
		color: #f1f1f1;
		outline: none; /* 파란색 테두리 사라짐 */
		cursor: pointer;
	}

	.page > a { 	/* 페이지 넘버 */
		padding: 10px 15px;

	}

/*■■■■■■서치바,검색바■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		.list_content_search {
			border: 1px solid #dadada;
			/* border-radius: 10px 0px 0px 10px; */ /*둥근테두리*/
		}

		.list_content_search_input {
		    background-color: transparent;
		    border-color: transparent;
		    height: 44px;
		    font-size: 13px;
		    padding: 10px 10px;
		    outline: none;
			}
			
		.list_search_group {
			display: flex;  /*인라인이나 블록, 인라인블록 등을 보여주는것이 디스플레이 : flex는 정렬방법인데 */
			align-items: center;
			background-color: #f2f3f5;
			border-radius: 2px;
		    width: 225px;
    		height: 45px;
		}


		/*아이콘 스타일*/
		.list_content_search_btn {
		    
		    width: 44px;
		    height: 44px;
		    cursor: pointer;
		    /* color: black; */
		    /* border-top-right-radius: 2px; */
		    /* border-bottom-right-radius: 2px; */
		    outline: none;
		    border: none;
			}
		.list_content_search_btn:hover {
			background-color: #3c3c3c;
			color: #f1f1f1;
			outline: none;
		}
		


</style>




</head>
<body>

		<div class="board_wrap">
			<div class="board_head">
			<span>자유게시판</span>
				<!-- 검색창 -->
				<div>
					<div class="list_content_search">
						<form name="frm_search" action="" method="GET">
							<div class="list_search_group">
								<input type="text" placeholder="검색어를 입력하세요" name="keyword" class="list_content_search_input">
								<button type="button" class="list_content_search_btn">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		
			<div class="orderby_row">
				<div>
					<a href="#" class="orderby_btn ani_underline">최신순</a>
					<a href="#" class="orderby_btn ani_underline">조회순</a>
					<a href="#" class="orderby_btn ani_underline">댓글순</a>
					<a href="#" class="orderby_btn ani_underline">추천순</a>
				</div>
			<div>
				<li><a href="" class="insert_btn ani_underline" >게시글등록</a></li>
			</div>
		</div><!-- orderby_row -->

		<table class="board_table">
			<tr>
				<td style="width: 8%">번호</td>
				<td >제목</td>
				<td style="width: 4%">조회수</td>
				<td style="width: 10%">작성자</td>
				<td style="width: 6%">작성일자</td>
				<td style="width: 6%">첨부파일</td>
			</tr>

			<tr>
				<td>0000</td><!-- 번호  -->
				
				<td><a href="#">게시판 테스트<span class="new">New!</span></a></td><!-- 제목  -->
				
				<td>22</td><!-- 좋아요  -->
				<td>관리자</td><!-- 작성자  -->
				<td>2020.03.17</td><!-- 작성일자  -->
				<td>♥</td><!-- 작성일자  -->
			</tr>
		<!-- 접어두기-->
			<tr>
				<td>0000</td><!-- 번호  -->
				<td><a href="#">게시판 테스트<span class="new">New!</span></a></td><!-- 제목  -->
				<td>22</td><!-- 좋아요  -->
				<td>관리자</td><!-- 작성자  -->
				<td>2020.03.17</td><!-- 작성일자  -->
				<td>♥</td><!-- 작성일자  -->
			</tr>
			<tr>
				<td>0000</td><!-- 번호  -->
				<td><a href="#">게시판 테스트<span class="new">New!</span></a></td><!-- 제목  -->
				<td>22</td><!-- 좋아요  -->
				<td>관리자</td><!-- 작성자  -->
				<td>2020.03.17</td><!-- 작성일자  -->
				<td>♥</td><!-- 작성일자  -->
			</tr>
			<tr>
				<td>0000</td><!-- 번호  -->
				<td><a href="#">게시판 테스트<span class="new">New!</span></a></td><!-- 제목  -->
				<td>22</td><!-- 좋아요  -->
				<td>관리자</td><!-- 작성자  -->
				<td>2020.03.17</td><!-- 작성일자  -->
				<td>♥</td><!-- 작성일자  -->
			</tr>
			<tr>
				<td>0000</td><!-- 번호  -->
				<td><a href="#">게시판 테스트</a></td><!-- 제목  -->
				<td>22</td><!-- 좋아요  -->
				<td>관리자</td><!-- 작성자  -->
				<td>2020.03.17</td><!-- 작성일자  -->
				<td>♥</td><!-- 작성일자  -->
			</tr>
			<tr>
				<td>0000</td><!-- 번호  -->
				<td><a href="#">게시판 테스트</a></td><!-- 제목  -->
				<td>22</td><!-- 좋아요  -->
				<td>관리자</td><!-- 작성자  -->
				<td>2020.03.17</td><!-- 작성일자  -->
				<td>♥</td><!-- 작성일자  -->
			</tr>
			<tr>
				<td>0000</td><!-- 번호  -->
				<td><a href="#">게시판 테스트</a></td><!-- 제목  -->
				<td>22</td><!-- 좋아요  -->
				<td>관리자</td><!-- 작성자  -->
				<td>2020.03.17</td><!-- 작성일자  -->
				<td>♥</td><!-- 작성일자  -->
			</tr>
			<tr>
				<td>0000</td><!-- 번호  -->
				<td><a href="#">게시판 테스트</a></td><!-- 제목  -->
				<td>22</td><!-- 좋아요  -->
				<td>관리자</td><!-- 작성자  -->
				<td>2020.03.17</td><!-- 작성일자  -->
				<td>♥</td><!-- 작성일자  -->
			</tr>
		</table>


		
		<div class="page">
			<a herf="" class="page_btn hover_btn"><</a>	
				<a href="#">1</a>
				<a href="#">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
				<a href="#">5</a>
				<a href="#">6</a>
				<a href="#">7</a>
				<a href="#">8</a>
			<a herf="" class="page_btn hover_btn">></a>	
		</div>


	</div> <!-- board_wrap -->
</body>
</html>