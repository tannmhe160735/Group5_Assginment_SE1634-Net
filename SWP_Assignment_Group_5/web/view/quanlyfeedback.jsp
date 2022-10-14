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
                width : 100vw;
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
            b
        </style>
    </head>
    <body>
        <table class="a">
            <tr>
                <td valign='top'>
                    <%pageContext.setAttribute("a", "adidat2");%>
                    <table class="b" style="width: 27vw; margin-left: 1vw">
                        <th>Tên giày</th>
                        <tr><td><a href="?tenGiay=adidat1">giày adidat 1</a></td></tr>
                        <tr><td><a href="?tenGiay=supromo1">giày supromo 1</a></td></tr>
                        <tr
                            <dava:if test="${param.tenGiay==a}" >
                                style="background-color: cornflowerblue"
                            </dava:if>><td><a href="?tenGiay=adidat2">giày adidat 2</a></td></tr>
                        <tr><td><a href="?tenGiay=supromo8">giày supromo 8</a></td></tr>
                    </table>
                </td>
                <td valign='top'>
                    <table class="b" style="width: 65vw; margin-right:  1vw">
                        <th>Feedback</th>
                            <dava:if test="${param.tenGiay == 'adidat2'}">
                            <tr>
                                <td><myCustomTag:Star_Format numberOfStarOfComment="${5}"/>Ổn áp lắm nha mng
                                    <a class="a" href="editFeedBack.jsp" style="float:right;text-align:right;"><button>Edit</button></a>
                                </td>
                            </tr>
                            <tr>
                                <td><myCustomTag:Star_Format numberOfStarOfComment="${5}"/>Chất lượng sản phẩm tốt.
                                    <a class="a" href="editFeedBack.jsp" style="float:right;text-align:right;"><button>Edit</button></a>
                                </td>
                            </tr>
                            <tr><td><myCustomTag:Star_Format numberOfStarOfComment="${3}"/>Hàng hơi bị lỗi, bị đứt chỉ, tôi phải khâu lại<a class="a" href="editFeedBack.jsp" style="float:right;text-align:right;"><button>Edit</button></a></td></tr>
                            <tr><td><myCustomTag:Star_Format numberOfStarOfComment="${1}"/>Sản phẩm quá tệ, đi được 1 tuần mà bị rách rồi<a class="a" href="editFeedBack.jsp" style="float:right;text-align:right;"><button>Edit</button></a></td></tr>
                            <tr><td><myCustomTag:Star_Format numberOfStarOfComment="${2}"/>Shop đóng hàng gửi hàng chậm, 1 tháng mới tới nơi<a class="a" href="editFeedBack.jsp" style="float:right;text-align:right;"><button>Edit</button></a></td></tr>
                            <tr><td><myCustomTag:Star_Format numberOfStarOfComment="${4}"/>Hàng Việt Nam chất lượng tốt quá<a class="a" href="editFeedBack.jsp" style="float:right;text-align:right;"><button>Edit</button></a></td></tr>

                        </dava:if>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>
