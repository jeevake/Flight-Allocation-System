<%-- 
    Document   : index
    Created on : Dec 9, 2022, 9:53:23 AM
    Author     : cst19041
--%>

<%@page import="java.util.List"%>
<%@page import="model.Flight"%>
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
        <title>HomePage</title>
        <link href="../css/index.css" rel="stylesheet" type="text/css"/>
        <link href="../css/login.css" rel="stylesheet" type="text/css"/>
        <link href="../css/table.css" rel="stylesheet" type="text/css"/>
        <link href="../css/button.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../navigation.jsp"/>


        <h1 style="text-align: center;margin-top: 4vh; margin-bottom: 106vh; color: #fff;font-size: 2.5vw">Create Flight List for Countries</h1>

        <section class="login">

            <div style="margin-top: 35vh;display: block;height:110vh" class="login_box">


                <div>

                    <form action="viewCountryFlights.jsp" method="POST">
                        <table style="width:50%;margin-top: 6vh;margin-bottom: 6vh" border="0">
                            <tbody>
                                <tr>
                                    <td>Country Name</td>
                                    <td>  <input type="text" id="category" name="country"></td>
                                </tr>

                                <tr>
                                    <td>Flight Include</td>
                                    <td>  <input type="text" id="category" name="air_way_add"></td>
                                </tr>

                                <tr>
                                    <td>Flight Exclude</td>
                                    <td>  <input type="text" id="category" name="air_way_remove"></td>
                                </tr>

                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Set Flights" /></td>
                                </tr>
                            </tbody>
                        </table>

                    </form>
                </div>


                <div >
                    <br>                    
                    <table  border="1">
                        <thead>
                            <tr>
                                <th>Default Flights</th
                            </tr>
                        </thead>
                        <tbody>


                            <%  Flight flights = new Flight();
                                flights.loadDefaultFlightList();

                                Flight defaultFlights = (Flight) flights.clone();
                                List<String> defaultFlightList = defaultFlights.getDefaultFlightList();

                                for (String i : defaultFlightList) {
                            %>
                            <tr>
                                <td><%=i%></td>
                            </tr>

                            <%

                                }

                            %>
                            

                        </tbody>
                    </table>

                    </br></br>
                    <div class="center">
                        <a href="adminPanel.jsp"><button class="button button1">Back to Admin Panel</button></a>
                    </div>
                    
                    </br></br>
                    </br></br>

                </div>
            </div>
        </section>









    </body>
</html>
