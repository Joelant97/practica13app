package practica13;

import org.apache.logging.log4j.message.SimpleMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import practica13.Utils.email.EmailServiceImpl;

import java.util.Properties;



//@SpringBootApplication
//public class Practica13App {
//    public static void main(String[] args) {
//        ApplicationContext applicationContext = SpringApplication.run(Practica13App.class, args);
//    }
//
//}


@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
public class Practica13App extends SpringBootServletInitializer {
    public static final String USE_HAZELCAST = "true";


    public static void main(String[] args) {

        SpringApplication.run(Practica13App.class, args);
    }

    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername("joelant97@gmail.com");
        mailSender.setPassword("clave");

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");

        return mailSender;
    }

}
