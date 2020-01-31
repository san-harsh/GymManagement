<%@ page import="java.sql.*"%>
 <% 
      String firstname =request.getParameter("fname");
       String lastname =request.getParameter("lname");
              
           try{
               
                String url = "jdbc:oracle:thin:@localhost:1521:XE";
                String user = "haransh"; 
                String pass = "haransh";
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection(url,user,pass);
                PreparedStatement pst = con.prepareStatement("Delete from register where fname=? and lname=?");
                pst.setString(1,firstname);
                pst.setString(2,lastname);
                int x= pst.executeUpdate();
                if(x!=0){
                out.println("deletd");
                response.sendRedirect("register.html");
                }
                else
                out.println("deleted");  
                }
                catch(Exception e)
                {
                out.println(e);
                }
               %>