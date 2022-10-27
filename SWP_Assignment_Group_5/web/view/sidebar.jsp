<%-- 
    Document   : sidebar
    Created on : Oct 28, 2022, 12:35:22 AM
    Author     : Thinkpad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');
            .sidebar{
                font-family: "open sans",sans-serif;
                background: rgb(5, 68, 104);
                position: fixed;
                top: 0;
                left: 0;
                width: 180px;
                height: 100%;
                padding: 20px 0;
                transition: all 0.5s ease;
            }
            ul{
                list-style: none;
                padding: 1px;
            }
            ul li a{
                text-decoration: none;
                display: block;
                padding: 13px 30px;
                border-bottom: 1px solid #10558d;
                color: #cce5ff;
                font-size: 16px;
                position: relative;
            }
            ul li a:hover{
                color: #0c7db1;
                background:white;
            }
            .main {
                font-family: "open sans",sans-serif;
                margin-left: 180px; /* Same as the width of the sidenav */
                padding: 0px 10px;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <ul>
                <li>
                    <a href="/SWP_Assignment_Group_5/">Home</a>
                </li>
                <li>
                    <a href="/SWP_Assignment_Group_5/ListOfFeedbackOnEachProduct">Feedback</a>
                </li>
                <li>
                    <a href="/SWP_Assignment_Group_5/ListOfPostPaginaged">Post</a>
                </li>
            </ul>
        </div>
    </body>
</html>
