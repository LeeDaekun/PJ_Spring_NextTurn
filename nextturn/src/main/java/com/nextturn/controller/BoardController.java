package com.nextturn.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nextturn.domain.BoardDTO;
import com.nextturn.service.board.BoardService;
import com.nextturn.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller // 컨트롤러 붙여준 이유는, 핸들러맵핑이 /member 붙은애를 찾아봐,
@RequestMapping("/board")
public class BoardController {
	@Autowired // DI 기능을 켜고
	BoardService bService; // Service를 쓸려고 의존성 주입을 하게 해줌

//---------------------------------------------------------------------------------------	

	/*
	 * 처음혼자서 시도했던 방법
	 * 
	 * @GetMapping("/list2") // 게시판 띄우기 public String freeBoard(Model model) { //
	 * DTO에서 자료를 가져와서 list 띄워라 log.info(">>>>> Get 전송 _ board/list 게시판 호출");
	 * 
	 * model.addAttribute("board_item", bService.boardList()); //
	 * model.addAttribute("뷰단item 이름", bService.서비스에 메서드명());
	 * 
	 * return "board/list"; }
	 */

	// 선생님이 알려준방법
	@GetMapping("/list") // 게시판 띄우기
	public String list(@RequestParam(defaultValue = "1") int curPage, // 게시판은 기본적으로 페이지1부터 시작한다
						@RequestParam(defaultValue = "new") String sort_option, // 게시판은 최신순 정렬을 기본으로 함 (쿼리스트링 ?sort_option=new
						@RequestParam(defaultValue = "all") String search_option, 
						@RequestParam(defaultValue = "") String keyword, String type, Model model) { // DTO에서 자료를 가져와서 list 띄워라
		//@RequestParam은 값이 안넘어와도 기본값을 셋팅해주는것
		type = "free";
		log.info(" ■■■■■■GET■■■■■■: 자유게시판 띄움");

		// 게시글 갯수 계산 //게시글을 '보드'라고도 하고 '아티클'이라고도한대 회사마다 다름
		int count = bService.countArticle(search_option, keyword, type);
		// 여기에 SQL에서 조회한 게시글 갯수가 담겨옴

		// 페이지 관련 설정 (URL에 ?curPage=1 이런식으로 쓸수 있다)
		Pager pager = new Pager(count, curPage); // 게시글15개 페이지는1페이지 기본값
		// 생성하면서, public Pager를 한번실행해서 기본준비를 마침

		int start = pager.getPageBegin(); // Pager에 담긴 값을 가져옴
		int end = pager.getPageEnd(); // Pager에 담긴 값을 가져옴
		List<BoardDTO> list = bService.boardList(sort_option, search_option, keyword, type, start, end); // 서비스작업 처리한 결과를 list에 담음

		HashMap<String, Object> map = new HashMap<>(); // 보내야될 데이터가 많아서, 바로 보내지않고 해쉬맵을 쓴다
		map.put("list", list); // <BoardDTO> list를 ▶ 해쉬맵 "list"에 담는다

		map.put("count", count); // 리스트 count를 ▶ 해쉬맵 "count"에 담는다
		map.put("pager", pager); //
		map.put("sort_option", sort_option); // 스트링 sort_option을 ▶ 해쉬맵 "sort_option"에 담는다
		// 정렬 옵션 (정렬 옵션은 페이지가 넘어갈때마다 항상 따라다녀야한다. 안그러면 첫페이지만 정렬되고 말아버리니까)
		map.put("search_option", search_option); // 나는 안만들었으므로, 이건 필요없음 검색할때 세부 옵션 설정하려고 만든거
		map.put("keyword", keyword); // 사용자가 검색한 키워드

		model.addAttribute("map", map); // 해쉬맵 map을, 모델"map"에 담는다 (모델은 화면단에 데이터를 전달하는 수단)

		log.info(" ■■■■■■■■■■■map.toString" + map.toString());
		return "board/list"; // 맵데이터를 리스트로 넘기고, 화면단을 리스트로 결정함
	} // @GetMapping("/list") 종료

	
	
