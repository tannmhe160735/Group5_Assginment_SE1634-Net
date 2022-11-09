<%-- 
    Document   : editPost
    Created on : Oct 2, 2022, 11:15:25 PM
    Author     : Tong Sy Nhat
    Description: this page allow staff(user) edit an existing post: 
                 change image, edit text, change product.
--%>
<%@ taglib prefix="dava" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="sidebar.jsp" %>
        <div class="main">
            <h1>Edit post</h1>
            <table><tr><td>
                        <form method="post" action="EditPost" enctype="multipart/form-data">
                            <table>
                                <tr><td><table class="b"><tr><td style="width: 10vw">Title of post:</td> <td>
                                                    <label for="product"></label>
                                                    <input type="text" name="title" value="${requestScope.thisPost.post_title}" size="50" >
                                                </td></tr></table></td></tr>
                                <tr><td><table class="b"><tr><td style="width: 10vw">Image:</td> <td>
                                                    <label for="file">Select image:</label>
                                                    <input type="file" id="file" name="file" accept="image/*" onclick="haha()">
                                                </td></tr></table></td></tr>
                                <tr><td><table class="b"><tr><td style="width: 10vw">Content before image:</td> <td>
                                                    <p style="margin-top: 1px;margin-bottom: 1px;"><label for="content1"></label></p>
                                                    <textarea id="text" name="content1" rows="15" cols="100">${requestScope.thisPost.content1}</textarea>
                                                </td></tr></table></td></tr>
                                <tr><td><table class="b"><tr><td style="width: 10vw">Content after image:</td> <td>
                                                    <p style="margin-top: 1px;margin-bottom: 1px;"><label for="content2"></label></p>
                                                    <textarea id="text" name="content2" rows="15" cols="100">${requestScope.thisPost.content2}</textarea>
                                                </td></tr></table></td></tr>
                                <tr><td><table class="b"><tr><td style="width: 10vw">Product:</td> <td>
                                                    <select name="productID">
                                                        <dava:forEach items="${requestScope.listAllIdAndTitleOfProduct}" var="aProduct">
                                                            <option value="${aProduct.product_id}"
                                                                    <dava:if test="${aProduct.product_id == requestScope.thisPost.product_id}">selected</dava:if>>
                                                                ${aProduct.title}
                                                            </option>
                                                        </dava:forEach>
                                                    </select>
                                                </td></tr></table></td></tr>
                                <tr><td><table class="c"><tr><td style="width: 50vw"></td> <td><button onclick="myFunction()">Done</button></td></tr></table></td></tr>
                                <input type="text" id="isClickChooseIMG" name ="isClickChooseIMG" value="no" hidden >
                                <input type="text" id="postID" name ="postID" value="${requestScope.thisPost.id}" hidden>
                                <input type="submit" id="submitIMG" hidden>
                            </table></form></td></tr>

            </table>
        </div>
        <script>
            function myFunction() {
                document.getElementById("submitIMG").click();

            }
            function haha() {
                document.getElementById("isClickChooseIMG").setAttribute('value', 'yes');
                ;

            }
        </script>
    </body>
</html>
