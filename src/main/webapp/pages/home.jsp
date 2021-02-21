<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Home page</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/myStyle.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark bgcolor"
		bgcolor>
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="/page/0">Home
						<span class="sr-only">(current)</span>
				</a></li>

			</ul>

		</div>
	</nav>
	<div class="container mt-5">
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#exampleModal">Save Student</button>
		<button class="btn btn-primary mt-0" type="button"
			data-toggle="collapse" data-target="#collapseExample"
			aria-expanded="false" aria-controls="collapseExample">Search
			Student</button>
		<div class="collapse" id="collapseExample">
			<div class="container-fluid mt-4 font-weight-bold">
				<form action="/search" method="post">
					<div class="row">
						<div class="col-3">
							<input class="form-control" type="number" value="0" name="ID"
								required="required">
						</div>
						<div class="col-3">
							<input class="btn btn-outline-success" type="submit"
								value="search">
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header text-center bg-primary font-weight-bold">
						<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="/formHandler" method="post" class="font-weight-bold">
							<div class="form-group">
								<label for="exampleFormControlInput1" class="font-weight-bold">Name</label>
								<input type="text" class="form-control"
									id="exampleFormControlInput1" placeholder="Aqib bhatti"
									name="s_name">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1" class="font-weight-bold">Email
									address</label> <input type="email" class="form-control"
									id="exampleFormControlInput1" placeholder="name@example.com"
									name="s_email">
							</div>

							<div class="form-group">
								<label for="exampleFormControlInput1" class="font-weight-bold">Favourite
									Subject</label> <input type="text" class="form-control"
									id="exampleFormControlInput1" placeholder="Chemistry"
									name="s_favourite_subject">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1" class="font-weight-bold">class</label>
								<input type="text" class="form-control"
									id="exampleFormControlInput1" placeholder="Mcs" name="s_class">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1" class="font-weight-bold">Age</label>
								<input type="number" class="form-control"
									id="exampleFormControlInput1" placeholder="20" name="s_age">
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="s_gender"
									id="exampleRadios1" value="Male" checked> <label
									class="form-check-label font-weight-bold" for="exampleRadios1">
									Male</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="s_gender"
									id="exampleRadios2" value="Female"> <label
									class="form-check-label font-weight-bold" for="exampleRadios2">
									Female </label>
							</div>
							<button type="submit" class="btn btn-primary">Save
								changes</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>

					</div>
				</div>
			</div>
		</div>
		<section class="mt-4">
			<div class="table-responsive">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Age</th>
							<th scope="col">Class</th>
							<th scope="col">Favourite subject</th>
							<th scope="col">Gender</th>
							<th scope="col">Update</th>
							<th scope="col">Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="student">
							<tr>
								<th scope="col"><c:out value="${student.getS_id() }"></c:out></th>
								<th scope="col"><c:out value="${student.getS_name() }"></c:out></th>
								<th scope="col"><c:out value="${student.getS_email() }"></c:out></th>
								<th scope="col"><c:out value="${student.getS_age() }"></c:out></th>
								<th scope="col"><c:out value="${student.getS_class() }"></c:out></th>
								<th scope="col"><c:out
										value="${student.getS_favourite_subject() }"></c:out></th>
								<th scope="col"><c:out value="${student.getS_gender() }"></c:out></th>
								<th scope="col"><a class="btn btn-warning"
									href="/update/<c:out value="${ student.getS_id()}"></c:out>">Update</a></th>
								<th scope="col"><a onclick="return confirm('Are You Sure')"
									class="btn btn-danger"
									href="/delete/<c:out value="${ student.getS_id()}"></c:out>">delete</a></th>
							</tr>
						</c:forEach>


					</tbody>
				</table>
			</div>
			<c:if test="${stds!=null }">
				<div>
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="/page/0">Previous</a></li>
							<c:forEach var="i" begin="1" end="${stds.getTotalPages()-2}">
								<li class="page-item"><a class="page-link"
									href="/page/${i}"><c:out value="${i}"></c:out></a></li>
							</c:forEach>
							<li class="page-item"><a class="page-link"
								href="/page/${stds.getTotalPages()-1}">Next</a></li>
						</ul>
					</nav>
				</div>
			</c:if>

		</section>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>
</html>