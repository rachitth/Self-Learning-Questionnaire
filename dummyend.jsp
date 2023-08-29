<%-- 
    Document   : dummyend
    Created on : Mar 25, 2018, 11:21:44 PM
    Author     : rachit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body oncontextmenu="return false">
        
        
        
                    <%@page import="java.sql.*" %>
                    <%@page import="javax.sql.*" %>   
                    
                    <%
                        
                            String score=request.getParameter("score");  
                            session.putValue("score",score); 
                            
                            out.println("score = "+score);
                            String email=request.getParameter("email");  
                            session.putValue("email",email); 
                            out.println("email = "+email);




 
                            String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
                            String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	
                            //Database Credentials
                            String USER = "system";
                            String PASS = "admin";


                            Connection conn=null;
                            PreparedStatement stmt = null;
                         //   ResultSet rs = null;

                            // STEP 2: Register JDBC driver
                            Class.forName(JDBC_DRIVER);

                            // STEP 3: Open a connection
                            conn = DriverManager.getConnection(DB_URL, USER, PASS);
                            
                                String sql;
	
				sql = "update userinfo  set score=?  where email=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,score);
				stmt.setString(2,email);
				stmt.executeUpdate();
                        //        stmt.executeQuery();
				out.println("score updated sucessfully");
				

                    
                    
                    
                    %>
        
        
        
        
        
        <h1>Hello World!</h1>
    </body>
</html>
