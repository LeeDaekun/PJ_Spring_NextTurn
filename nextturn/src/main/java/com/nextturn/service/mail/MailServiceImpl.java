package com.nextturn.service.mail;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


import com.nextturn.persistence.MemberDAO;

@Service   //서버 작업하려면 서비스 붙여줘야하고
public class MailServiceImpl implements MailService {  //implements 가 있어야 @override 를 쓸 수 있다.

	@Autowired
	JavaMailSender mailSender;

	@Autowired
	private SqlSession sqlSession;  //DB작업하는데 필요한거

	private MemberDAO mDao;  //맵퍼랑 연결할때 필요한거

	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}

	// 이메일 난수 생성 메서드
	private String init() {
		Random ran = new Random();   //자바에서 난수를 발생시키는 메서드

		StringBuffer sb = new StringBuffer(); 	// StringBuffer : 문자열처리 효율성때문에 String대신 사용 (스트링과 스트링버퍼의 차이는
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;  //랜덤숫자를 정수 75까지 발생시킨다. 아무거나 숫자 나온거에서 +48을 더한다 (난수 만드는건데 자세히 알 필욘 없다)
			                             //아스키 코드값은 48부터가 문자이다. 그래서 +48을 더한다.
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
			// Ascii 코드 값으로 변형
				sb.append((char) num);  //char 하면 숫자를 강제로 문자로 변환한다 (아스키 코드값 문자로)?
				                        //48~122 사이에 문자가 아닌게 껴있어서, 이런 조건문을 만듬, 문자만 쓰려고
			} else {
				continue;
			}
		} while (sb.length() < size);  //사이즈20 ( 난수가 19개가 되면 빠져나간다)
		if (lowerCheck) {
			return sb.toString().toLowerCase(); //아스키 코드로 바뀐 문자를, 소문자로 전부 바꿔준다.
		}
		return sb.toString();  //스트링버퍼에 있는걸 출력한다.
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;
                                  //false         20
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;  //false
		this.size = size;  //20
		return init();  //함수(기능)
	}
	
	// 회원가입 발송 이메일(인증키 발송)
	@Override   //implements 가 있어야 @override 를 쓸 수 있다.
	public void mailSendUser(String email, String id, HttpServletRequest request) {
		String key = getKey(false, 20); // 길이 20의 난수 생성 getKey는 기능(함수)
		mDao.getKey(id, key); //id가 파라메터1, key는 파라메터2, 맵퍼에서 이렇게 인식하고있음
		// 메일 구조를 만듦 (수신, 목적, 제목, 내용은 x)
		// mime type (String, int 등과 같음) : 동영상, 소리, 사진 등의 파일을 받아주는 타입 
		MimeMessage mail = mailSender.createMimeMessage();  //
		// model1 방식과 비슷
		
		
		//이것이 사용자가 받을 이메일의 내용이다.
		String htmlTxt = "<h2>안녕하세요 PAIKS RECIPE입니다:)</h2><br><br>"
				+"<h3>" + id + "님</h3>" + "<p>인증하기 버튼을 누르시면 PAIKS RECIPE사이트 활동이 가능합니다."
				+ "<a href='http://localhost:8081" + request.getContextPath() + "/member/keyauth?id=" + id + "&key=" + key + "'>인증하기</a></p>"
				+ "( PAIKS RECIPE에 가입하신적이 없다면 무시하셔도 됩니다 )";
		try {
			mail.setSubject("[본인인증] PAIKS RECIPE님의 인증메일입니다.", "utf-8"); // 메일 제목
			mail.setText(htmlTxt,"utf-8", "html"); // 메일 내용(html형식, 한글출력을 위한 utf-8)
			mail.addRecipient(RecipientType.TO, new InternetAddress(email)); // 메일 수신자
			mailSender.send(mail); // 메일발송
		} catch(MessagingException e) {
			e.printStackTrace();
		}
	}
}
