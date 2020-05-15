<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>게시글 작성</title>
	
	<!-- 첨부파일 할때 작성한 스크립트 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
	
	<!-- 서치박스 스크립트 -->
	<script src="https://kit.fontawesome.com/1aa6bb9bc2.js" crossorigin="anonymous"></script>
	<!-- <link rel="stylesheet" type="text/css" href="../../css/common.css"> -->

	<style type="text/css">
		
		.write_wrap{
			width: 900px;
			padding: 20px;
		    background: white;
		}

		.table_wrap{
		    width: 100%;
		}

	/*제목써진곳 데이터*/
		.table_wrap tr > td:nth-child(1){
			text-align: right;
			padding: 0px 10px;
			width: 110px;
		}
		
		/*테이블 간격*/
		.table_wrap tr > td{
		    padding-bottom: 10px;
		}


	/* 테이블 구조 */
		.table_wrap td > input {
			padding:10px 10px;
			width: 100%;
			outline: none;
			border: 1px solid #a9a9a9;
		}

		.align_top{  /*글자 상단 정렬*/
			vertical-align: top;
		    line-height: 40px;
		}



		.user_name{
			background-color: #d8d8d8;
			padding: 10px 10px;
			border: 1px solid #a9a9a9;
		    font-weight: bolder;
		    
		}
		.input_wrap{
			background-color: white;
			padding: 10px 10px;
			border: 1px solid #a9a9a9;
			width: 100%;
			-webkit-appearance: none;
    		/* background: #fff url(${path}/resources/img/sel_arr.gif) 98% 50% no-repeat; */
		}
	
		/* .input_content{  네이버 내용으로 대체됨
			height: 300px;
			width: 100%;
			vertical-align: top;
			outline: none;  
			border-spacing: 0;
		} */

		
/* ======버튼===================================== */
		.btn_style{
	        padding: 10px 40px;
		    border-radius: 5px;
		    color: white;
		    font-weight: bold;
		    border: 0; /*버튼의 속성을 죽이기 위해서 사용*/
	    }
	    .button_align{
	        padding: 20px 00px;
    		text-align: right;
	    }
	    
/* ===== 복사헤더 ===================================== */
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
		height: 60px;
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
		}
	.flag_text {
	    padding: 4px 10px;
   		font-size: 13px;
   		color: #f1f1f1;
	}
