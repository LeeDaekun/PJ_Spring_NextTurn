package com.nextturn.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nextturn.service.board.BoardService;
import com.nextturn.util.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {

	@Autowired
	BoardService bService;
	
	//업로드 디렉토리 servlet-context.xml에 설정되어 있
	@Resource(name = "uploadPath")  //리소스는 이름으로 가져온다 (이름에 있는 값을 그대로 갔다주세요)
	String uploadPath;
	
	// 파일첨부 페이지로 이동
		@GetMapping("/upload/uploadAjax")
		public String uploadAjax() {
			return "/upload/uploadAjax";
		}
	
		// Upload File 멀티파트파일에 Save
		@ResponseBody
		@PostMapping(value="/upload/uploadAjax", produces="text/plain;charset=utf-8")  //파일을 utf 8로 받자 produces 문을 안써도 되긴하지만, 깨진다면 써줘야한다
		  //ResponseEntity
		public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{  //멀미파트 파일로 받아야 한다 , throws Exception 은 예외처리를 던진다는말
			// 업로드한 파일 정보와 Http 상태 코드를 함께 리턴
			
			                      
			return new ResponseEntity<String> (UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
			// 자바 객체 생성하면 리턴시켜라  (이거랑 같음 ResponseEntity re = new ResponseEntity();)
			//new ResponseEntity 는 객체생성 1회용으로 해서 바로 보내려고 적음
			// < > 는 제네릭이고, 용도는 <> 여기에 들어오는 값들을 체크한다.
			//<String> 이면 new ResponseEntity 에 무조건 스트링만 들어올수 있다. (타입을 강하게 체크하는 역할. 유효성체크랑 비슷)
			
			//uploadPath = C:/deleloper/upload  를 의미함
			//file. 은 첨부파일 하나를 의미함
			//file.getOriginalFilename(), 은  오리지널 파일 이름만 가져온다.
			//file.getBytes(), 은 첨부파일의 크기를 알려준다. (ajax 끝나고 뷰단 갈때 uploadpath 보낸다)
			//HttpStatus.OK 는 성공했다고 전송한다. (http의 상태는 ok는 숫자로 200이 전송된다) (400은 서버가 고장(백엔드 스프링코드 이상) , 500에러는 뷰단 고장(jsp를봐야한다)
			//
			
			
		}
	
	
}//class 종료
