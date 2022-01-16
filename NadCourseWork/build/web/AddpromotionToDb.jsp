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

        <title>Promotion Items</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
        %>



        <%
            DBConnection con = new DBConnection();
            Connection newConn = con.getConnection();
             Statement St = newConn.createStatement();                  
         St.executeUpdate("INSERT INTO promotion (`name`) "
                  + "VALUES ('"+name+"')");
         
          
          out.print("<script>window.location.href='promotion.jsp'</script>");
          
            %>
    </body>
</html>
