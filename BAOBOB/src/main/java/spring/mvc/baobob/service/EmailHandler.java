package spring.mvc.baobob.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.DataSource;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class EmailHandler {

    private JavaMailSender mailSender;
    private MimeMessage msg;
    private MimeMessageHelper msgHelper;

    public EmailHandler() {}

    public EmailHandler(JavaMailSender mailSender) {
        try {
            this.mailSender = mailSender;
            msg = this.mailSender.createMimeMessage();
            msgHelper = new MimeMessageHelper(msg, true, "UTF-8");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public void setSubject(String subject) throws MessagingException {
        msgHelper.setSubject(subject);
    }

    public void setText(String htmlContent) throws MessagingException {
        msgHelper.setText(htmlContent, true);
    }

    public void setFrom(String email, String name) 
                throws UnsupportedEncodingException, MessagingException {
    	System.out.println("******************1111111111111");
        msgHelper.setFrom(email, name);
    	System.out.println("******************2222222222222");
    }

    public void setTo(String email) throws MessagingException {
        msgHelper.setTo(email);
    }

    public void addInline(String contentId, DataSource dataSource) throws MessagingException {
        msgHelper.addInline(contentId, dataSource);
    }

    public void send() {
        mailSender.send(msg);
    }
}