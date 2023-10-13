package com.cms.service.common;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

/**
 * 
 * @ClassName MailSenderService
 * @description 메일발송 서비스
 * @author JB
 * @since 2021. 10. 29.
 */
@Service
public class MailSenderService {

	@Autowired private JavaMailSender mailSender;
	
	public void sendMail(String subject, String text, String from, String[] toUser) {
		MimeMessage message = mailSender.createMimeMessage(); 
		try{
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setSubject(subject);
			messageHelper.setTo(toUser);
			messageHelper.setFrom("noreply@sample.co.kr", "admin");
			messageHelper.setText(text, true);
			mailSender.send(message);
		}catch(MessagingException e){
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
}
