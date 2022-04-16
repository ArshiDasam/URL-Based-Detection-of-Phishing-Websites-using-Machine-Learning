<%-- 
    Document   : userlogin
    Created on : 17 Mar, 2019, 4:45:48 AM
    Author     : Arshitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        try{
            String uid,pwd;
            uid=request.getParameter("userid");
            pwd=request.getParameter("pass");
            if(uid.equalsIgnoreCase("arshitha")&&pwd.equalsIgnoreCase("arshi"))
            {
                response.sendRedirect("home.jsp");
            }
            else
            {
               response.sendRedirect("index.html?message=invlid credential"); 
               
               
            }
            
            
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
        %>
    </body>
</html>
