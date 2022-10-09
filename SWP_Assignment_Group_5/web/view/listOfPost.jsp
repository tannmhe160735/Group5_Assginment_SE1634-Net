<%-- 
    Document   : listOfPost
    Created on : Oct 2, 2022, 9:37:17 PM
    Author     : Tong Sy Nhat
    Description: staff can view posts paginaged.
                 5 post each page. sort by day add or edit
--%>
<%@ taglib uri='/WEB-INF/tlds/nhatCustomTag' prefix='myCustomTag' %>
<%@ taglib prefix="dava" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/pagger_staff2.js" type="text/javascript"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            table.a{
                width: 100vw;
            }
            table.b{
                width: 98vw;
            }
            table.c{
                width: 98vw;
            }
            table.d{
                width: 98vw;
            }
            table.b td{
                width: 98vw;
            }
            table, th, td {
                border-collapse: collapse;
            }
            a{
                text-decoration: none;
                color: black;
            }
            .pagger span
            {
                font-weight: bold;
                padding: 2px;
            }
            .pagger a
            {
                border-radius: 5px;
                border-style: solid;
                border-width: 2px;
                border-color: #0a98b4;
                padding: 8px;
                margin-left: 4px;
                margin-right: 4px;
            }

        </style>
    </head>
    <body>
        <table class ="a">
            <tr>
                <td><table class ="b">
                        <td><h1>List of post</h1></td>
                        <td></td>
                        <td></td>
                        <td><a href="addNewPost.jsp"><button>Add new Post</button></a></td>
                    </table><td>
            </tr>
            <dava:forEach items="${requestScope.list5PostInThisPage}" var="aPost">
                <tr>
                    <td ><table class ="c">
                            <td style="width: 10vw"></td>
                            <td style="width: 20vw"><img src="${aPost.image_path}" alt="" width="380"/></td>
                            <td style="width: 60vw"><h5 style="font-size: 30px;margin-top: 1px;margin-bottom: 5px">${aPost.post_title}</h5><p style="font-size: 25px"><a href="ViewDetailPost?post_id=${aPost.id}"><myCustomTag:Content1_Format content1="${aPost.content1}"></myCustomTag:Content1_Format></a></p></td>
                            <td style="width: 10vw"></td>
                        </table></td>
                </tr>
            </dava:forEach>
            <tr><td><table class ="d"><td style="width: 28vw"></td><td style="width: 28vw"></td><td style="width: 28vw"><div id="bot_pagger" class="pagger"> </div></td></table></td></tr>
        </table>
        <script>
            render("bot_pagger",${requestScope.noPage},${requestScope.totalpage}, 2);
        </script>

    </body>
</html>
