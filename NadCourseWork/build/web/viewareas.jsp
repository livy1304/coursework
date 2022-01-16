<%-- 
    Document   : viewareas
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
        <title>Show area</title>
    </head>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <body>
        <%
             DBConnection con = new DBConnection();
            Connection newConn = con.getConnection();
             Statement St = newConn.createStatement();
             ResultSet rs= St.executeQuery("SELECT * FROM area");
             %>
            <div class="container m-4">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">District </th>
                        <th scope="col">County</th>
                        <th scope="col">Sub-county</th>
                        <th scope="col">parish</th>
                        <th scope="col">village</th>
                        <th scope="col">Total Agents</th>
                    </tr>
                </thead>
                <tbody>
                    <%while(rs.next()){%>
                    <tr>
                        <td scope="row"><%=rs.getString("district")%></td>
                        <td><%=rs.getString("county")%></td>
                        <td><%=rs.getString("sub-county")%></td>
                        <td><%=rs.getString("parish")%></td>
                        <td><%=rs.getString("village")%></td>
                        <td><%=rs.getInt("totalAgents")%></td>
                    </tr>
                    
                    <%}%>

                </tbody>
            </table>

        
    </body>
</html>
