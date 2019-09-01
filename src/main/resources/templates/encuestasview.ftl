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
                <h2>Encuestas</h2>
                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="index.html">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Encuestas</span></li>

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

                    <h2 class="panel-title">Encuestas</h2>
                </header>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="mb-md">
                                <a class="popup-with-form btn btn-primary" href="#encuesta-form">agregar<i class="fa fa-plus"></i></a>
                            </div>
                        </div>
                        <!-- Encuestas Form -->
                        <form id="encuesta-form" class="white-popup-block mfp-hide form-horizontal"
                              action="/encuestas/crear/" method="post" enctype='multipart/form-data'>
                            <div class="row">
                                <div class="col-sm-12">
                                    <h3>Formulario Encuestas</h3>
                                </div>
                            </div>
                            <div class="form-group mt-lg">
                                <label class="col-sm-3 control-label">Cumplieron con las Expectativas?(Nivel:1 al 5)</label>
                                <div class="col-sm-6">
                                    <#--<input type="text" name="cumplieronExpectativas" class="form-control"  required />-->
                                    <select type="text" name="cumplieronExpectativas" class="form-control"  required >
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group mt-lg">
                                <label class="col-sm-3 control-label">Tienen dominio del Tema?(Nivel:1 al 5)</label>
                                <div class="col-sm-6">
                                    <#--<input type="text" name="dominioDelTema" class="form-control"  required />-->
                                    <select type="text" name="dominioDelTema" class="form-control"  required >
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group mt-lg">
                                <label class="col-sm-3 control-label">Las instalaciones son confortables?(Nivel:1 al 5)</label>
                                <div class="col-sm-6">
                                    <#--<input type="text" name="instalacionesConfortables" class="form-control"  required />-->
                                    <select type="text" name="instalacionesConfortables" class="form-control"  required >
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group mt-lg">
                                <label class="col-sm-3 control-label">Comentario</label>
                                <div class="col-sm-9">
                                    <input type="text" name="comentario" class="form-control"  required />
                                </div>
                            </div>


                            <div class="row mb-lg">
                                <div class="col-sm-9 col-sm-offset-3">
                                    <button class="btn btn-primary">Guardar</button>
                                    <button type="reset" class="btn btn-default">Limpiar</button>
                                </div>
                            </div>

                        </form>

                    </div>
                    <table class="table table-bordered table-striped mb-none" id="datatable-editable">
                        <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Acciones</th>
                        </tr>
                        </thead>
                        <tbody>
									<#list encuestas as encuesta>
                                    <tr class="gradeX">
                                        <td>${encuesta.getComentario()}</td>
                                        <td class="actions">
                                            <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                            <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                            <a href="#edit-form" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
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
</body>
</html>