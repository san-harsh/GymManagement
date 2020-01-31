<%@ page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String firstname=request.getParameter("fname");
String middlename=request.getParameter("mname");
String lastname=request.getParameter("lname");
String gender=request.getParameter("gender");
String age=request.getParameter("age");
String phone=request.getParameter("phone");
try{
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","haransh","haransh");
    PreparedStatement ps=con.prepareStatement("insert into register values(?,?,?,?,?,?)");
    ps.setString(1,firstname);
    ps.setString(2,middlename);
    ps.setString(3,lastname);
    ps.setString(4,age);
    ps.setString(5,gender);
    ps.setString(6,phone);
    int x= ps.executeUpdate();
    
    if(x!=0){
        out.println("registered");
         response.sendRedirect("registered.html");
    }
    else
        out.println("somthing went wrong");
}
catch(Exception e)
{
 out.println(e);   
}
%>