	//공지사항 게시판 띄우기
	@GetMapping("/list_meeting")
	public String list_meeting(@RequestParam(defaultValue = "1") int curPage, // 게시판은 기본적으로 페이지1부터 시작한다
							  @RequestParam(defaultValue = "new") String sort_option, // 게시판은 최신순 정렬을 기본으로 함 (쿼리스트링 ?sort_option=new
							  @RequestParam(defaultValue = "all") String search_option,
							  @RequestParam(defaultValue = "") String keyword, String type, Model model) { // DTO에서 자료를 가져와서 list 띄워라
		type = "noti";
		log.info(" ■■■■■GET■■■■■■: 공지 게시글 목록을 띄움");

		// 게시글 갯수 계산 //게시글을 '보드'라고도 하고 '아티클'이라고도한대 회사마다 다름
		int count = bService.countArticle(search_option, keyword, type);
		// 여기에 SQL에서 조회한 게시글 갯수가 담겨옴

		// 페이지 관련 설정 (URL에 ?curPage=1 이런식으로 쓸수 있다)
		Pager pager = new Pager(count, curPage); // 게시글15개 페이지는1페이지 기본값
		// 생성하면서, public Pager를 한번실행해서 기본준비를 마침

		int start = pager.getPageBegin(); // Pager에 담긴 값을 가져옴
		int end = pager.getPageEnd(); // Pager에 담긴 값을 가져옴
		List<BoardDTO> list = bService.boardList(sort_option, search_option, keyword, type, start, end); // 서비스작업 처리한 결과를 list
																									// 에 담음

		HashMap<String, Object> map = new HashMap<>(); // 보내야될 데이터가 많아서, 바로 보내지않고 해쉬맵을 쓴다
		map.put("list", list); // <BoardDTO> list를 ▶ 해쉬맵 "list"에 담는다

		map.put("count", count); // 리스트 count를 ▶ 해쉬맵 "count"에 담는다
		map.put("pager", pager); //
		map.put("sort_option", sort_option); // 스트링 sort_option을 ▶ 해쉬맵 "sort_option"에 담는다
		// 정렬 옵션 (정렬 옵션은 페이지가 넘어갈때마다 항상 따라다녀야한다. 안그러면 첫페이지만 정렬되고 말아버리니까)
		map.put("search_option", search_option); // 나는 안만들었으므로, 이건 필요없음 검색할때 세부 옵션 설정하려고 만든거
		map.put("keyword", keyword); // 사용자가 검색한 키워드
		map.put("list_meeting", type);

		model.addAttribute("map", map); // 해쉬맵 map을, 모델"map"에 담는다 (모델은 화면단에 데이터를 전달하는 수단)

		log.info(" ■■■■■■■■■■■map.toString" + map.toString());
		return "board/list_meeting"; // 맵데이터를 리스트로 넘기고, 화면단을 리스트로 결정함
	} // @GetMapping("/list_meeting") 종료
	
	
	
	
	
	//리뷰 게시판 띄우기
		@GetMapping("/list_review")
		public String list_revi(@RequestParam(defaultValue = "1") int curPage, // 게시판은 기본적으로 페이지1부터 시작한다
								  @RequestParam(defaultValue = "new") String sort_option, // 게시판은 최신순 정렬을 기본으로 함 (쿼리스트링 ?sort_option=new
								  @RequestParam(defaultValue = "all") String search_option,
								  @RequestParam(defaultValue = "") String keyword, String type, Model model) { // DTO에서 자료를 가져와서 list 띄워라
			type = "revi";
			log.info(" ■■■■■GET■■■■■■: 공지 게시글 목록을 띄움");

			// 게시글 갯수 계산 //게시글을 '보드'라고도 하고 '아티클'이라고도한대 회사마다 다름
			int count = bService.countArticle(search_option, keyword, type);
			// 여기에 SQL에서 조회한 게시글 갯수가 담겨옴

			// 페이지 관련 설정 (URL에 ?curPage=1 이런식으로 쓸수 있다)
			Pager pager = new Pager(count, curPage); // 게시글15개 페이지는1페이지 기본값
			// 생성하면서, public Pager를 한번실행해서 기본준비를 마침

			int start = pager.getPageBegin(); // Pager에 담긴 값을 가져옴
			int end = pager.getPageEnd(); // Pager에 담긴 값을 가져옴
			List<BoardDTO> list = bService.boardList(sort_option, search_option, keyword, type, start, end); // 서비스작업 처리한 결과를 list
																										// 에 담음

			HashMap<String, Object> map = new HashMap<>(); // 보내야될 데이터가 많아서, 바로 보내지않고 해쉬맵을 쓴다
			map.put("list", list); // <BoardDTO> list를 ▶ 해쉬맵 "list"에 담는다

			map.put("count", count); // 리스트 count를 ▶ 해쉬맵 "count"에 담는다
			map.put("pager", pager); //
			map.put("sort_option", sort_option); // 스트링 sort_option을 ▶ 해쉬맵 "sort_option"에 담는다
			// 정렬 옵션 (정렬 옵션은 페이지가 넘어갈때마다 항상 따라다녀야한다. 안그러면 첫페이지만 정렬되고 말아버리니까)
			map.put("search_option", search_option); // 나는 안만들었으므로, 이건 필요없음 검색할때 세부 옵션 설정하려고 만든거
			map.put("keyword", keyword); // 사용자가 검색한 키워드

			model.addAttribute("map", map); // 해쉬맵 map을, 모델"map"에 담는다 (모델은 화면단에 데이터를 전달하는 수단)

			log.info(" ■■■■■■■■■■■map.toString" + map.toString());
			return "board/list_review"; // 맵데이터를 리스트로 넘기고, 화면단을 리스트로 결정함
		} // @GetMapping("/list_review") 종료
	
	
		
