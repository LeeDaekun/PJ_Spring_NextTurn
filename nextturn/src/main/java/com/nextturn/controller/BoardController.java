package com.nextturn.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
	/* 처음혼자서 시도했던 방법 
	 * @GetMapping("/list2") // 게시판 띄우기 public String freeBoard(Model model) { //
	 * DTO에서 자료를 가져와서 list 띄워라 log.info(">>>>> Get 전송 _ board/list 게시판 호출");
	 * 
	 * model.addAttribute("board_item", bService.boardList()); //
	 * model.addAttribute("뷰단item 이름", bService.서비스에 메서드명());
	 * 
	 * return "board/list"; }
	 */
	
	//선생님이 알려준방법
	@GetMapping("/list")  //게시판 띄우기
	public String list(
			@RequestParam(defaultValue="1") int curPage,			//게시판은 기본적으로 페이지1부터 시작한다
			@RequestParam(defaultValue="new") String sort_option,	//게시판은 최신순 정렬을 기본으로 함 (쿼리스트링 ?sort_option=new
			@RequestParam(defaultValue="all") String search_option,
			@RequestParam(defaultValue="") String keyword,
			Model model) {   //DTO에서 자료를 가져와서 list 띄워라	
		
		
		log.info(">>>> Get: 보드리스트 페이지 띄움");
		
		// 게시글 갯수 계산            //게시글을 '보드'라고도 하고 '아티클'이라고도한대 회사마다 다름
		int count = bService.countArticle(search_option, keyword);  
				//여기에 SQL에서 조회한 게시글 갯수가 담겨옴
		
		//페이지 관련 설정  (URL에 ?curPage=1 이런식으로 쓸수 있다)
		Pager pager = new Pager(count, curPage);  //게시글15개  페이지는1페이지 기본값
					//생성하면서, public Pager를 한번실행해서 기본준비를 마침
		
		int start = pager.getPageBegin();  //Pager에 담긴 값을 가져옴
		int end = pager.getPageEnd();		//Pager에 담긴 값을 가져옴
		List<BoardDTO> list = bService.boardList(sort_option, search_option, keyword, start, end);  //서비스작업 처리한 결과를 list 에 담음

		HashMap<String,Object> map = new HashMap<>();  //보내야될 데이터가 많아서, 바로 보내지않고 해쉬맵을 쓴다
		map.put("list", list);    //<BoardDTO> list를 ▶ 해쉬맵 "list"에 담는다
		
		map.put("count", count);  //리스트 count를 ▶ 해쉬맵 "count"에 담는다
		map.put("pager", pager);  //
		map.put("sort_option", sort_option); //스트링 sort_option을 ▶ 해쉬맵 "sort_option"에 담는다
		//정렬 옵션 (정렬 옵션은 페이지가 넘어갈때마다 항상 따라다녀야한다. 안그러면 첫페이지만 정렬되고 말아버리니까)
		map.put("search_option", search_option); //검색옵션?
		map.put("keyword", keyword);  //사용자가 검색한 키워드
		
		model.addAttribute("map",map);  //해쉬맵 map을, 모델"map"에 담는다 (모델은 화면단에 데이터를 전달하는 수단)
		
		return "board/list";  //맵데이터를 리스트로 넘기고, 화면단을 리스트로 결정함
	
	}
}
