<%@ page import="com.crudApp.Entitities.Student" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
Student student=(Student)session.getAttribute("student");
    request.setAttribute("student", student);
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Student Form</title>
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
	<div class="container">
	<div class="row">
	<div class="col-6 mt-5 offset-2">
	<form action="/updateStudent" method="post" class="font-weight-bold">
								<div class="form-group">
								<input type="hidden" class="form-control"
									id="exampleFormControlInput1" placeholder="Aqib bhatti"
									name="s_id" value='<c:out value="${student.getS_id() }"></c:out>'>
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1" class="font-weight-bold">Name</label>
								<input type="text" class="form-control"
									id="exampleFormControlInput1" placeholder="Aqib bhatti"
									name="s_name" value='<c:out value="${student.getS_name() }"></c:out>'>
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1" class="font-weight-bold">Email
									address</label> <input type="email" class="form-control"
									id="exampleFormControlInput1" value='<c:out value="${student.getS_email() }"></c:out>' placeholder="name@example.com"
									name="s_email">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1" class="font-weight-bold">Favourite
									Subject</label> <input type="text" class="form-control"
									id="exampleFormControlInput1" value='<c:out value="${student.getS_favourite_subject() }"></c:out>' placeholder="Chemistry"
									name="s_favourite_subject">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1" class="font-weight-bold">class</label>
								<input type="text" class="form-control"
									id="exampleFormControlInput1" placeholder="Mcs" value='<c:out value="${student.getS_class() }"></c:out>' name="s_class">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1" class="font-weight-bold">Age</label>
								<input type="number" class="form-control"
									id="exampleFormControlInput1" placeholder="20" value='<c:out value="${student.getS_age() }"></c:out>' name="s_age">
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
	</div>
	</div>
</body>
</html>