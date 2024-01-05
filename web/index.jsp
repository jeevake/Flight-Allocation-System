

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flight Allocation System</title>
        <link rel="shortcut icon" href="image/logo.png" type="image/x-icon">

        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
      
        <div>
            <section class="login">
                <div class="login_box " style="height:620px">
                    <div class="left">
                        <div class="contact">
                            <form style="margin-top: -45px" action="RegisterController" method="POST">
                                <%
                                        if (request.getParameter("success") != null) {
                                            if (Integer.parseInt(request.getParameter("success")) == 1) {%>
                                <h3 style="color: blue; text-align: center">Registration Successful</h3>
                                <% } else if (Integer.parseInt(request.getParameter("success")) == 0) {%>
                                <h3 style="color: red; text-align: center">Registration Unsuccessful</h3>
                                <%}
                                    }
                                %>
                                <h3>SIGN UP</h3>
                                <input type="text" name="first_name" placeholder="First Name" value="" required="required"/>
                                <input type="text" name="last_name" placeholder="Last Name" value="" required="required"/>
                                <input type="text" name="user_name" placeholder="Username" value="" required="required"/>
                                <input type="password" name="password" placeholder="Password" value="" required="required"/>
                                <button style="margin-top: -2px" type="submit" class="submit">Register</button>
                                <!--                            <input class="submit" type="submit" value="Login" />-->
                                <h4 style="text-align: center">Have an account? <a style="color: #0077e6; text-decoration: none" href="login.jsp">Sign In</a></h4>
                            </form>
                        </div>
                    </div>
                    <div class="right">
                        <div class="right-text">
                            <h2>Flight Allocation System</h2>
                            <h5></h5>
                        </div>
                        <div class="right-inductor"><img src="https://lh3.googleusercontent.com/fife/ABSRlIoGiXn2r0SBm7bjFHea6iCUOyY0N2SrvhNUT-orJfyGNRSMO2vfqar3R-xs5Z4xbeqYwrEMq2FXKGXm-l_H6QAlwCBk9uceKBfG-FjacfftM0WM_aoUC_oxRSXXYspQE3tCMHGvMBlb2K1NAdU6qWv3VAQAPdCo8VwTgdnyWv08CmeZ8hX_6Ty8FzetXYKnfXb0CTEFQOVF4p3R58LksVUd73FU6564OsrJt918LPEwqIPAPQ4dMgiH73sgLXnDndUDCdLSDHMSirr4uUaqbiWQq-X1SNdkh-3jzjhW4keeNt1TgQHSrzW3maYO3ryueQzYoMEhts8MP8HH5gs2NkCar9cr_guunglU7Zqaede4cLFhsCZWBLVHY4cKHgk8SzfH_0Rn3St2AQen9MaiT38L5QXsaq6zFMuGiT8M2Md50eS0JdRTdlWLJApbgAUqI3zltUXce-MaCrDtp_UiI6x3IR4fEZiCo0XDyoAesFjXZg9cIuSsLTiKkSAGzzledJU3crgSHjAIycQN2PH2_dBIa3ibAJLphqq6zLh0qiQn_dHh83ru2y7MgxRU85ithgjdIk3PgplREbW9_PLv5j9juYc1WXFNW9ML80UlTaC9D2rP3i80zESJJY56faKsA5GVCIFiUtc3EewSM_C0bkJSMiobIWiXFz7pMcadgZlweUdjBcjvaepHBe8wou0ZtDM9TKom0hs_nx_AKy0dnXGNWI1qftTjAg=w1920-h979-ft" alt=""></div>
                    </div>
                </div>
            </section>


        </form>
    </div>
</body>
</html>
