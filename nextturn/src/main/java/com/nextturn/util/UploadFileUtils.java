package com.nextturn.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UploadFileUtils {
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		// uuid 발급
		UUID uid = UUID.randomUUID(); // abc.txt 라는 파일이 중복될수 있어서 UUID 를 써서, 16자리 랜덤한값을 만들어서 파일이름을 생성해준다 (중복파일이름 해결)
		String savedName = uid.toString() + "_" + originalName;
		// 업로드할 디렉토리 생성
		
		
		//폴더작업 메서드
		String savedPath = calcPath(uploadPath); // calcPath 는 캘린더의 줄임말이고, 아래에 메서드가 만들어져있음
												 //파일이 날짜별로 정렬될 수 있게, 오늘날짜 폴더를 만들어준다. 예)20200408

		//파일작업 
		File target = new File(uploadPath + savedPath, savedName); // 파일 껍데기 만든다. (객체생성)
		// 저장폴더 + 파일이름 조합시킴 ( d:/developer/2020/04/08/asdfe_냐냐냐_abc.txt )
		// UUID
		// uploadPath : d:developer/upload
		// savePath : 20200408 폴더생성
		// savedName :중복을 해결 할 수 있는 이름

		// 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target); // fileData 는 첨부파일 (파일카피 유틸은 파일을 잘게 쪼개서 복사해주는 역할을 함)
		// 여기까지 해서 local 디렉토리에 파일이 저장됨

		
		
		
		// 파일의 확장자 검사해서 그림이면 썸내일을 만들어야한다.
		// a.jpg / aaa.bbb.ccc.jpg                             라스트인덱스는 0부터 시작
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);
		// lastIndexOf 는 뒤에서부터 . 이 어디있는지 찾는다. 점을 찾으면 점울 포함하여 .jpg의 값이 남음 (확장자 파악용)
		String uploadedFileName = null;
		// 이미지파일은 썸네일 사용
		if (MediaUtils.getMediaType(formatName) != null) {
			// 썸네일 생성
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
								//유저 메서드
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
						      //유저 메서드
		}
		return uploadedFileName;
	}

	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance(); // 오늘날짜 달력을 가져오는 명령어 (자바 지원명령어)

		// \2020                   \
		String yearPath = File.separator + cal.get(Calendar.YEAR);  //오늘날짜에서 년도만 가져와라
		// File.separator 는 구분자이고 구분할때는 / 슬러시를 쓴다. /2020
		// yearPath 에는 /2020이 들어온다

		// \2020\04 만드는거
		String monthPath = yearPath + File.separator // monthPath는 /2020에 + / +
				+ new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); // 이번달을 가져오라고 하면 0부터 인식해서 +1을 해줘야 정확한 달이 나온다
																				// 포맷팅을 00을 해줘야 04 이런식으로 들어온다 (안하면 4만 들어옴)
		// \2020\04\08 만드는거 위에서부터 계속 받아오면서 여기서 완성됨
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		//우리가 만든 makeDir 클래스    
		makeDir(uploadPath, yearPath, monthPath, datePath); // makeDir 도 메서드이다 아래에 만들어줘라.년 월일 은 string ... paths 에서 받음
		//     c:/developer/upload       \2020\04\08   이렇게 하위폴더를 계속 만듬            
		return datePath;

	}// calcPath 메서드 종료

	// 메이크 디랙토리 (폴더 생성)
	private static void makeDir(String uploadPath, String... paths) { // ...은 '동일한 타입'의 매개변수를 여러개 받을수 있게 하는것이다. (스트링 배열같은거)
																		// 첫번째 매개변수는 uploadPath 이고, 두번째 매개변수는 String 이고배열로 만든다
		// 디렉토리가 존재하면 skip // 위에서 쓴 여기에 makeDir(uploadPath, yearPath, monthPath,
		// datePath); 이게 들어온다
		
		// 년월일의 [일]이 오늘날짜 폴더가 있는지 체크하는 if문
		//오늘날짜 폴더가 생성되어 있다면, if를 탄다
		//                 3-1=2  결과>> paths[2] = datePath(오늘일자)  
		if (new File(paths[paths.length - 1]).exists()) {
			// paths 마지막값을 꺼내옴 (0부터 시작하므로 -1해줘야함) .exists 는 파일이 있을때 하라는말.
			return;  //return을 만나면 아래로 안가고 mkDir 메서드 종료
		}
		
		//년 월 일 폴더를 만드는 작업을 하는 포문 (년폴더 만들고 > 월폴더 만들고 > 일폴더 만들고 (3회 반복) String...paths가 3개니까
		// 여기 포문을 타면 오늘날짜 폴더를 생성함 (있으면 if를 안타서 폴더 생성을 안함) (하루에 처음올린 사람이 첫폴더를 만들고, 그걸 모두가 사용함)
		for (String path : paths) {  //반복문  (for int i=0, i<10, i++)
									 //		for(path가 3개니까 3회반복)
			File dirPath = new File(uploadPath + path);  //new File 은 경로를 확인하는 녀석
			if (!dirPath.exists()) {
				dirPath.mkdir(); // 디렉토리 생성
			}
		}
	}

	
	
	
	
	
	
	// 이미지가 아니면 아이콘 생성 (경로만 제대로 만들면됨)
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
		// 아이콘의 이름
		String iconName = uploadPath + path + File.separator + fileName;
		// 아이콘 이름을 리턴
		// File.separatorChar : 디렉토리 구분자
		// 윈도우 \, 유닉스(리눅스) /
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}// replace 는 치환하라는 말 (윈도우는 \이걸 쓰는데 이걸 / 이거로 바꾸라는말)
		// 이경로 치환한다 C:\developer\ upload/2020/04/08/1kljwoiv232134_abc.txt

	
	
	
	
	
	
	
	
	
	
	// 이미지일 경우 썸네일 생성 (아아콘 생성보다 복잡)
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		// 이미지를 읽기 위한 버퍼
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));// imageIO는 이미지를 읽어들임
		// C:\developer\ upload +/2020/04/08/ 1kljwoiv232134_abc.txt
		// 100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		// Scalr 는 썸네일을 만들어줌( 해상도를 리사이징함, height 를 100으로 맞춰서 자동)  아직 저장하지 않고, 만들기만 했음

		// 썸네일의 이름
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName; // 썸네일 파일에 s_ 를 포함한 이름을 정해줌 (확장자 없음)
		File newFile = new File(thumbnailName); // 파일을 만들어라 
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1); // formatName 이 확장자 만들어줌 (png 나 jpg )
		// 썸네일 생성
		
		//위에서 작업된걸 파일로 생성함
		ImageIO.write(destImg, formatName.toUpperCase(), newFile); // toUpperCase 는 대문자로 바꿈 newFile 은 썸네일 이름
		// 썸네일의 이름을 리턴함
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/'); // replace 는 치환하라는 말 (윈도우는
																								// \이걸 쓰는데 이걸 / 이거로
																								// 바꾸라는말)
	}

}// class
