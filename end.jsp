<%-- 
    Document   : end
    Created on : Mar 19, 2018, 8:07:42 PM
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
	background-image: url('background2.jpg');
	background-size: cover;
	/*-webkit-filter: blur(5px);*/
	z-index: 0;
}



h1 {
    text-transform: uppercase;
    color: #4CAF50;
    
	position: absolute;
	top: 270px;
	left: 180px;

}

p {
    
    text-align:justify;
    letter-spacing: 3px;
    font-size:20px;
    
	position: absolute;
	top: 200px;
	left: 270px;

    
}
a{
    text-align:justify;
    letter-spacing: 3px;
    
	position: absolute;
	top: 500px;
	left: 270px;

}


</style>

 
        
        
        
        
    </head>
    <body class="back" oncontextmenu="return false">
        
        
                    <%@page import="java.sql.*" %>
                    <%@page import="javax.sql.*" %>   
                    <h1>
                    <%
                        
                            int diff=Integer.parseInt(request.getParameter("diff"));
                            session.putValue("diff",diff);
                            
                            int qno=Integer.parseInt(request.getParameter("no"));
                            
                            String checker=request.getParameter("checker");  
                            session.putValue("checker",checker); 


                            
                            String ans=request.getParameter("ans");  
                            String answ=request.getParameter("answ"); 
                    
                        
                            float score=Float.parseFloat(request.getParameter("score"));
                            session.putValue("score",score); 
                            String email=request.getParameter("email");  
                            session.putValue("email",email); 

   //out.println("dgdgs  " +email);
   
                             float k=0.5f;//base score for correct=0.5(diff+1)
                             float l=0.1f;//base score for wrong=0.1(diff+4)



  
                                                                            if(!ans.equals("ns"))
                                                                            {
                                                                            

                                                                                        if(ans.equals(answ))
                                                                                        {
                                                                                                score=score*10+(k*10)*(diff+1);
                                                                                                 score=score/10;
                                                                                                if(diff==4)
                                                                                                {
                                                                                                        diff=4;
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                        diff=diff+1;
                                                                                                }
                                                                                       // out.print("check1");

                                                                                        }
                                                                                        else{
                                                                                                if(!ans.equals("temp"))
                                                                                                {
                                                                                                    score=score*10-(l*10)*(4+diff); 
                                                                                                    score=score/10;
                                                                                                }
                                                                                                
                                                                                                if(diff==1)
                                                                                                {
                                                                                                        diff=1;
                                                                                                }
                                                                                                else{
                                                                                                                diff=diff-1;	
                                                                                                    }
                                                                                                // out.print("check2");
                                                                                            }


                                                                            
                                                                            }
                                                                                                         
                             
   
                            String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
                            String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	
                            //Database Credentials
                            String USER = "system";
                            String PASS = "admin";


                            Connection conn=null;
                            PreparedStatement stmt = null;
                            ResultSet rs = null;

                            // STEP 2: Register JDBC driver
                            Class.forName(JDBC_DRIVER);

                            // STEP 3: Open a connection
                            conn = DriverManager.getConnection(DB_URL, USER, PASS);
                            
                                String sql;
				sql = "select  * from userinfo where email=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,email);
                                rs = stmt.executeQuery();
                          //      out.println("\nquery executed sucessfully");
                                                  
                                if(rs.next())
                                {
                                String A = rs.getString("frst");
                                String B = rs.getString("lst");
                                        out.println("\n thank you for giving the test "+A +" "+B+".");%></h1><br><p><%
                                        
                                            out.println("Your score is  " +score+".");

                                }



                                String strscore=Float.toString(score);
                                String diff1=Integer.toString(diff);
                               // String qno1=Integer.toString(qno);

                              //  out.println("score from string = "+score);
/*

                             conn=null;
                             stmt = null;
                             rs = null;

                            // STEP 2: Register JDBC driver
                            Class.forName(JDBC_DRIVER);

                            // STEP 3: Open a connection
                            conn = DriverManager.getConnection(DB_URL, USER, PASS);
                            

*/
				sql = "update userinfo  set score=? , diff=? , qno=? , checker=?  where email=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,strscore);
				stmt.setString(2,diff1);
				stmt.setString(3,"endq");
				stmt.setString(4,checker);
				stmt.setString(5,email);
				stmt.executeUpdate();
                          //      stmt.executeQuery();
			//	out.println("score updated sucessfully");
				
				
                    
                    
                    %>
                    </p>
                    
                    <br><br>
                    <a href="javascript:window.open('','_self').close();">close</a>

                    
                                               <!--         
                                                    <form name="myForm"  action="dummyend.jsp" method="post">
                                                        <input type="hidden" name="score" value="<%//=score%>"> 
                                                        <input type="hidden" name="email" value="<%//=email%>"> 

                                                         <input type="submit" value="back to login page">
                                                    </form>
                                               -->

    </body>
</html>
