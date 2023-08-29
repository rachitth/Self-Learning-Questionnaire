<%-- 
    Document   : index
    Created on : Mar 25, 2018, 9:52:19 PM
    Author     : rachit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
        <style type="text/css">
            

            

body.back{
    
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url('background.jpg');
	background-size: cover;
	/*-webkit-filter: blur(5px);*/
	z-index: 0;
}




.grad{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;

	z-index: 1;
	opacity: 0.7;
}

.header{
	position: absolute;
	top: calc(50% - 250px);
	left: calc(50% - 250px);
	z-index: 2;
}

.header div{
	float: left;
	color: #000000;
	font-family: Arial;
	font-size: 35px;
	font-weight: 200;
}

.header div span{
	color: #000000000 !important;
}

.login{
	position: absolute;
	top: calc(50% - 75px);
	left: calc(50% - 50px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}

.login input[type=text]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(0,0,0,0.6);
	border-radius: 2px;
	color: #000000;
	font-family: Arial;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(0,0,0,0.6);
	border-radius: 2px;
	color: #000000;
	font-family: Arial;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=button]{
	width: 260px;
	height: 35px;
	background: #000000;
	border: 1px solid #000000;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: Arial;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=button]:hover{
	opacity: 0.8;
}

.login input[type=button]:active{
	opacity: 0.6;
}

.login input[type=text]:focus{

	border: 1px solid rgba(0,0,0,0.9);
}

.login input[type=password]:focus{

	border: 1px solid rgba(0,0,0,0.9);
}


::-webkit-input-placeholder{
   color: rgba(0,0,0,0.6);
}

::-moz-input-placeholder{
   color: rgba(0,0,0,0.6);
}




</style>

        
        
    </head>
<body class="back" oncontextmenu="return false">

              <%   
                                          String flag=request.getParameter("flag");  
                                          String first=request.getParameter("first");  
                                          String last=request.getParameter("last");  
                                          String score=request.getParameter("score");  

              %>
              

    
 <!-- <div class="body"></div>
		<!--<div class="grad"></div>-->
		<div class="header">
			<div>SELF TEACHING <span>QUESTIONNAIRE</span></div>
		</div>
		<br>
		<form name="loginn" action="login.jsp" method="post">
		<div class="login">
                    <input type="text" placeholder="email ID" name="email"><br>
			<input type="password" placeholder="password" name="password"><br>

                        <input type="hidden" id="flg" name="flag" value="<%=flag%>"> 
                        <input type="hidden" id="f" name="first" value="<%=first%>"> 
                        <input type="hidden" id="l" name="last" value="<%=last%>">
                        <input type="hidden" id="s" name="score" value="<%=score%>"> 

                                <input type="button"  onclick="sub()" value="Login"><br><br>
                                <a href="register.html" style="color:black; font-size:105%;">Not Registered ? Click here to register</a>
		</div>

		</form>
                
                
                                    <script language="javascript">
                                        
                                        function sub()
                                        {
                                            document.loginn.submit();
                                        }
                                        
                                                                                var c=0;
                                                                                var auto_refresh = setInterval(
                                                                                function()
                                                                                {
                                                                                submitform();
                                                                                }, 700);

                                                                                function submitform()
                                                                                {
                                                                                        if(c==0)
                                                                                        {
                                                                                            
                                                                                            if(document.getElementById("flg").value=="w")
                                                                                                    alert("wrong password");
                                                                                            if(document.getElementById("flg").value=="e")
                                                                                                    alert("email ID doesn't exists");
                                                                                            if(document.getElementById("flg").value=="ss")
                                                                                            {
                                                                                                
                                                                                                 alert("you have sucessfully submitted the test "+document.getElementById("f").value + " " + document.getElementById("l").value + "!\n your score is " + document.getElementById("s").value);
                                                                                            }
                                                                                                
                                                                                                c=c+1;
                                                                                      
                                                                                        }
                         
                                                                                }

                                    </script> 


</body>
</html>
