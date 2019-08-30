

import practica13.Models.Encuesta;
import practica13.Models.Usuario;
import practica13.Services.EncuestaService;
import org.springframework.beans.factory.annotation.Autowired;

///*
//@Route("graphs")
//public class GraficosView extends VerticalLayout implements BeforeEnterObserver {
//    public GraficosView(@Autowired EncuestaService encuestaService) {
//
//        //Grafico Pie
//        Chart chart = new Chart(ChartType.PIE);
//        Configuration conf = chart.getConfiguration();
//        conf.setTitle("Promedio de respuesta por pregunta");
//
//        Tooltip tooltip = new Tooltip();
//        tooltip.setValueDecimals(2);
//        conf.setTooltip(tooltip);
//
//        PlotOptionsPie plotOptions = new PlotOptionsPie();
//        plotOptions.setAllowPointSelect(true);
//        plotOptions.setCursor(Cursor.POINTER);
//        plotOptions.setShowInLegend(true);
//        conf.setPlotOptions(plotOptions);
//        int pregunta1 = 0, pregunta2 = 0, pregunta3 = 0;
//        double promedio1 = 0, promedio2 = 0, promedio3 = 0;
//        for (Encuesta encuesta :
//                encuestaService.listarEncuestas()) {
//            pregunta1 += encuesta.getCumplieronExpectativas();
//            pregunta2 += encuesta.getDominioDelTema();
//            pregunta3 += encuesta.getInstalacionesConfortables();
//        }
//        if (encuestaService.listarEncuestas().size() > 0) {
//            promedio1 = (double) (pregunta1 / encuestaService.listarEncuestas().size());
//            promedio2 = (double) (pregunta2 / encuestaService.listarEncuestas().size());
//            promedio3 = (double) (pregunta3 / encuestaService.listarEncuestas().size());
//        }
//
//        DataSeries series = new DataSeries();
//        DataSeriesItem chrome = new DataSeriesItem("Las charlas cumplieron sus expectativas?", promedio1);
//        chrome.setSliced(true);
//        chrome.setSelected(true);
//        series.add(chrome);
//        series.add(new DataSeriesItem("Los Expositores demostraron dominio del tema?", promedio2));
//        series.add(new DataSeriesItem("Las instalaciones eran confortables:", promedio3));
//        conf.setSeries(series);
//        chart.setVisibilityTogglingDisabled(true);
//        chart.setWidth("40%");
//        chart.setHeight("40%");
//
////        chart.addPointLegendItemClickListener(event -> {
////            showNotification("Legend item click" + " : " + event.getItemIndex()
////                    + " : " + event.getItem().getName());
////        });
//        setAlignItems(Alignment.CENTER);
//        //Grafico de barras
//        Chart barra = new Chart();
//
//        Configuration configuration = barra.getConfiguration();
//        configuration.setTitle("Suma total de las preguntas");
//        barra.getConfiguration().getChart().setType(ChartType.BAR);
//
//        configuration.addSeries(new ListSeries("Pregunta 1", pregunta1));
//        configuration.addSeries(new ListSeries("Pregunta 2", pregunta2));
//        configuration.addSeries(new ListSeries("Pregunta 3", pregunta3));
//
//        XAxis x = new XAxis();
//        x.setCategories("Pregunta 1", "Pregunta 2", "Pregunta 3");
//        configuration.addxAxis(x);
//
//        YAxis y = new YAxis();
//        y.setMin(0);
//        AxisTitle yTitle = new AxisTitle();
//        yTitle.setText("Rating");
//        yTitle.setAlign(VerticalAlign.HIGH);
//        y.setTitle(yTitle);
//        configuration.addyAxis(y);
//
//        Tooltip tooltip2 = new Tooltip();
//        configuration.setTooltip(tooltip2);
//
//        PlotOptionsBar plotOptions2 = new PlotOptionsBar();
//        DataLabels dataLabels = new DataLabels();
//        dataLabels.setEnabled(true);
//        plotOptions2.setDataLabels(dataLabels);
//        configuration.setPlotOptions(plotOptions2);
//
//        //Tabla de datos de encuestas
//        Grid<Encuesta> encuestasValores = new Grid<>();
//        encuestasValores.setItems(encuestaService.listarEncuestas());
//        encuestasValores.addColumn(Encuesta::getId).setHeader("ID");
//        encuestasValores.addColumn(Encuesta::getCumplieronExpectativas).setHeader("Pregunta 1");
//        encuestasValores.addColumn(Encuesta::getDominioDelTema).setHeader("Pregunta 2");
//        encuestasValores.addColumn(Encuesta::getInstalacionesConfortables).setHeader("Pregunta 3");
//        encuestasValores.setSelectionMode(Grid.SelectionMode.NONE);
//        Dialog dialog = new Dialog();
//        encuestasValores.addItemClickListener(event -> {
//            dialog.removeAll();
//            dialog.add(new H1("Comentario:"));
//            dialog.add(new H3(event.getItem().getComentario()));
//            dialog.open();
//        });
//
//        Button irEncuesta = new Button("Crear encuesta");
//        irEncuesta.addClickListener(event -> getUI().get().navigate("encuesta"));
//        Button logout = new Button("Logout");
//        logout.setIcon(VaadinIcon.SIGN_OUT.create());
//        logout.addClickListener(event -> {
//            VaadinSession.getCurrent().getSession().setAttribute("usuario", null);
//            getUI().get().navigate("");
//        });
//        irEncuesta.addClickListener(event -> getUI().get().navigate("encuesta"));
//
//        add(new H1("Data de las encuestas"), new H3("\n Encuestas respondidas:" + encuestaService.listarEncuestas().size()), irEncuesta, chart, barra, encuestasValores, logout);
//    }
//
//    @Override
//    public void beforeEnter(BeforeEnterEvent event) {
//        Usuario usuario = (Usuario) VaadinSession.getCurrent().getSession().getAttribute("usuario");
//        if (VaadinSession.getCurrent().getSession().getAttribute("usuario") == null)
//            event.forwardTo("");
//        else if (!usuario.isAdmin()) {
//            event.forwardTo("encuesta");
//        }
//    }
//}*/
