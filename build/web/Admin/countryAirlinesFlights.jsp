
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.Airline"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../config.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flight Allocation System</title>
         <link rel="shortcut icon" href="../image/logo.png" type="image/x-icon">
        <link href="../css/index.css" rel="stylesheet" type="text/css"/>
        <link href="../css/table.css" rel="stylesheet" type="text/css"/>
        <link href="../css/login.css" rel="stylesheet" type="text/css"/>

    </head>
    <body >
        <jsp:include page="../navigation.jsp"/>

        <section  class="login" >
            <%  String countryName = request.getParameter("country");%>
                    <h1 style="text-align: center;color: #fff;margin-top:7vh;font-size: 2.5vw;margin-bottom: 126vh;">Airlines and Flights to travel to  <%=countryName%></h1>

            <div style="margin-top: 50vh; display: block;height:auto" class="login_box" >
                

                <div>
                    <div class="center">
                        <a  href="adminPanel.jsp"><img style="width: 42px;height: 42px; padding-right: 0.7vw; margin-top: 12px;margin-right: 65vw;margin-left: 1vw"  src="../image/undo.png" alt=""/></a>
                    </div>
                    

                    <table style="margin-top: 6vh; margin-bottom: 5vh;" >
                        <thead>
                            <tr>
                                <th rowspan ="2" style="background-color: #0077e6" class="td">Airlines</th>
                                <th style="background-color: #0077e6" class="td">Flight details
                                </th>
                            </tr>
                            
                              <tr>
                              
                                <th style="background-color: #0077e6" class="td">
                                    Flight Name | Capacity | Aircraft Type | Baggage Information | Crew Information
                                </th>
                            </tr>
                            
                            
                             
                        </thead>
                        <tbody>


                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prototype", "root", "");

                                String sql = "SELECT airlines FROM countryflights WHERE country ='" + countryName + "'";
                                PreparedStatement pstmt = con.prepareStatement(sql);
                                ResultSet r = pstmt.executeQuery();

                                while (r.next()) {%>
                            <tr>
                                <td style="color: #002966" class="td"><%=r.getString("airlines")%></td>
                                
                                <td style="color: #002966" class="td">
                                    <ul></ul>
                                    
                                    <%
                                        String sql2 = "SELECT * FROM flightdetails WHERE airline='" + r.getString("airlines") + "'";
                                        PreparedStatement pstmt2 = con.prepareStatement(sql2);
                                        ResultSet r2 = pstmt2.executeQuery();
                                        while (r2.next()) {

                                    %>
                                    <li><%=r2.getString("name")%> | 
                                    <%=r2.getString("capacity")%> |
                                    <%=r2.getString("aircraftType")%>  </br>
                                    <%=r2.getString("baggageInformation")%> | </br>
                                    <%=r2.getString("crewInformation")%>                                      
                                    </br></br>
                                                               
                                    
                                    </li>
                                  <% } %></ul>
                                </td>
                            </tr>
                            <% }%>

                        </tbody>
                    </table>

                </div>
            </div>
        </section>


    </body>
</html>
