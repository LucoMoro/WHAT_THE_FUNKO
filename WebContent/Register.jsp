<html>
<head>

	<link rel="stylesheet" type="text/css" href="CSS_WTFUNKO.css">
	<title>What The Funko</title>
    <link rel="shortcut icon" type="image/x-icon" href="Images/Logo/logo.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="./Images/Logo/logo.png">
    
    <script src = "jquery-3.5.1.min.js"></script>

</head>

<body> <header> <%@include file="Header.jsp" %></header>

<div class = "divbody" style = "margin-top : 50px">

<div class="registerdin">
	<div class="regcontainer">

		<section class="regsec">

			<div class="imgreg">
				<img src="./Images/Product/doc.jpg" alt="doc">
			</div>

			<div class="contentreg">
				<div class="formreg">
					<h2> Register </h2>


				<div class="containerpop-up">

					<form action="RegisterServlet" id = "form" method = "post" onSubmit = "event.preventDefault(); validate(this)">
						<div class="inputreg">
							<label for="usrname">Username</label>
    						<input type="text" id="usrname" name="usrname" placeholder = 
							"Inserire Username qui" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}" 
							title="Controlla le caratteristiche richieste" required>
    						<div id="result3"></div>
						</div>


						<div class="inputreg">
							<label for="psw">Password</label>
    						<input type="password" id="psw" name="psw" placeholder = "Inserire password qui" 
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}" title="Controlla le caratteristiche richieste" required>
   							<input type = "button" value = "Mostra Password" onClick = "myFunction()"><br> 	
						</div>


						<div id="message2">
							<h3>Lo <b>Username</b> deve avere:</h3>
							<p id="letter2" class="invalid">Una <b>lettera minuscola</b></p>
							<p id="capital2" class="invalid">Una <b>lettera maiuscola</b></p>
							<p id="number2" class="invalid">Un <b>numero</b></p>
							<p id="length2" class="invalid"><b>Dagli 8 ai 15 caratteri</b></p>
						  </div>
						  
						  <div id="message">
							<h3>La <b>Password</b> deve avere:</h3>
							<p id="letter" class="invalid">Una <b>lettera minuscola</b></p>
							<p id="capital" class="invalid">Una <b>lettera maiuscola</b></p>
							<p id="number" class="invalid">Un <b>numero</b></p>
							<p id="length" class="invalid"><b>Dagli 8 ai 15 caratteri</b></p>
						</div>




						<div class="inputreg">
							<label for="nome">Nome:</label>
							<input type="text" name="nome" id = "nome" placeholder="Mario" required>
							<div id = "nomeResult"></div>
						</div>

						<div class="inputreg">
							<label for="lastname">Cognome:</label>
							<input type="text" name="cognome" id = "cognome" placeholder="Rossi" required>
							<div id = "cognomeResult"></div>	
						</div>

						

						<div class="inputreg">
							<label for="email">Email:</label>
							<input type="text" name="email" id = "email" placeholder="aaaa@bbbb.it" required>
							<div id = "emailResult"></div>	
						</div>

						<div class="inputreg">
							<input type="number" name = "telefono" id="telefono" placeholder = "XXXXXXXXXX">
							<div id = "telefonoResult"></div>
						</div>

						<input type = "hidden" name = "tipo" value = "base">
						
						<div class="inputreg">
							<input type="submit" value="Registrati" name="">
						</div>
					</form>

					<div id = "message3"></div>

				</div>
			</div>
			</div>

		</section>
	</div>
</div>

 </div>
        <footer><%@include file="Footer.html" %></footer> 


