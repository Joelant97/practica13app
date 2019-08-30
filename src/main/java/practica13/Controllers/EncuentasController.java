package practica13.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import practica13.Utils.email.EmailServiceImpl;

@Controller
public class EncuentasController {

    @Autowired
    public EmailServiceImpl emailService;

    @GetMapping("/sendmail")
    @ResponseBody
    public String sendemail() {
        emailService.sendSimpleMessage("leonardoaii71@gmail.com", "prueba pucmm", "esto es una prueba test");
        return "sent";
    }


    @GetMapping("/test")
    @ResponseBody
    public String test() {

        return "Now you are connected";
    }
}