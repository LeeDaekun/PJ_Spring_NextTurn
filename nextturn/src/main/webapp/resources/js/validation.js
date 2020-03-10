var joinValidate = {
// 결과 메시지 출력시 사용하는 Text
	resultCode : {
	// 공통■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		empty_val : {
			code: 1,
			desc : '필수 정보입니다.'
		},
		space_length_val : {
			code: 2,
			desc : '공백없이 입력해주세요.'
		},
	// ID ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		success_id : {
			code: 0,
			desc : '멋진 아이디네요:)'
		},
		specialStr_id : {
			code: 3,
			desc : '특수문자는 대시(-), 언더바(_)만 이용 가능합니다.'
		},
		invalid_id : {
			code: 4,
			desc : '아이디는 영문 소문자, 숫자, 특수기호 일부만 사용할 수 있습니다.'
		},
		first_special_id : {
			code: 5,
			desc : '첫 글자는 특수문자를 이용하실 수 없습니다.'
		},
		length_id : {
			code: 6,
			desc : 'ID는 공백없이 5자 이상~20자 이하여야 합니다.'
		},
		overlap_id : {
			code: 7,
			desc : '이미 사용 중인 ID 입니다.'
		},
	// pw ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		success_pw : {
			code: 0,
			desc : '사용가능한 비밀번호입니다.'
		},
		equals_success_pw : {  //새로 추가함
			code: 10,
			desc : '사용가능한 비밀번호입니다.'
		},
		invalid_pw : {
			code: 3,
			desc : '비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.'
		},
		stream_pw : {
			code: 4,
			desc : '같은 문자를 4번 이상 사용하실 수 없습니다.'
		},
		hangle_pw : {
			code: 5,
			desc : '비밀번호에 한글은 사용하실 수 없습니다.'
		},
		other_pw : {
			code: 6,
			desc : '입력하신 비밀번호가 일치하지 않습니다.'
		},
		equal_pw : {
			code: 7,
			desc : '현재비밀번호와 다르게 입력해주세요.'
		},
		success_nowpw : {
			code : 100,
			desc: '확인되었습니다.'
		},
	// name ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		success_name : {
			code: 0,
			desc : '멋진 이름이네요:)'
		},
		invalid_name : {
			code: 3,
			desc : '이름은 표준한글만 입력가능합니다.'
		},
		length_name : {
			code: 4,
			desc : '이름은 2자이상 ~ 4자이하만 가능합니다.'
		},
	// phone ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		success_phone : {
			code: 0,
			desc : '사용가능한 번호입니다.'
		},
		invalid_phone : {
			code: 3,
			desc : '휴대폰 번호가 유효하지 않습니다.'
		},
		// length_phone : {
		// 	code: 4,
		// 	desc : '(-)없이 10, 11자로 입력해주세요.'
		// },
		// number_phone : {
		// 	code: 5,
		// 	desc : '숫자만 입력해주세요.'
		// },

		// email■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		success_email : {
			code: 0,
			desc : '사용가능한 이메일입니다.'
		},
		invalid_email : {
			code: 3,
			desc : '올바른 이메일을 입력해주세요.'
		},

		//address■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		success_addr : {
			code : 0,
			desc : '확인되었습니다'
		},
		empty_post : {
			code: 3,
			desc : '[우편번호 찾기]를 클릭하고 값을 입력해주세요.'
		},
		empty_detail : {
			code: 4,
			desc: '상세주소를 입력해주세요'
		},
		invalid_addr : {
			code: 5,
			desc : '올바른 주소를 입력해주세요.'
		}

	},

	//code 0 이면 각 유효성 체크를 전부 통과한것



