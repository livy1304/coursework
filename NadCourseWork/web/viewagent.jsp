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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Show agent</title>
    </head>
    <body>
        <%
             DBConnection con = new DBConnection();
            Connection newConn = con.getConnection();
             Statement St = newConn.createStatement();
             ResultSet rs= St.executeQuery("SELECT agent.*, area.* FROM agent INNER JOIN area ON area.id = agent.areaId");
        %>
        
        <div class="container m-4">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Name </th>
                        <th scope="col">Email</th>
                        <th scope="col">phone</th>
                        <th scope="col">Area</th>
                    </tr>
                </thead>
                <tbody>
                    <%while(rs.next()){%>
                    <tr>
                        <td scope="row"><%=rs.getString("firstname")+ " "+ rs.getString("lastname")%></td>
                        <td><%=rs.getString("email")%></td>
                        <td><%=rs.getString("phone")%></td>
                        <td><%=rs.getString("village")%></td>
                    </tr>
                    
                    <%}%>

                </tbody>
            </table>

        </div>


    </body>
</html>