		//게임 게시판 띄우기
		@GetMapping("/list_rull")
		public String list_rull(@RequestParam(defaultValue = "1") int curPage, // 게시판은 기본적으로 페이지1부터 시작한다
								  @RequestParam(defaultValue = "new") String sort_option, // 게시판은 최신순 정렬을 기본으로 함 (쿼리스트링 ?sort_option=new
								  @RequestParam(defaultValue = "all") String search_option,
								  @RequestParam(defaultValue = "") String keyword, String type, Model model) { // DTO에서 자료를 가져와서 list 띄워라
			type = "rull";
			log.info(" ■■■■■GET■■■■■ 게임 룰 영상 컨트롤러 ■■■■■");

			// 게시글 갯수 계산 //게시글을 '보드'라고도 하고 '아티클'이라고도한대 회사마다 다름
			int count = bService.countArticle(search_option, keyword, type);
			// 여기에 SQL에서 조회한 게시글 갯수가 담겨옴

			// 페이지 관련 설정 (URL에 ?curPage=1 이런식으로 쓸수 있다)
			Pager pager = new Pager(count, curPage); // 게시글15개 페이지는1페이지 기본값
			// 생성하면서, public Pager를 한번실행해서 기본준비를 마침

			int start = pager.getPageBegin(); // Pager에 담긴 값을 가져옴
			int end = pager.getPageEnd(); // Pager에 담긴 값을 가져옴
			List<BoardDTO> list = bService.boardList(sort_option, search_option, keyword, type, start, end); // 서비스작업 처리한 결과를 list
																										// 에 담음

			HashMap<String, Object> map = new HashMap<>(); // 보내야될 데이터가 많아서, 바로 보내지않고 해쉬맵을 쓴다
			map.put("list", list); // <BoardDTO> list를 ▶ 해쉬맵 "list"에 담는다
			log.info(" ■■■■■■ 게임 룰영상 list결과값■■■■■" + list.toString());
			
			map.put("count", count); // 리스트 count를 ▶ 해쉬맵 "count"에 담는다
			map.put("pager", pager); //
			map.put("sort_option", sort_option); // 스트링 sort_option을 ▶ 해쉬맵 "sort_option"에 담는다
			// 정렬 옵션 (정렬 옵션은 페이지가 넘어갈때마다 항상 따라다녀야한다. 안그러면 첫페이지만 정렬되고 말아버리니까)
			map.put("search_option", search_option); // 나는 안만들었으므로, 이건 필요없음 검색할때 세부 옵션 설정하려고 만든거
			map.put("keyword", keyword); // 사용자가 검색한 키워드

			model.addAttribute("map", map); // 해쉬맵 map을, 모델"map"에 담는다 (모델은 화면단에 데이터를 전달하는 수단)

			log.info(" ■■■■■■ 게임 룰영상 map결과값■■■■■" + map.toString());
			return "board/list_rull"; // 맵데이터를 리스트로 넘기고, 화면단을 리스트로 결정함
		} 		
		
	
		//중거거래 게시판 (작업안했음)
				@GetMapping("/list_trade")
				public String list_trade(@RequestParam(defaultValue = "1") int curPage, // 게시판은 기본적으로 페이지1부터 시작한다
										  @RequestParam(defaultValue = "new") String sort_option, // 게시판은 최신순 정렬을 기본으로 함 (쿼리스트링 ?sort_option=new
										  @RequestParam(defaultValue = "all") String search_option,
										  @RequestParam(defaultValue = "") String keyword, String type, Model model) { // DTO에서 자료를 가져와서 list 띄워라
					type = "trad";
					log.info(" ■■■■■GET■■■■■ 중고거래 게시판");

					// 게시글 갯수 계산 //게시글을 '보드'라고도 하고 '아티클'이라고도한대 회사마다 다름
					int count = bService.countArticle(search_option, keyword, type);
					// 여기에 SQL에서 조회한 게시글 갯수가 담겨옴

					// 페이지 관련 설정 (URL에 ?curPage=1 이런식으로 쓸수 있다)
					Pager pager = new Pager(count, curPage); // 게시글15개 페이지는1페이지 기본값
					// 생성하면서, public Pager를 한번실행해서 기본준비를 마침

					int start = pager.getPageBegin(); // Pager에 담긴 값을 가져옴
					int end = pager.getPageEnd(); // Pager에 담긴 값을 가져옴
					List<BoardDTO> list = bService.boardList(sort_option, search_option, keyword, type, start, end); // 서비스작업 처리한 결과를 list
																												// 에 담음

					HashMap<String, Object> map = new HashMap<>(); // 보내야될 데이터가 많아서, 바로 보내지않고 해쉬맵을 쓴다
					map.put("list", list); // <BoardDTO> list를 ▶ 해쉬맵 "list"에 담는다

					map.put("count", count); // 리스트 count를 ▶ 해쉬맵 "count"에 담는다
					map.put("pager", pager); //
					map.put("sort_option", sort_option); // 스트링 sort_option을 ▶ 해쉬맵 "sort_option"에 담는다
					// 정렬 옵션 (정렬 옵션은 페이지가 넘어갈때마다 항상 따라다녀야한다. 안그러면 첫페이지만 정렬되고 말아버리니까)
					map.put("search_option", search_option); // 나는 안만들었으므로, 이건 필요없음 검색할때 세부 옵션 설정하려고 만든거
					map.put("keyword", keyword); // 사용자가 검색한 키워드

					model.addAttribute("map", map); // 해쉬맵 map을, 모델"map"에 담는다 (모델은 화면단에 데이터를 전달하는 수단)

					log.info(" ■■■■■■■■■■■map.toString" + map.toString());
					return "board/list_trade"; // 맵데이터를 리스트로 넘기고, 화면단을 리스트로 결정함
				} // @GetMapping("/list_trade") 종료
	
		
	
