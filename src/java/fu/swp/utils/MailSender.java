/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.utils;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author DW
 */
public class MailSender {

    public static Boolean send(String subject, String htmlContent, String recipient) {

//        String recipient = "recipient@gmail.com"; // Change to the recipient's email address
        String sender = "cunplong.1@gmail.com"; // Change to your Gmail address
        String password = "ngxaoomslsghhmdv"; // Change to the app password generated in Step 2

        // Get the email parameters from the request
//        String subject = request.getParameter("subject");
//        String message = request.getParameter("message");
        // Set up the JavaMail properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        // Create a session with the Gmail SMTP server
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, password);
            }
        });

        try {
            // Create a MimeMessage object
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setContent(htmlContent, "text/html");
            mimeMessage.setFrom(new InternetAddress(sender));
            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            mimeMessage.setSubject(subject);
//            mimeMessage.setText(message);

            // Send the email
            Transport.send(mimeMessage);

            // Redirect to a success page
//            response.sendRedirect("success.jsp");
            return true;
        } catch (MessagingException e) {
            // Redirect to an error page
            e.printStackTrace();
            return false;
        }
    }

}
