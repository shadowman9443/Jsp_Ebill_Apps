<html>
    <head>
        <title> Ebill Apps   </title>
    </head>
    <BODY bgcolor="FFCC99">
        <h1 align="center">Ebilling Application</h1>
        <form id="form1" name="form1" method="post" action="user_login.jsp">
            <table width="320" border="0" align="center" cellpading="2" cellspacing="3">
                <tr>
                    <td>UserName</td>
                    <td><input type="text" name="username" size="20"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" size="20"/></td>
                </tr>
                <tr>
                    <td align="right" colspan="2"><a href="reg.jsp">New Account</a>
                        <input name="s" type="submit" id="s" value="Login"/>
                        <input name="reset" type="reset" id="s" value="Reset"/>
                    </td>
                    <td align="left" colspan="2"><a href="adminlogin.jsp">Log in as admin</a>
                      
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>