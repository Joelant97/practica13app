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
						<h2><@spring.message "equipos"/></h2>
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-home"></i>
									</a>
								</li>
								<li><span><@spring.message "equipos"/></span></li>

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

                            <h2 class="panel-title"><@spring.message "equipos"/></h2>
                        </header>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="mb-md">
                                        <a class="popup-with-form btn btn-primary" href="#equipo-form"><@spring.message "agregar"/> <i class="fa fa-plus"></i></a>
                                    </div>
                                </div>
                                <!-- Equipos Form -->
                                <form id="equipo-form" class="white-popup-block mfp-hide form-horizontal"
                                             action="/equipos/crear/" method="post" enctype='multipart/form-data'>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h3>Formulario Equipos</h3>
                                        </div>
                                    </div>
                                    <div class="form-group mt-lg">
                                        <label class="col-sm-3 control-label">Nombre</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="nombre" class="form-control"  required />
                                        </div>
                                    </div>
                                    <div class="form-group mt-lg">
                                        <label class="col-sm-3 control-label">Existencia</label>
                                        <div class="col-sm-9">
                                            <input type="number" name="existencia" class="form-control"  required />
                                        </div>
                                    </div>
                                    <div class="form-group mt-lg">
                                        <label class="col-sm-3 control-label">Tarifa</label>
                                        <div class="col-sm-9">
                                            <input type="number" name="precio" class="form-control" required />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Familia</label>
                                        <div class="col-sm-9">
                                            <select id="categoria" name="familia" class="form-control"
                                                    style="width: 100%;" tabindex="-1" aria-hidden="true"
                                                    required>
                                                <option selected="selected">Seleccionar Familia</option>
                                                <#list categorias as categoria>
                                                    <option value="${categoria.getNombreCategoria()}">${categoria.getNombreCategoria()}</option>
                                                </#list>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">SubFamilia</label>
                                        <div class="col-sm-9">
                                            <select id="categoria" name="subfamilia" class="form-control"
                                                    style="width: 100%;" tabindex="-1" aria-hidden="true"
                                                    required>
                                                <option selected="selected">Seleccionar SubFamilia</option>
                                                <#list subfamilias as subcategoria>
                                                    <option value="${subcategoria.nombreSubFamilia}">${subcategoria.nombreSubFamilia}</option>
                                                </#list>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Foto de equipo</label>
                                        <div class="col-sm-9">
                                            <input type="file" accept="image/png, image/jpeg" id="foto" name="foto">
                                        </div>
                                    </div>
                                    <div class="row mb-lg">
                                        <div class="col-sm-9 col-sm-offset-3">
                                            <button class="btn btn-primary">Guardar</button>
                                            <button type="reset" class="btn btn-default">Reset</button>
                                        </div>
                                    </div>
                                </form>
                                <form id="edit-equipo-form" class="white-popup-block mfp-hide form-horizontal"
                                      action="/equipos/modificar/" method="post" enctype='multipart/form-data'>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h3>Formulario Equipos</h3>
                                        </div>
                                    </div>
                                    <input type="hidden" name="id2" id="id2">
                                    <div class="form-group mt-lg">
                                        <label class="col-sm-3 control-label">Nombre</label>
                                        <div class="col-sm-9">
                                            <input type="text" id="nombre2" name="nombre2" class="form-control"  required />
                                        </div>
                                    </div>
                                    <div class="form-group mt-lg">
                                        <label class="col-sm-3 control-label">Existencia</label>
                                        <div class="col-sm-9">
                                            <input type="number" id="existencia2" name="existencia2" class="form-control"  required />
                                        </div>
                                    </div>
                                    <div class="form-group mt-lg">
                                        <label class="col-sm-3 control-label">Tarifa</label>
                                        <div class="col-sm-9">
                                            <input type="number" id="precio2" name="precio2" class="form-control" required />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Familia</label>
                                        <div class="col-sm-9">
                                            <select id="categoria2" name="categoria2" class="form-control"
                                                    style="width: 100%;" tabindex="-1" aria-hidden="true"
                                                    required>
                                                <option selected="selected">Seleccionar Familia</option>
                                                <#list categorias as categoria>
                                                    <option value="${categoria.getNombreCategoria()}">${categoria.getNombreCategoria()}</option>
                                                </#list>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">SubFamilia</label>
                                        <div class="col-sm-9">
                                            <select id="subfamilia2" name="subfamilia2" class="form-control"
                                                    style="width: 100%;" tabindex="-1" aria-hidden="true"
                                                    required>
                                                <option selected="selected">Seleccionar SubFamilia</option>
                                                <#list subfamilias as subcategoria>
                                                    <option value="${subcategoria.nombreSubFamilia}">${subcategoria.nombreSubFamilia}</option>
                                                </#list>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Foto de equipo</label>
                                        <div class="col-sm-9">
                                            <input type="file" accept="image/png, image/jpeg" id="foto2" name="foto2">
                                        </div>
                                    </div>
                                    <div class="row mb-lg">
                                        <div class="col-sm-9 col-sm-offset-3">
                                            <button class="btn btn-primary">Guardar</button>
                                            <button type="reset" class="btn btn-default">Reset</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <table class="table table-bordered table-striped mb-none" id="datatable-editable">
                                <thead>
                                <tr>
                                    <th><@spring.message "nombre"/></th>
                                    <th><@spring.message "existencia"/></th>
                                    <th><@spring.message "tarifa"/></th>
									<th><@spring.message "familia"/></th>
									<th><@spring.message "subfamilia"/></th>
                                    <th><@spring.message "acciones"/></th>
                                </tr>
                                </thead>
                                <tbody>
									<#list equipos as equipo>
									<tr class="gradeX">
										<td>${equipo.getNombreEquipo()}</td>
										<td>${equipo.getExistencia()}</td>
										<td>${equipo.getPrecio()}</td>
									    <td>${equipo.getCategoria().nombreCategoria}</td>
										<td>${equipo.getSubFamilia().nombreSubFamilia}</td>
										<td class="actions">
											<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
											<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
											<a href="#edit-equipo-form" class="on-default popup-with-form edit-row"
                                               onclick="edit(${equipo.getId()},'${equipo.getNombreEquipo()}', '${equipo.getPrecio()}',
                                                       '${equipo.getExistencia()}', '${equipo.getCategoria().getNombreCategoria()}')">
                                                <i class="fa fa-pencil"></i>
                                            </a>
											<a href="delete/${equipo.getId()}"  class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
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
    <script>
        $('.datepicker').datepicker({format: "dd-mm-yyyy"});

        function edit(id, nombre, precio, existencia, categoria, foto){
            $('#id2').val(id);
            $('#nombre2').val(nombre);
            $('#precio2').val(precio);
            $('#existencia2').val(existencia);
            $('#categoria2').val(categoria);
            $('#foto2').val(foto);
        }

    </script>
</html>