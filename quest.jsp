<%-- 
    Document   : index1.jsp
    Created on : Mar 18, 2018, 5:52:05 PM
    Author     : rachit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>thakur test</title>
    </head>
    
    
      
<style type="text/css">

body.back{
     background-image: url('back4.jpg');
    min-height: 100%;
    background-position: center;
    background-size: cover;

}



div.cities {

    background-color: black;

    color: white;

    margin: 10px 0 10px 0;

    padding: 20px;

	opacity:0.8;
        
        text-align:justify;
            
    letter-spacing: 3px;
    
    font-size:20px ;
    

}
h2{
        margin: 40px 0 20px 0;

}




div.cities2 {

    background-color: black;

    color: white;

    margin: 10px 0 10px 0;

    padding: 20px;

	opacity:0.7;
        
        text-align:justify;
            
    
    font-size:20px ;
    

}
</style>

    
    
    
    
<body class="back" oncontextmenu="return false">

    
        
                    <%@page import="java.sql.*" %>
                    <%@page import="javax.sql.*" %>   
                    <%@page import="java.util.Random" %>   
                    
                    
                    <div class="cities2">
                        
      
                    <%
                        
                     //   float difff=Float.parseFloat(request.getParameter("diff"));
                        
                        
                    int diff=Integer.parseInt(request.getParameter("diff"));
                    session.putValue("diff",diff); 
                    
                    float score=Float.parseFloat(request.getParameter("score"));
                    session.putValue("score",score); 


               //    int ind=Integer.parseInt(request.getParameter("ind"));
               //     session.putValue("ind",ind); 

                            int no=Integer.parseInt(request.getParameter("no"));
                            String ans=request.getParameter("ans");  
                            String answ=request.getParameter("answ");  
                            String email=request.getParameter("email");  
                            String checker=request.getParameter("checker");  
                                                session.putValue("checker",checker); 

                          //  out.println(checker1);
                          
                          char[] checker1=checker.toCharArray();
                          
                                                     // out.println("ram"+checker[0]+"rsm");



 
                     String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
                     String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	
                    //Database Credentials
                    String USER = "system";
                    String PASS = "admin";


                    Connection conn=null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    Random rand= new Random();
                    
                    String question=null,A=null,B=null,C=null,D=null;
                   int  ind=1;

                   ind =rand.nextInt(30000);
                   ind=ind%10;
                   ind++;

                   float k=0.5f;//base score for correct=0.5(diff+1)
                   float l=0.1f;//base score for wrong=0.1(diff+4)
                  // int diffp=diff;
  
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
                                                                            
                                                                        /*    
                                                                            if(diff>diffp)
                                                                                score=score+k*(diffp+1);
                                                                            else if(diff<diffp)
                                                                                score=score-l*diffp;
                                                                            else if(diff==diffp)
                                                                            {
                                                                              
                                                                                if(diff==1||diff==4)
                                                                                {
                                                                                        
                                                                                }
                                                                            
                                                                            }*/
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            no=no+1;
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
out.println("  diff "+diff);
//out.println("ind"+ind);
out.println("  no "+no);
out.println("  score "+score);
out.println("  index "+ind);

while(checker1[(diff-1)*10+(ind-1)]=='1')
{
                   ind =rand.nextInt(30000);
                   ind=ind%10;
                   ind++;
   
}

checker1[(diff-1)*10+(ind-1)]='1';

String checker2 = String.copyValueOf(checker1);


%><br>


