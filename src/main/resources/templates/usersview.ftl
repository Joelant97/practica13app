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
				<h2>usuarios</h2>
				<div class="right-wrapper pull-right">
					<ol class="breadcrumbs">
						<li>
							<a href="index.html">
								<i class="fa fa-home"></i>
							</a>
						</li>
						<li><span>usuarios</span></li>

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

					<h2 class="panel-title">Usuarios</h2>
				</header>
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-6">
							<div class="mb-md">
								<a class="popup-with-form btn btn-primary" href="#demo-form">Agregar<i class="fa fa-plus"></i></a>
							</div>
						</div>
						<!-- Cliente Form -->
						<form id="demo-form" class="white-popup-block mfp-hide form-horizontal"
							  action="/usuarios/crear/" method="post" enctype='multipart/form-data'>
							<div class="row">
								<div class="col-sm-12">
									<h3>Nuevo Usuario</h3>
								</div>
							</div>
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">Usuario</label>
								<div class="col-sm-9">
									<input type="text" name="username" class="form-control"  required />
								</div>
							</div>
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">contrase&ncaron;a</label>
								<div class="col-sm-9">
									<input type="password" name="password" class="form-control"  required />
								</div>
							</div>
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">email</label>
								<div class="col-sm-9">
									<input type="text" name="email" class="form-control"  required />
								</div>
							</div>
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">Rol</label>
								<div class="col-sm-9">
									<select id="rol" name="rol" class="form-control select2 select2-hidden-accessible" required>
										<#list roles as rol>
											<option value="${rol.getNombreRol()}">${rol.getNombreRol()}</option>
										</#list>
									</select>
								</div>
							</div>
							<div class="row mb-lg">
								<div class="col-sm-9 col-sm-offset-3">
									<button class="btn btn-primary">Guardar</button>
									<button type="reset" class="btn btn-default">Reset</button>
								</div>
							</div>

						</form>
						<form id="edit-form" class="white-popup-block mfp-hide form-horizontal"
							  action="/usuarios/modificar/" method="post" enctype='multipart/form-data'>
							<div class="row">
								<div class="col-sm-12">
									<h3>Editar Usuario</h3>
								</div>
							</div>
							<input type="hidden" name="id2" id="id">
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">Usuario</label>
								<div class="col-sm-9">
									<input id="username" type="text" name="username2" class="form-control"  required />
								</div>
							</div>
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">Contrasena</label>
								<div class="col-sm-9">
									<input type="password" name="password2" class="form-control"  required />
								</div>
							</div>
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">email</label>
								<div class="col-sm-9">
									<input type="text" id="email" name="email2" class="form-control"  required />
								</div>
							</div>
							<div class="form-group mt-lg">
								<label class="col-sm-3 control-label">Rol</label>
								<div class="col-sm-9">
									<select id="rol" name="rol2" class="form-control select2 select2-hidden-accessible" required>
										<#list roles as rol>
											<option value="${rol.getNombreRol()}">${rol.getNombreRol()}</option>
										</#list>
									</select>
								</div>
							</div>
							<div class="row mb-lg">
								<div class="col-sm-9 col-sm-offset-3">
									<button class="btn btn-primary">Modificar</button>
									<button type="reset" class="btn btn-default">Reset</button>
								</div>
							</div>
						</form>

					</div>
					<table class="table table-bordered table-striped mb-none" id="datatable-editable">
						<thead>
						<tr>
							<th class="text-center"> usuario</th>
							<th class="text-center"> contrasena</th>
							<th class="text-center"> email</th>
							<th class="text-center">Rol</th>
							<th class="text-center"> opciones</th>
						</tr>
						</thead>
						<tbody>
						<#list usuarios as usuario>
							<tr class="gradeX">
								<td>${usuario.getUsername()}</td>
								<td>${usuario.getPassword()}</td>
								<td>${usuario.getEmail()}</td>
								<td>${usuario.rol.getNombreRol()}</td>
								<td class="actions">
									<a href="/profile/${usuario.getId()}"  class="hidden on-editing save-row"><i class="fa fa-eye"></i></a>
									<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
									<a href="#edit-form" class="on-default popup-with-form edit-row" onclick="edit(${usuario.getId()}, '${usuario.getUsername()}', '${usuario.getEmail()}')">
										<i class="fa fa-pencil "></i>
									</a>
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

<#include "footer.ftl">
<script src="/assets/javascripts/ui-elements/examples.lightbox.js" type="text/javascript"></script>
<script>

	function edit(id, usuario, email) {
		$('#id').val(id);
		$('#username').val(usuario);
		$('#email').val(email);
	}
</script>
</body>
</html>