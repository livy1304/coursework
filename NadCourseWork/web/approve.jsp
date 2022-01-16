<%-- 
    Document   : approve
    Created on : Jan 16, 2022, 11:32:39 AM
    Author     : olivia uwimaana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="org.db.connection.DBConnection"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
              DBConnection con = new DBConnection();
            Connection newConn = con.getConnection();
             Statement St = newConn.createStatement();
            
           String id =  request.getParameter("id");
           St.executeUpdate("UPDATE promotion SET approved=1 WHERE id='"+id+"'");
            newConn.close();
            out.print("<script>window.location.href='GetPromotionItems.jsp'</script>");
           
        %>
    </body>
</html>
