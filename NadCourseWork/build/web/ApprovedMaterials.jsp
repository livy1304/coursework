<%-- 
    Document   : approvedmaterials
    Created on : Jan 15, 2022, 6:59:56 PM
    Author     : olivia uwimaana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.db.connection.DBConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Approved Item</title>
    </head>
    <body>
        <%
             DBConnection con = new DBConnection();
            Connection newConn = con.getConnection();
             Statement St = newConn.createStatement();
             ResultSet rs= St.executeQuery("select * from promotion where approved=1 ");
        %>
        
        <div class="container m-4">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col"> Approved Items </th>
                    </tr>
                </thead>
                <tbody>
                    <%while(rs.next()){%>
                    <tr>
                        <td scope="row"><%=rs.getString("name")%></td>
                    </tr>
                    
                    <%}%>

                </tbody>
            </table>

        </div>


    </body>
</html>