	/*
	 * @GetMapping("/view") public String view(int bno, Model model) { //쿼리스트링으로 int
	 * 변수를 주입 log.info("view 페이지 접속완료"); BoardDTO bDto = bService.boardView(bno);
	 * 
	 * model.addAttribute("bDto", bDto); return "board/view"; }
	 */

	//상세게시글 띄우기 (bno를 받은 게시글을 띄움)
	@GetMapping("/view/{bno}") // 모델은 뷰단에 데이터를 전달 , HttpSession 공용저장소
	public String view(@PathVariable(value = "bno") int bno, Model model, HttpSession session) {
		log.info(" ■■■■■GET■■■■■■: board/view PAGE 출력");

		bService.increaseViewCnt(session, bno);

		model.addAttribute("bDto", bService.boardView(bno));
		model.addAttribute("key", "dropBoard");
		
		 log.info("bDto 는"+bService.boardView(bno).toString()); 
		
		return "board/view";
	}
	

	// view에서 게시글 삭제버튼 눌렀을때
	@GetMapping("delete")
	public String delete(int bno) {
		log.info(" ■■■■■GET■■■■■■: Board Delete Action");

		bService.delBoard(bno);

		return "redirect:/board/list";
	}

	
//■■■■■ 게시글 등록  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	// 리스트에서 게시글등록 눌렀을때
	@GetMapping("/write")
	public String write() {
		log.info(" ■■■■■GET■■■■■ /write");
		return "/board/register";
	}

	
	// 게시글 등록 완료 후 , 등록한 상세게시글을 띄움 (CURRVAL 사용)
	@PostMapping("/write")
	public String write(BoardDTO bDto, Model model) {
		log.info(" ■■■■■POST■■■■■ /write (bDto)");
		log.info("■■컨트롤러에 전달된 데이터■■"+bDto.toString());
				
		//log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■currval:"+bDto.getBno());  //방금 등록한 게시글 번호를 확인하기 위한것 CURRVAL
		
	//첨부파일 카운터
		if(bDto.getFiles() == null) { // 첨부파일 NO
			bDto.setFilecnt(0);
		} else { // 첨부파일 YES
			log.info(" ■■■■■■■■■■■첨부파일 수: " + bDto.getFiles().length);
			bDto.setFilecnt(bDto.getFiles().length);
		}
		
		//int bno=bDto.getBno();
		//model.addAttribute("bno",bno);
		//return "redirect:/board/view/{bno}
		log.info("■■SQL 실행 시작");
		bService.write(bDto);
		log.info("■■SQL 실행 완료");
		return "redirect:/board/view/" + bDto.getBno();
	}
//=========================================================================================================

	
	
	
	// 수정 버튼 눌렀을때, register.jsp 를 수정페이지로 변경해서 동작
	@GetMapping("/update")
	public String updateBoard(int bno, Model model) {
		log.info(" ■■■■■GET■■■■■■: Board update View Page");
		log.info(" ■■■■■■■■■■■bno: " + bno);
		bService.boardView(bno);

		// 수정을 원하는 게시글의 정보를(1줄) 원함
		model.addAttribute("bDto", bService.boardView(bno)); // 뷰단의 키값 bDto
		model.addAttribute("flag", "update");
		
		return "/board/register";
	}

