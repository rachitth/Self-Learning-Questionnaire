<%-- 
    Document   : questionpage
    Created on : Mar 17, 2018, 8:38:06 PM
    Author     : rachit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>question page</title>
    </head>
    <body>

        
                    <%@page import="java.sql.*" %>
                    <%@page import="javax.sql.*" %>   
                    <%@page import="java.util.Random" %>   
                    <%@page import="java.util.Scanner" %>   
                   
                    
                    <%
                    
                    
                     String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
                     String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	
                    //Database Credentials
                    String USER = "system";
                    String PASS = "admin";


                    Connection conn=null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    Random rand= new Random();
                    Scanner s=new Scanner(System.in);

	
                    // STEP 2: Register JDBC driver
                    Class.forName(JDBC_DRIVER);

                    // STEP 3: Open a connection
                    conn = DriverManager.getConnection(DB_URL, USER, PASS);



                    int a[][]=new int[4][5];					//i=difficulty j=index
                    for(int i=0;i<4;i++)
                    {
                            for(int j=0;j<5;j++)
                            {
                            a[i][j]=0;	
                            }
                    }

                    




                        int diff=1;
			int queno=1;
			int no=1;
			int ind;
			// STEP 4: Execute a query Diplaying the questions
			while(queno<=5)
			{
			 ind =rand.nextInt(30000);
                         ind=ind%5;
		//Making sure that thes same question doesnt repeate

			if(a[diff-1][ind]==0)
			{
			a[diff-1][ind]=1;
			
			String sql;
			if(queno<=5)
			{
			sql = "SELECT * FROM qdata where difficulty_level=? and indx=?";
			}
			else
			{
			sql = "SELECT * FROM cdata where difficulty_level=? and indx=?";
			}
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,diff);
			stmt.setInt(2,ind+1);
                         rs = stmt.executeQuery();
			while (rs.next()) {
				// Retrieve by column name
				String question = rs.getString("QUESTION");
				String A = rs.getString("A");
				String B = rs.getString("B");
				String C = rs.getString("C");
				String D = rs.getString("D");
				String answ=rs.getString("CORRECT_OPTION");
				
				// Display values
				System.out.print("Q "+ no +"):" + question);
				System.out.print("\nA: " + A);
				System.out.print("\nB: " + B);
				System.out.print("\nC: " + C);
				System.out.print("\nD: " + D +"\nans=");
				String ans=s.next();
				
			
				
			
				//Buisness Logic(basic-Adaptive)
				if(ans.equals(answ))
				{
					if(diff==4)
					{
						diff=4;
					}
					else
					{
					diff=diff+1;
					}
				}
				else{
					if(diff==1)
					{
						diff=1;
					}
					else{
							diff=diff-1;	
						}
					}
				queno=queno+1;
				no=no+1;
			}
			
			

			}
                       
                        rs.close();
			stmt.close();
			
		}//For the testing perpose to check the array
				
		conn.close();
		System.out.println("Your test is Over!!!!Thnks");//yahan tak le le
                




                    %>
                    
    </body>
</html>
