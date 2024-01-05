

<jsp:useBean id="dbcon" class="model.DBConnector" scope="session"/>
<jsp:setProperty name="dbcon" property="username" value="root"/>
<jsp:setProperty name="dbcon" property="password" value=""/>
<jsp:setProperty name="dbcon" property="url" value="jdbc:mysql://localhost:3306/prototype"/>
<jsp:setProperty name="dbcon" property="driver" value="com.mysql.jdbc.Driver"/>
