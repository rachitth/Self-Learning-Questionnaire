<%-- 
    Document   : reg
    Created on : Mar 16, 2018, 12:04:18 PM
    Author     : rachit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>regjsp</title>
    </head>
    
<style>
body,h1 {font-family: Arial}
body, html {height: 100%}
.bgimg {
    background-image: url('https://i.ytimg.com/vi/QQdrrr3XJak/maxresdefault.jpg');
    min-height: 100%;
    background-position: center;
    background-size: cover;
}
</style>




    <body oncontextmenu="return false">
      <%@page import="java.sql.*" %>
              <%@page import="javax.sql.*" %>    
            <%
                String email=request.getParameter("email");
               // out.println("email: " + email);
                //System.out.println("Email: " + email);
                session.putValue("email",email); 
                String pwd=request.getParameter("password");
                //System.out.println("Pwd: " + pwd);
                String first=request.getParameter("first");
                //System.out.println("First: " + first);
                String last=request.getParameter("last");
                //System.out.println("Last: " + last);
    String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	 String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	
	//Database Credentials
	String USER = "system";
        String PASS = "admin";
        
        
                        Connection conn=null;
			PreparedStatement stmt = null;
                        
	
				// STEP 2: Register JDBC driver
				Class.forName(JDBC_DRIVER);

				// STEP 3: Open a connection
				conn = DriverManager.getConnection(DB_URL, USER, PASS);
                                
                                
                                            char[] checker=new char[40];
                                            for(int i=0;i<40;i++)
                                            {
                                                checker[i]='0';
                                            }
                                            String checker1 = String.copyValueOf(checker);

                                
                                

String sql;
				sql = "insert into userinfo values( ? , ? , ? ,? ,'noscore','1','0',?)";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,first);
				stmt.setString(2,last);
				stmt.setString(3,email);
				stmt.setString(4,pwd);
                                stmt.setString(5,checker1);
				stmt.executeUpdate();
				//out.println("You have registered Successfully");
				
			
                %>
                
                
                
                
<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">

  <div class="w3-display-middle">
    <h1 class="w3-jumbo w3-animate-top">THANK YOU</h1>
    <hr class="w3-border-grey" style="margin:auto;width:40%">
    <p class="w3-large w3-center">REGISTRATION COMPLETED SUCCESSFULLY!</p>
  </div>
  <div class="w3-display-bottomleft w3-padding-large">
    back to <a href="index.jsp">login page</a>
  </div>
</div>

                

    </body>
</html>