/*■■■■ 언더라인 애니메이션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.flag_text, .c_back_btn{
		display: inline-block;

	}
	

/*■■■■ 뒤로가기 버튼 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.c_back_btn{
	    padding: 4px 10px;
   		font-size: 15px;
   		font-weight: lighter;
    	border-radius: 10px;
    	border: 0;
    	background-color: white;
    	color: #424242;
		}
/*■■■■ 폰트 애니메이션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■	*/
	.board_wrap * {
	  /*-webkit-animation-name: movingPara;
        -webkit-animation-duration: 1s; */
        animation-name: movingPara;
        animation-duration: 1s;
        }
     @keyframes movingPara {
        from {	transform: translateX(2000px);
	        	color:#00000000;} 
	        
        to {transform: translateX(0px);}
    }
    
/*======== 에러메시지 ==============*/
		.err_msg_wrap {
			text-align: right;
		}
		.err_msg {
			color: #d95339;
			font-size: 14px;
			visibility: hidden;
		}

/* 라디오버튼 꾸미기 */
	input[type=radio] {display: none;} /* 원형 라디오 버튼 숨김 */
	
	input[type=radio] + label{
  	word-wrap: break-word;
    /* word-break: keep-all; */
    /* display: inline-block; */
    cursor: pointer;
    position: relative;
    padding: 0px 40px 0 20px;
    font-size: 14px;
    /* margin: 0px -10px; */
    /* color: #cc2929; */
    /* line-height: 21px; */
    letter-spacing: -0.5px;}
	
	/*선택되지 못한 체크박스 ㅁ*/
	input[type=radio]+ label:before {  
		content: ""; 
		display: inline-block; 
		width:14px;
		height:14px; 
		margin-right:10px;
		position: absolute;  left: 0;
		top:1px;
		background-color: #fff; 
		border-radius: 4px; 
		border:1px solid #ccc;
		}
	
	/* 선택된 체크박스  ㅁ */
	input[type=radio]:checked + label:before { 
	content: "\2713"; /*v 체크의 모양*/
	text-shadow: 1px 1px 1px rgba(0, 0, 0, .2); 
	font-size: 20px;  /*체크표시의 크기*/
	font-weight: 800; /*체크표시 굵기*/
 	color: red; /*체크표시 색깔*/
	background: #fff; /*체크박스 배경*/
	text-align: center; 
	line-height: 13px;
	} 
/* 첨부파일 =================================================================== */
	.form-group{
		align-items: flex-start;
	}
	
	.form-group > label {
		margin-top: 10px;
	}
	.form-group .board_div{
		border: 1.5px dashed #dadada;
		text-align: center;
		height: 150px;
		display: flex;
		align-items: center;
		justify-content: center;
		color: #515151;
		font-size: 15px;
	}

</style>


</head>
<body>

	<div class="board_wrap">
		<div class="board_head">
<%-- 	<c:choose>  JSTL 로 하면 이런 방법으로 함
			<c:when test="${empty bDto}">
				<span class="ani">게시글등록</span>
			</c:when>
			<c:otherwise>
				<span class="ani" style="color:orange">게시글수정</span>
			</c:otherwise>
		</c:choose> --%>
		<span id="bno_modify">게시글등록</span>
		
		
		</div>	
	
	<div class="orderby_row">
		<div>
			<a href="#" class="flag_text" >게시글을 작성 후 [등록하기] 버튼을 눌러주세요</a>
 		</div>
		
		<div>
			<button type=button class="c_back_btn" id="back_btn">뒤로가기</button>
		</div>
	</div><!-- orderby_row -->




		<div class="write_wrap">
			<form:form id ="frm_board">  <%-- 스프링폼태그는 POST가 기본이고, 사용하려면 페이지 첫부분에 뭔가 추가해줘야함 , 인풋 텍스트에리어, 체크박스--%>
				<table class="table_wrap"><%--name="" 에 들어가는건 DTO에도 있는 변수여야 한다--%>
					<tr>
						<td>작성자</td>
						<td><div class="user_name">${name}</div>
							<input type="hidden" value="${name}" name="writer">
						</td> <%-- 작성자도 스프링폼이 가져갈수 있는 태그로 바꿔야함 --%>
						
					</tr>
					
					<tr>
						<td>게시판 선택</td>
						<td>
							<div class="input_wrap"> <%-- 스프링 폼태그가 벨류값에 있는 글자를 가져감 --%>
								<input type="radio" id="ra_a" name="type" value="noti">	<label for="ra_a">오프라인모임</label>
								<input type="radio" id="ra_b" name="type" value="game">	<label for="ra_b">게임 룰영상</label>
								<input type="radio" id="ra_c" name="type" value="free" checked>	<label for="ra_c">자유게시판</label>
								<input type="radio" id="ra_d" name="type" value="revi">	<label for="ra_d">게임후기</label>
								<input type="radio" id="ra_e" name="type" value="trad"><label for="ra_e">중고장터</label>
							</div>
						</td>
					</tr>
					
						
					<tr>
						<td>제목</td>
						<td>
							<input type="text" placeholder="제목을 입력하세요" id="board_title" name="title" value="${bDto.title}">
						</td>
					</tr>
					
					<tr>
						<td>영상 코드</td>
						<td>
							<input type="text" placeholder="유튜브 영상에서 우클릭해서, [소스코드 복사]를 누른후 여기에 붙여넣기 하세요" id="video_code" name="video_code" value="${bDto.video_code}">
						</td>
					</tr>
					
					<tr>
						<td class="align_top">내용</td>
						<td>
							<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	 						<textarea id="board_content" name="view_content" style="width:100%; height:270px;">${bDto.view_content}</textarea>
						</td>
					</tr>
		
					<tr>
						<td class="align_top">첨부파일</td>
						<td>
						<!-- 게시글 첨부파일 선생님꺼 -->
						<div class="input_wrap form-group fileDrop">
							<div class="board_div ">
								<p><i class="fas fa-paperclip"></i>첨부파일을 드래그 해주세요</p>
							</div>
						<ul class="mailbox-attachments clearfix uploadedList" style="display: flex"><li></ul>
						</div>
						
						<div class="button_align">
							<span>
								<button type="button" class="btn_style" id="n_btn" style="background: #e44444;">취소</button>
								<%-- 기본타입이 서브밋이기 때문에 취소는 속성을 바꿔야한다. 안그러면 이것도 전송기능이 되버림 --%>
							</span>
							<span><button type="button" class="btn_style" id="y_btn" style="background: #15ad6e;">등록하기</button></span>
						</div>
						</td>
					</tr>
				</table>
				
			
			</form:form>
	
	
		</div>
	</div>
</body>
<!-- 이 스크립트에 {{}} 에 있는데, 여기에 값들이 다 채워지면서, 첨부파일이 올라간 애들이 나오게됨 -->
 <script id="fileTemplate" type="text/x-handlebars-template">
		<li>
			<div class="mailbox-attachment-icon has-img">
				<center><img src="{{imgSrc}}" alt="Attachment" class="s_img"></center>
			</div>
			<div class="mailbox-attachment-info">
				<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
					<i class="fa fa-paperclip"></i> {{originalFileName}}
				</a>
				<span class="btn btn-default btn-xs pull-right delBtn" data-src="{{basicFileName}}">
					<i class="fas fa-times"></i>
				</span>
			</div>
		</li>
	</script>
	<script src="${path}/resources/js/fileAttach.js"></script>
	<script type="text/javascript">
		var flag = '${flag}';
		console.log('■■■flag: ' + flag);
		
//==================================================================================================
		// Handlebars 파일템플릿 컴파일 (라이브러리, 파일 첨부할때 만듬)
		var fileTemplate = Handlebars.compile($("#fileTemplate").html());
//==================================================================================================
		// 수정시 로컬에서 삭제할 기존 첨부파일 목록
		var deleteFileList = new Array();
//==================================================================================================
		
		$(function(){
			// register.jsp ==> [게시글 등록]_[게시글 수정]_[게시글 답변]}
				if(flag == 'update') {
			//수정 눌렀을때 디자인 변경■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
				$('#bno_modify').text('게시글 수정')
								.css('color','#F39C12');
				$('.orderby_row').css('background-color','#F39C12')
				$('#y_btn').text('수정완료')
							.css('background','#F39C12')
				$('.flag_text').text('게시글 수정 후 [수정 완료] 버튼을 눌러주세요')
				     		
                //라디오 버튼 값 불러오기
              	$("input:radio[name='type']:radio[value='${bDto.type}']").prop('checked', true);
				//인풋의 라디오에서 [이름이 type 인것]
				
  				listAttach('${path}', '${bDto.bno}');  //첨부파일 출력해주는거
  				
			//답변 눌렀을때 디자인 변경■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
				} else if(flag == 'answer') {
				
				$('#bno_modify').text('게시글에 답변달기')  //상단 타이틀 변경
								.css('color','#3498db');
				$('.orderby_row').css('background-color','#3498db');  
				
				//  라디오버튼창       게시글 제목창  css 회색으로 변경
				$('.input_wrap, #board_title').css('background','#d8d8d8');
								
				$('#board_title').val('RE:'+'${bDto.title}')  //제목줄에 re: 라고 붙임
				                 .attr('readonly', 'readonly');
				$('.flag_text').text('답변 작성 후 [답변 작성완료] 버튼을 눌러주세요')
				
				     		
               //라디오 버튼 값 불러오기  //인풋의 라디오에서 [이름이 type 인것]
              	$("input:radio[name='type']:radio[value='${bDto.type}']").prop('checked', true);
              	$("[name='type']:not(:checked)").attr('disabled', 'disabled');  //체크된것 이외에 전부 디서블
              	
              //버튼을 답변 버튼으로 변경
              	$('#y_btn').text('답변 작성완료').css('background','#3498db');
			}
			
			// 1.웹브라우저에 drag&drop시 파일이 열리는 문제(기본 효과)
			//   : 기본효과 막음!

				$('.fileDrop').on('dragenter dragover', function(e){	//fileDrop 클래스에 드래그 했을때 동작
					e.preventDefault();  //드래그시 기본동작을 막음 (실행하지 못하게)
				});
			
				// 2. 사용자가 파일을 drop했을때
				$('.fileDrop').on('drop', function(e){
					e.preventDefault();	//드래그시 기본동작을 막음 (실행하지 못하게)
				
					var files = e.originalEvent.dataTransfer.files;	// 5개의 파일을 드래그 했다면, 배열로 5개 들어간다
					var file = files[0];	// 그중 0번지 배열만 뽑아온다 
					
					var formData = new FormData();	// 폼 객체 생성
						formData.append('file', file);	// 폼에 파일 1개 추가! key값 file 로 꺼낼 수 있음
					
					// 서버에 파일 업로드(화면단 전환이 없어야 해서 Ajax 사용)
					$.ajax({
						url:'${path}/upload/uploadAjax',   //첨부파일은 여기를 통해서 간다
						data: formData,  //위에 var formData를 받아서 전송 
						datatype: 'text',  //서버에서 받는거를 말한다. (이 줄은 지워도 상관없다)
						processData: false,  //이걸 false 를 하면, 쿼리스트링 방식을 안쓰고 데이터를 보낸다. (쿼리스트링 쓰지말라고 적음)
						contentType: false,  //화면단에서 서버로 보내는 역할을 한다. false 라고하면 서버에 보낼때 'multipart'라고 하는 타입으로 바뀐다. (이건 반드시 셋팅 필요)
											 //멀티파트란? 확장팩 개념 , 첨부파일을 받으려면, multi 파트로 바꿔줘야한다. (첨부파일을 스트링타입이 아니라, 멀티파트 타입으로 바꿈)
											 //servlet-context 에 멀티파트 리졸버가 빈즈로 등록되있음
						type: 'POST',  //get은 url 길이 제한이 있기때문에 post 로 보내야 대용량 전송가능(post 강제사항이다) (첨부파일을 get으로는 보낼 수 없음)
										//get은 헤더에 담에서 보내는데, 헤더는 길이 제한이 있어서 설정값만 보내는거고
										//post는 바디에 담아서 보내는데, 용량이 큰 파일들을 보낸다
						success: function(data){  //url 실행되고 리턴된 데이터는 여기로 받음 (위에 데이터 타입을 text 라고 적어놨는데 그걸 받음) 
							console.log(data); //콘솔에 /2020/04/09/s_alksjfiaef_그림.jpg 이런식으로 들어와야함 (썸네일 이미지)
							// data: 업로드한 파일 정보와 http 상태 코드
							printFiles(data, '${path}');	// 첨부파일 출력 메서드 호출
						}
					});
				});
				
				
				
				
				
				
			//첨부part3. 파일 첨부 후, 첨부파일에서 X 버튼을 눌렀을때
				$('.uploadedList').on('click', '.delBtn', function(event){
					var bno = '${bDto.bno}';
					var that = $(this);//삭제시 태그 삭제됨
					
					if(bno == '') {	// 게시글 등록
						$.ajax({
							url: '${path}/upload/deleteFile',
							type: 'POST',
							data: {fileName: $(this).attr('data-src')},
							success: function(data) { // success: data = 'deleted'
								if(data == 'deleted') {
									that.parents('li').remove();
								}
							}, error: function() {
								alert('System Error!!!');
							}
						});
					} else {		// 게시글 수정
						var arr_size = deleteFileList.length;
	                    deleteFileList[arr_size] = $(this).attr('data-src');
						
						//첨부파일을 디자인만 지워야됨 (수정완료 버튼을 누르기 전까지는)
						 $(this).parents('li').next('input').remove();
	                    $(this).parents('li').remove();
	                    for(var i=0; i<deleteFileList.length; i++) {
	                        console.log(i+', '+deleteFileList[i]);
	                    }
						
	                   
					}
				});
				
				
				
			});  //$(function(){ 종료
		
				
				

//==================================================================================================
	// 취소버튼, 뒤로가기 버튼 눌렀을때 (리퍼럴이 비정상경로일 경우 대처방법)
		$(document).on('click', '#n_btn, #back_btn', function(){  //btn 클릭시 동작
			var referer = '${header.referer}';
			//console.log('이전 URL: '+referer);
			
			var index = referer.indexOf('/board/');  //indexOf는 글자를 찾아주는거
			//alert(index);
			//console.log('index: '+referer.indexOf('/board/list'));
			
			if(index == '-1') {
				location.href = '${path}/board/list';  //인덱스가 -1이면 여기로 경로를 이동시킨다
				//alert(index);
			} else {
				location.href = '${header.referer}';  /* -1이 아니면, 바로이전의 리퍼럴로 이동시킴 */
				//alert(index);
			}
		});
			
//==================================================================================================	
	//register.jsp에서 [등록]버튼을 눌렀을때 유효성체크
		$(document).on('click', '#y_btn', function(){
			// 유효성체크(제목)
			var title = $('#board_title').val();
			if(title == '' || title.length == 0) {
				// 에러메세지 '제목을 입력해주세요.'
				alert('값 입력해라!!!');
				return false;
			} else {
				 // 에디터의 내용이 textarea에 적용된다.
				 oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []);
				var view_content = $('#board_content').val();
				
				//검색어 정규식 (게시글 검색시 태그는 검색할 수 없게함)
				var search_content = view_content.replace(/(<([^>]+)>)/ig, "").replace("&nbsp;", ""); //태그가 들어간값의 내용을 다 지워주세요 (태그를 제거하는 정규식)
				
				//append 는 폼태그가 끝나는 지점에 이것을 넣어준다.
				$('#frm_board').append('<textarea id="search_content" name="search_content"></textarea>');  //사용자가 입력한 폼값에, 택스트에리어를 붙인다.
				$('#search_content').val(search_content);
				
				
				//--------------첨부파일 part3---------------------
				if(flag == 'answer') {
					$('#board_title').val(title);
                    
                    
				}
				
				// 첨부파일 목록[배열]도 추가
				var str = '';
				// uploadedList 내부의 .file 태그 각각 반복
				$(".uploadedList .file").each(function(i){ // each = foreach  (.each 앞에 선택자 갯수만큼 반복하라는거)
					console.log(i);
					// hidden 태그 구성         //str 에는 첨부파일의 목록이 들어가있다
					str += "<input type='hidden' name='files["+i+"]' value='" + $(this).val()+"'>";  //첨부파일 하나당 이 태그가 추가됨(숨겨짐)
					
				}); 
				
				// 로컬드라이브에 저장되어있는 해당 게시글
				// 첨부파일 삭제
				/*if(deleteFileList.length > 0) {
					$.post('${path}/upload/deleteAllFile', {files:deleteFileList}, function(){});
				}*/
				
				// 삭제 첨부파일 목록에 있는 첨부파일들 Local에서 삭제
				if(deleteFileList.length > 0) {
					$.post('${path}/upload/deleteAllFile', {files:deleteFileList}, function(){});
				}
				
				
				// 폼에 hidden 태그들을 붙임 
				$("#frm_board").append(str); //frm_board 맨 마지막에 str(첨부파일 목록)을 붙여라
				
				// 서버로 전송
				$('#frm_board').submit();	//스프링 폼태그 전송 (PostMapping("/write") 로 이동)
			}
		});
//==================================================================================================	
		$(document).on('keyup', '#board_title', function(){
			var len = $(this).length;
			
			if(len != 0) {
				$('.err_msg').css('display', 'none');
			}

		});
		
		
		

	</script>
 
 
 
 <!-- 네이버 텍스트 에디터 -->
	 <script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "board_content",  /* 택스트에리어 태그만 가능 */
		 sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
		 fCreator: "createSEditor2"
		});
	</script>
 
</html>