//아이디 유효성체크■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	checkId: function(id) {  //이런걸 정규식이라고 함
		var regEmpty = /\s/g; // 공백문자
		var regEtc = /[~`!@#$%^&*()+=\|\\\{\}\[\]:";'<>.,?//]/g; // 특수문자
		var regId = /[^a-z0-9-_.]+/g;
		
	// 1.값이 있는지 없는지 체크
	// space값이 있으면 값이 있다 판단되어 통과하니까 id.length == 0 을 준다
		if(id == '' || id.length == 0) {
			return this.resultCode.empty_val;  //'필수 정보입니다' 출력

		} else if(id.match(regEmpty)) { // 2.값사이에 공백이 있는지 체크
			return this.resultCode.space_length_val;  //공백없이 입력해주세요

		} else if(id.match(regEtc)) { // 3.특수문자 체크(-, _만 가능)
			return this.resultCode.specialStr_id;

		} else if(id.match(regId)) { // 4.아이디 정규식 체크
			return this.resultCode.invalid_id;
			
		} else if(id.charAt(0) == '-' || id.charAt(0) == '_') { // 5.첫글자로 특수문자 사용 불가
			return this.resultCode.first_special_id;
			
		} else if(id.length < 5 || id.length > 20) { // 6.길이(5~20자 이내)
			return this.resultCode.length_id;

		} else if(idCheck(id)){ // 7. 아이디 중복 체크
			return this.resultCode.overlap_id;
		}else {
			return this.resultCode.success_id;
		}
	},


//비밀번호 유효성체크■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	checkPw : function(pw, rpw) {
		var regEmpty = /\s/g; // 공백문자
		var regPw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&_*-]).{8,}$/;
		var regHangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

		
		if(pw == '' || pw.length == 0) 	{ // 1.값이 있는지 체크
			return this.resultCode.empty_val;

		
		} else if(pw.match(regEmpty)) { // 2.공백값이 있는지 체크
			return this.resultCode.space_length_val;

		
		} else if(/(\w)\1\1\1/.test(pw)) { // 3.같은 값이 4번연속으로 사용했는지 체크
			return this.resultCode.stream_pw;

		
		} else if(regHangle.test(pw)) { // 4.한글 사용 체크
			return this.resultCode.hangle_pw;

		
		} else if(!pw.match(regPw)) { // 5.유효한 비밀번호 체크
			return this.resultCode.invalid_pw;

	// 6.비밀번호재확인에 값이 있으면, 여기서 성공을 띄움
		} else if(rpw != '' || rpw.length != 0) {
			if(pw == rpw) {
				return this.resultCode.equals_success_pw;  //사용가능한 비밀번호입니다
			} else {
				return this.resultCode.other_pw;
			}
	
	//7. 비번 재확인에 값이 있으면, 여기서 성공을 띄움
		} else {  
			return this.resultCode.success_pw;  //사용가능한 비밀번호입니다
		}
	}, //check function(pw)


//비밀번호 재확인 유효성체크■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	checkRpw : function(pw,rpw,pwFlag) {
		// 비밀번호의 유효성체크를 통과한 값과
		// 비밀번호 재확인 값이 같다면
		// 비밀번호 재확인 값은 유효성체크를 할 필요가 없음
		if (rpw == ''|| rpw.length == 0) {
			return this.resultCode.empty_val;  //필수 정보입니다

		} else if(!pwFlag) { // 2.
			return this.resultCode.invalid_pw;  //비밀번호는 8자 이상.

		// 6.비밀번호재확인에 값이 있으면, 여기서 성공을 띄움
		} else{
			if(pw == rpw && pwFlag) {
				return this.resultCode.equals_success_pw;  //사용가능한 비밀번호입니다
			} else {
				return this.resultCode.other_pw; //입력하신 비밀번호가 일치하지 않습니다
			}

		}//if
	},// checkRpw : function(pw,rpw,pwFlag)


//이름 유효성체크■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	checkName : function(name) {
		var regEmpty = /\s/g; // 공백문자
		var regName = /^[a-zA-Z가-힣]+$/;

		if(name == '' || name.length == 0) { // 1.값 유무
			return this.resultCode.empty_val;  //필수 정보입니다

		} else if(name.match(regEmpty)) { // 2.공백 유무
			return this.resultCode.space_length_val;  //공백없이 입력해주세요

		} else if(!name.match(regName)) { // 3.유효한 이름
			return this.resultCode.invalid_name;
		} else if(name.length < 2 || name.length > 20) { // 4. 2~20자 길이
			return this.resultCode.length_name;
		} else { // 통과!
			return this.resultCode.success_name;
		}
	}, // checkName : function(name)


//전화번호 유효성체크■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	checkPhone : function(phone) {
		var regEmpty = /\s/g; // 공백문자
		var regPhone = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/g;
		             	   //3숫자            3~4숫자    4숫자

		if(phone == '' || phone.length == 0) { // 1.값 유무
			return this.resultCode.empty_val;  //필수 정보입니다

		} else if(phone.match(regEmpty)) { // 2.공백 유무
			return this.resultCode.space_length_val;  //공백없이 입력해주세요

		} else if(!phone.match(regPhone)) { // 3.유효한 폰번호
			return this.resultCode.invalid_phone;  //휴대폰 번호가 유효하지 않습니다

		} else { // 통과!
			return this.resultCode.success_phone;  //사용가능한 번호입니다
		}
	}, // checkName : function(phone)


//이메일 유효성체크■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	checkEmail : function(email) {
		var regEmpty = /\s/g; // 공백문자
		var regEmail = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/g;
				  //      영문과 숫자로만 아아디 .은 나중에 가능        @1개만 영문,숫자1개이상/후 .찍기 가능 .1개   확장자 영문으로1~5개
				  //   ~+ 까지   /  ~*까지  /  ~{1}까지 
				  //  *은 작성하지 않아도 되는문자를 말함
				  //  +는 필수적으로 1개 이상은 들어가야 되는것


		if(email == '' || email.length == 0) { // 1.값 유무
			return this.resultCode.empty_val;
		} else if(email.match(regEmpty)) { // 2.공백 유무
			return this.resultCode.space_length_val;

		} else if(!email.match(regEmail)) { // 3.유효한 이메일
			return this.resultCode.invalid_email;
		} else { // 통과!
			return this.resultCode.success_email;
		}
	}, // checkEmail : function(email) 


//주소 유효성체크■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	//영어대문자, 영어소문자, 한글, -, 공백외에 전부 체크
	checkAddr : function(addrDetail, addrPost) {  //상세주소 input , 우편번호 input 받는곳
		var regAddr = /^[a-zA-Z가-힣]+$/;  //들어올 수 있는 글자종류

		if(addrPost == '' || addrPost.length == 0) {
			return this.resultCode.empty_post;
		} else if(addrDetail == '' || addrDetail.length == 0) {
			return this.resultCode.empty_detail;
		} else if(!addrDetail.match(regAddr)) { 	// 3.정규식 체크
			return this.resultCode.invalid_addr;
		} else {
			return this.resultCode.success_addr;
		}
	},
	checkNowpw : function(pw){  //순차적으로 1,2,3 진행해서 유효성검사
		var regEmpty = /\s/g; // 공백문자
		if(pw == '' || pw.length == 0) { // 1.값 유무 체크
			return this.resultCode.empty_val;
		} else if(pw.match(regEmpty)) { // 2.공백값이 있는지 체크
			return this.resultCode.space_length_val;
		} else if(pwCheck(pw)) { //3. 현재 비밀번호와 동일한지 체크 후 pwCheck(pw)에 pw를 전달
			return this.resultCode.other_pw;  //비밀번호가 일치하지 않습니다.
		}else{ //4. 유효성체크 통과
			return this.resultCode.success_nowpw;  //확인되었습니다.
		}
		
	}//checkNowpw : function(pw) 종료

	
	

} //var joinValidate = { 종료=========

// [start]
//==id중복값 체크==============AJAX 쓰는 이유는 , 한 페이지 안에서 아이디 체크를 하기 위해서 =====================================================//@PostMapping("y1member/idoverlap") 을 찾아가세요
function idCheck(id) {
	var return_val = true;
	$.ajax({
		type : 'POST',
		url : 'idoverlap?id=' + id,
		async : false, 					//retrun 사용하기 위해서, ajax(비동기방식)는 차례대로 실행x 다 먼저 실행하므로 return 사용불가능
		success : function(data) {
			console.log(data);
			if (data >= 1) {
				return_val = true;
			} else {
				return_val = false;
			}
		},
		error : function() {
			alert('System ERROR:(');
		}
	});
	return return_val;
}
// [end]

//비밀번호 체크
function pwCheck(pw){
	var return_val = true;
	$.ajax({
		type: 'POST',
		url: 'pwcheck?pw='+pw,
		async: false,
		success: function(data) {
			if(data == 1) {
				return_val = false;
			} else if(data == 0) {
				return_val = true;
			}
		},
		error: function() {
			alert('System ERROR:(');
		}
		
	});
	return return_val;
}