/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.health.administration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.db.connection.DBConnection;

/**
 *
 * @author user
 */
public class LoginServlet extends HttpServlet {
               DBConnection Conn = new DBConnection();
         Connection newConn  = Conn.getConnection();
    
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            

                      
//            request.setAttribute("email", email);
//            request.setAttribute("password", password);
//             RequestDispatcher rd = request.getRequestDispatcher("LoginUser.jsp");    
//            rd.forward(request, response);//method may be include or forward  
            

                    
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
                        //getParamaters
            String email =  request.getParameter("email");
            String password =  request.getParameter("password");
            if(newConn.isClosed()){
                out.println("no connection");
            }
            else{
                                 //out.println("There is connection");
        }

            
            
               //create statement
               Statement St = newConn.createStatement();
               ResultSet rs =St.executeQuery("select email, password,role, name from administrator ");
                          HttpSession session = request.getSession();
               while(rs.next()){
                   //out.println("here");
                  if(email.equalsIgnoreCase(rs.getString("email")) && password.equals(rs.getString("password"))){
                         //out.println("<h1>SuperAdmin</h1>");
                //get role
                session.removeAttribute("invalid");

                 if(rs.getString("role").equals("overall")){
                      session.setAttribute("name", rs.getString("name"));
                      out.println("here");
                       //session.setAttribute("healthCentreId", rs.getString("healthCenterName"));
                       //system admin
                  RequestDispatcher rd = request.getRequestDispatcher("systemadminstrator.jsp");
                 rd.forward(request, response);
                 
                       
                 } 
                 else{
                     session.setAttribute("name", rs.getString("name"));
                                           // session.setAttribute("healthCentreId", rs.getString("healthCenterName"));
                       //system admin
                  RequestDispatcher rd = request.getRequestDispatcher("agent.jsp");
                  rd.forward(request, response);
                     //healthAdministrator

                 }
                }else{
                      ResultSet agents =St.executeQuery("select agent.*, area.village from agent INNER JOIN area ON area.id = agent.areaId");
                      
                        while(agents.next()){
                             if(email.equalsIgnoreCase(agents.getString("email")) && password.equals(agents.getString("password"))){
                                  session.setAttribute("agentName", agents.getString("firstname"));
                                  session.setAttribute("areaName", agents.getString("village"));
                                            RequestDispatcher rd = request.getRequestDispatcher("agent.jsp");
                  rd.forward(request, response);
                                 //out.println("login");
                             }
                             
                        }
                       session.setAttribute("invalid", "invalidCredentials");
                 out.println("<script type='text/javascript'>window.location='login.jsp?invalid=true'</script>");
//               out.println("<h1>email :"+rs.getString("email")+"password"+rs.getString("password")+"</h1>");
                }

               }
              // newConn.close();
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                   try {
                       processRequest(request, response);
                   } catch (SQLException ex) {
                       Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                   }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                   try {
                       processRequest(request, response);
                   } catch (SQLException ex) {
                       Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                   }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}