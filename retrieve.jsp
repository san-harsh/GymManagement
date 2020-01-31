<%@ page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%       

 String url = "jdbc:oracle:thin:@localhost:1521:XE";
        String user = "haransh"; 
           String pass = "haransh";
          
            try{
               
               
                Class.forName("oracle.jdbc.driver.OracleDriver");
               Connection con = DriverManager.getConnection(url,user,pass);
                 PreparedStatement ps=con.prepareStatement("select *from register ");
                 ResultSet resultSet=ps.executeQuery();
                  
            


              
            
          
%>
<html>
    <head>
        <title>retrive</title>
        <style>
            
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
    </head>
    <body>
   
    <table>
        <tr>
            <th>First_name</th>
            <th>Middle_name</th>
            <th>Last_name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Phone</th>
         </tr>
    
        <tr> 
            <%while(resultSet.next())
    {
        %>
        <tr>
                 <td><%=resultSet.getString(1) %></td>
                 <td><%=resultSet.getString(2) %></td>
                 <td><%=resultSet.getString(3) %></td>
                 <td><%=resultSet.getInt(4) %></td>
                 <td><%=resultSet.getString(5) %></td>
                 <td><%=resultSet.getInt(6) %></td>
        </tr>
                 <%}%>
         </tr>    
         
 </table>
            <%
       

            }
             catch(Exception e)
           {
               out.println(e);
           }%>
    </body>
</html>