<%
out.println("previous selected ans :  "+ans);
out.println("previous correct ans :  "+answ);
out.println("new checker list :  "+checker2);









                    

	
                    // STEP 2: Register JDBC driver
                    Class.forName(JDBC_DRIVER);

                    // STEP 3: Open a connection
                    conn = DriverManager.getConnection(DB_URL, USER, PASS);



                                        String sql;
                                        
                                        
                                        
                                        
                                String strscore=Float.toString(score);
                                String diff1=Integer.toString(diff);
                                String qno1=Integer.toString(no);

                                        
                                        
                                        
                                sql = "update userinfo  set score=? , diff=? , qno=? , checker=?  where email=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,strscore);
				stmt.setString(2,diff1);
				stmt.setString(3,qno1);
				stmt.setString(4,checker);
				stmt.setString(5,email);
				stmt.executeUpdate();
                                        
                                        
                                        
                                        
                                        sql = "SELECT * FROM qdata where difficulty_level=? and indx=?";
                                        

                                        stmt = conn.prepareStatement(sql);
                                        stmt.setInt(1,diff);
                                        stmt.setInt(2,ind);
                                        rs = stmt.executeQuery();
                                        while (rs.next()) {
                                                                // Retrieve by column name
                                                                question = rs.getString("QUESTION");
                                                                 A = rs.getString("A");
                                                                 B = rs.getString("B");
                                                                 C = rs.getString("C");
                                                                 D = rs.getString("D");
                                                                 answ=rs.getString("CORRECT_OPTION");
                                                                 //ans="x";//s.next();

                                                          }
                                        /*
                                                                            out.print("\nans: " + answ);

                                                                            out.print("Q :" + question);
                                                                            out.print("\nA: " + A);
                                                                            out.print("\nB: " + B);
                                                                            out.print("\nC: " + C);
                                                                            out.print("\nD: " + D +"\nans=");
                                                                            */
                                                                          
                                                                            String str1=Integer.toString(diff);
                                                                            String str2=Integer.toString(no);
                                                                            String str3=Float.toString(score);

                    
                    %>
                    
                    </div> 

                    
                    <h2></h2>
                    <div class="cities">
                  

                                <h1>QUESTION <%=no%>:</h1>


                    </div> 
                               
                               
                    <div class="cities">
                        

                                    <p> 	
                                                 <%=question%>
                                    </p>
                                    <br><br>
                                  <form name="myForm" id="rac"  method="post">
                                  <input type="radio" id="A" name="city" value="A"  ><%=A%><br>
                                  <input type="radio" id="B" name="city" value="B"><%=B%><br>
                                  <input type="radio" id="C" name="city" value="C" ><%=C%><br>
                                  <input type="radio" id="D" name="city" value="D" ><%=D%><br><br>
                                  <input type="hidden" id="anss" name="ans">  
                                  <input type="hidden" name="answ" value="<%=answ%>"> 
                                  <input type="hidden" name="diff" value="<%=str1%>"> 
                                  <input type="hidden" id="noo" name="no" value="<%=str2%>"> 
                                  <input type="hidden" name="score" value="<%=str3%>"> 
                                  <input type="hidden" name="email" value="<%=email%>"> 
                                                        <input type="hidden" name="checker" value="<%=checker1%>"> 



                                  <input type="submit" onclick="check(this.form)"  value="submit & next">
                                  <input type="reset">
                                </form> 

                    </div> 
                      
                      
                      <div class="cities2" id="some_div"></div>
                      
<script language="javascript">
   
   
   var timeLeft = 20;
var elem = document.getElementById('some_div');

var timerId = setInterval(countdown, 1000);

function countdown() {
  if (timeLeft == 0) {
    clearTimeout(timerId);
    doSomething();
  } else {
    elem.innerHTML = timeLeft + ' seconds remaining';
    timeLeft--;
  }
}
   
   
   
   
   
   
      var auto_refresh = setInterval(
    function()
    {
    submitform();
    }, 20000);

    function submitform()
    {
    //  alert('times up');
          document.getElementById("anss").value ="ns";
          if(document.getElementById("noo").value=="10")
                    document.getElementById("rac").action ="end.jsp";
                 
      document.myForm.submit();
    }

function check(form)
{
            if(form.city.value=="A"||form.city.value=="B"||form.city.value=="C"||form.city.value=="D")
                    document.getElementById("anss").value = form.city.value;
            else
                    document.getElementById("anss").value ="ns";

                    
            if(form.no.value=="10")
                            document.getElementById("rac").action ="end.jsp";
                 
}

 </script> 
 
     
   
                      
                     
 
    </body>
</html>
