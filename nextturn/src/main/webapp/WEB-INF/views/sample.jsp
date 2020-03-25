<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sample.jsp</title>
</head>
<body>
<div>
Get 과 Post는 데이터를 숨기느냐 마느냐의 전송방식
<br>
동기와 비동기는 페이지를 전환하느냐 마느냐의 방식
</div>

	<div>
		<h3>
			학습1 Get방식으로 데이터 전달하는 방법 // (동기:페이지전환 있음)
			</h3>

			<!-- 
		쿼리스트링(GET방식만 허용) : View단에서 Controller단으로 전송 
		URL : localhost:8081/metop/sample/view
		-> ${path}/sample/view?user='배뚱'&pass=1234
		?를 기준으로 ?앞은 주소 ?뒤는 데이터	
	-->
			<a href="${path}/sample/view?user=배뚱&pass=1234">GET</a>
			<!-- view가시는데 반드시 view가 @GetMapping 과 @PostMapping 있더라도, 쿼리스트링은 기본적으로 Get으로 찾아감 -->
	</div>
	<br>
	<Br>
	<div>
		<h3>
			학습2 POST방식 (동기)방식으로 데이터 전달하는 방법  // (동기:페이지전환 있음)
			</h3>
			<!-- 학습2 폼과 Post 방식으로 데이터 전달하는 방법 -->
			<!-- 폼테그는 뭔가를 전송할때 쓰는데, Post랑 Get을선택할 수 있음 -->
			<!-- 폼태그에서는 action method name 을 반드시 적어야한다. -->
			<!-- 액션은 이동할 목적지이고, 메서드는 get,post, name은 데이터를 Controller에 전달할때  -->
			
			<form action="${path}/sample/view" method="POST"> <!-- view가시는데 반드시 @PostMapping 이 붙은 view로 가야합니다 -->
				<!-- input, textarea, select, radio, checkbox등 사용자가 입력하는 태그들만 controller에 넘김 -->
				<input type="text" name="user">  <!-- DTO에 있는 user 에 담는것 -->
				<!-- user 라는 이름을 컨트롤러에서 인식하여, 값을 받음 -->
				<input type="password" name="pass"><!-- DTO에 있는 pass 에 담는것 -->
				<button type="submit">POST</button>
			</form>
			<!-- 서브밋을 누르면 페이지 전환이 일어나면서 (동기) 값을 전달함 -->
	</div>


<br><br>
	<div>
		<h3>학습3 동기방식, 비동기방식 전송방식</h3>
		<!-- 동기방식 -->
		<a href="${path}/sample/sync?name=배뚱아">동기방식</a>
		<!-- 비동기방식 -->
		<button type="button" id="ajax_btn">비동기방식(AJAX)</button>
		<div>ajax 버튼을 스크립트로 구현해야한다</div>

		<br>
		<div>
			<span>동기: ${name}</span>
		</div>
		<div>
			<span>비동기: </span><span id="ajax_txt"></span>
		</div>
	</div>
	
</body>
<script type="text/javascript">
	$('#ajax_btn').on('click', function() {
		// type : GET or POST
		// url : 서버단 목적지(RequestMapping으로 받는 요청)
		// contextType : 서버단으로 전송하는 데이터의 타입
		// data : 서버로 전송하는 실제 데이터
		// dateType : 서버단에서 View단으로 전송하는 데이터 타입, (생략할 경우 String)
		// success : AJAX 성공했을 때 작업(DATA: AJAX 서버단 Return값)
		// error : AJAX 실패했을 때 작업
		// {key: value} 이런 형태를 띄고있다면-> JSON 이다

		// 	url: '${path}/sample/ajax', 
		//	data: {name: '뚱깐징어'}
		//  쿼리스트링도 가능 -> url: '${path}/sample/ajax?name=뚱깐징어', 
		$.ajax({
			type : 'POST',
			url : '${path}/sample/ajax',
			data : {
				name : '뚱깐징어'
			},},  //위에 값을 가지고, 컨트롤러에 다녀오셔서, 성공인지 실패인지 확인후에 아래 실행
			
			success : function(data) {
				console.log(data);
				$('#ajax_txt').text(data);
			},
			error : function() {
				alert('System ERROR :( ');
			}
		});
	});
</script>
</html>