<script>
	var myInput = document.getElementById("psw");
	var myInput2 = document.getElementById("usrname");
	
	var letter = document.getElementById("letter");
	var capital = document.getElementById("capital");
	var number = document.getElementById("number");
	var length = document.getElementById("length");
	
	var letter2 = document.getElementById("letter2");
	var capital2 = document.getElementById("capital2");
	var number2 = document.getElementById("number2");
	var length2 = document.getElementById("length2");
	
	
	// When the user clicks on the password field, show the message box
	myInput.onfocus = function() {
	  document.getElementById("message").style.display = "block";
	}
	
	myInput2.onfocus = function() {
		  document.getElementById("message2").style.display = "block";
		}
	
	// When the user clicks outside of the password field, hide the message box
	myInput.onblur = function() {
	  document.getElementById("message").style.display = "none";
	}
	
	myInput2.onblur = function() {
		  document.getElementById("message2").style.display = "none";
		}
	
	// When the user starts to type something inside the password field
	myInput.onkeyup = function() {
	  // Validate lowercase letters
	  var lowerCaseLetters = /[a-z]/g;
	  var check1;
	  if(myInput.value.match(lowerCaseLetters)) {  
		letter.classList.remove("invalid");
		letter.classList.add("valid");
		
		check1 = true;
	  } else {
		check1 = false;
		letter.classList.remove("valid");
		letter.classList.add("invalid");
	  }
	  
	  // Validate capital letters
	  var upperCaseLetters = /[A-Z]/g;
	  var check2;
	  if(myInput.value.match(upperCaseLetters)) {  
		capital.classList.remove("invalid");
		capital.classList.add("valid");
		check2 = true;
	  } else {
		passwordCheck = "false";
		capital.classList.remove("valid");
		capital.classList.add("invalid");
		check2 = false;
	  }
	
	  // Validate numbers
	  var numbers = /[0-9]/g;
	  var check3;
	  if(myInput.value.match(numbers)) {  
		number.classList.remove("invalid");
		number.classList.add("valid");
		check3 = true;
	  } else {
		number.classList.remove("valid");
		number.classList.add("invalid");
		check3 = false;
	  }
	  
	  // Validate length
	  var check4;
	  if(myInput.value.length >= 8 && myInput.value.length <=15) {
		length.classList.remove("invalid");
		length.classList.add("valid");
		check4 = true;
	  } else {
		length.classList.remove("valid");
		length.classList.add("invalid");
		check4 = false;
	  }
	  
	  passwordCheck = (check1 && check2 && check3 && check4);
	  if(passwordCheck == true)
		  {
		  $('#psw').css("border","2px solid green");
		  }
	  else
		  {
		  $('#psw').css("border","2px solid red");
		  }
	}
	
	myInput2.onkeyup = function() {
		  // Validate lowercase letters
		  var check1;
		  var lowerCaseLetters = /[a-z]/g;
		  if(myInput2.value.match(lowerCaseLetters)) {  
			letter2.classList.remove("invalid");
			letter2.classList.add("valid");
			check1 = true;
		  } else {
			letter2.classList.remove("valid");
			letter2.classList.add("invalid");
			check1 = false;
		  }
		  
		  // Validate capital letters
		  var upperCaseLetters = /[A-Z]/g;
		  var check2;
		  if(myInput2.value.match(upperCaseLetters)) {  
			capital2.classList.remove("invalid");
			capital2.classList.add("valid");
			check2 = true;
		  } else {
			capital2.classList.remove("valid");
			capital2.classList.add("invalid");
			check2 = false;
		  }
	
		  // Validate numbers
		  var numbers = /[0-9]/g;
		  var check3;
		  if(myInput2.value.match(numbers)) {  
			number2.classList.remove("invalid");
			number2.classList.add("valid");
			check3 = true;
		  } else {
			number2.classList.remove("valid");
			number2.classList.add("invalid");
			check3 = false;
		  }
		  
		  // Validate length
		  var check4;
		  if(myInput2.value.length >= 8 && myInput2.value.length <=15) {
			length2.classList.remove("invalid");
			length2.classList.add("valid");
			check4 = true;
		  } else {
			length2.classList.remove("valid");
			length2.classList.add("invalid");
			check4 = false;
		  }
		  usernameCheck = (check1 && check2 && check3 && check4);
		}
		
		function checkNamesurname(inputtxt)
		{
			var name = /^[A-Za-z]+$/;
			if(inputtxt.value.match(name)) 	return true
		
			return false;
		}
		
		function checkEmail(inputtxt)
		{
			var atpos = inputtxt.value.indexOf("@");
			var dotpos = inputtxt.value.lastIndexOf(".");
			if(atpos<1 || dotpos<atpos+2 ||  dotpos+2>= inputtxt.length)
				{
					return false;
				}
			return true;
		}
		
		
		function validate(obj)
		{
			var valid = true;
			
			
			var result = document.getElementById("result3");
			if(result.value == "Username gi? presente")	valid = false;
			
			var nome = document.getElementById("nome");
			if(!checkNamesurname(nome)) 
				{
					valid = false;
					 $('#nome').css("border","1px solid red");
					 $('#nomeResult').css("display","inline");
					 $('#nomeResult').css("color","red");
					 $('#nomeResult').css("font-size","14px").html("Formato nome incorretto, NON USARE numeri" + "<br>");
				}
			else
			{
				$('#nome').css("border","1px solid green");
				$('#nomeResult').css("display","none");
			}
			
			var cognome = document.getElementById("cognome");
			if(!checkNamesurname(cognome))
			{
				valid = false;
				$('#cognome').css("border","1px solid red");
				$('#cognomeResult').css("display","inline");
				$('#cognomeResult').css("color","red");
				$('#cognomeResult').css("font-size","14px").html("Formato cognome incorretto, NON USARE numeri" + "<br>");
			}
			else
			{
				$('#cognome').css("border","1px solid green");
				$('#cognomeResult').css("display","none");
			}
			
			var email = document.getElementById("email");
			if(checkEmail(email) == false)
			{
				valid = false;
				 $('#email').css("border","1px solid red");
				 $('#emailResult').css("display","inline");
				 $('#emailResult').css("color","red");
				 $('#emailResult').css("font-size","14px").html("Formato email incorretto" + "<br>");
			}
			else
			{
				$('#email').css("border","1px solid green");
				$('#emailResult').css("display","none");
			}
			
			var telefono = document.getElementById("telefono");
			if(phonenumber(telefono) == false)
				{
					valid = false;
					 $('#telefono').css("border","1px solid red");
					 $('#telefonoResult').css("display","inline");
					 $('#telefonoResult').css("color","red");
					 $('#telefonoResult').css("font-size","14px").html("Formato telefono incorretto" + "<br>");
				}
			else
				{
					$('#telefono').css("border","1px solid green");
					$('#telefonoResult').css("display","none");
				}
			
			if(valid) obj.submit();
		}
		
		function myFunction() {
			  var x = document.getElementById("psw");
			  if (x.type === "password") {
				x.type = "text";
			  } else {
				x.type = "password";
			  }
			}
		
		function phonenumber(inputtxt)
		{
		  var phoneno = /^\d{10}$/;
		  if(inputtxt.value.match(phoneno)) return true;
		  
		  return false;
		}
	
	</script>
	
	<script type="text/javascript">
	
	//usato jquery con il $
	$(document).ready(function(){
		$('#usrname').change(function(){
			var usrname = $('#usrname').val();
			$.ajax({
				type: 'POST',
				data: {username : usrname},			//il campo username del form ? usrname
				url : 'UsernameCheckServlet',
				success: function(result){			//result = quello che ritorna la servlet
					if(result!=null && result!=""){	//se ? presente un messaggio, result!=null c'? stata una collisione di nomi
						//impostazioni css caso di errore
						$('#result3').css("display","inline");
						$('#result3').css("color","red");
						$('#result3').css("font-size","14px").html(result + "<br>");
						$('#btn').prop("type","button");
						$('#usrname').css("border","1px solid red");
					}else{
						$('#usrname').css("border","2px solid green");
						$('#result3').css("color","green");
						$('#result3').css("display","inline");
						$('#btn').prop("type","submit");
						$('#result3').css("font-size","14px").html("Username disponibile <br><br>");
					}
				}
	
			})
		});
	
	});
	</script>
	
</body>
</html>