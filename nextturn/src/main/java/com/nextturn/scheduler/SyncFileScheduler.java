package com.nextturn.scheduler;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.nextturn.domain.AttachDTO;
import com.nextturn.persistence.BoardDAO;
import com.nextturn.util.MediaUtils;

import lombok.extern.slf4j.Slf4j;

// 게시글 첨부파일 사용시
// 로컬에 저장된 첨부파일과
// DB에 저장된 첨부파일 이름이
// 매칭이 안되는 경우 아무도 사용하지 않는 파일
// 고로 로컬에서 삭제!!!
// 하루에 한번씩 새벽시간에 전날 로컬첨부파일 폴더를 대상으로

@Slf4j
@Component  //(@Component @Service @Repository @Controller)  IOC의 기본적인 기능을 컴포넌트가 한다 (IOC 의 기본값 같은거)
public class SyncFileScheduler {
	@Autowired
	private SqlSession sqlSession;
	
	private BoardDAO bDao;
	
	@Autowired
	public void newBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);  //DAO랑 boardMapper 랑 연결시켜주는거
	}
	
	String uploadPath = "C:/developer/upload";
	

	
	// 매일 새벽 2시에 첨부파일 목록과 DB를 비교해서
	// DB에 없는 첨부파일을 로컬 디렉토리에서 삭제
	@Scheduled(cron = "0 0 16 * * *")  //초 분 시 일 월 년도   (이 시간이 되면 이 메서드를 실행함)
	public void checkFiles() throws Exception {
		log.warn("File Check Task run .................");
		log.warn("" + new Date());
		
		// DB에 등록되어 있는 첨부파일 목록 불러오기
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		
		// 오늘 날짜 가져오기 ex) 2020-04-16
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1); //테스트할때 주석처리하고 하세요
	
		log.info("어제날짜: " + sf.format(cal.getTime()));
		List<AttachDTO> fileList = bDao.getOldFiles(sf.format(cal.getTime()));  //어제날짜의 첨부파일이 담김
		
//		for(AttachDTO one : fileList) {
//			log.info(one.toString());
//		}
		
		// fileList에 담긴 이름
		// fullname = /2020/04/16/s_2dbe0701-ff66-4254-8223-53b6a28d24f0_yoojeong.jpg
		// fileListPaths = C:/developer/upload/2020/04/16/s_2dbe0701-ff66-4254-8223-53b6a28d24f0_yoojeong.jpg
		
//		fileList[0] = ab.txt
//		fileList[1] = dd.txt
//		
//		stream(ab.txt, dd.txt)
//		
//		map(c:/upload/ab.txt, c:/upload/dd.txt)
//		
//		collect()
//		fileListPaths[0] = c:/upload/ab.txt
//		fileListPaths[1] = c:/upload/dd.txt
		
		//한줄이다 잘읽어라 (자르고, 조립하고 집어넣고, stream, map, collect 가 한세트)
		List<Path> fileListPaths = fileList.stream()  //파일 리스트에서 하나씩 꺼내온다
					.map(dto -> Paths.get(uploadPath+dto.getFullname()))  //여기서 나온 맵은 경로를 조립하는 그런것이다  c:/developer/upload/s_adfefaefg_aa.txt
//					.map(sumPath(fullname))	// 람다식 안썼을때
					.collect(Collectors.toList());  //집어넣고 (map을 통해서 처리한 결과를 리스트에 집어넣어라)
		// 파일목록: 파일, 썸네일 이미지
		
		// 이미지 파일이면 DB에 썸네일 이미지파일이 등록돼있기 때문에
		// 파일목록에 원본이미지 파일도 등록
		for(AttachDTO avo : fileList) {
			String fileName = avo.getFullname();
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);  //확장자만 정확하게 잘라내기
			MediaType mType = MediaUtils.getMediaType(formatName);  //txt 면 이미지 파일이 아니니까 null 이 들어옴
			
			//DB에는 s_ 썸네일 파일이름만 저장되있어서, 이 과정으로 원본파일 경로를 만들어줌
			if(mType != null) {
				String front = fileName.substring(0, 12);
				//db에 파일 이름이 /2020/04/16/s_7d8fcbdb-2991-4515-9f44-afa285fe0f91_110_104.png 이런식이니 12까지 자르면
				// front= /2020/04/16/ 서브스트링 0~12까지면 이것만 가져옴 (12까지면 11까지만 씀)
				
				// end = 7d8fcbdb-2991-4515-9f44-afa285fe0f91_110_104.png 
				//s_다음에 있는것들 싹다 가져옴 (s_ 앞에 있는거는 버림)
				String end = fileName.substring(14); //14번째 뒤에 있는것들만 사용함 (앞에꺼는 다 버림)
				
				// File.separatorChar : 유닉스 / 윈도우즈 \
				fileListPaths.add(Paths.get(uploadPath+(front+end).replace('/', File.separatorChar)));
				//         C:/developer/upload +/2020/04/16/ + 7d8fcbdb-2991-4515-9f44-afa285fe0f91_110_104.png
				// 그다음에 /를 \로 전부 변환
			}
		}
		
		// 파일목록: 파일, 원본이미지, 썸네일 이미지
		fileListPaths.forEach(p -> log.info("" + p));  //람다식 함수이다.
		       //  fileListPaths를 p에 저장하고, p를 가지고. log.info를 실행시킴
				//로그에는 원본파일이름과 썸네일 파일이름이 찍힘
		
		// 하루 전날 첨부파일 저장 폴더 지정
		File targetDir = Paths.get(uploadPath, getFolderYesterday()).toFile();  //getFolderYesterday 메서드 실행
		
		// 디렉토리의 파일목록(디렉토리 포함)을 File배열로 반환
		// DB 첨부파일 목록과 하루전폴더의 첨부파일과 매칭!
		// -> DB에 없는 첨부파일 목록 = 삭제 목록 생성
		// contains는 비교하는게 아니라 포함되어있는지를 보는것
		// equal이 아니라 IN이다
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		//파일배열에  
		
		// DB에 등록되지 않은 첨부파일 삭제 시작!
		log.warn("==================================================");
		for(File file : removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
	}
	
//	public static String sumPath(String fullname) {	// 람다식 안썼을때
//		return Paths.get(uploadPath+fullname);
//	}
	
	
	
	// 하루 전날 파일 목록 가져오기
	private String getFolderYesterday() {
		// format 형식 생성
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		// 오늘 날짜 가져오기 ex) 2020-04-16
		Calendar cal = Calendar.getInstance();

		// 오늘 날짜에서 -1해서 어제로 설정
		cal.add(Calendar.DATE, -1);
		
		// 어제날짜 yyyy-MM-dd로 설정 ex) 2020-04-15
		String str = sf.format(cal.getTime());
		// File.separator은 \ 또는 /로 파일 경로를 분리
		// 2020-04-15을 2020\04\15으로 변경
		
		return str.replace("-", File.separator);  //  '\' 여긴 윈도우니까
	}
	
	
	
	
}
