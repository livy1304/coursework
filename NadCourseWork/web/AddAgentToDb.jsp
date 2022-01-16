
<%-- 
    Document   : AddVaccineToDb
    Created on : Dec 2, 2021, 1:10:22 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.db.connection.DBConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>jsp....</title>
    </head>
    <body>
        <%
            String firstname = request.getParameter("fname");
            String lastname = request.getParameter("lname");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
             String id = request.getParameter("id");
      %>



        <%
            DBConnection con = new DBConnection();
            Connection newConn = con.getConnection();
             Statement St = newConn.createStatement();                  
         St.executeUpdate("INSERT INTO agent (`firstname`, `lastname`, `phone`, `email`,`password`,`areaId`) "
                  + "VALUES ('"+firstname+"','"+lastname+"','"+phone+"','"+email+"','"+password+"', '"+id+"')");
         
         ResultSet rs = St.executeQuery("select totalAgents from area where id = '"+id+"'");
         int totalAgents = 0;
         while(rs.next()){
              totalAgents = rs.getInt("totalAgents");
         }
         totalAgents+=1;
         
         St.executeUpdate("update area set totalAgents='"+totalAgents+"' where id = '"+id+"'");
         
         
         
        // out.println(rs.getInt("totalAgents"));
         
         
         
         
         
         
         out.print("<script>window.alert('agent registered')</script>");
          out.print("<script>window.location.href='RegisterAgentsForm.jsp'</script>");
          
            %>
    </body>
</html>
