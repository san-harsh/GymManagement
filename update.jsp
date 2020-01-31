<%@ page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String ed=request.getParameter("ed");
String firstname=request.getParameter("fname");
String middlename=request.getParameter("mname");
String lastname=request.getParameter("lname");
String gender=request.getParameter("gender");
String age=request.getParameter("age");
String phone=request.getParameter("phone");
try{
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","haransh","haransh");
    PreparedStatement ps=con.prepareStatement("select *from register where fname=?");
    ps.setString(1, ed);
                 ResultSet resultSet=ps.executeQuery();
    
%>
<html>

            <title>REGISTER</title>
            <style>
                    body {
                        background-color: #00cccc;
                    } 
                    </style>
                    <style>

font.sansserif {
  font-family: Arial, Helvetica, sans-serif;
}

                    </style>
                     <style>
                            .container {
                              position: relative;
                            }
                            
                            .bottomright {
                              position: absolute;
                              bottom: 8px;
                              right: 16px;
                              font-size: 18px;
                              border: 3px solid #515a5a;
                            }
                            img.pos{
                              position: absolute;
                              top:52px;
                            }
                            img.pos{
                                          position: absolute;
                                          top:80px;
                                          right: 0px;
                                        }
                                          table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
                            </style>
         <body>
             <table>
        <tr>
            <th>First name</th>
            <th>Middle name</th>
            <th>Last name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Phone</th>
         </tr>
    
        
            <%
                
                while(resultSet.next())
    
                {%>
        <tr>
                 <td><%=resultSet.getString(1) %></td>
                 <td><%=resultSet.getString(2) %></td>
                 <td><%=resultSet.getString(3) %></td>
                 <td><%=resultSet.getInt(4) %></td>
                 <td><%=resultSet.getString(5) %></td>
                 <td><%=resultSet.getInt(6) %></td>
        </tr>
                 <%}
PreparedStatement pst = con.prepareStatement("Delete from register where fname=?");
                pst.setString(1,ed);
                int x= pst.executeUpdate();
}
                 catch(Exception e){
out.print(e);
}
%>
           
         
 </table>
            <form action ="updatef.jsp" method="post">
                <br><br>   <font class="sansserif" color="#515a5a"> <center>ENTER THE UPDATE VALLUES</center></font> <br><br><br>
                   
                            <font class="sansserif" color="#515a5a" >ENTER FIRST NAME:</font> <center><input type="text" required name="fname"></center><br>
                            <font class="sansserif" color="#515a5a">ENTER MIDDLE NAME: <center><input type="text" name="mname" required></center><br>
                            <font class="sansserif" color="#515a5a">ENTER LAST NAME: <center> <input type="text" name="lname" required ></center><br>
                            AGE: <center><input type="text" name="age" required></center><br>
                            GENDER:<br>(MALE/FEMALE) <br> <center><input type="text" required name="gender"></center>
                            <p style="text-align:left;">PHONE NO:</p>
                            <center><input type="text" name="phone" required></center><br>
                            <center><input type="submit" value="submit"></center> 
                            <div class="bottomright">DESIGNED BY <font class="sansserif" color="#cd292a">VIGNESH </font> AND <font  class="sansserif" color="#cd292a">HARSH </font></div>
          
                  <img class="pos" src="regs.jpg" style="width:300px;height:560px;">
                </form>
           </body>       
                   
                    
    
   
</html>