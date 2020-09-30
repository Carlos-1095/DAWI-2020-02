<%@page import="beans.UsuarioDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>miTienda - Principal</title>

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/cart.css" rel="stylesheet">
<link href="css/shop.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
		<div class="container">
			<a class="navbar-brand py-0 my-0 by-0 h1"
				href="tiendaSer?btnes=l&cat=0"><span class="mb-0 h3">miTienda</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<%
						UsuarioDTO u = (UsuarioDTO) request.getSession().getAttribute("usuario");
						if (u == null) {
					%>
					<li class="nav-item"><a class="nav-link" href="loginRegistro.jsp">Iniciar
							Sesion</a></li>
					<%
						} else {
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Bienvenido ${usuario.nombre} </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<%
								if (u.getIdTipo() == 1) {
							%>
							<a class="dropdown-item" href="tiendaSer?btnes=l&cat=0">Tienda</a> <a
								class="dropdown-item" href="listadoProductos.jsp">Mantenimiento</a>
							<a class="dropdown-item" href="reporteStock.jsp">Reportes</a>
							<div class="dropdown-divider"></div>

							<%
								}
							%>

							<a class="dropdown-item" href="crudUsu">Cerrar Sesion</a>
						</div></li>
					<%
						}
					%>

				</ul>
				<a class="btn btn-success btn-sm ml-3" href="carrito.jsp"> <i
					class="fa fa-shopping-cart"></i> Cart <span
					class="badge badge-light">${cantArticulos }</span>
				</a>
			</div>
		</div>
	</nav>

	<section class="jumbotron text-center">
		<div class="container">
			<h1 class="jumbotron-heading">CARRITO</h1>
		</div>
	</section>
	<div class="container mb-4">
		<form action="tiendaSer">
			<div class="row">
				<div class="col-12">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">Producto</th>
									<th scope="col">Disponibilidad</th>
									<th scope="col" class="text-center">Cantidad</th>
									<th scope="col" class="text-right">Precio</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${carro}" var="x" varStatus="loop">
									<tr>
										<td><img src="img/imgs_50x50/${x.idprod}.jpg" />
										</td>
										<td><a href="tiendaSer?btnes=q&cod=${x.idprod}">${x.nombre}</a></td>
										<td>En stock</td>
										<td><input class="form-control text-center" type="number"
											value="${x.cantidad}" min="1" step="1" readonly="readonly"/></td>
										<td class="text-right">S/ ${x.preciovta}</td>
										<td class="text-right"><a class="btn btn-sm btn-danger"
											href="tiendaSer?btnes=e&con=${loop.index}"> <i
												class="fa fa-trash"></i>
										</a></td>
									</tr>
								</c:forEach>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td class="text-right"><strong>Total</strong></td>
									<td class="text-right"><strong>S/ ${subTotalVenta }</strong></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col mb-2">
					<div class="row">
						<div class="col-sm-12  col-md-6">
							<button type="submit" class="btn btn-lg btn-block btn-light text-uppercase" name="btnes" value="i">
							Continuar comprando</button>
						</div>
						<div class="col-sm-12 col-md-6 text-right">
							<button type="submit"
								class="btn btn-lg btn-block btn-success text-uppercase"
								name="btnes" value="b">Completar</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		${mensaje}
	</div>

	<br>
	<footer class="text-light">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-lg-4 col-xl-3">
					<h5>About</h5>
					<hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
					<p class="mb-0">Le Lorem Ipsum est simplement du faux texte
						employ� dans la composition et la mise en page avant impression.</p>
				</div>

				<div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
					<h5>Informations</h5>
					<hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
					<ul class="list-unstyled">
						<li><a href="">Link 1</a></li>
						<li><a href="">Link 2</a></li>
						<li><a href="">Link 3</a></li>
						<li><a href="">Link 4</a></li>
					</ul>
				</div>

				<div class="col-md-3 col-lg-2 col-xl-2 mx-auto">
					<h5>Others links</h5>
					<hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
					<ul class="list-unstyled">
						<li><a href="">Link 1</a></li>
						<li><a href="">Link 2</a></li>
						<li><a href="">Link 3</a></li>
						<li><a href="">Link 4</a></li>
					</ul>
				</div>

				<div class="col-md-4 col-lg-3 col-xl-3">
					<h5>Contact</h5>
					<hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
					<ul class="list-unstyled">
						<li><i class="fa fa-home mr-2"></i> My company</li>
						<li><i class="fa fa-envelope mr-2"></i> email@example.com</li>
						<li><i class="fa fa-phone mr-2"></i> + 33 12 14 15 16</li>
						<li><i class="fa fa-print mr-2"></i> + 33 12 14 15 16</li>
					</ul>
				</div>
				<div class="col-12 copyright mt-3">
					<p class="float-left">
						<a href="#">Back to top</a>
					</p>

				</div>
			</div>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>