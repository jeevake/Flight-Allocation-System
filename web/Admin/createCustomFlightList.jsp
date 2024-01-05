

<%@page import="java.util.List"%>
<%@page import="model.Airline"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <link href="../css/login.css" rel="stylesheet" type="text/css"/>
        <link href="../css/table.css" rel="stylesheet" type="text/css"/>
        <link href="../css/button.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../navigation.jsp"/>


        <h1 style="text-align: center;margin-top: 7vh; margin-bottom: 166vh; color: #fff;font-size: 2.5vw">Create Airline List for Countries</h1>

        <section class="login">

            <div style="margin-top: 55vh;display: block;height:auto;" class="login_box">
                <div class="center">
                    <a  href="adminPanel.jsp"><img style="width: 42px;height: 42px; padding-right: 0.7vw; margin-top: 12px;margin-right: 65vw;margin-left: 1vw"  src="../image/undo.png" alt=""/></a>
                </div>
                <h1 style="text-align: center; margin-top: 8vh;color: #002966">Create Airline List</h1>


                <div>

                    <form action="createCustomFlightList.jsp" method="POST">
                        <table style="width:50%;margin-top: 6vh;margin-bottom: 6vh" border="0">
                            <tbody>
                                <tr>
                                    <td style="color: #002966">Country Name</td>
                                    <td>  <input class="td" type="text" id="category" name="country" ></td>
                                </tr>

                                <tr>
                                    <td style="color: #002966">Airline Include</td>
                                 
                                    <td> 

                                        <select class="td" style="height: auto; padding: 1% 1% 0%" name="air_way_add" multiple>
                                            <option value="China Airlines">China Airlines</option>
                                            <option value="Kenya Airways">Kenya Airways</option>
                                            <option value="Alaska Airlines">Alaska Airlines</option>
                                             <option value="Air Europa">Air Europa</option>
                                              <option value="Air India">Air India</option>
                                        </select>
                                    </td>

                                </tr>

                                <tr>
                                    <td style="color: #002966">Airline Exclude</td>
                                    <td>  
                                        <select class="td" style="height: auto; padding: 1% 1% 0%" name="air_way_remove" multiple>
                                            <%  Airline airlines = new Airline();
                                                airlines.loadDefaultAirlineList();

                                                Airline defaultFlights = (Airline) airlines.clone();
                                                List<String> defaultAirlineList = defaultFlights.getDefaultAirlineList();

                                                for (String i : defaultAirlineList) {


                                            %>

                                            <option value="<%=i%>"><%=i%></option>

                                            <%
                                                }

                                            %>
                                        </select>

                                    </td>
                                </tr>

                            </tbody>
                        </table>
                                        <div style="margin-bottom: 6vh" class="center">
                            <input style="font-weight: bold" class="button " type="submit" value="Set Airlines" />
                        </div>

                    </form>
                </div>


                <div >
                    <br>                    
                    <table  border="1">
                        <thead>
                            <tr>
                                <th style="background-color: #0077e6;font-size: 1.2vw" class="td">Default Airlines</th
                            </tr>
                        </thead>
                        <tbody>


                            <%                                for (String j : defaultAirlineList) {
                            %>
                            <tr>
                                <td class="td"><%=j%></td>
                            </tr>

                            <%

                                }

                            %>


                        </tbody>
                    </table>
                    <br>  <br> 

                    <%  if ((request.getParameter("air_way_add") != null) || (request.getParameter("air_way_remove") != null)) {

                            String countryName = request.getParameter("country");


                    %>
                    <table  border="1">
                        <thead>
                            <tr>
                                <th>Airline List For <%=countryName%></th
                            </tr>
                        </thead>
                        <tbody>

                            <%

                                Airline countryFlights = (Airline) airlines.clone();
                                List<String> countryAirwaysList = countryFlights.getDefaultAirlineList();

                                if (request.getParameterValues("air_way_add") != null) {
                                    String[] addAirways = request.getParameterValues("air_way_add");
                                    for (String airway : addAirways) {
                                        countryAirwaysList.add(airway);
                                    }
                                }

                                if (request.getParameterValues("air_way_remove") != null) {
                                    String[] removeAirways = request.getParameterValues("air_way_remove");
                                    for (String airway : removeAirways) {
                                        countryAirwaysList.remove(airway);
                                    }
                                }
                                for (String i : countryAirwaysList) {

                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prototype", "root", "");
                                    String query2 = "INSERT INTO countryflights(country,airlines) VALUES (?,?)";
                                    PreparedStatement pstmt2 = con.prepareStatement(query2);
                                    pstmt2.setString(1, countryName);
                                    pstmt2.setString(2, i);

                                    pstmt2.executeUpdate();
                            %>
                            <tr>
                                <td><%=i%></td>
                            </tr>

                            <%

                                }

                            %>


                        </tbody>
                    </table>

                    <% }%>

                    </br></br>
                    

                    </br></br>
                    </br></br>

                </div>
            </div>
        </section>









    </body>
</html>
