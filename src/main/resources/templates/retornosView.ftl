<!doctype html>
<html class="fixed">
<#include "header.ftl">
<body>
<section class="body">
    <!-- start: header -->
    <#include "body_header.ftl">
    <!-- end: header -->

    <div class="inner-wrapper">
        <!-- start: sidebar -->
        <#include "sidebar.ftl">
        <!-- end: sidebar -->

        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Clientes</h2>
                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="index.html">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Tables</span></li>
                        <li><span>Editable</span></li>
                    </ol>
                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <!-- start: page -->
            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="fa fa-caret-down"></a>
                        <a href="#" class="fa fa-times"></a>
                    </div>

                    <h2 class="panel-title">No Retornados</h2>
                </header>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <section class="panel">
                                <header class="panel-heading panel-heading-transparent">
                                    <div class="panel-actions">
                                        <a href="#" class="fa fa-caret-down"></a>
                                        <a href="#" class="fa fa-times"></a>
                                    </div>
                                    <h2 class="panel-title">Estado de alquileres</h2>
                                </header>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped mb-none">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Cliente</th>
                                                <th>Equipo</th>
                                                <th>Fecha de inicio</th>
                                                <th>Dias para la entrega</th>
                                                <th>Opciones</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <#list alquileres as object>
                                                <tr>
                                                    <td>${object[0]}</td>
                                                    <td>${object[1]}</td>
                                                    <td>${object[2]}</td>
                                                    <td>${object[3]}</td>
                                                    <td>${object[4]}</td>
                                                    <td class="actions">
                                                        <a href="/alquileres/entrega/${object[0]}"
                                                           class="on-editing save-row "
                                                           title="Marcar como entregado"><span class="label label-success">Entregar</span></a>
                                                    </td>
                                                </tr>
                                            </#list>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </section>
            <!-- end: page -->
        </section>
    </div>
    <#include "sidebar-right.ftl">
</section>

<div id="dialog" class="modal-block mfp-hide">
    <section class="panel">
        <header class="panel-heading">
            <h2 class="panel-title">Are you sure?</h2>
        </header>
        <div class="panel-body">
            <div class="modal-wrapper">
                <div class="modal-text">
                    <p>Are you sure that you want to delete this row?</p>
                </div>
            </div>
        </div>
        <footer class="panel-footer">
            <div class="row">
                <div class="col-md-12 text-right">
                    <button id="dialogConfirm" class="btn btn-primary">Confirm</button>
                    <button id="dialogCancel" class="btn btn-default">Cancel</button>
                </div>
            </div>
        </footer>
    </section>
</div>

<#include "footer.ftl">
<!-- Examples -->
<script src="/assets/javascripts/tables/examples.datatables.editable.js"></script>
<script src="/assets/javascripts/ui-elements/examples.lightbox.js"></script>
<script>
    var equipoActual;
    var equipo;
    var ids = [];

    $(function () {
        $('#add').prop('disabled', true);
    });

    $("#equipo").change(function () {
        equipo = document.getElementById("equipo");
        var equipo_value = equipo.options[equipo.selectedIndex].value;
        var url = "/equipos/" + equipo_value + "/"
        $.getJSON(url, function (data) {
            if (data != null)
                equipoActual = data;

        }).done(function () {
            var picture = '<img src="data:image/jpeg;base64,' + equipoActual.imagen
                + '" class="rounded mx-auto d-block" style="' +
                'height: 200px;' +
                'max-width: 200px;' +
                'margin: auto;' +
                'display: block;">';
            $('#foto').html(picture);

        }).fail(function () {
            console.log("error al recibir equipo");
        });

        if (equipoActual.existencia == 0) {
            $('#add').prop('disabled', true);
        } else {
            $('#add').prop('disabled', false);
        }
    });

    function setup() {
        "use strict";
        if (equipoActual !== null) {
            var markup = "<tr><td>" + equipoActual.id + "</td><td>" + equipoActual.nombreEquipo + "</td><td>" + equipoActual.precio + "</td></tr>";
            $("#carrito tbody").append(markup);
            equipo.selectedIndex = 0;
            ids.push(equipoActual.id);
            $('#foto').html("");
            $('#add').prop('disabled', true);
            document.getElementById('ids[]').value = ids;
        }
    }

</script>
</body>
</html>