<%-- 
    Document   : addNewPost
    Created on : Oct 2, 2022, 10:57:08 PM
    Author     : Tong Sy Nhat
    Description: display a page that allow staff(user) add new post, include: 
                 upload image, type text, choose product
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
        <h1>Add new post</h1>
        <table><tr><td>
                    <form method="post" action="AddNewPost" enctype="multipart/form-data">
                        <table>
                            <tr><td><table class="b"><tr><td style="width: 10vw">Title of post:</td> <td>
                                                <label for="product"></label>
                                                <input type="text" name="title">
                                            </td></tr></table></td></tr>
                            <tr><td><table class="b"><tr><td style="width: 10vw">Image:</td> <td>
                                                <label for="file">Select image:</label>
                                                <input type="file" id="file" name="file" accept="image/*">
                                            </td></tr></table></td></tr>
                            <tr><td><table class="b"><tr><td style="width: 10vw">Content before image:</td> <td>
                                                <p style="margin-top: 1px;margin-bottom: 1px;"><label for="content1"></label></p>
                                                <textarea id="text" name="content1" rows="10" cols="70"></textarea>
                                            </td></tr></table></td></tr>
                            <tr><td><table class="b"><tr><td style="width: 10vw">Content after image:</td> <td>
                                                <p style="margin-top: 1px;margin-bottom: 1px;"><label for="content2"></label></p>
                                                <textarea id="text" name="content2" rows="10" cols="70"></textarea>
                                            </td></tr></table></td></tr>
                            <tr><td><table class="b"><tr><td style="width: 10vw">Product:</td> <td>
                                                <select name="productID">
                                                    <dava:forEach items="${requestScope.listAllIdAndTitleOfProduct}" var="aProduct">
                                                        <option value="${aProduct.product_id}">
                                                            ${aProduct.title}
                                                        </option>
                                                    </dava:forEach>
                                                </select>
                                            </td></tr></table></td></tr>
                            <tr><td><table class="c"><tr><td style="width: 50vw"></td> <td><button onclick="myFunction()">Done</button></td></tr></table></td></tr>

                            <input type="submit" id="submitIMG" hidden>
                        </table></form></td></tr>

        </table>
        <script>
            function myFunction() {
                document.getElementById("submitIMG").click();

            }
        </script>
    </body>
</html>
