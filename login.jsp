<%@ page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
 <% 
             Class.forName("oracle.jdbc.OracleDriver");
             Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","haransh","haransh");
           try
           {
               
               String user=request.getParameter("user");
               String password=request.getParameter("password");     
               PreparedStatement pst = con.prepareStatement("select * from login where username=? and password=?");
               pst.setString(1,user);
               pst.setString(2,password);
               ResultSet r=pst.executeQuery();
               if(r.next())
               {
                 session.setAttribute("password",password);
                 response.sendRedirect("register.html");
                 
               }
               else
               {   
                  response.sendRedirect("wrongpassword.html");
               }
           } 
           catch(Exception e) 
           { 
               out.println(e); 
           }
 %>

