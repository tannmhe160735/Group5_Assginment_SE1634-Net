/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function render(id, pageindex, totalpage, gap)
{
    var container = document.getElementById(id);
    var content = "";
    if (pageindex > gap + 1)
        content += "<a href='ListOfPostPaginaged?noPage=1'>First</a>";

    for (var i = pageindex - gap; i < pageindex; i++)
    {
        if (i > 0)
            content += "<a href='ListOfPostPaginaged?noPage=" + i + "'>" + i + "</a>";
    }

    content += "<span>" + pageindex + "</span>";

    for (var i = pageindex + 1; i <= pageindex + gap; i++)
    {
        if (i <= totalpage)
            content += "<a href='ListOfPostPaginaged?noPage=" + i + "'>" + i + "</a>";
    }

    if (pageindex < totalpage - gap)
        content += "<a href='ListOfPostPaginaged?noPage=" + totalpage + "'>Last</a>";
    container.innerHTML = content;
}

function render1(id,gap){
    var container = document.getElementById(id);
    container.innerHTML = "<p>"+gap+"</p>";
}

