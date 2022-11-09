<%-- 
    Document   : viewDetailPost
    Created on : Oct 2, 2022, 11:21:51 PM
    Author     : Tong Sy Nhat
    Description: Staff can view all detail infor of a post.
--%>
<%@ taglib prefix="dava" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="sidebar.jsp" %>
        <div class="main"> 
            
            <table>
                <tr>
                    <td><table>
                            <tr>
                                <td style="width: 85vw"><h1>View detail post</h1></td>
                                <dava:if test="${sessionScope.acc.role_id eq 2}">
                                    <td><a href="EditPost?postID=${requestScope.thisPost.id}"><button style="background-color: deepskyblue">Edit</button></a>
                                        <a href="HidePost?postID=${requestScope.thisPost.id}"><button style="background-color: red">Hide</button></a></td>
                                        </dava:if>

                                
                                </tr>
                        </table></td>
                </tr>
                <tr>
                    <td><table>
                            <tr>
                                <td style="width: 95vw"><h2 style="text-align:center">${requestScope.thisPost.post_title}</h2></td>
                            </tr>
                        </table></td>
                </tr>
                <tr>
                    <td><table>
                            <tr>
                                <td style="width: 10vw"></td>
                                <td style="width: 60vw">${requestScope.thisPost.content1}</td>
                            </tr>
                            <tr>
                                <td style="width: 10vw"></td>
                                <td><img src="${requestScope.thisPost.image_path}" alt="sda" width="500"/></td>
                            </tr>
                            <tr>
                                <td style="width: 10vw"></td>
                                <td style="width: 60vw">${requestScope.thisPost.content2}</td>
                            </tr>
                        </table></td>
                </tr>
                <dava:if test="${requestScope.thisProduct != null}">
                    <tr>
                        <td><table>
                                <tr>
                                    <td style="width: 10vw"></td>
                                    <td><h6 style="margin-bottom: 3px;margin-top: 3px;font-size: 18px">Product detail:</h6></td>
                                    <td style="width: 40vw">
                                        <table style="background-color: cadetblue;width: 40vw">
                                            <tr>
                                                <td style="width: 10vw;"><img src="${requestScope.thisProduct.img}" alt=""/></td>
                                                <td><table>
                                                        <tr><td><h6 style="font-size: 18px;margin-bottom: 15px">${requestScope.thisProduct.title}</h6></td></tr>
                                                        <tr><td><p>${requestScope.thisProduct.price}đ</p></td></tr>
                                                    </table></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table></td>
                    </tr>
                </dava:if>
            </table>
        </div>
    </body>
</html>
