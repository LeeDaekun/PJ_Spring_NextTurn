package com.nextturn.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nextturn.domain.BoardDTO;

import com.nextturn.persistence.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardServiceImpl implements BoardService{

	@Autowired  //의존성 주입
	private SqlSession sqlSession;  //서버접속을 위한 SQL세션
	
	private BoardDAO bDao; //DAO 객체 생성
	
	@Autowired
	public void newBoardDAO() {  //이건 이름을 왜이렇게 짓나
		bDao = sqlSession.getMapper(BoardDAO.class);  //DB에 접속해라 SQL문은 뒤로
	}


				
	@Override  //부모메서드와 같은이름을 써야함  //비지니스 단이니까 처리할 작업을 적어야함
	public List<BoardDTO> boardList(String sort_option, String search_option, String keyword, String type, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("sort_option", sort_option);//매개변수를 "sort_option" 맵에 담는다.
		map.put("start", start);			//매개변수를 "start" 맵에 담는다.
		map.put("end", end);				//매개변수를 "end" 맵에 담는다.
		map.put("search_option",search_option);  //키워드 검색에 필요함
		map.put("keyword","%"+keyword+"%");		 //키워드 검색에 필요함
		
		map.put("list_type",type);	//게시글 카테고리
		//DAO의 boardList 에서 작업을 처리하고, 리턴하라
		return bDao.boardList(map);
	}


	//셀렉트된 게시글들을 갯수로(count)로 표시해줌(페이저 사용을 위한것)
	@Override
	public int countArticle(String search_option, String keyword, String type) {
		Map<String, String> map = new HashMap<>();
		map.put("search_option",search_option);  //키워드 검색에 필요함
		map.put("keyword","%"+keyword+"%");      //키워드 검색에 필요함
		map.put("list_type","%"+type+"%");      //키워드 검색에 필요함
		
		
		return bDao.countArticle(map);  //dao의 카운트아티클로 이동
	}



	@Override
	public BoardDTO boardView(int bno) {
		
		return bDao.boardView(bno);
	}



	@Override
	public void increaseViewCnt(HttpSession session, int bno) {
		// now_time: 현재시간
		// plus_time: 조회수 +1 시간
		// now_time - plus_time = 조회수+1증가후 지난시간
		long update_time = 0; // 조회수 +1 증가한 시간
		
		if(session.getAttribute("update_time_"+bno) != null) {
			// 최근에 조회수를 올린 시간
			update_time = (long)session.getAttribute("update_time_"+bno);  //세션에 값을 long 으로 바꿔서, update 타임 담는다
		}
		
		// 현재시간
		long current_time = System.currentTimeMillis();   //시간을 오직 '초(밀리세컨드)'로 계산해버린다.  1000이 1초
		
		// 일정시간이 경과한 후 조회수 증가 처리
		if(current_time - update_time > 24*60*60*1000) {  //1초 x 60 = 60초 / 60초x60은 1시간 / 1시간 x 24는 하루
			// DB에서 조회수 +1 증가
			bDao.increaseViewCnt(bno);
			// 조회수 올린 시간 저장
			session.setAttribute("update_time_"+bno, current_time);  //커렌트 타임
		}
	}


	//뷰에서 게시글 삭제 눌렀을때
	@Transactional  //한번에 모든 bDao를 처리해야함
	@Override
	public void delBoard(int bno) {
		
		bDao.delBoard(bno);  //게시글만 삭제함
		
		//첨부파일 삭제하는것 (DB에서 지우고, 로컬에서도 지워야함)
		bDao.deleteAttach(bno);		//DB에서 첨부파일 삭제
		//기타방법
		// 예 ) tbl_board와 tbl_attach를 relation을 맺고
		// Cascade 작업을 통해 tbl_board에서 해당 게시글 삭제하면,
		// 자동으로 tbl_attach에 해당 게시글 첨부파일 일괄 삭제
		// 즉 첨부파일 DB에서 삭제하는 코드는 작성 안해도 됨!
		
	}


	//게시글 등록
	@Transactional  //한번에 다 처리해야 처리되는 트랜젝션
	@Override
	public void write(BoardDTO bDto) {
		log.info("■■BoardServiceImpl의 Write■■");
		
		//video_code가 값이 안들어온 경우 null을 입력함
		if("".equals(bDto.getVideo_code())){
				bDto.setVideo_code("");
				bDto.setVideo_img("");
				log.info("■변경됨■"+bDto.toString());
		}else {
			log.info("■■썸네일 주소 생성■■");
			//-------------------썸네일 이미지 주소 만들기 -----------------------
			String originalName = bDto.getVideo_code();
			String substring1 = originalName.substring(originalName.indexOf("/embed/")+ 7); 			 //처음부터 검색해서 /embed/가 있는걸 찾고 시작/가 0인데, 7칸 더 버리고 뒤에만 씀
			String substring2 = substring1.substring(0,11); 											 //0~11까지 사용  (숫자 하나만 쓸경우 거기까지 버려버림)
			log.info("■■■ 추출된 유튜브 이미지 주소■■■■"+substring2);
			
			String video_img = "https://img.youtube.com/vi/"+substring2+"/maxresdefault.jpg";  //유튜브 썸네일 주소
			bDto.setVideo_img(video_img);  //완성된 주소를 DTO에 주입
			log.info("■■■ 데이터에 저장된 유튜브 썸네일 코드 ■■■■"+video_img);
			//----------------------------------
		}
		
		//tbl_board에 게시글 등록(type, title, content, writer)
		bDao.write(bDto);
		
		// tbl_attach에 해당 게시글 첨부파일 등록
		String[] files = bDto.getFiles();
		
		if(files == null) {
			return; // 첨부파일 없음, 종료
		}
		for(String name : files) {
			// tbl_attach 테이블에 첨부파일 1건씩 등록
			bDao.addAttach(name);
		}
		
	}


	//게시글 내용 수정
	@Override
	public void update(BoardDTO bDto) {
		//1. 게시글 내용 수정
		bDao.update(bDto);
		
		//2. 해당 게시글 관련 첨부파일 모두 DB에서 삭제(tbl_attach)
		bDao.deleteAttach(bDto.getBno());
		
		// 3.수정시 존재하는 첨부파일 모두 DB에 등록
		String[] files = bDto.getFiles();
		if(files == null) {
			return;
		}
		
		for(String fullName: files) {
			bDao.updateAttach(fullName, bDto.getBno());
		}
		
	}//update 메서드 종료
	
	

	//답글기능 인터페이스
	@Transactional  //한번에 전부 처리하라고 트랜젝션
	@Override
	public void answer(BoardDTO bDto) {
		// 답글 알고리즘
		// Current Status bDto:
		// answer: title, writer, type, content
		// main: bno, ref, re_level, re_step
		
		// 1) re_step을 수정
		//  : ref가 같은 row중에 메인 게시글의
		//    re_step보다 크기가 큰 값을 찾아
		//    전부 +1 => updateStep()
		bDao.updateStep(bDto);
		
		// 2) 답글 DB에 INSERT
		bDto.setRe_level(bDto.getRe_level()+1);
		bDto.setRe_step(bDto.getRe_step()+1);
		bDao.answer(bDto);
	
		
		
		// tbl_attach에 해당 게시글 첨부파일 등록
		String[] files = bDto.getFiles();
	
		if(files == null) {
			log.info("■■■■■■■■■■■■■■ 첨부파일 없음 ■■■■■■■■■■■■■■■");
			return; // 첨부파일 없음, 종료
		}
		for(String name : files) {
			// tbl_attach 테이블에 첨부파일 1건씩 등록
			bDao.addAttach(name);
		}
	}//answer 메서드 종료 (답글)



	@Override
	public List<String> getAttach(int bno) {
		// TODO Auto-generated method stub
		return bDao.getAttach(bno);
	}

}
