<%-- 
    Document   : editFeedBack
    Created on : Oct 2, 2022, 7:03:29 PM
    Author     : Tong Sy Nhat
    Description: this page allow staff(user) edit an existing feedback: 
                 view feedback detail, view product detail, edit feedback text.
--%>

<%@ taglib prefix="dava" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table.a{
                border-bottom: 1px solid #f2f2f2;
                margin-left: auto;
                margin-right: auto;
                width : 100vw;
            }
            table.b td{
                width: 25vw;
            }
            table.b{
                width : 650px;
            }
        </style>
    </head>
    <body>
        <%@include file="sidebar.jsp" %>
        <div class="main">
            <table class="a">
                <tr>
                <h1>Edit Feedback:</h1>
                </tr>
                <tr>
                <p style="margin-top: 1px;margin-bottom: 1px;">
                    Customer name: ${requestScope.thisAccount.acc_name}<br>
                    Star rate: ${requestScope.star} stars<br>
                    Product: ${requestScope.thisProduct.title} <br></p>
                <a href="" style="margin-top: 1px;margin-bottom: 1px;">View product detail </a><br>
                <td>
                    <form method="post" action="EditFeedback">
                        <p style="margin-top: 1px;margin-bottom: 1px;"><label for="comment">Comment:</label></p>
                        <textarea id="comment" name="comment" rows="4" cols="70">${requestScope.thisFeedback.feedbackContent}</textarea>
                        <input type="text" id="id" name ="id" value="${requestScope.thisFeedback.feedbackID}" hidden >
                        <input type="submit" value="Submit" id="sumitDone" hidden>
                    </form>
                </td>
                </tr>
                <tr>
                <table class="b">
                    <tr>
                        <td> </td>
                        <td> </td>
                        <td><a href="ListOfFeedbackOnEachProduct" ><button style="background-color: dodgerblue;">CANCEL</button></a></td>
                        <td><button style="background-color: dodgerblue;" onclick="submitButtonClick()"> DONE </button></td>
                    </tr>
                </table>
                </tr>
            </table>
        </div>
        <script>
            function submitButtonClick() {
                document.getElementById("sumitDone").click();
            }
        </script>
    </body>
</html>
