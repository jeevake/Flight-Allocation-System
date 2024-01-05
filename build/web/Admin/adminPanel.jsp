

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
        <link href="../css/button.css" rel="stylesheet" type="text/css"/>

    </head>
    <body >

        <jsp:include page="../navigation.jsp"/>
        <h3 style="text-align: center;margin-top: 8vh; color: #fff;font-size: 2.0vw">Hi ${userbean.firstname} ${userbean.lastname}</h3>
        <h1 style="text-align: center;margin-top: 4vh; margin-bottom: 95vh; color: #fff;font-size: 2.5vw">| Welcome To Airline Allocation Panel |</h1>

        <section style="position: absolute; margin-top: -58vh;" class="login" >

            <div style="margin-bottom: 5%" class="login_box" >

                <div>
                    <h1 style="text-align: center;color: #002966;margin-top: 6vh">Airlines To Travel For Different Countries </h1>
                    

                    <table >
                        <thead>
                            <tr  class="text">
                                <th >Countries</th>
                                <th>Airlines available</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>


                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prototype", "root", "");

                                String sql = "SELECT DISTINCT country FROM countryflights ORDER BY country ASC";
                                PreparedStatement pstmt = con.prepareStatement(sql);
                                ResultSet r = pstmt.executeQuery();

                                while (r.next()) {
                                    String countryname = r.getString("country");
                            %>
                            <tr>
                                <td><a class="button " style="width:83px;font-size: 1vw" href="countryAirlinesFlights.jsp?country=<%=r.getString("country")%>"><%=r.getString("country")%></a></td>
                                <td style="color: #002966">
                                    <%
                                        String sql2 = "SELECT * FROM countryflights WHERE country='" + r.getString("country") + "'";
                                        PreparedStatement pstmt2 = con.prepareStatement(sql2);
                                        ResultSet r2 = pstmt2.executeQuery();
                                        while (r2.next()) {

                                    %>
                                    <%=r2.getString("airlines")%>,
                                    <% }%>
                                </td>
                                <td>
                             
                                   <form action="../DeleteCountryController" method="POST">
<!--                                       <input class="button " type="submit" value="Register" />-->
                                        <input  type="text" name="country"  value="<%=r.getString("country")%>" hidden/>
                                        <input class="button " style="font-size: 0.8vw; background-color: red; padding: 10% 25% 10%;" type="submit" value="Delete" />
                                    </form>
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
