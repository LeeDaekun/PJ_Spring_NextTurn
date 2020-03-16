package com.nextturn.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nextturn.domain.MemberDTO;
import com.nextturn.service.Member.MemberService;
import com.nextturn.service.mail.MailService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller // 컨트롤러 붙여준 이유는, 핸들러맵핑이 /member 붙은애를 찾아봐,
@RequestMapping("/member") 
@SessionAttributes({"memberDTO"}) // 공용저장소 만듬. (join페이지 직접 못넘어가게 하는거 할때 만듬)
public class MemberController {
	@Autowired // DI 기능을 켜고
	MemberService mService; // Service를 쓸려고 의존성 주입을 하게 해줌
	
	@Autowired  //암호 해쉬코드 작업하려고 만든것
	PasswordEncoder passwordEncoder;
	/*
	 * SessionAttributes를 사용하기 위해서는
	 * 반드시 해당 변수를 생성하는 method가 controller에 있어야하고
	 * 해당 메서드에는 @ModelAttribute("변수명")이 있어야 한다.
	 */
	
	@Autowired  //메일 인증할때 필요한 서비스
	private MailService mailService;  //메일서비스로 이동할 수 있게 연결해줌
		
	
	// 초기화하는 작업(필수)
	@ModelAttribute("memberDTO")
	public MemberDTO newMember() {
		return new MemberDTO();
	}
	
	@GetMapping("/constract") // Get 방식이 기본값이라. Post라고 안쓰면 무조건 Get
	public String viewConstract() {   
		log.info(">>>>> MEMBER/CONSTRACT PAGE 출력");
		return "member/constract";
	}

	
	/*
	 * SessionAttributes에서 설정한 변수(객체)에는
	 * 
	 * @ModelAttribute를 설정해두어야 한다. 단, 5.x 이하에서는 필수 5.x 이상에서는 선택
	 * 
	 * 만약 Attributes의 이름을 표준패턴이 아닌 임의의 이름으로 사용할 경우
	 * 
	 * @ModelAttribute("객체이름")을 필수로 지정해주어야 한다.
	 */

