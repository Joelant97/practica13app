package practica13.Utils.email;

import com.mailjet.client.errors.MailjetException;
import com.mailjet.client.errors.MailjetSocketTimeoutException;
import com.mailjet.client.MailjetClient;
import com.mailjet.client.MailjetRequest;
import com.mailjet.client.MailjetResponse;
import com.mailjet.client.ClientOptions;
import com.mailjet.client.resource.Emailv31;
import org.json.JSONArray;
import org.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.util.Properties;

@Component
public class EmailServiceImpl implements EmailService {

    final String APIKey = "ee3d1ce4b3b4d90fec2657fe1911b146";
    final String SecretKey = "820b090f83e75d13fcac862a6808a634";

    @Autowired
    public JavaMailSender emailSender;

    public void sendSimpleMessage(String to, String subject, String text) {
        Properties props = new Properties ();

        props.put ("mail.smtp.host", "in.mailjet.com");
        props.put ("mail.smtp.socketFactory.port", "465");
        props.put ("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put ("mail.smtp.auth", "true");
        props.put ("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance (props,
                new javax.mail.Authenticator ()
                {
                    protected PasswordAuthentication getPasswordAuthentication ()
                    {
                        return new PasswordAuthentication (APIKey, SecretKey);
                    }
                });
        try
        {
            Message message = new MimeMessage (session);
            message.setFrom (new InternetAddress("leonardoaii71@gmail.com"));
            message.setRecipients (Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject ("Your mail from Mailjet");

            message.setText ("Your mail from Mailjet, sent by Java.");
            message.addHeader("X-MJ-TemplateID", "978112");
            message.addHeader("X-MJ-TemplateLanguage", "true");

            Transport.send (message);

        }
        catch (MessagingException e)
        {
            throw new RuntimeException (e);
        }

    }

    public void sendSimpleMessageApi(String to, String name, String password, String subject, String link) throws
        MailjetException, MailjetSocketTimeoutException {
            MailjetClient client;
            MailjetRequest request;
            MailjetResponse response;
            client = new MailjetClient(APIKey, SecretKey, new ClientOptions("v3.1"));
            request = new MailjetRequest(Emailv31.resource)
                    .property(Emailv31.MESSAGES, new JSONArray()
                            .put(new JSONObject()
                                    .put(Emailv31.Message.FROM, new JSONObject()
                                            .put("Email", "20121917@ce.pucmm.edu.do")
                                            .put("Name", "PUCMM"))
                                    .put(Emailv31.Message.TO, new JSONArray()
                                            .put(new JSONObject()
                                                    .put("Email", to)
                                                    .put("Name", name)))
                                    .put(Emailv31.Message.TEMPLATEID, 978112)
                                    .put(Emailv31.Message.TEMPLATELANGUAGE, true)
                                    .put(Emailv31.Message.SUBJECT, "Confirmacion de registro")
                                    .put(Emailv31.Message.VARIABLES, new JSONObject()
                                            .put("confirmation_link", link)
                                            .put("firstname", name))
                                            .put("username", name)
                                            .put("password", password)));
            response = client.post(request);
            System.out.println(response.getStatus());
            System.out.println(response.getData());
        }

    @Override
    public void sendSimpleMessageUsingTemplate(String to, String subject, SimpleMailMessage template, String... templateArgs) {
    }

    @Override
    public void sendMessageWithAttachment(String to, String subject, String text, String pathToAttachment) {
        try {
            MimeMessage message = emailSender.createMimeMessage();
            // pass 'true' to the constructor to create a multipart message
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text);

            FileSystemResource file = new FileSystemResource(new File(pathToAttachment));
            helper.addAttachment("Invoice", file);

            emailSender.send(message);
        } catch (javax.mail.MessagingException e) {
            e.printStackTrace();
        }
    }


}