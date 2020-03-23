<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>

	<title>board</title>
	 <!-- 폰트어썸 아이콘 사용 스크립트 --> 
	<script src="https://kit.fontawesome.com/fc5ae9294d.js" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" type="text/css" href="../../css/common.css">

<style type="text/css">
/*  	div, span, table, tr, td, a{
	border: 1px solid green
}  */

	.view_wrap {
		width: 900px;
		height: 800px;
		margin: 30px auto;
	}


/*■■■■■■ 상단부 (자유게시판 타이틀■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.board_title{
		display: flex;
		align-items: center;
		justify-content: space-between;
		background-color: #151515;
		color: white;
		padding: 5px 15px;
		font-size: 15px;
	}
	
	.board_head span {/*자유게시판 글자*/
	    font-size: 35px;
	    font-weight: bold;
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


	/*제목부=================================================*/
		.view_title{
		    font-size: 26px;
		    font-weight: bold;
		}
		.community_icon{
		    display: flex;
		    justify-content: center;
		    align-items: flex-end;
		}
		.community_icon i{
			font-size: 20px;
		    padding: 10px 0px 0px 30px;
	        color: #565656;
		}
		
		.padding{ display: flex;}
		.padding > div {
		    padding: 5px 25px 0px 0px;
		}


	/* 내용부================================================ */
		.view_header{
		    width: 900px;
		    background: white;
		    display: flex;
			justify-content: space-between;
			padding: 10px;
			border-bottom: 2px solid #c7c7c7;
		}
		.view_content {
		    background-color: white;
		    margin: 7px 0px 0px 0px;
		    padding: 25px 25px;
		}
	

		.down_menu_btn{
			padding: 7px 20px;
		    border-radius: 10px;
		    color: white;
		    font-weight: bold;
		}
		.color_btn_orderby {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    margin: 50px 0px 15px 0px;
		}

	/* 댓글 입력부================================================== */
		.reple_wrap {
		    display: flex;
		    justify-content: center;
		}
		.reple_wrap i{
			font-size: 40px;
		}
		.textarea_bg{
		    border: 1px solid black;
		    width: 100%;
		    padding: 5px 5px;
		    border-radius: 10px;
		}
		.input_reple{
			width: 100%;
			height: 100%;
		    border: 0px;
	        resize: none;  /* textarea 사이즈 조정 막기 */
	        outline: none; /* textarea 사이즈 조정 막기 */
			}
		.input_reple_btn {
		    margin: 0 0 0 10px;
		    padding: 10px;
		    height: 90px;
		    width: 115px;
		    color: white;
		    text-align: center;
		    display: grid;
		    align-items: center;
		    background-color: #2b2b2b;
		    border-radius: 5px;
		}

	/* 댓글 출력부================================================== */
		.reple_view{
			background-color: white;
		    border-top: 2px solid #3498db;
		    margin: 20px 0px;
		    padding: 15px 10px;
		}
		.reple_user_info{
		    margin: 20px 10px 0px 10px;
		    border: 1px solid #3498db;
		    padding: 10px 10px;
		    border-radius: 5px;
		}
		.under_line{
			border-bottom: 1px solid #b5b5b5;
		    padding-bottom: 10px;
		    margin-bottom: 10px;
		}

		.re_reple_btn{
		    padding: 5px 10px;
		    border-radius: 5px;
		    color: white;
		    font-weight: bold;
		}
		.comment_line {
			display: flex;
			justify-content: space-between;}

</style>




