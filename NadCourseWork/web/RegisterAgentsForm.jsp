<%@page import="org.db.connection.DBConnection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
           <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Page</title>
    </head>
    <body>
      <jsp:include page="includes/systemadmin.jsp" />

      
      <%
                      DBConnection con = new DBConnection();
            Connection newConn = con.getConnection();
             Statement St = newConn.createStatement(); 
             ResultSet rs =  St.executeQuery("select * from area where totalAgents<2");
      %>
<div class="w3-container">
            <div style="display: grid; place-items: center; margin:50px;  ;padding: 20px; border-radius: 10px;">
        <div  style="display: flex;align-items: center; justify-content: center; margin:10px;color: #fff; ">
           
        </div>

        <form action="AddAgentToDb.jsp" style="width: 40%; background-color: white;border: 1px solid whitesmoke; padding: 10px;box-shadow: 
        rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border-radius: 10px;">
            
            
        <div style="display: flex;align-items: center; justify-content: center;">
            <h5 style="align-items: center;">REGISTER AN AGENT</h5>
            
            <a href="RegisterAreaForm.jsp" title="register" style="margin-left: 10px;margin-top: 5px; border: 1px solid black;background-color: blue;color:white">Register Area First</a>
               <a href="viewagent.jsp" title="view areas" style="margin-left: 10px;margin-top: 5px; border: 1px solid black;background-color: blue;color:white">View Agents</a>
        </div>

            <div class="m-3">
                <label for="exampleFormControlInput1" class="form-label"> First Name</label>
                <input type="text" class="form-control" name="fname" required>
            </div>

              <div class="m-3">
                <label for="exampleFormControlInput1" class="form-label">Last Name</label>
                <input type="text" required  class="form-control m-2" name="lname">
              </div>
             <div class="m-3">
                 <label for="exampleFormControlInput1"class="form-label">Phone</label>
                <input type="text" required  class="form-control m-2" name="phone">
              </div>
                     
            
              <div class="m-3">
                <label for="exampleFormControlInput1" class="form-label">Email</label>
                <input type="email" required  class="form-control m-2" name="email">
              </div>
                          <div class="m-3">
                <label for="exampleFormControlInput1" class="form-label">Area</label>
                <select class="form-control" name="id">
                    <option selected="" disabled="">select area</option>
                    <%
                      while(rs.next()){
                        
                    %>
                    <option value="<%=rs.getInt("id")%>"><%=rs.getString("village")%></option>
                    <%}%>
                </select>
              </div>
            <div class="m-3">
                <label for="exampleFormControlInput1" class="form-label">password</label>
                <input type="password" required  class="form-control m-2" name="password">
              </div>


              <div class="m-3 "  style="margin:20px 0;">
                  <button type="submit" class="btn btn-primary pt-3 m-2 btn-block">Register An Agent</button>
              </div>
            

    
        </form>
     </div>
</div>

    </body>
</html>
