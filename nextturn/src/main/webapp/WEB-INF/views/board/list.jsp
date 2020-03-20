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
		margin: 0px auto;
	}


/*■■■■■■ 상단부 (자유게시판 타이틀■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.board_head{
		display: flex;
		align-items: flex-end;
		justify-content: space-between;
	}
	
	.board_head span {/*자유게시판 글자*/
    font-size: 35px;
    font-weight: bold;
    margin: 20px 0px 5px 0px;
    
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
		margin-top: 5px;
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
		.search_clear {
			background-color: #f76d6d;;
			color: white;
			padding: 3px 6px;
			border-radius: 10px;
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
		
/* 페이지네이션의 현재 페이지의 숫자 색상*/
		#check_color {
		    color: tomato;
		    font-weight: bold;
		    background-color: white;
		    border-radius: 50px;
		    border: 2px solid #dedede;
		}

</style>




</head>
<body>
	<!-- 날짜나오는 것의 포맷을 바꾼다 -->
	<!-- 자바유틸 데이터를 now 라고 이름짓고, 포맷을 바꾼다, 바꾼녀석의 이름은 today -->
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
								<!-- mm을 대문자로 써야한다 -->

		<div class="board_wrap">
			<div class="board_head">
			<span>자유게시판</span>
				<!-- 검색창 -->
				<div>
					<div class="list_content_search">
					<!-- 검색창을 쓸때, 엔터를 눌러서 검색어가 전달되게 하려면 from 태그를 써야한다. // 인풋의 name="keyword"로 -->
						<form name="frm_search" action="" method="GET">
							<div class="list_search_group">
								<input type="text" name="keyword" class="list_content_search_input" placeholder="검색어를 입력하세요" value="${map.keyword}">
								<button type="button" class="list_content_search_btn">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</form>
						
					</div>
				</div>
			</div>
			
			
			<!-- 키워드가 비어있지 않을때, 띄움 -->
			<c:if test="${not empty map.keyword}">
				<div><span span style="color:red">${map.keyword}</span>의 검색결과 중
				<span style="color:red">${map.count}</span>건 의 게시글이 검색되었습니다.
				<a href="${path}/board/list" class="search_clear">닫기</a>
				</div>
			</c:if>
			
			
			<div class="orderby_row">
				<div>
					<a href="${path}/board/list?sort_option=new&keyword=${map.keyword}" class="orderby_btn ani_underline" id="sort_new">최신순</a>
					<a href="${path}/board/list?sort_option=cnt&keyword=${map.keyword}" class="orderby_btn ani_underline" id="sort_cnt">조회순</a>
					<a href="${path}/board/list?sort_option=reply&keyword=${map.keyword}" class="orderby_btn ani_underline" id="sort_reply">댓글순</a>
					<a href="${path}/board/list?sort_option=good&keyword=${map.keyword}" class="orderby_btn ani_underline" id="sort_good">추천순</a>
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
				<td style="width: 8%">작성일자</td>
				<td style="width: 6%">첨부파일</td>
			</tr>
 		
		
			
			<!-- formatDate 포맷해서 regdate 를 만들었음 -->
			<!-- 위에 시계날짜랑 같으면, 시간으로 나오고, 다르면 날짜로 나온다 -->
			<!-- regdate 를 년월일 만 뜨도록 바꾸는거다 showDTO의 자료가 아니고 새로 만든자료임-->
			<c:forEach items="${map.list}" var="showDTO">
			<%-- <c:forEach items="${board_item}" var="showDTO"> 처음에 연습한 소스 --%>
			
				<fmt:formatDate value="${showDTO.updateDate}" pattern="yyyy-MM-dd" var="regdate"/>
					<tr>
						<td>${showDTO.bno}</td>
						
						<td>${showDTO.title}
							<a href="${path}/board/view?bno=${list.bno}">${list.title}</a>
							<%-- 오늘 올라온 게시글에 새 게시글 깜빡이기 --%>
							<c:if test="${today == regdate}">
								<span class="new_color new">New!</span>
							</c:if>
						</td>
						
						
						<td>${showDTO.viewcnt}</td>
						<td>${showDTO.writer}</td>
					<%--<td>${regdate}</td>	 --%>
				 	<td>
						<c:choose>
							<%-- 투데이와 레그데이트의 날짜가 같으면, 오늘 올라온 거니까 시간으로 표시하고, 날짜가 다르면, 날짜로 보여줘라 --%>
							<c:when test="${today == regdate}">
								<fmt:formatDate value="${showDTO.updateDate}" pattern="HH:mm:ss"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${showDTO.updateDate}" pattern="yyyy-MM-dd"/>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			
			
			
			<!-- HTML 예제용 -->
			<!--<tr>
				<td>0000</td>번호 
				<td><a href="#">HTML에서 직접 타이핑(예제용)<span class="new">New!</span></a></td>제목 
				<td>22</td>조회수 
				<td>관리자</td>작성자 
				<td>2020.03.18</td>작성일자
				<td>♥</td>첨부파일
			</tr> -->
			
		</table>


		<!-- 페이지 검색 영역 (페이지 네이션)  < 1 2 3 4 5 >-->
		<div class="page">
		<!-- 페이지네이션 :글이 많을 때 다음 글 또는 이전 글, 다음 글 목록 또는 이전 글 목록으로 이동하는 링크를 만듭니다. 이를 페이지네이션(Pagination)이라고 합니다 -->
			
			<!-- 이전페이지, 처음페이지로 이동 (블록이동  1~10번 페이지가 1블록이다) -->
				<c:if test="${map.pager.curBlock > 1}">
					<a href="${path}/board/list?curPage=${map.pager.blockBegin-10}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="page_btn hover_btn board_page board_prev page_left">◀</a>
					<a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&keyword=${map.keword}" class="board_page board_prev">1</a>
					<span>...</span>
				</c:if>


			<!-- 페이지내에서 번호를 눌러서 이동  -->
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="board_page" id="check_color">${num}</a>
						</c:when>
						<c:otherwise>
							<a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="board_page">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
			<!-- 다음페이지, 마지막 페이지로 이동 (블록이동  1~10번 페이지가 1블록이다) -->
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<span>...</span>
				<a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="board_page board_next">${map.pager.totPage}</a>
				<a href="${path}/board/list?curPage=${map.pager.blockEnd + 1}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="page_btn hover_btn board_page board_next page_right">▶</a>
			</c:if>
				

		</div>


	</div> <!-- board_wrap -->
</body>

<script type="text/javascript">
	$(function(){
		var sort_option = '${map.sort_option}';  /* 해쉬맵을 받아옴 */
		
		if(sort_option != null) {
			$('#sort_' + sort_option).css('color', '#f3ca00');
			$('#sort_' + sort_option).css('font-weight', 'bold');
			$('.ani_underline:after').css('background-color', 'yellow');
		}
	    		
		$('.write_btn').click(function(){
			location.href="/metop/board/write";
		});
	});
</script>
</html>