<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>

	<title>board</title>
	<!-- 서치박스 스크립트 -->
	<script src="https://kit.fontawesome.com/1aa6bb9bc2.js" crossorigin="anonymous"></script>
</head>

<body>
	<!-- 달린 리플 출력하는곳 -->
			<div class="reple_view">
			<div class="reply_header">댓글 ${list.size()}</div>
					<div>
						<a href="#" class="down_menu_btn" style="background: #3498db">최신 댓글순</a>
						<a href="#" class="down_menu_btn" style="background: #3498db">댓글 등록순</a>
						<span>등록된 댓글수 00 개</span>
					</div>
				
			<c:forEach items="${list}" var="list">
				<!-- 달린 댓글들 -->
					<div class="reple_user_info">
						<div class="under_line">
							<i class="fas fa-comment"></i>
							<a href="#"> ${list.writer}</a><!-- 작성자 -->
							<a href="#"><i class="far fa-envelope"></i></a>
							<span>${list.regdate}</span><!-- 날짜 -->
						</div>
						<!-- 내용부 -->
						${list.content}
						<div class="comment_line">
							<div>
								
							</div>
							<div style="display: block; align-self: flex-end;">
								<a href="#" class="re_reple_btn" style="background: #3498DB"
								>댓글달기</a>
							</div>
						</div>
					</div> <!-- 댓글 종료 -->
				</c:forEach>
				
				
			</div><!-- 달린 리플 출력하는곳 종료-->
	</body>
</html>