	// 수정 postMapping      register 페이지에서 수정 완료 버튼을 눌렀을때, 업데이트문 실행하고, 게시글목록을 띄움
	@PostMapping("/update")
	public String update(BoardDTO bDto) {
		log.info(" ■■■■■POST■■■■■■ /update (bDto) 게시글이 수정되었습니다");
		log.info(bDto.toString());
		
		if(bDto.getFiles() == null) { // 첨부파일 NO
			bDto.setFilecnt(0);
		} else { // 첨부파일 YES
			log.info("첨부파일 수: " + bDto.getFiles().length);
			bDto.setFilecnt(bDto.getFiles().length);
		}
		
		bService.update(bDto);
		return "redirect:/board/view/" + bDto.getBno();
	}
//=========================================================================================================	
	
	
	
	
	
	
	//view.jsp에서, 답글 버튼 눌렀을때 동작
	@GetMapping("/answer")
	public String answerBoard(BoardDTO bDto, Model model) {
		log.info(" ■■■■■■■■■■■GET 답글 (화면단 액션)");
		bDto = bService.boardView(bDto.getBno());  //bno 를 받아서, 그 값으로 boardView 를 실행
		
		String newContent = "<p style='font-size:20px; font-weight:bold;'>====== 이전 게시글내용 ======</p>" +
				bDto.getView_content() + 
				"<br><p style='font-size:20px; font-weight:bold;'>=================================================</p>";
		bDto.setView_content(newContent);
		
		// 답글을 원하는 게시글의 정보를(1줄) 원함
		model.addAttribute("bDto", bDto);
		model.addAttribute("flag", "answer");
		return "board/register";
	}
	//register.jsp 에서 답글 전부 작성후, 답글 버튼을 눌렀을때
	@PostMapping("/answer")
	public String answerBoard(BoardDTO bDto) {
		log.info(" ■■■■■@POST■■■■■■(/answer) 답글 (데이터 액션)");
		
		// 현재상태: 답글(bno(메인게시글), 타입, 제목, 내용, 작성자)
		log.info(" ■■■■■■답글DTO■■■■■: " + bDto.toString());
		
		// 현재상태: 메인(ALL, ref, re_level, re_step)
		BoardDTO prevDto = bService.boardView(bDto.getBno());
		log.info(" ■■■■■■메인DTO■■■■■: " + prevDto.toString());
		
		
		//첨부파일 출력
		if(bDto.getFiles() == null) { // 첨부파일 NO
			bDto.setFilecnt(0);
		} else { // 첨부파일 YES
			log.info(" ■■■■■첨부파일 수■■■■■■: " + bDto.getFiles().length);
			bDto.setFilecnt(bDto.getFiles().length);
		}
		
		
		// 현재상태: 답글(bno(메인게시글), 타입, 제목, 내용, 작성자,
		//				  ref(메인), re_level(메인), re_step(메인))
		bDto.setRef(prevDto.getRef());
		bDto.setRe_level(prevDto.getRe_level());
		bDto.setRe_step(prevDto.getRe_step());
		
		bService.answer(bDto);
		log.info("■■■■bDto.toString■■■■"+bDto.toString());
		
		// ref, re_step, re_level
		// ref = 그대로 메인게시글 ref C&P
		// re_level = 메인게시글 re_level + 1
		// re_step = 메인게시글 re_step + 1
		return "redirect:/board/view/" + bDto.getBno();
	}
	
	
	//첨부파일
	@PostMapping("/getAttach")
	@ResponseBody
	public List<String> getAttach(int bno) {
		log.info("■■■■■POST■■■■■■ : Board getAttach Action");
		log.info("■■■■■bno■■■■■■ : " + bno);
		return bService.getAttach(bno);
	}
	
	
	
}// class 종료
