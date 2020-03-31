<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>

	<title></title>
	<!-- 서치박스 스크립트 -->
	<script src="https://kit.fontawesome.com/1aa6bb9bc2.js" crossorigin="anonymous"></script>
	<style type="text/css">
	/* 댓글 출력부================================================== */
		.reple_view{
			background-color: white;
		    border-top: 2px solid #3498db;
		    margin: 20px 0px;
		    padding: 15px 10px;
		}
						
		.reple_user_info {
		    margin: 20px 10px;
		    border: 1px solid #3498db;
		    padding: 10px 10px;
		    border-radius: 5px;
		}
		
		.comment_line {
		    display: flex;
		    justify-content: space-between;
	        padding: 10px 0px 5px 0px;
			}
	
		.reply_textarea{
			width: 100%;
			height: 100%;
		    border: 0px;
	        resize: none;  /* textarea 사이즈 조정 막기 */
	        outline: none; /* textarea 사이즈 조정 막기 */
			}
			
		.re_reple_btn{
		    padding: 5px 10px;
		    border-radius: 5px;
		    color: white;
		    font-weight: bold;
		    }
		    
		.reply_login_div {
		    text-align: center;
		    font-size: 20px;
		}
		
		.reply_login_btn {
			color: #007791;
			font-weight: bold;
			cursor: pointer;
		}
		.align_between {
		    display: flex;
		    align-items: center;
		    justify-content: space-between;
		}
		
		

	</style>
</head>

<body>
	<!-- 현재시간 알려주는 코드 today -->
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
		

		
	<!-- 달린 리플 출력하는곳 -->
			<div class="reple_view">
					<div class="align_between">
						<div>
							<a href="#" class="down_menu_btn" style="background: #3498db">최신 댓글순</a>
							<a href="#" class="down_menu_btn" style="background: #3498db">댓글 등록순</a>
							<span>등록된 댓글수<span>${Reply_List.size()}</span> 개</span>  <!-- 모델리스트 이름을 직접 지정해야함 -->
							<input type="hidden" class="replyListCnt" value="${Reply_List.size()}"><!-- 모델리스트 이름을 직접 지정해야함 -->
						</div>
						<div>
							<button class="reply_refresh_btn">
								<i class="fas fa-sync-alt"></i>
								<span>새로운 댓글 확인하기</span>
							</button>
						</div>
					</div>
					
			<!-- 달린 댓글들 -->
				<c:forEach items="${Reply_List}" var="replyDto"> <%-- ReplyController 에서 모델이 전달해준값 --%>
					<div class="reple_user_info">
						<div class="under_line">
							<i class="fas fa-comment"></i>
							<a href="#"> ${replyDto.writer}</a><!-- 작성자 -->
							<a href="#"><i class="far fa-envelope"></i></a>
							<span>${replyDto.regdate}</span><!-- 날짜 -->
							
							<span>리플번호 ${replyDto.rno} </span>

						</div>
						
						<!-- 댓글 내용부 -->
						<div class="comment_line">
							<div>${replyDto.content}</div>
							<div style="display: block; align-self: flex-end;">
							<c:if test="${name == replyDto.writer}">
								&nbsp;
								<%-- <input type="text" class="del_rno" value="${replyDto.rno}"> --%>
								<button class="reply_del_btn" data_num="${replyDto.rno}">삭제 ${replyDto.rno}</button>
							</c:if>
								<a href="#" style="background: #3498DB" class="re_reple_btn">댓글달기</a>
							</div>
							
						</div>
					</div>
				</c:forEach> <!-- 댓글 종료 -->
				
				
				<!-- 리플 갯수가 0개이면 띄움 -->
				<c:if test="${Reply_List.size() == 0}">  <%-- size 를 쓸때는 모델에서 넘어온 이름을 그대로 써야됨 . --%> 
					<div class="reple_user_info">
						<div>
							<span>${regdate}</span><!-- 날짜 -->
							<div style="text-align: center; font-size: 15px;" >등록된 댓글이 없습니다.</div>
						</div>
					</div>
										
				</c:if>	
				
						
				<!-- 댓글입력 하는 곳 (로그인시에만 나와야함 -->
				<!-- 유저아이디가 비어있다면 (로그인이 안되있다면) -->
				<c:choose>
					<c:when test="${empty userid}">
						<div class="reply_login_div">
							<span class="reply_login_btn">로그인</span>을 하시면 댓글을 등록할 수 있습니다.
						</div>
					</c:when>
					
					<c:otherwise>
						<form class="frm_reply"><%-- ajax 로 리플 입력데이터를 전송하기 위한 form 태그 (name=""이 전달한다)--%>
						<input type="hidden" name="bno" class="reply_bno"> <%-- hidden은 태그만 안보이지 값이 있음 ,사용자 접속정보를 전달하기위해 작성 --%>
						<input type="hidden" name="type" class="reply_type"> <%--view.jsp 에서 ajax가 처리함--%>
						<input type="hidden" name="writer" class="reply_writer">
							<div>
								<a href="#" class="down_menu_btn" style="background: #8E44AD">댓글을 남겨주세요</a>
								<a href="#"><i class="fas fa-thumbs-up down_menu_btn" style="background: #8E44AD">좋아요</i></a>
								<a href="#"><i class="fas fa-thumbs-down down_menu_btn" style="background: #8E44AD">싫어요</i></a>
								
							</div>
						
							<div class="reple_wrap">
								<span class="textarea_bg">
									<textarea class="reply_textarea" placeholder="내용을 입력하세요." name="content"></textarea>
								</span>
								<a href="#"  class="reply_btn" >
									<i class="fas fa-comment"></i>댓글등록
								</a>
							</div>
							<div><span class="err_msg">댓글을 입력해주세요</span></div>
						</form>
					</c:otherwise>
					
				</c:choose>
				
			</div><!-- 달린 리플 출력하는곳 종료-->
			
	</body>
	
	
</html>