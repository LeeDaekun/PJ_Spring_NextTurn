package com.nextturn.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nextturn.service.board.BoardService;
import com.nextturn.util.MediaUtils;
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
	

	
		// Upload File 멀티파트파일에 Save
		//리퀘스트 맵핑은 Get도 받고 post도 받을수 있다. 리퀘스트 맵핑이 두 맵핑의 업그레이드 버전이다 4버전부터 나왔나
		@ResponseBody
		@RequestMapping(value="/upload/uploadAjax", produces="text/plain;charset=utf-8")  //파일을 utf 8로 받자 produces 문을 안써도 되긴하지만, 깨진다면 써줘야한다
		  //ResponseEntity
		public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{  //멀미파트 파일로 받아야 한다 , throws Exception 은 예외처리를 던진다는말
			// 업로드한 파일 정보와 Http 상태 코드를 함께 리턴
			
		                              //UploadFileUtils 클래스의 uploadFile 호출 (스태틱 메서드는 이렇게 호출만으로도 사용가능)
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
		}
		
		// 이미지 표시 기능
		@ResponseBody // view가 아닌 data 리턴
		@RequestMapping("/upload/displayFile")
		public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
			// 서버의 파일을 다운로드하기 위한 스트림
			InputStream in = null; // java.io
			ResponseEntity<byte[]> entity = null;
			try {
				// 확장자 검사
				String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
				MediaType mType = MediaUtils.getMediaType(formatName);
				// 헤더 구성 객체
				HttpHeaders headers = new HttpHeaders();
				// InputStream 생성
				in = new FileInputStream(uploadPath + fileName);
//					if(mType != null) { // 이미지 파일이면
//						headers.setContentType(mType);
//					} else { // 이미지가 아니면
						fileName = fileName.substring(fileName.indexOf("_") + 1);
						// 다운로드용 컨텐트 타입
						headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
						// 큰 따옴표 내부에 " \" "
						// 바이트배열을 스트링으로
						// iso-8859-1 서유럽언어
						// new String(fileName.getBytes("utf-8"),"iso-8859-1")
						headers.add("Content-Disposition", "attachment; filename=\"" + new String(
									fileName.getBytes("utf-8"), "iso-8859-1") + "\"");
						// headers.add("Content-Disposition"
						// ,"attachment; filename='"+fileName+"'");
//					}
				// 바이트배열, 헤더
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			} finally {
				if(in != null) {
					in.close(); // 스트림 닫기
				}
			}
			return entity;
		}
		
		//첨부파일 part3.
		@ResponseBody
		@PostMapping("/upload/deleteFile")
		public ResponseEntity<String> deleteFile(String fileName) {
			log.info("fileName: " + fileName);
			// fileName: /2020/04/10/s_8419df4a-2395-4507-88dc-a01ac0c8f46a_yoojeong.jpg (span태그의 data-src)
			
			// 확장자 검사
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);  //파일네임에서 뒤에서부터 .을 찾아서 jpg만 남기고 앞에 다 버림
			
			//확장자 확인하기 이미지인지 일반파일인지 보려고
			MediaType mType = MediaUtils.getMediaType(formatName); //클래스확인 MediaUtils.getMediaType(formatName)
			if(mType != null) { // 확장자가 이미지 파일이면 원본이미지 삭제
				String front = fileName.substring(0, 12); //0~11번까지 사용하고, 나머지는 버림 _front: /2020/04/10/ 
				String end = fileName.substring(14);  //14번 이후부터만 사용 (14이전은 버림) ____end: 8419df4a-2395-4507-88dc-a01ac0c8f46a_yoojeong.jpg
				// File.separatorChar : 유닉스 / 윈도우즈\
				new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
				// new File   (c://developer/upload/ +  2020/04/10/ + 8419df4a-2395-4507-88dc-a01ac0c8f46a_yoojeong.jpg 
				// replace 하면  c:\\developer\ upload\2020\04\10\8419df4a-2395-4507-88dc-a01ac0c8f46a_yoojeong.jpg (슬리시를 역슬러시로)
				// delete >> c:\\developer\ upload\2020\04\10\8419df4a-2395-4507-88dc-a01ac0c8f46a_yoojeong.jpg
				// .delete 이제 삭제 (원본 이미지가 삭제됨)______윈도우만 역슬러시를 쓰기때문에 이 작업이 필요함
			}
			// 원본 파일 삭제(이미지이면 썸네일 삭제)
			new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
			// new File(c://developer/upload/2020/04/10/s_8419df4a-2395-4507-88dc-a01ac0c8f46a_yoojeong.jpg)(썸네일 이미지)
			// replace >> c:\\developer\ upload\2020\04\10\s_8419df4a-2395-4507-88dc-a01ac0c8f46a_yoojeong.jpg
			// delete >> c:\\developer\ upload\2020\04\10\s_8419df4a-2395-4507-88dc-a01ac0c8f46a_yoojeong.jpg
			
			// 썸네일이미지 삭제 or 이미지가 아닌 첨부파일 삭제
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
			// ResponseEntity: response의 설정값들을 디테일하게 바꾸고싶을때 사용
		}
		
		
}//class 종료
