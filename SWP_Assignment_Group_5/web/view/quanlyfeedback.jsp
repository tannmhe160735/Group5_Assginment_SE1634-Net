<%-- 
    Document   : quanlyfeedback
    Created on : Sep 25, 2022, 4:54:37 PM
    Author     : Tong Sy Nhat
    Description: staff can view list of product. when choose one product then 
                 display all comment of this product
--%>
<%@ taglib uri='/WEB-INF/tlds/nhatCustomTag' prefix='myCustomTag' %>
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
                width : 85vw;
            }
            table.b{
                border-collapse: collapse;
                border: 1px solid buttonhighlight;
            }
            table.b th{
                background-color: DodgerBlue;
                font-weight: normal;
            }
            table.b td{
                border: 1px solid buttonhighlight;
            }
            table.b tr:hover {
                background:  cornflowerblue;
                /*                cursor:crosshair*/
            }
            a.a{
                /*                position:absolute*/
                color: orange

            }
        </style>
    </head>
    <body>
        <%@include file="sidebar.jsp" %>
        <div class="main">
            <table class="a">
                <tr>
                    <td valign='top'>
                        <%pageContext.setAttribute("a", "adidat2");%>
                        <table class="b" style="width: 25vw; margin-left: 1vw">
                            <th>Tên giày</th>
                                <dava:forEach items="${requestScope.listAllIdAndTitleOfProduct}" var="aIdAndTitleOfProduct">
                                <tr
                                    <dava:if test="${param.product_id==aIdAndTitleOfProduct.product_id}" >
                                        style="background-color: cornflowerblue"
                                    </dava:if>><td><a href="?product_id=${aIdAndTitleOfProduct.product_id}">${aIdAndTitleOfProduct.title}</a></td></tr>
                                        </dava:forEach>
                        </table>
                    </td>
                    <td valign='top'>
                        <table class="b" style="width: 60vw; margin-right:  1vw">
                            <th>Feedback</th>
                                <dava:forEach items="${requestScope.listAllFeedbackStarAndContentByProductID}" var="FeedbackStarAndContent">
                                <tr>
                                    <td><myCustomTag:Star_Format numberOfStarOfComment="${FeedbackStarAndContent.numberOfStar}"/>${FeedbackStarAndContent.feedbackContent}
                                        <a class="a" href="editFeedBack.jsp" style="float:right;text-align:right;"><button>Edit</button></a>
                                    </td>
                                </tr>
                            </dava:forEach>

                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
