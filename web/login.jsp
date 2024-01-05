

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

        <section class="login">
            <div class="login_box">
                <div class="left">
                    <div class="contact">
                        <form action="LoginController" method="POST">
                            <h3>SIGN IN</h3>
                            <input type="text" name="u_name" value="" placeholder="USERNAME" required="required">
                            <input type="password" name="password" value="" placeholder="PASSWORD" required="required">
                            <%
                                if (request.getParameter("error") != null) {
                                    if (Integer.parseInt(request.getParameter("error")) == 1) {
                            %>
                            <h4 style="color: red; text-align: center">Invalid Username or Password</h4>
                            <%
                                    }
                                }
                            %>
                            <button type="submit" class="submit">Sign In</button>
                            <h4 style="text-align: center">Don't have an account? <a style="color: #0077e6; text-decoration: none" href="index.jsp">Sign Up</a></h4>
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
    </body>
</html>
