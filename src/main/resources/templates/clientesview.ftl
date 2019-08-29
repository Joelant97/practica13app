<!doctype html>
<html class="fixed">
<#include "header.ftl">
<body>

<section class="body">
	<#include "body_header.ftl">

	<div class="inner-wrapper">
		<#include "sidebar.ftl">
		<section role="main" class="content-body">
			<header class="page-header">
				<h2><@spring.message "clientes"/></h2>
				<div class="right-wrapper pull-right">
					<ol class="breadcrumbs">
						<li>
							<a href="index.html">
								<i class="fa fa-home"></i>
							</a>
						</li>
						<li><span><@spring.message "clientes"/></span></li>
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

					<h2 class="panel-title"><@spring.message "clientes"/></h2>
				</header>
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-6">
							<div class="mb-md">
								<a class="popup-with-form btn btn-primary" href="#demo-form"><@spring.message "agregar"/> <i class="fa fa-plus"></i></a>
							</div>
						</div>
						<!-- Cliente Form -->
						<form id="demo-form" class="white-popup-block mfp-hide form-horizontal"
							  action="/clientes/add/" method="post" enctype='multipart/form-data'>
							<div class="row">
								<div class="col-sm-12">
									<h3>Formulario Cliente</h3>
								</div>
							</div>
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">Nombre</label>
								<div class="col-sm-9">
									<input type="text" name="nombre" class="form-control"  required />
								</div>
							</div>
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">Apellido</label>
								<div class="col-sm-9">
									<input type="text" name="apellido" class="form-control"  required />
								</div>
							</div>
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">Cédula</label>
								<div class="col-sm-9">
									<input type="text" name="cedula" class="form-control"  required />
								</div>
							</div>
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">Fecha de nacimiento</label>
								<div class="col-sm-9">
									<input type="date" name="fechaNacimiento" class="form-control"  required />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Foto de perfil</label>
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
						<form id="edit-demo-form" class="white-popup-block mfp-hide form-horizontal"
							  action="/clientes/modificar/" method="post" enctype='multipart/form-data'>
							<div class="row">
								<div class="col-sm-12">
									<h3>Editar Cliente</h3>
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
								<label class="col-sm-3 control-label">Apellido</label>
								<div class="col-sm-9">
									<input type="text" id="apellido2" name="apellido2" class="form-control"  required />
								</div>
							</div>
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">Cédula</label>
								<div class="col-sm-9">
									<input type="text" id="cedula2" name="cedula2" class="form-control"  required />
								</div>
							</div>
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">Fecha de nacimiento</label>
								<div class="col-sm-9">
									<input type="date" id="fechaNacimiento2" name="fechaNacimiento2" class="form-control"  required />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">Foto de perfil</label>
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
							<th><@spring.message "apellido"/></th>
							<th><@spring.message "cedula"/></th>
							<th><@spring.message "fechaNacimiento"/></th>
						</tr>
						</thead>
						<tbody>
						<#list clientes as cliente>
							<tr class="gradeX">
								<td>${cliente.getNombre()}</td>
								<td>${cliente.getApellido()}</td>
								<td>${cliente.getCedula()}</td>
								<td>${cliente.getFechaNacimiento()}</td>
								<td class="actions">
									<a href="/clientes/profile/${cliente.getId()}" class=" on-editing save-row"><i class="fa fa-eye"></i></a>
									<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
									<a href="#edit-demo-form" class="on-default edit-row popup-with-form" onclick="edit(${cliente.getId()},
											'${cliente.getNombre()}', '${cliente.getApellido()}', '${cliente.getCedula()}',
											'${cliente.getFechaNacimiento()}', '${cliente.getImagen()}')"><i class="fa fa-pencil"></i></a>
									<a href="delete/${cliente.getId()}"  class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
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
<script src="/assets/javascripts/ui-elements/examples.lightbox.js" type="text/javascript"></script>
<script>

function edit(id, nombre, apellido, cedula, fechaNacimiento, foto){
$('#id2').val(id);
$('#nombre2').val(nombre);
$('#apellido2').val(apellido);
$('#cedula2').val(cedula);
$('#fechaNacimiento2').val(fechaNacimiento);
$('#foto2').val(foto);
}

</script>

</body>
</html>