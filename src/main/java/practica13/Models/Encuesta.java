package practica13.Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Encuesta {

    @Id
    @GeneratedValue
    private Long id;

    private String cumplieronExpectativas;
    private String dominioDelTema;
    private String instalacionesConfortables;
    private String comentario;


    public Encuesta(String cumplieronExpectativas, String dominioDelTema, String instalacionesConfortables, String comentario) {
        this.cumplieronExpectativas = cumplieronExpectativas;
        this.dominioDelTema = dominioDelTema;
        this.instalacionesConfortables = instalacionesConfortables;
        this.comentario = comentario;
    }

    public Encuesta() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCumplieronExpectativas() {
        return cumplieronExpectativas;
    }

    public void setCumplieronExpectativas(String cumplieronExpectativas) {
        this.cumplieronExpectativas = cumplieronExpectativas;
    }

    public String getDominioDelTema() {
        return dominioDelTema;
    }

    public void setDominioDelTema(String dominioDelTema) {
        this.dominioDelTema = dominioDelTema;
    }

    public String getInstalacionesConfortables() {
        return instalacionesConfortables;
    }

    public void setInstalacionesConfortables(String instalacionesConfortables) {
        this.instalacionesConfortables = instalacionesConfortables;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
}
