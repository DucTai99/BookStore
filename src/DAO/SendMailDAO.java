package DAO;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
public class SendMailDAO {


    public static boolean sendMail(String to, String subject, String text) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("thanhluongtrungit@gmail.com", "trungthanh123");
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
            message.setFrom(new InternetAddress("thanhluongtrungit@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

            message.setSubject(subject);
            message.setText(text);
            Transport.send(message);
        } catch (MessagingException e) {
            return false;
        }
        return true;


    }


}
