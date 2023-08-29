<%-- 
    Document   : login
    Created on : Mar 16, 2018, 8:49:54 PM
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



div.cities {
    

        text-align: center;

    background-color: black;

    color: white;

    margin: 20px 0 20px 0;

    padding: 20px;

	opacity:0.8;

}





h1 {
    text-transform: uppercase;
    color: #4CAF50;
}

pre {
    
    text-align:justify;
    letter-spacing: 3px;
    
}
p {
    
    text-align: center;
    letter-spacing: 3px;
    
}

h3 {
    
        text-align: center;

    background-color: black;

    color: white;

    margin: 20px 0 20px 0;

	opacity:0.8;
        
    letter-spacing: 3px;
    

    
    
    
    
}


</style>

        
        
        
    </head>
    <body class="back" oncontextmenu="return false">

        <!--      <div class="body"></div>    -->
        
              <%@page import="java.sql.*" %>
              <%@page import="javax.sql.*" %>   
              
                       

              <%
                            String email=request.getParameter("email");  
                          //  out.println(email);
                            session.putValue("email",email); 
                            String pwd=request.getParameter("password");
                          //  out.println("\nsdfdsfdsffsd"+pwd);

                            
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
                                //out.println("\nquery executed sucessfully");
                                                  
                                if(rs.next())
                                {
                                String A = rs.getString("frst");
                                String B = rs.getString("lst");
                                String c=  rs.getString("score");
				String D = rs.getString("pasword");
                                String diff = rs.getString("diff");
                                String qno = rs.getString("qno");
                                String checkflag = rs.getString("checker");

                                if(pwd.equals(D))
                                {
                                        if(c.equals("noscore"))
                                        {  
                                            char[] checker=new char[40];
                                            for(int i=0;i<40;i++)
                                            {
                                                checker[i]='0';
                                            }
                                           // out.println(checker);
                                        
                                           %>
                                            <h3>
                                            <%
                                           
                                                                                    out.println("\n correct password   welcome "+A +" "+B+" .");
                                        %>        
                                        
                    </h3>
                    
                    
                    <div class="cities">     

                    <h1><b><i><u>INSTRUCTIONS:</u></i></b></h1>

                    </div>
                    
<div class="cities">     

<pre>
1.<u>THIS IS AN ADAPTIVE TEST.</u>
2.There are 10 question in this test.
3.The question are of 4 different difficulty levels.
4.Depending on the response of the question given by the user difficulty level increase or decrease.
5.If <b>right/wrong answer</b> is submitted by the candidate for the current question, difficulty level of next question will 
  <b>increase/decrease by 1</b>.
6.If question is skipped/not answered , the difficult level remain same as the previous question.
7.For each question,the candidate has 20 seconds to answer.

MARKING SCHEME:

DIFF LEVEL:                 MARKS FOR CORRECT ANS:                   MARKS FOR WRONG ANS:                  %MARKS LOSS 

1                           1                                        0.5                                   50%

2                           1.5                                      0.6                                   40%

3                           2                                        0.7                                   35%

4.                          2.5                                      0.8                                   32%
</pre>
</div>
    
                    <div class="cities">     
     
                    <form  name="myForm"  action="quest.jsp" method="post">
                
                      
                        
                      <input type="hidden" name="ans" value="temp">  
                      <input type="hidden" name="answ" value="x"> 
                      <input type="hidden" name="diff" value="1"> 
                      <input type="hidden" name="no" value="0"> 
                      <input type="hidden" name="score" value="0"> 
                      <input type="hidden" name="email" value="<%=email%>"> 
                      <input type="hidden" name="checker" value="<%=checker%>"> 

                      <input type="button" onclick="popitup()" value="start exam"> 

                    <input type="checkbox" id="checked">I HAVE READ THE INSTRUCTIONS CAREFULLY.

                    </form>  
                      
                    </div>     

                      
                      
<script language="javascript">    
    
        function popitup() {
            if(document.getElementById("checked").checked==true)
           {
                       document.myForm.submit();

           }
            else
                alert('please check the box before starting the exam!!');
         }
</script>




<%
                               
                                        
                                        
                                        }
                                        else
                                        {
                                                if(!qno.equals("endq"))
                                                {
                                                   int qno11=Integer.parseInt(qno);
                                                   qno11--;
                                                    qno=Integer.toString(qno11);
                                                    
                                                        
%>
                                                  <div class="cities">     

                                                <h1><b><i><u>YOUR EXAM SESSION HAD ENDED ABRUPTLY!</u></i></b></h1>
                                                
                                                    </div>     

                                                <br><br><br><br><br><br><br><br>

                                                <h3>enter the admin password to continue the exam.</h3><br>

                                                <div class="cities">     
                                                
                                                <form name="myForm" id="rac"  action="quest.jsp" method="post">


                                                  <input type="password" placeholder="admin password" id="password" name="password"><br><br>
                                                  <input type="hidden" name="ans" value="temp">  
                                                  <input type="hidden" name="answ" value="x"> 
                                                  <input type="hidden" name="diff" value="<%=diff%>"> 
                                                  <input type="hidden" name="no" value="<%=qno%>"> 
                                                  <input type="hidden" name="score" value="<%=c%>"> 
                                                  <input type="hidden" name="email" value="<%=email%>"> 
                                                  <input type="hidden" name="checker" value="<%=checkflag%>"> 

                                                    <input type="button"  onclick="checkpass()" value="Start Exam"><p>OR</p>
                                                    <input type="button" onclick="jump()" value="end exam"> 


                                                </form> 
                                                 </div>     

<script language="javascript">    


    function checkpass() {
        if(document.getElementById("password").value=="rt")
       {
                 document.myForm.submit();
       }
        else
            alert('Enter correct password!!');
        }
        
        function jump()
        {
                                document.getElementById("rac").action ="end.jsp";
                                document.myForm.submit();


        }
</script>


                    
                                                                
                                    <%
                                                            
                                                }
                                                    
                                                else
                                                {

                                                                    %> 

                                                                                    <form name="myForm"  action="index.jsp" method="post">
                                                                                                  <input type="hidden" name="flag" value="ss"> 
                                                                                                  <input type="hidden" name="first" value="<%=A%>"> 
                                                                                                  <input type="hidden" name="last" value="<%=B%>">
                                                                                                  <input type="hidden" name="score" value="<%=c%>"> 
                                                                                    </form> 


                                                                    <script language="javascript">
                                                                                                         document.myForm.submit();
                                                                    </script> 




                                                                    <%     

                                                }
              
                                        
                                        }


                                }//END OF IF PASSWORD IS CORRECT
                                else
                                { 
                                    %> 
                                    
                                                    <form name="myForm"  action="index.jsp" method="post">
                                                                  <input type="hidden" name="flag" value="w"> 
                                                    </form> 
                                    
                                    
                                    <script language="javascript">
                                                                         document.myForm.submit();
                                    </script> 

                                    
                                    
                                    
                                    <%
                                }

                                }
                                else
                                {
                                    %>   
                           
                                                    <form name="myForm"  action="index.jsp" method="post">
                                                                  <input type="hidden" name="flag" value="e"> 
                                                    </form> 
                                    
                                    
                                    <script language="javascript">
                                                                         document.myForm.submit();
                                    </script> 

                                    
                                    
                                    
                                    <%
                                }
                                


                %>
                



    </body>
</html>
