<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
    	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
		<title>Accede a tu horario escolar</title>
		<style>
			body,html {
			margin: 0;
			padding: 0;
			height: 100%;
			background: #60a3bc !important;
		}
		.user_card {
			height: 550px;
			width: 350px;
			margin-top: auto;
			margin-bottom: auto;
			background: #F5F5F5;
			position: relative;
			display: flex;
			justify-content: center;
			flex-direction: column;
			padding: 10px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			-webkit-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			-moz-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			border-radius: 5px;

		}
		.brand_logo_container {
			position: absolute;
			height: 170px;
			width: 170px;
			top: -75px;
			border-radius: 50%;
			background: #60a3bc;
			padding: 10px;
			text-align: center;
		}
		.brand_logo {
			height: 150px;
			width: 150px;
			border-radius: 50%;
			border: 2px solid white;
		}
		.form_container {
			margin-top: 100px;
		}
		.login_btn {
			width: 100%;
			background: #00507F !important;
			color: white !important;
		}
		.login_btn:focus {
			box-shadow: none !important;
			outline: 0px !important;
		}
		.login_container {
			padding: 0 2rem;
		}
		.input-group-text {
			background: #00507F !important;
			color: white !important;
			border: 0 !important;
			border-radius: 0.25rem 0 0 0.25rem !important;
		}
		.input_user,
		.input_pass:focus {
			box-shadow: none !important;
			outline: 0px !important;
		}
		.custom-checkbox .custom-control-input:checked~.custom-control-label::before {
			background-color: #00507F !important;
		}
		</style>
	</head>
	<body>
		<!--
		<nav class="navbar navbar-expand-lg py-3 navbar-dark bg-dark shadow-sm">
		  <div class="container">
		    <a href="#" class="navbar-brand">
		    
		      <img src="https://res.cloudinary.com/mhmd/image/upload/v1557368579/logo_iqjuay.png" width="45" alt="" class="d-inline-block align-middle mr-2">
		      
		      <span class="text-uppercase font-weight-bold">ITESO Universidad Jesuita</span>
		    </a>
		
		    <button type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler"><span class="navbar-toggler-icon"></span></button>
		
		    <div id="navbarSupportedContent" class="collapse navbar-collapse">
		      <ul class="navbar-nav ml-auto">
		        <li class="nav-item active"><a href="#" class="nav-link">Home <span class="sr-only">(current)</span></a></li>
		        <li class="nav-item"><a href="#" class="nav-link">About</a></li>
		        <li class="nav-item"><a href="#" class="nav-link">Services</a></li>
		        <li class="nav-item"><a href="#" class="nav-link">Contact</a></li>
		      </ul>
		    </div>
		  </div>
		</nav>
		-->
		<div class="container h-100">
		<div class="d-flex justify-content-center h-100">
			<div class="user_card">
				<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img src="https://yt3.ggpht.com/a/AGF-l7_z7YpihzV5LjEjgcHfMKKv0wDrSwNkfOJIdA=s900-c-k-c0xffffffff-no-rj-mo" class="brand_logo" alt="Logo">
					</div>
				</div>
				<div class="d-flex justify-content-center form_container">
					<form action="http://localhost:8080/JavaCourseProject/security_check" method="POST">
						<div class="input-group mb-3">
							<label for="player">Take your picture!</label>
							<video id="player" controls autoplay></video>
							<button id="capture" type="button">Snap</button>
							<canvas hidden id="snapshot" width=320 height=240></canvas>
						</div>
					
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="username" class="form-control input_user" value="" placeholder="Your username">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="password" class="form-control input_pass" value="" placeholder="Your password">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="password2" class="form-control input_pass" value="" placeholder="repeat the password">
						</div>
							<div class="d-flex justify-content-center mt-3 login_container">
				 	<button type="submit" name="button" class="btn login_btn">Register</button>
				   </div>
					</form>
				</div>
				
				<div class="mt-4">
					<div class="d-flex justify-content-center links">
						Already have an account? <a href="http://localhost:8080/JavaCourseProject/index" class="ml-2">Log in</a>
					</div>
				</div>
				<div class="mt-4">
					<div class="d-flex justify-content-center links" >
						<% String errorMsg = "";
						for(Cookie c: request.getCookies()) {
							if(c.getName().equals("errorMessage")) {
								errorMsg = c.getValue();
								break;
							}
						}
							if(errorMsg.equals("Please"))
								errorMsg = errorMsg + " fill all the fields.";
							else if(errorMsg.equals("Passwords"))
								errorMsg = errorMsg + " dont match!";
							else if(errorMsg.equals("Username"))
								errorMsg = errorMsg + " already taken!";
						%>
						<p style="color:red;"><%= errorMsg %> </p>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
  var player = document.getElementById('player'); 
  var snapshotCanvas = document.getElementById('snapshot');
  var captureButton = document.getElementById('capture');

  var handleSuccess = function(stream) {
    // Attach the video stream to the video element and autoplay.
    player.srcObject = stream;
  };

  captureButton.addEventListener('click', function() {
    var context = snapshot.getContext('2d');
    // Draw the video frame to the canvas.
    context.drawImage(player, 0, 0, snapshotCanvas.width, 
        snapshotCanvas.height);
    
    navigator.webkitPersistentStorage.requestQuota(1024*1024, function() {
    	  window.webkitRequestFileSystem(window.PERSISTENT , 1024*1024, SaveDatFileBro);
    	})
    console.log(snapshotCanvas.toDataURL())
  });

  function SaveDatFileBro(localstorage) {
	  localstorage.root.getFile("info.jpg", {create: true}, function(DatFile) {
	    DatFile.createWriter(function(DatContent) {
	      var blob = new Blob([snapshotCanvas.toDataURL()], {type: "image/png"});
	      DatContent.write(blob);
	    });
	  });
	}
  navigator.mediaDevices.getUserMedia({video: true})
      .then(handleSuccess);
</script>

	</body>
</html>