

<%@page import="java.util.List"%>
<%@page import="model.Airline"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
        <link href="../css/button.css" rel="stylesheet" type="text/css"/>
        <link href="../css/login.css" rel="stylesheet" type="text/css"/>
        <link href="../css/table.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../navigation.jsp"/>

        <div>

            <h1 style="text-align: center;margin-top: 10vh; margin-bottom: 146vh; color: #fff;font-size: 2.5vw">Search Flights Under Airlines</h1>


            <section class="login">

                <div style="margin-top: 45vh;display: block;height:120vh" class="login_box">


                    <div class="center">
                        <a  href="adminPanel.jsp"><img style="width: 42px;height: 42px; padding-right: 0.7vw; margin-top: 12px;margin-right: 65vw;margin-left: 1vw"  src="../image/undo.png" alt=""/></a>
                    </div>
                    <h1 style="text-align: center; margin-top: 2vh;color: #002966">Search Your Flight</h1>

                    <form action="searchFlightsPerAirline.jsp?search=1" method="POST">
                        <table class="center"  border="0">
                            <tbody>
                                <tr>
                                    <td style="color: #002966">Search By Airline</td>
                                    <td> <select class="td" style="width:12vw" name="airline" id="airlines">


                                            <%
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prototype", "root", "");

                                                Airline airlines = new Airline();
                                                airlines.loadDefaultAirlineList();

                                                String sql = "SELECT DISTINCT airline FROM flightdetails";
                                                PreparedStatement pstmt = con.prepareStatement(sql);
                                                ResultSet r = pstmt.executeQuery();
                                                while (r.next()) {
                                            %>

                                            <option value="<%=r.getString("airline")%>"><%=r.getString("airline")%></option>

                                            <%
                                                }
                                            %>
                                        </select>

                                    </td>
                                </tr>
                               
                            </tbody>
                        </table>
                        <div class="center">
                            <input style="font-weight: bold;height: 5vh;font-size: 1vw;padding-bottom: 4vh" class="button " type="submit" value="Seach Flights" />
                        </div>

                        <br>

                    </form>


                    <%
                        if (request.getParameter("search") != null) {
                            if (Integer.parseInt(request.getParameter("search")) == 1) {
                                String airline = request.getParameter("airline");

                    %>
                    <h3 style="text-align: center; font-size: 1.4vw;color: #002966">Flight List for <%=airline%> </h3>
                    <table  border="1">
                        <thead>
                            <tr>
                                <th class="td">Flight Name</th>
                                <th class="td">Capacity</th>
                                <th class="td">Aircraft Type</th>
                                <th class="td">Baggage Information</th>
                                <th class="td">Crew Information</th>
                                <th class="td">Airline Code</th>
                                <th class="td">Action</th>
                            </tr>
                        </thead>
                        <tbody>


                            <%  

                                String sql2 = "SELECT * FROM flightdetails WHERE airline='" + airline + "'";
                                PreparedStatement pstmt2 = con.prepareStatement(sql2);
                                ResultSet r2 = pstmt2.executeQuery();

                                while (r2.next()) {%>
                            <tr>
                                <td style="color: #002966" class="td"><%=r2.getString("name")%></td>
                                <td style="color: #002966" class="td"><%=r2.getString("capacity")%></td>
                                <td style="color: #002966" class="td"><%=r2.getString("aircraftType")%></td>
                                <td style="color: #002966" class="td"><%=r2.getString("baggageInformation")%></td>
                                <td style="color: #002966" class="td"><%=r2.getString("crewInformation")%></td>
                                <td style="color: #002966" class="td"><%=r2.getString("airlineCode")%></td>
                                <td style="color: #002966" class="td">
                                    <form action="../DeleteFlightDetails" method="POST">
                                        <input type="text" name="flightName"  value="<%=r2.getString("name")%>" hidden/>
                                       
                                        <input class="button " style="font-size: 1vw" type="submit" value="Delete Flight" />
                                    </form>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>

                    </br></br>
                   

                    </br></br>
                    </br></br>
                    
                    <%
                            }
                        }
                    %>   
                </div>


        </div>
    </section>







</body>
</html>
