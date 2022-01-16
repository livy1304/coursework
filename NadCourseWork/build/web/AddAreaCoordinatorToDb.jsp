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
            String name = request.getParameter("name");
            String phone= request.getParameter("phone");
            String email = request.getParameter("email");
            //String area= request.getParameter("area");
            String date = request.getParameter("date");
            String time= request.getParameter("time");
        %>
        
        <%
                     HttpSession s = request.getSession();
                    String area = (String)s.getAttribute("areaName");
        %>



        <%
            DBConnection con = new DBConnection();
            Connection newConn = con.getConnection();
             Statement St = newConn.createStatement();                  
         St.executeUpdate("INSERT INTO coordinator (`name`, `phone`, `email`, `area`,`date`,`time`) "
                  + "VALUES ('"+name+"','"+phone+"','"+email+"','"+area+"','"+date+"','"+time+"')");
         
          
          out.print("<script>window.location.href='RegisterAreaCoordinator.jsp'</script>");
          
            %>
    </body>
</html>
