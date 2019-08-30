package practica13.views;

import practica13.Models.Encuesta;
import practica13.Models.Usuario;
import practica13.Services.EncuestaService;
import org.springframework.beans.factory.annotation.Autowired;


/*
@Route("encuesta")
public class EncuestaView extends VerticalLayout implements BeforeEnterObserver {
    public EncuestaView(@Autowired EncuestaService encuestaService) {
        NumberField pregunta1 = new NumberField("Las charlas cumplieron sus expectativas?");
        pregunta1.setValue(1d);
        pregunta1.setMin(1);
        pregunta1.setMax(5);
        pregunta1.setHasControls(true);
        pregunta1.setStep(1);
        pregunta1.setWidth("30%");

        NumberField pregunta2 = new NumberField("Los Expositores demostraron dominio del tema?");
        pregunta2.setValue(1d);
        pregunta2.setMin(1);
        pregunta2.setMax(5);
        pregunta2.setHasControls(true);
        pregunta2.setStep(1);
        pregunta2.setWidth("30%");

        NumberField pregunta3 = new NumberField("Las instalaciones eran confortables:");
        pregunta3.setValue(1d);
        pregunta3.setMin(1);
        pregunta3.setMax(5);
        pregunta3.setHasControls(true);
        pregunta3.setStep(1);
        pregunta3.setWidth("30%");

        TextField comentario = new TextField();
        comentario.setLabel("Algun comentario");
        comentario.setPlaceholder("Escriba aqui..");
        comentario.setWidth("30%");
        comentario.setHeight("10%");
        Notification notification = new Notification(
                "Encuesta enviada", 3000);
        Button enviar = new Button("Enviar respuestas");
        enviar.addClickListener(event -> {
            Encuesta encuesta = new Encuesta();
            encuesta.setCumplieronExpectativas(pregunta1.getValue().intValue());
            encuesta.setDominioDelTema(pregunta2.getValue().intValue());
            encuesta.setInstalacionesConfortables(pregunta3.getValue().intValue());
            encuesta.setComentario(comentario.getValue());
            encuestaService.crearEncuesta(encuesta);
            notification.open();
        });


        setAlignItems(Alignment.CENTER);
        Button logout = new Button("Logout");
        logout.setIcon(VaadinIcon.SIGN_OUT.create());
        logout.addClickListener(event -> {
            VaadinSession.getCurrent().getSession().setAttribute("usuario", null);
            getUI().get().navigate("");
        });
        add(new H1("Encuesta"), pregunta1, pregunta2, pregunta3, comentario, enviar, logout);

        //panel de admin
        Button adminPanel = new Button("Panel de Admin");
        adminPanel.addClickListener(event -> getUI().get().navigate("graphs"));
        if (VaadinSession.getCurrent().getSession().getAttribute("usuario") != null) {
            Usuario usuario = (Usuario) VaadinSession.getCurrent().getSession().getAttribute("usuario");
            if (usuario.isAdmin()) {
                add(adminPanel);
            }
        }

    }

    @Override
    public void beforeEnter(BeforeEnterEvent event) {
        if (VaadinSession.getCurrent().getSession().getAttribute("usuario") == null)
            event.forwardTo("");
    }
}*/
