<html class="fixed">
<#include "header.ftl">
<body>

<section class="body">

    <#include "body_header.ftl">

    <div class="inner-wrapper">
        <#include "sidebar.ftl">
        <section role="main" class="content-body">
            <header class="page-header">
                <h2>User Profile</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="index.html">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Pages</span></li>
                        <li><span>User Profile</span></li>
                    </ol>

                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                </div>
            </header>

            <!-- start: page -->

            <div class="row">
                <div class="col-md-4 col-lg-3">

                    <section class="panel">
                        <div class="panel-body">
                            <div class="thumb-info mb-md">
                                <img src="data:image/jpeg;base64,${cliente.getImagen()}" class="rounded img-responsive"
                                     alt="John Doe">
                                <div class="thumb-info-title">
                                    <span class="thumb-info-inner">${cliente.getNombre()} ${cliente.getApellido()}</span>
                                </div>
                            </div>
                            <div class="widghaet-toggle-expand mb-md">
                                <div class="widget-header">
                                    <h4>Informacion Personal</h4>
                                </div>

                                <div class="widget-content-expanded">
                                    <ul class="simple-todo-list">
                                        <li><span class="text-bold">Cedula:</span> ${cliente.getCedula()}</li>
                                        <li>
                                            <span class="text-bold">Fecha Nacimiento:</span> ${cliente.getFechaNacimiento()}
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <hr class="dotted short">

                        </div>
                    </section>
                </div>
                <div class="col-md-8 col-lg-6">

                    <div class="tabs">
                        <ul class="nav nav-tabs tabs-primary">
                            <li class="active">
                                <a href="#overview" data-toggle="tab">Overview</a>
                            </li>
                            <li>
                                <a href="#edit" data-toggle="tab">Edit</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="overview" class="tab-pane active">
                                <h4 class="mb-md">Historial de Alquileres</h4>

                                <div class="timeline timeline-simple mt-xlg mb-md">
                                    <div class="tm-body">
                                        <#list historial?sort_by("fechaInicioAlquiler") as alquiler >
                                            <ol class="tm-items">
                                                <li>
                                                    <div class="tm-box">
                                                        <p class="text-muted mb-none">${alquiler.getFechaInicioAlquiler()} </p>
                                                        <p>
                                                            <span class="text-bold">ID: </span> ${alquiler.getId()}
                                                            <span class="text-bold">Fecha de entrega: </span> ${alquiler.getFechaFinAlquiler()}
                                                            <#if alquiler.getEstado()  == "Pendiente">
                                                                <span class="label label-warning">Pendiente</span>
                                                            <#elseif alquiler.getEstado()  == "Entregado" >
                                                                <span class="label label-success">Entregado</span>
                                                            </#if>
                                                        </p>
                                                    </div>
                                                </li>
                                            </ol>
                                        </#list>
                                    </div>
                                </div>
                            </div>
                            <div id="edit" class="tab-pane">

                                <form class="form-horizontal" class="white-popup-block mfp-hide form-horizontal"
                                      action="/clientes/modificar/" method="post" enctype='multipart/form-data'>
                                    <h4 class="mb-xlg">Personal Information</h4>
                                    <fieldset>
                                        <input type="text" hidden id="id" name="id" value="${cliente.getId()}">
                                        <div class="form-group mt-lg">
                                            <label class="col-sm-3 control-label">Nombre</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="nombre" class="form-control" required value="${cliente.getNombre()}"/>
                                            </div>
                                        </div>
                                        <div class="form-group mt-lg">
                                            <label class="col-sm-3 control-label">Apellido</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="apellido" class="form-control" required value="${cliente.getApellido()}" />
                                            </div>
                                        </div>
                                        <div class="form-group mt-lg">
                                            <label class="col-sm-3 control-label">Cédula</label>
                                            <div class="col-sm-9">
                                                <input type="text" name="cedula" class="form-control" required value="${cliente.getCedula()}" />
                                            </div>
                                        </div>
                                        <div class="form-group mt-lg">
                                            <label class="col-sm-3 control-label">Fecha de nacimiento</label>
                                            <div class="col-sm-9">
                                                <input type="date" name="fechaNacimiento" class="form-control"
                                                       required value="${cliente.getFechaNacimiento()}" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Foto de perfil</label>
                                            <div class="col-sm-9">
                                                <input type="file" accept="image/png, image/jpeg" id="foto" name="foto" value="${cliente.getImagen()}">
                                            </div>
                                        </div>
                                    </fieldset>
                                    <hr class="dotted tall">
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-md-9 col-md-offset-3">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                                <button type="reset" class="btn btn-default">Reset</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-3">

                    <h4 class="mb-md">Estadisticas</h4>
                    <ul class="simple-card-list mb-xlg">
                        <li class="primary">
                            <h3>${historial?size} </h3>
                            <p>Alquileres hasta ahora.</p>
                        </li>
                    </ul>
                </div>

            </div>
            <!-- end: page -->
        </section>
    </div>

    <#include "sidebar-right.ftl">
</section>

<#include "footer.ftl">

</body>
</html>