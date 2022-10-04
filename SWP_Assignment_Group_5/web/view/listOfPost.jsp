<%-- 
    Document   : listOfPost
    Created on : Oct 2, 2022, 9:37:17 PM
    Author     : Tong Sy Nhat
    Description: staff can view posts paginaged.
                 5 post each page. sort by day add or edit
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
            <tr>
                <td><table class ="c">
                        <td style="width: 28vw"><img src="../assets/img/img_for_posts/123.png" alt=""/></td>
                        <td style="width: 69vw"><h5 style="font-size: 30px;margin-top: 1px;margin-bottom: 5px">Gợi ý mẫu giày đẹp và hot nhất năm 2022</h5><p style="font-size: 25px"><a href="viewDetailPost.jsp">Trong thời gian gần đây, các mẫu giày Nika được giới trẻ vô cùng ưa chuộng bởi phối màu cùng thiết kế vô cùng đẹp mắt. Ngoài ra, các mẫu...</a></p></td>
                    </table></td>
            </tr>
            <tr><td><table class ="c"><td style="width: 28vw"><img src="../assets/img/img_for_posts/Screenshot 2022-10-02 220116.png" alt=""/></td><td style="width: 69vw"><h5 style="font-size: 30px;margin-top: 1px;margin-bottom: 5px">Mẫu giày nữ tính phù hợp để tặng nhân ngày ...</h5><p style="font-size: 25px"><a href="viewDetailPost.jsp">Adidas gửi một lời nhắc nhở mọi người hãy yêu thương bản thân mình trong ngày lễ tình nhân sắp đến. Mặc dù phiên bản đặc biệt hầu như vẫn tương tự...</a></p></td></table></td></tr>
            <tr><td><table class ="c"><td style="width: 28vw"><img src="../assets/img/img_for_posts/Screenshot 2022-10-02 220128.png" alt=""/></td><td style="width: 69vw"><h5 style="font-size: 30px;margin-top: 1px;margin-bottom: 5px">Mẫu giày Vans đẹp cho bạn nam không thể bỏ qua</h5><p style="font-size: 25px"><a href="viewDetailPost.jsp">Nhắc đến dòng giày trượt ván, chắc hẳn ai cũng nghĩ đến giày Vans ngay trong vài tích tắc. Không chỉ bởi chất lượng tuyệt vời mà sản phẩm này mang lại, mà còn bởi ...</a></p></td></table></td></tr>
            <tr><td><table class ="c"><td style="width: 28vw"><img src="../assets/img/img_for_posts/Screenshot 2022-10-02 220128.png" alt=""/></td><td style="width: 69vw"><h5 style="font-size: 30px;margin-top: 1px;margin-bottom: 5px">Gợi ý mẫu giày đẹp và hot nhất năm 2022</h5><p style="font-size: 25px"><a href="viewDetailPost.jsp">Trong thời gian gần đây, các mẫu giày Nika được giới trẻ vô cùng ưa chuộng bởi phối màu cùng thiết kế vô cùng đẹp mắt. Ngoài ra, các mẫu...</a></p></td></table></td></tr>
            <tr><td><table class ="d"><td style="width: 28vw"></td><td style="width: 28vw"></td><td style="width: 28vw"><a href=""><button>1</button></a><a href=""><button>2</button></a><a href=""><button>3</button></a><a href=""><button>4</button></a></td></table></td></tr>
        </table>
    </body>
</html>
