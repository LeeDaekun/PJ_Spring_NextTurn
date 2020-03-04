package com.nextturn.service.mail;

import javax.servlet.http.HttpServletRequest;

public interface MailService {
	//인증 이메일 전송
	public void mailSendUser(String email, String id, HttpServletRequest request);
	
}
