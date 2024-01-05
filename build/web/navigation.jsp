

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<ul style="background-color: #0077e6; font-weight: bold;font-size: 23px;  ">
    <li ><a style="color: #fff;" href="adminPanel.jsp"><img style="width: 42px; padding-right: 0.7vw;margin-top: -12px " src="../image/logo.png" alt=""/></a></li>
    <li><a style="color: #fff; "  href="regDefaultFlights.jsp">Create available Airline list</a></li>
    <li><a style="color: #fff;" href="createCustomFlightList.jsp"> Register Airlines to Countries</a></li>
    <li><a style="color: #fff;" href="registerFlightDetails.jsp"> Register Flight Details</a></li>
    <li><a style="color: #fff;" href="searchFlightsPerAirline.jsp"> Search Flight of Airlines</a></li>
    <li style="margin-left: 11vw;"><a style="color: #fff;" href="../LoginController"><img style="width: 42px; padding-right: 0.7vw; margin-top: -12px" src="../image/log-out.png" alt=""/></a></li>
    
    
</ul>

<script>
    // Get all the links in the list
    const links = document.querySelectorAll('ul li a');
    
    // Get the current URL
    const currentURL = window.location.href;
    
    // Loop through each link
    links.forEach(link => {
        // Check if the link's href matches the current URL
        if (link.href === currentURL) {
            // Add the active class to the link
            link.classList.add('active');
        }
    });
</script>