</head>
<body>

		<div class="view_wrap">
			<!-- 상단부 -->
			<div class="view_head">
				<a href="${path}/board/list"><span class="board_title">자유게시판</span></a>
			</div>
		
			<div>
				<div class="view_header">
					
					<div>
						<span class="view_title">${bDto.title}</span> <!-- 게시글제목 -->
						<div class="padding">
							<div>${bDto.bno}</div><!-- 게시글번호 -->
							<div>${bDto.writer}</div><!-- 작성자 -->
							<div>${bDto.viewcnt}</div><!-- 조회수 -->
							<fmt:formatDate value="${bDto.updateDate}" pattern="yyyy-MM-dd" var="regdate"/>
							<div>${regdate}</div><!-- 시간 -->
							
						</div>
					</div>

					<div class="community_icon">
						<a href="#"><i class="fas fa-comments">${bDto.replycnt}</i></a><!-- 댓글수 -->
						<a href="#"><i class="fas fa-thumbs-up">0</i></a><!-- 좋아요 -->
						<a href="#"><i class="fas fa-thumbs-down">10</i></a><!-- 싫어요 -->
					</div>
						
				</div>
				
			</div>	

			<!-- 컨텐츠 -->
			<div class="view_content">
				<div>
					${bDto.content}
				</div>

			
				<div class="color_btn_orderby">
					
					<div>
						<a href="#" class="down_menu_btn" style="background: #8E44AD">댓글을 남겨주세요</a>
						<a href="#"><i class="fas fa-thumbs-up down_menu_btn" style="background: #8E44AD">좋아요</i></a>
						<a href="#"><i class="fas fa-thumbs-down down_menu_btn" style="background: #8E44AD">싫어요</i></a>
					</div>

					<div>
						<a href="${path}/board/list" class="down_menu_btn" style="background: #27AE60">목록</a>
						<a href="#" class="down_menu_btn" style="background: #3498DB">답변</a>
						<a href="#" class="down_menu_btn" style="background: #F39C12">수정</a>
						<a href="#" class="down_menu_btn" style="background: #C0392B">삭제</a>
					</div>
				</div>


				<!-- 댓글 -->
				<div class="reple_wrap">
					<span class="textarea_bg">
						<textarea class="input_reple">텍스트 입력창</textarea>
					</span>
					<a href="#"  class="input_reple_btn" >
						<i class="fas fa-comment"></i>댓글등록</a>
				</div>
			
			</div> <!-- 컨텐츠공간 닫기 -->
				


			<!-- 달린 리플 출력하는곳 -->
			<div class="reple_view">

					<div>
						<a href="#" class="down_menu_btn" style="background: #3498db">최신 댓글순</a>
						<a href="#" class="down_menu_btn" style="background: #3498db">댓글 등록순</a>
						<span>등록된 댓글수 00 개</span>
					</div>
				
				<!-- 달린 댓글들 -->
					<div class="reple_user_info">
						<div class="under_line">
							<i class="fas fa-comment"></i>
							<a href="#">이대군</a>
							<a href="#"><i class="far fa-envelope"></i></a>
							<span>(2020.03.23)</span>
						</div>
						
						<div class="comment_line">
							<div>
								하하하<br>
								안녕하세요. 반갑습니다.<br>
								열심히 활동하시고, 코로나 조심하세요<br>
							</div>
							<div style="display: block; align-self: flex-end;">
								<a href="#" class="re_reple_btn" style="background: #3498DB"
								>댓글달기</a>
							</div>
						</div>
					</div> <!-- 댓글 종료 -->

				<!-- 달린 댓글들 -->
					<div class="reple_user_info">
						<div class="under_line">
							<i class="fas fa-comment"></i>
							<a href="#">이대군</a>
							<a href="#"><i class="far fa-envelope"></i></a>
							<span>(2020.03.23)</span>
						</div>
						
						<div class="comment_line">
							<div>
								하하하<br>
								안녕하세요. 반갑습니다.<br>
								열심히 활동하시고, 코로나 조심하세요<br>
							</div>
							<div style="display: block; align-self: flex-end;">
								<a href="#" class="re_reple_btn" style="background: #3498DB"
								>댓글달기</a>
							</div>
						</div>
					</div> <!-- 댓글 종료 -->

									<!-- 달린 댓글들 -->
					<div class="reple_user_info">
						<div class="under_line">
							<i class="fas fa-comment"></i>
							<a href="#">이대군</a>
							<a href="#"><i class="far fa-envelope"></i></a>
							<span>(2020.03.23)</span>
						</div>
						
						<div class="comment_line">
							<div>
								하하하<br>
								안녕하세요. 반갑습니다.<br>
								열심히 활동하시고, 코로나 조심하세요<br>
							</div>
							<div style="display: block; align-self: flex-end;">
								<a href="#" class="re_reple_btn" style="background: #3498DB"
								>댓글달기</a>
							</div>
						</div>
					</div> <!-- 댓글 종료 -->	
				
			</div><!-- 달린 리플 출력하는곳 -->
			

		

	</div> <!-- view_wrap -->
</body>
</html>