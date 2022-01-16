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
            String district = request.getParameter("district");
            String county = request.getParameter("county");
            String sub_county = request.getParameter("sub-county");
            String parish = request.getParameter("parish");
            String village = request.getParameter("village");
        %>



        <%
            DBConnection con = new DBConnection();
            Connection newConn = con.getConnection();
             Statement St = newConn.createStatement();                  
         St.executeUpdate("INSERT INTO area (`district`, `county`, `sub-county`, `parish`,`village`) "
                  + "VALUES ('"+district+"','"+county+"','"+sub_county+"','"+parish+"','"+village+"')");
         
          
          out.print("<script>window.location.href='RegisterAreaForm.jsp'</script>");
          
            %>
    </body>
</html>
