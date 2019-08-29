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
                        <li><span><@spring.message "alquileres"/></span></li>
                    </ol>

                </div>
            </header>

            <!-- start: page -->
            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="fa fa-caret-down"></a>
                        <a href="#" class="fa fa-times"></a>
                    </div>

                    <h2 class="panel-title"><@spring.message "alquileres"/></h2>
                </header>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="mb-md">
                                <a class="popup-with-form btn btn-primary" href="#shop"><@spring.message "agregar"/> <i
                                            class="fa fa-plus"></i></a>
                            </div>
                        </div>
                        <!-- Equipos Form -->
                        <div id="shop" class="white-popup-block mfp-hide">
                            <form id="alquiler-form" class=" form-horizontal" method="post" action="/alquileres/despachar/">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h3><@spring.message "dashboard"/></h3>
                                    </div>
                                </div>
                                <div class="form-group mt-lg">
                                    <label class="col-sm-3 control-label">Cliente</label>
                                    <div class="col-sm-9">
                                        <select id="client" name="client" class="form-control"
                                                style="width: 100%;" tabindex="-1" aria-hidden="true"
                                                required>
                                            <option selected="selected">Seleccionar Cliente</option>
                                            <#list clientes as cliente>
                                                <option value="${cliente.getId()}">${cliente.getNombre()}</option>
                                            </#list>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group mt-lg">
                                    <label class="col-sm-3 control-label">Fecha de entrega</label>
                                    <div class="col-sm-9">
                                        <div class="">
                                            <input id="entregadatepicker" name="fechaentrega"
                                                   class="form-control pull-right" type="date" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Equipo</label>
                                    <div class="col-sm-5">
                                        <select id="equipo" name="equipos"
                                                class="select2 select2-hidden-accessible form-control">
                                            <option value="">Seleccionar equipo</option>
                                            <#list equipos as equipo>
                                                <option value="${equipo.getId()}">${equipo.getNombreEquipo()}</option>
                                            </#list>
                                        </select>
                                    </div>
                                    <label class="col-sm-2 control-label">Cantidad</label>
                                    <div class="col-sm-2">
                                        <input id="cantidad" name="cantidad" type="number" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group mt-lg">
                                    <input type="hidden" id="cant[]" name="cant[]">
                                    <input type="hidden" id="ids[]" name="ids[]">
                                </div>

                                <div class="form-group my-2">
                                    <div class="col-md-12 my-2 ">
                                        <button type="button" id="add" name="agregar" onclick="setup()"
                                                class="btn btn-primary form-control">+
                                        </button>
                                    </div>
                                </div>

                                <div id="ran-out-alert" class="alert alert-danger" style="display: none;">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×
                                    </button>

                                </div>

                                <div class="row my-3">
                                    <div id="foto" name="foto"></div>
                                </div>
                                <div class="row my-2">
                                    <div class="table-responsive table-bordered card">
                                        <table id="carrito" name="carrito" class="table">
                                            <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th><@spring.message "nombre"/></th>
                                                <th><@spring.message "preciodiario"/></th>
                                                <th><@spring.message "cantidad"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button id="submitB" type="button" class="btn btn-info" data-backdrop="true"><@spring.message "confirmar"/></button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <table class="table table-bordered table-striped mb-none" id="datatable-editable">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th><@spring.message "cliente"/></th>
                            <th><@spring.message "equipo"/></th>
                            <th><@spring.message "estado"/></th>
                            <th><@spring.message "acciones"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list alquileres as alquiler>
                            <tr class="gradeX">
                                <td class="text-center">${alquiler.getId()}</td>
                                <td class="text-center">${alquiler.getCliente().getNombre()} ${alquiler.getCliente().getApellido()}</td>
                                <td class="text-center">${alquiler.getEquipo().getNombreEquipo()}</td>
                                <#if alquiler.getEstado()  == "Pendiente">
                                    <td><span class="label label-warning">${alquiler.getEstado()}</span></td>
                                <#elseif alquiler.getEstado()  == "Entregado" >
                                    <td><span class="label label-success">${alquiler.getEstado()}</span></td>
                                </#if>
                                <td class="actions">
                                    <a href="/alquileres/entrega/${alquiler.getId()}" class="on-editing save-row"
                                       title="Marcar como entregado"><i class="fa fa-check-circle"></i></a>
                                    <a href="#edit-form" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                    <a href="/alquileres/eliminar/${alquiler.getId()}" class="on-default remove-row">
                                        <i class="fa fa-trash-o"></i></a>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- end: page -->
        </section>
    </div>
    <#include "sidebar-right.ftl">
</section>

<#include "footer.ftl">
<!-- Examples -->
<script src="/assets/javascripts/tables/examples.datatables.editable.js"></script>
<script src="/assets/javascripts/ui-elements/examples.lightbox.js"></script>
<script>
    var equipoActual = {};
    var clientActual = {};
    var alquileres = [];
    var alquilerActual = {};

    $(function () {
        $('#add').prop('disabled', true);
    });

    $("#equipo").change(function () {
        var equipo = document.getElementById("equipo");
        var equipo_value = equipo.options[equipo.selectedIndex].value;
        if (equipoActual != null && equipo_value != equipoActual.id) {
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
        }
    });

    $("#client").change(function () {
        var client_value = document.getElementById("client").value;
        if (client_value != clientActual.id) {
            var url = "/clientes/" + client_value + "/"
            $.getJSON(url, function (data) {
                if (data != null)
                    clientActual = data;
            }).done(function () {

            }).fail(function () {
                console.log("error al recibir client");
            });
        }
    });

    $("#submitB").click(function (e) {
        e.preventDefault();
        $.ajax({
            url: '/alquileres/despachar/',
            method: 'POST',
            contentType: 'application/json',
            headers: {
                Accept: "text/plain;charset=utf-8",
            },
            data: JSON.stringify(alquileres),

        }).success(function(data, textStatus){
            if (data) {
                // data.redirect contains the string URL to redirect to
                window.location.href = data;
            }

        });
    });

    function setup() {
        "use strict";
        var cantidad = $('#cantidad').val();
        if (equipoActual.id && clientActual.id && $('#entregadatepicker').val()) {
            if (cantidad <= equipoActual.existencia && cantidad > 0) {
                equipoActual.existencia -= cantidad;
                alquilerActual = {
                    'cliente': clientActual,
                    'equipo': equipoActual,
                    'fechaFinAlquiler': $('#entregadatepicker').val(),
                    'cantidad': cantidad,
                    'costo': equipoActual.precio,
                    'estado': "Pendiente",
                    'total': null,
                    'subtotal': null,
                    'deleted': false,
                };
                alquileres.push(alquilerActual);

                var markup = "<tr>" +
                    "<td>" + equipoActual.id + "</td>" +
                    "<td>" + equipoActual.nombreEquipo + "</td>" +
                    "<td>" + equipoActual.precio + "</td>" +
                    "<td>" + cantidad + "</td>" +
                    "</tr>";
                $("#carrito tbody").append(markup);
                equipo.selectedIndex = 0;
                $('#foto').html("");
                $('#add').prop('disabled', true);
            } else {
                var text = '<strong>Oh snap!</strong> Ya no quedan tantas. Solo hay ' + equipoActual.existencia + ' unidades disponibles';
                $('#ran-out-alert').append(text);
                $('#ran-out-alert').show();
            }
        }
        else {
            var text = '<strong>No tan rapido!</strong> primero debes seleccionar el cliente, equipo y la fecha de entrega ';
            $('#ran-out-alert').append(text);
            $('#ran-out-alert').show();
        }
    }
</script>
</body>
</html>