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
		.write_btn{
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
	        
        to {	transform: translateX(0px);
        		}
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
		<span class="ani" id="bno_modify">게시글등록</span>
		
		
		</div>	
	
	<div class="orderby_row">
		<div>
		<a href="#" class="orderby_btn ani_underline ani" id="sort_new">게시글을 작성 해주세요</a>
 		</div>
		
		<div>
			<a href="${path}/board/list" class="insert_btn ani_underline">뒤로가기</a>
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
								<input type="radio" id="ra_a" name="type" value="free" checked>	<label for="ra_a">자유게시판</label>
								<input type="radio" id="ra_b" name="type" value="qna">	<label for="ra_b" >문의하기</label>
								<input type="radio" id="ra_c" name="type" value="trad">	<label for="ra_c">중고거래</label>
								<input type="radio" id="ra_d" name="type" value="revi">	<label for="ra_d">게임후기</label>
							</div>
						</td>
					</tr>
					
						
					<tr>
						<td>제목</td>
						<td><input type="text" placeholder="제목을 입력하세요" id="board_title" name="title" value="${bDto.title}"> </td>
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
								<button type="button" class="write_btn" id="n_btn" style="background: #e44444;">취소</button>
								<%-- 기본타입이 서브밋이기 때문에 취소는 속성을 바꿔야한다. 안그러면 이것도 전송기능이 되버림 --%>
							</span>
							<span><button type="button" class="write_btn" id="y_btn" style="background: #15ad6e;">등록</button></span>
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
	<script type="text/javascript">
		var flag = '${flag}';
		console.log('flag: ' + flag);
		
		//--------------------------------------------------------------------------
		// Handlebars 파일템플릿 컴파일 (라이브러리, 파일 첨부할때 만듬)
		var fileTemplate = Handlebars.compile($("#fileTemplate").html());
		//--------------------------------------------------------------------------
		
		$(function(){
			// register ==> 게시글 등록과 게시글 수정
				if(flag == 'update') {
			//수정 눌렀을때 디자인 변경■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
				$('#bno_modify').text('게시글 수정')
								.css('color','#F39C12');
				$('.orderby_row').css('background-color','#F39C12')
				$('#y_btn').text('수정')
							.css('background','#F39C12')
				     		
                //라디오 버튼 값 불러오기
              	$("input:radio[name='type']:radio[value='${bDto.type}']").prop('checked', true);
				//인풋의 라디오에서 [이름이 type 인것]
  			
			//답글 눌렀을때 디자인 변경■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
				} else if(flag == 'answer') {
				
				$('#bno_modify').text('게시글에 답변달기')  //상단 타이틀 변경
								.css('color','#3498db');
				$('.orderby_row').css('background-color','#3498db');  
				
				//  라디오버튼창       게시글 제목창  css 회색으로 변경
				$('.input_wrap, #board_title').css('background','#d8d8d8');
								
				$('#board_title').val('└RE:'+'${bDto.title}')  //제목줄에 re: 라고 붙임
								.attr('readonly', 'readonly');
				     		
               //라디오 버튼 값 불러오기  //인풋의 라디오에서 [이름이 type 인것]
              	$("input:radio[name='type']:radio[value='${bDto.type}']").prop('checked', true);
              	$("[name='type']:not(:checked)").attr('disabled', 'disabled');  //체크된것 이외에 전부 디서블
              	
              //버튼을 답글 버튼으로 변경
              	$('#y_btn').text('답글').css('background','#3498db');
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
							printFiles(data);	// 첨부파일 출력 메서드 호출
						}
					});
				});
				
			//첨부part3. 파일 첨부 후, 첨부파일에서 X 버튼을 눌렀을때
				$('.uploadedList').on('click', '.delBtn', function(event){
					var bno = '${one.bno}';
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
						
					}
				});
				
				
				
			});  //$(function(){ 종료
		
				
				
				
			// 파일 정보 처리
			function getFileInfo(fullName) {
				var originalFileName;	// 화면에 출력할 파일명
				var imgSrc;				// 썸네일 or 파일아이콘 이미지 파일
				var originalFileUrl;	// 원본파일 요청 URL
				var uuidFileName;		// 날짜경로를 제외한 나머지 파일명(UUID)
				var basicFileName = fullName;	// 삭제시 값을 전달하기 위한 파일
				
				// 이미지 파일이면
				if(checkImageType(fullName)) {
					imgSrc = "${path}/upload/displayFile?fileName=" + fullName;	// 썸네일 이미지 링크
					uuidFileName = fullName.substr(14);
					var originalImg = fullName.substr(0, 12) + fullName.substr(14);
					// 원본 이미지 요청 링크
					originalFileUrl = "${path}/upload/displayFile?fileName=" + originalImg;
				} else {
					imgSrc = "${path}/resources/img/file-icon.png";	// 파일 아이콘 이미지 링크
					uuidFileName = fullName.substr(12);
					// 파일 다운로드 요청 링크
					originalFileUrl = "${path}/upload/displayFile?fileName=" + fullName;
				}
				originalFileName = uuidFileName.substr(uuidFileName.indexOf("_") + 1);
				// 전체 파일명의 크기가 14보다 작으면 그대로 이름 출력,
				// 14보다 크면 실행
				if(originalFileName.length > 14) {
					// 앞에서부터 11글자 자름
					var shortName = originalFileName.substr(0, 10);
					// .을 기준으로 배열 생성
					var formatVal = originalFileName.split(".");
					// formatVal = originalFileName.substr(originalFileName.length-3)
					// 파일명에 .이 여러개 들어가 있을수도 있음
					// 배열크기를 구해와서 무조건 맨 마지막 확장자부분 출력되게 함
					var arrNum = formatVal.length - 1;
					// 맨 처음 문자열 10글자 + ... + 확장자
					originalFileName = shortName + "..." + formatVal[arrNum];
				}
				return {originalFileName: originalFileName, imgSrc: imgSrc, originalFileUrl: originalFileUrl, fullName: fullName, basicFileName: basicFileName}
			}
			
			// 첨부파일 출력
			function printFiles(data) {
				// 파일 정보 처리
				var fileInfo = getFileInfo(data);
				console.log(fileInfo);  //콘솔에 파일정보를 불러옴
				// Handlebars 파일 템플릿에 파일 정보들을 바인딩하고 HTML 생성
				var html = fileTemplate(fileInfo); //파일탬플릿 은, 이미지 올라갔을때 이미지가 뜰공간을 HTML 로 만들어 놓은것
				html += "<input type='hidden' class='file' value='"	+fileInfo.fullName+"'>";
				// Handlebars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
				$(".uploadedList").append(html); //업로드 리스트에 html을 주입시킴
				// 이미지 파일인 경우 aaaaaaaaaaa파일 템플릿에 lightbox 속성 추가
				if(fileInfo.fullName.substr(12, 2) === "s_") {
					// 마지막에 추가된 첨부파일 템플릿 선택자
					var that = $(".uploadedList li").last();
					// lightbox 속성 추가
					that.find(".mailbox-attachment-name").attr("data-lightbox", "uploadImages");
					// 파일 아이콘에서 이미지 아이콘으로 변경
					that.find(".fa-paperclip").attr("class", "fa fa-camera");
				}
			}
					
			function getOriginalName(fileName) {
				if(checkImageType(fileName)) {	// 이미지 파일이면 skip
					return;
				}
				var idx = fileName.indexOf("_") + 1; // uuid를 제외한 파일이름
				return fileName.substr(idx);
			}
			function getImageLink(fileName) {
				if(!checkImageType(fileName)) { // 이미지 파일이 아니면 skip
					return;
				}
				var front = fileName.substr(0, 12);	// 연월일 경로
				var end = fileName.substr(14);	// s_ 제거
				return front+end;
			}
			function checkImageType(fileName) {
				var pattern=/jpg|gif|png|jpeg/i; // 정규표현식(대소문자 무시)
				return fileName.match(pattern);	// 규칙에 맞으면 true
			}
			
			// 첨부파일 리스트를 출력하는 함수
			function listAttach() {
				var listCnt = 0;
				$.ajax({
					type: "post",
					url: "${path}/board/getAttach/${one.bno}",
					async: false,
					success: function(list) {
						// list : json
						// console.log(list);
						listCnt = list.length;
						
						/* console.log(list.length); */
						/*
							jQuery each()는 반복문
							i와 e는 index와 element로
							json에서 { 0: "apple.png" }일 때
							index는 0, element는 apple.png가 됨
						*/
						$(list).each(function(i, e){
							/* console.log(list) */
							printFiles(e); // 첨부파일 출력 메서드 호출
						});
					}
				});
				return listCnt;
			}
				
				
			
			
			
				
				
				
		
	//리퍼럴이 비정상경로일 경우 대처방법
		$(document).on('click', '#n_btn', function(){  //write_btn 클릭시 동작
			var referer = '${header.referer}';
			console.log('이전 URL: '+referer);
			
			var index = referer.indexOf('/board/list');  //indexOf는 글자를 찾아주는거
			alert(index);
			console.log('index: '+referer.indexOf('/board/list'));
			
			if(index == '-1') {
				location.href = '${path}/board/list';  //인덱스가 -1이면 여기로 경로를 이동시킨다
				alert(index);
			} else {
				location.href = '${header.referer}';  //-1이 아니면, 바로이전의 리퍼럴로 이동시킴
				alert(index);
			}
		});
	
	
	
	
	//게시글등록 에서 등록버튼을 눌렀을때 유효성체크
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
				
				//--------------첨부파일 part3----------------------------------------------------------------
				if(flag == 'answer') {
					$('#board_title').val('${bDto.title}');
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
				
				// 폼에 hidden 태그들을 붙임 
				$("#frm_board").append(str); //frm_board 맨 마지막에 str(첨부파일 목록)을 붙여라
				
				// 서버로 전송
				$('#frm_board').submit();	//스프링 폼태그 전송 (PostMapping으로)
			}
		});
	
	
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