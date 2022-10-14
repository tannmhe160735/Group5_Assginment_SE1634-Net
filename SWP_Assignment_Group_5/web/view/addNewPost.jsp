<%-- 
    Document   : addNewPost
    Created on : Oct 2, 2022, 10:57:08 PM
    Author     : Tong Sy Nhat
    Description: display a page that allow staff(user) add new post, include: 
                 upload image, type text, choose product
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add new post</h1>
        <table>
            <tr><td><table class="b"><tr><td style="width: 10vw">Image:</td> <td><form method="post" action="../AddNewPost" enctype="multipart/form-data">
                                    <label for="file">Select image:</label>
                                    <input type="file" id="file" name="file" accept="image/*">
                                    <input type="submit">
                                </form></td></tr></table></td></tr>
            <tr><td><table class="b"><tr><td style="width: 10vw">Text:</td> <td><form action="">
                                    <p style="margin-top: 1px;margin-bottom: 1px;"><label for="text"></label></p>
                                    <textarea id="text" name="text" rows="10" cols="70">Trong thời gian gần đây, các mẫu giày Nika được giới trẻ vô cùng ưa chuộng bởi phối màu..</textarea>
                                    <input type="submit" value="Submit">
                                </form></td></tr></table></td></tr>
            <tr><td><table class="b"><tr><td style="width: 10vw">Product:</td> <td><form action="/action_page.php">
                                    <label for="product"></label>
                                    <input type="text" id="product" name="product">
                                    <input type="submit">
                                </form></td></tr></table></td></tr>
            <tr><td><table class="c"><tr><td style="width: 50vw"></td> <td><a href="listOfPost.jsp"><button>Done</button></a></td></tr></table></td></tr>
        </table>
    </body>
</html>