	@GetMapping("/join") // (join페이지 직접 못넘어가게 하는거 할때 만듬)
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, Model model, 
		@RequestParam(value="flag", defaultValue="0") String flag) {  //String flag 는 기본값을 설정할수 없으니까, 
		log.info("★★★★★★★★★★★★★★★ MEMBER/JOIN PAGE GET 출력");		  //@RequestParam(value="flag", defaultValue="0") String flag 를 쓴다.
		log.info("★★★★★★★★★★★★★★★ " + mDto.toString());
		
		//비정상적인 접근일 경우 약관 동의페이지로 이동  
		if(!flag.equals("1")) {  //1이 아니면 약관동의 페이지로 이동
			return "member/constract";
		}
		return "member/join";  //1이면 회원가입 페이지로 이동
	}


	//pwupdate.jsp 파일을 열기위한 컨트롤러
	@GetMapping("/pwupdate") // Get 방식이 기본값이라. Post라고 안쓰면 무조건 Get
	public String viewPwUpdate() {
		log.info(">>>>> MEMBER/Pw Update 출력");
		return "member/pwupdate";
	}
	
	@PostMapping("/pwupdate")
	public String pwUpdate(HttpSession session, MemberDTO mDto) {
		log.info("★★★★★★★★★★★★★★★ POST: Password Update Action");
		log.info("수정 비밀번호 : " + mDto.getPw());
		
		String encPw = passwordEncoder.encode(mDto.getPw());
		mDto.setPw(encPw);
		
		String id = (String)session.getAttribute("userid");
		mDto.setId(id);
		log.info(mDto.toString());
		
		mService.pwUpdate(mDto);
		
		return "redirect:/";
	}
	
	
	
	@ResponseBody
	@PostMapping("/pwcheck")
	public Integer pwCheck(String pw, HttpSession session) {
		log.info("★★★★★★★★★★★★★★★ POST: Password Check(AJAX)");
		
		String id = (String)session.getAttribute("userid");
		
		return mService.pwCheck(id, pw);
	}
	
	
	@GetMapping("/drop") // Get 방식이 기본값이라. Post라고 안쓰면 무조건 Get
	public String viewDrop() {
		log.info(">>>>> MEMBER/drop 출력");
		return "member/drop";
	}
	
	@GetMapping("/mypage") // Get 방식이 기본값이라. Post라고 안쓰면 무조건 Get
	public String viewMypage() {
		log.info(">>>>> MEMBER/mypage 출력");
		return "member/mypage";
	}

	
	
	@PostMapping("/join") // 스프링 폼태그를 submit 으로 제출했을때 여기를 탄다.
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, SessionStatus sessionStatus, 
			HttpServletRequest request, RedirectAttributes rttr) { 
		// @ModelAttribute 를 해줘야, @SessionAttribute 에 담을 수 있다.
		//@ModelAttribute 는 데이터베이스 값을 전달하려고 있는거
		//http서블릿 리퀘스트 이메일 전송할때 필요한것
		//리다이랙트 어트리뷰트 1회성으로 변수값을 전송하는것
		//상단에 공용자원인 @SessionAttributes({"memberDTO"}) 이걸 열었는데, 자원을 사용하고 반납까지 해줘야하는데, 반납하는 역할은 SessionStatus sessionStatus 이거로 해준다.
																		
		log.info("★★★★★★★★★★★★★★★ MEMBER/JOIN PAGE POST 출력");		
		log.info(mDto.toString());
		
	// 1. 사용자 암호 hash 변환
		String encPw=passwordEncoder.encode(mDto.getPw());  //페스워드 인코더가 해시값으로 변환시킨다. 그걸 encPW에 저장
		mDto.setPw(encPw);  //변환된 값을 DTO에 기록해라
		log.info("Password(+Hash):" + mDto.getPw());  //DTO에 저장된 변수를 get으로 가져와서 확인하기
				
		
	// 2. DB에 회원 등록
		int result = mService.memInsert(mDto); //mService 서비스단에 있는, 회원등록 메서드를 탄다.

	// 3. 회원 등록 결과
		if (result > 0) {
			log.info("★★★★★★★★★★★★★★★ " + mDto.getId() + "님 회원가입되셨습니다.");
		}
		
		// 4. 회원가입 인증 메일 보내기
				mailService.mailSendUser(mDto.getEmail(), mDto.getId(), request);  //오토와이어드로 메일서비스랑 연결되있음
				
				// SessionAttributes를 사용할 때 insert, update가 완료되고 
				// view로 보내기 전 반드시 setComplet()를 실행하여
				// session에 담긴 값을 clear 해주어야 한다.
				// sessionStatus : controller에서 공유하던 영역을 제거
				sessionStatus.setComplete();   //세션 스테이터스는 공용 영역에 변수를 넣어서 사용한것을 다시 초기화 시킨다는 의미, 꼭 사용후 초기화해야함
				
				// 회원가입 후 메시지 출력을 위한 값 전달
				rttr.addFlashAttribute("id", mDto.getId());  //rttr 은 모델과 비슷하게, 컨트롤러에서 뷰로 전송해주는데, rttr 도 같은 기능을 함 (단 1회성)
				rttr.addFlashAttribute("email", mDto.getEmail());
				rttr.addFlashAttribute("key", "join");  //변수 key 에 "join"을 담는다
		
		return "redirect:/";
	}
	
	
	
	
	
	// 회원가입 후 email 인증 (인증 이메일에서 a태그가 이 메서드를 실행함)
	@GetMapping("/keyauth")
	public String keyAuth(String id, String key, RedirectAttributes rttr) {   //리다이렉트 어트리뷰트 : 원래 데이터를 전달하면 살아있는데, 이거로 보내면 한번 보내고 소멸
		
		mailService.keyAuth(id, key);
		
		// 인증 후 메시지 출력을 위한 값 전달
		rttr.addFlashAttribute("id", id);
		rttr.addFlashAttribute("key", "auth");  //모달창에 값을 전달하고, 모달창이 사라지면, 같이 값이 사라진다. 에드 플래시 어트리뷰트
		
		return "redirect:/"; //리다이렉트로 인덱스로 바뀌면 모달창이 떠야함
	}
			
			
			
			
			
					
					
					
	
	// 회원가입 ID 중복체크
	@ResponseBody  //리턴값을 화면단으로 인식하지않고, 일반 데이터로 인식하는거
	@PostMapping("/idoverlap")
	public String idOverlap(String id) {
		log.info("★★★★★★★★★★★★★★★ ID OVERLAP CHECK");
		log.info("아이디 : " + id);
		int cnt = mService.idOverlap(id);  //MemberService에 idOverlap 만드세요
		
		String flag = "1";
		if(cnt == 0) {  //아이디가 있으면1, 없으면0
			flag = "0";
		}
		return flag; //화면단을 결정하는게 아니면 @ResponseBody 를 붙여준다 
	}
	
	
	
	// 회원정보수정  	@GetMapping("/update")
	@GetMapping("/update")
	public String memUpdate(HttpSession session, Model model) {
		log.info("★★★★★★★★★★★★★★★ GET : Member Update Page");
		
		// 현재 로그인 상태를 확인
		// session영역에 담을경우 제일 최상의 타입인 object로 변환하여 담음
		// 담기 전 형변환 해야함
		String id = (String)session.getAttribute("userid");
		
		// 로그인 된 유저의 정보를 GET
		model.addAttribute("user", mService.userView(id));
		return "member/join";
	}
	
	
	// 회원정보 수정 	@PostMapping("/update")
	@PostMapping("/update")
	public String memUpdate(MemberDTO mDto, HttpSession session) { //	@PostMapping("/update")
		log.info("★★★★★★★★★★★★★★★ POST: Member Update Action");
		log.info(mDto.toString());
		
		mService.memUpdate(mDto, session);

		return "redirect:/";  //루트컨텍스트(/) 호출
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
