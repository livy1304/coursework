<%-- 
    Document   : totalAdmins
    Created on : Dec 3, 2021, 10:44:35 AM
    Author     : user
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.db.connection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
                <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboards Page</title>
    </head>
  <!-- Sidebar -->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
  <h3 class="w3-bar-item">Agent Activities</h3>

  <a href="promotion.jsp" class="w3-bar-item w3-button">Register Promotional Item</a>
  <a href="RegisterAreaCoordinator.jsp" class="w3-bar-item w3-button">Register Area Coordinator</a>
 
  
     


</div>

<!-- Page Content -->
<div style="margin-left:25%">
    <style>
        .header{
            display: flex;
            align-items: center;
            justify-content: space-between
        }
        
    </style>

<div class="w3-container w3-teal">
  <div class="header">
        <h1>
        <%   
  String name = (String)session.getAttribute("agentName"); 

out.print("Welcome "+name);  
  
 
  

  
%>  

    
    <h3 style="cursor:pointer; text-decoration: none;">
        <a href="/NadCourseWork">LogOut</a>
    </h3>
    
    
        
    </div>
</div>



</div>
    </body>
</html>
