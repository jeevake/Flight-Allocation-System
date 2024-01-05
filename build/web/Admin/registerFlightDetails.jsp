

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
        <link href="../css/button.css" rel="stylesheet" type="text/css"/>
        <link href="../css/login.css" rel="stylesheet" type="text/css"/>
        <link href="../css/table.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../navigation.jsp"/>


        <h1 style="text-align: center;margin-top: 10vh; margin-bottom: 136vh; color: #fff;font-size: 2.5vw">Register Flight Details</h1>


        <section class="login">

            <div style="margin-top: 35vh;display: block;height:100vh" class="login_box">
                <div class="center">
                    <a  href="adminPanel.jsp"><img style="width: 42px;height: 42px; padding-right: 0.7vw; margin-top: 12px;margin-right: 65vw"  src="../image/undo.png" alt=""/></a>
                </div>
                <%
                    if (request.getParameter("register") != null) {
                        if (Integer.parseInt(request.getParameter("register")) == 1) {
                %>
                <h3 style="color: blue; margin-left: 2%">Flight Registered successfully</h3>
                <%
                } else if (Integer.parseInt(request.getParameter("register")) == 0) {
                %>    
                <h3 style="color: red; margin-left: 2%">Error occurred</h3>
                <%
                        }

                    }
                %>
                <h1 style="text-align: center;color: #1a001a;margin-top: 3vh">Register Your Flight</h1>

                <div style="margin-top: 6vh">
                    <form action="../FlightDetailsHandler" method="POST">
                        <table class="center" border="0">
                            <tbody>
                                <tr>

                                    <td><input class="td" placeholder="Flight Name" type="text" id="flight_name" name="flight_name"  required="required"></td>
                                </tr>

                                <tr>

                                    <td><input class="td" placeholder="Capacity"  type="text" id="capacity" name="capacity" required="required"></td>
                                </tr>

                                <tr>

                                    <td><input class="td" placeholder="Air Craft Type"  type="text" id="airCraftType" name="airCraftType" required="required"></td>
                                </tr>

                                <tr>

                                    <td><textarea class="td" id="baggageInfo" style="height: 8vh" name="baggageInfo" placeholder="Baggage Information" required="required"></textarea>
                                    </td>
                                </tr>

                                <tr>

                                    <td><textarea class="td" id="crewInfo" style="height: 8vh" name="crewInfo" placeholder="Crew Information" required="required"></textarea>
                                    </td>
                                </tr>

                                <tr>

                                    <td><input class="td" placeholder="Airline Code"  type="text" id="airlineCode" name="airlineCode" required="required"></td>
                                </tr>

                                <tr>

                                    <td >
                                        <select class="td"   name="airline" id="airlines" required="required">


                                            <%
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prototype", "root", "");

                                                String sql = "SELECT DISTINCT airlines FROM countryflights";
                                                PreparedStatement pstmt = con.prepareStatement(sql);
                                                ResultSet r = pstmt.executeQuery();
                                                while (r.next()) {

                                            %>
                                            <option value="<%=r.getString("airlines")%>"><%=r.getString("airlines")%></option>
                                            <%
                                                }

                                            %></select>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        </br></br>
                        <div class="center">
                            <input style="font-weight: bold" class="button " type="submit" value="Register" />
                        </div>

                        </br></br>
                        </br></br>
                    </form>
                </div>

                </br></br>
                <div>


                </div>
        </section>






    </body>
</html>
