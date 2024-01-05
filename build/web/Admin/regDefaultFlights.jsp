

<%@page import="java.util.List"%>
<%@page import="model.Airline"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../config.jsp" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flight Allocation Panel</title>
        <link rel="shortcut icon" href="../image/logo.png" type="image/x-icon">
        <link href="../css/index.css" rel="stylesheet" type="text/css"/>
        <link href="../css/login.css" rel="stylesheet" type="text/css"/>
        <link href="../css/table.css" rel="stylesheet" type="text/css"/>
        <link href="../css/button.css" rel="stylesheet" type="text/css"/>
    </head>
    <body >
        <jsp:include page="../navigation.jsp"/>
        <section style="position: absolute;" class="login">

            <h1 style="text-align: center; margin-bottom: 116vh; color: #fff;font-size: 2.5vw">Available Airlines Registration</h1>
            <div style="margin-top: 5vh;display: block; height:auto" class="login_box">
                <div class="center">
                    <a  href="adminPanel.jsp"><img style="width: 42px;height: 42px; padding-right: 0.7vw; margin-top: 12px;margin-right: 65vw;margin-left: 1vw"  src="../image/undo.png" alt=""/></a>
                </div>

                <%
                    if (request.getParameter("update") != null) {
                        if (Integer.parseInt(request.getParameter("update")) == 1) {
                %>
                <h3 style="color: blue; margin-left: 2%">Airline List updated successfully</h3>
                <%
                } else if (Integer.parseInt(request.getParameter("update")) == 0) {
                %>    
                <h3 style="color: red; margin-left: 2%">Error occurred</h3>
                <%
                        }
                    }
                    if (request.getParameter("delete") != null) {
                        if (Integer.parseInt(request.getParameter("delete")) == 1) {
                %>
                <h3 style="color: blue; margin-left: 2%">Airline deleted successfully</h3>
                <%
                } else if (Integer.parseInt(request.getParameter("delete")) == 0) {
                %>    
                <h3 style="color: red; margin-left: 2%">“Error occurred</h3>
                <%
                        }

                    }
                %>
                <h1 style="text-align: center; margin-top: 2vh;color: #002966">Airlines To Travel For Different Countries</h1>

                <div>

                    <div style="display: flex;">
                        <form style="margin-left: 4vw;" action="../DefaultFlightHandler" method="POST">
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td style="width:28vw;color: #002966">Add To Airline List</td>
                                        <td ><input class="td" style="width:12vw" type="text" name="air_way" value="" required="required"/></td>
                                        <td><input type="text" name="operation" value="add" hidden/></td>
                                    </tr>

                                </tbody>
                            </table>
                            <div class="center">
                                <input style="font-weight: bold" class="button " type="submit" value="Add Airline" />
                            </div>
                            <br>

                        </form>
                        <form  action="../DefaultFlightHandler" method="POST">
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td style="width:31vw;color: #002966">Remove From Airline List</td>
                                        <td> 
                                            <select class="td" style="width:12vw" name="air_way" id="air_way" required="required">
                                        <%
                                            //DISPLAYING A CLONE OF THE ORIGINAL FLIGHT OBJECT WITHOUT ANY MODIFICATION
                                            Airline airlines = new Airline();
                                            airlines.loadDefaultAirlineList();

                                            Airline defaultAirlines = (Airline) airlines.clone();
                                            List<String> defaultAirlineList = defaultAirlines.getDefaultAirlineList();
                                            for (String flight1 : defaultAirlineList) {
                                        %>
                                  
                                            <option value="<%=flight1%>"><%=flight1%></option>

                                    <%
                                        }
                                    %>
                                       </select> 
                                        </td>
<!--                                <td><input class="td" style="width:12vw" type="text" name="air_way" value="" required="required"/></td>-->
                                <td><input type="text" name="operation" value="remove" hidden/></td>
                                </tr>

                                </tbody>
                            </table>
                            <div class="center">
                                <input style="font-weight: bold" class="button " type="submit" value="Remove Airline" />
                            </div>

                            <br>

                        </form>
                    </div>


                    <table style="margin:auto;" border="1">
                        <thead>
                            <tr>
                                <th style="background-color: #0077e6;font-size: 1.2vw" class="td">Available Airlines</th
                            </tr>
                        </thead>
                        <tbody>


                            <%
                                //DISPLAYING A CLONE OF THE ORIGINAL FLIGHT OBJECT WITHOUT ANY MODIFICATION
                                for (String flight : defaultAirlineList) {
                            %>
                            <tr>
                                <td style="text-align: center;color: #002966" class="td"><%=flight%></td>
                            </tr>


                            <%
                                }
                            %>

                        </tbody>
                    </table>
                    </br></br>


                    </br></br>
                    </br></br>


                </div>
            </div>
        </section>
    </body>
</html>
