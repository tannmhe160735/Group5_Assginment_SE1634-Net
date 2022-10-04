/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/*
    Description: create a tag for jsp page: input is number of star you want to output
*/
package myTag;

import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

/**
 *
 * @author Tong Sy Nhat
 */
public class MyStarFormat extends SimpleTagSupport{
    private int numberOfStarOfComment;
    private String formatStar="";

    public MyStarFormat() {
    }

    public void setNumberOfStarOfComment(int numberOfStarOfComment) {
        this.numberOfStarOfComment = numberOfStarOfComment;
    }

    public void setFormatStar(String formatStar) {
        this.formatStar = formatStar;
    }
    @Override
    public void doTag() throws IOException{
        formatStar+="<em style=\"font-style: normal;font-size: 13px;margin-bottom: 1px;margin-top: 1px;margin-right: 5px\">";
        for(int i=0;i<numberOfStarOfComment;i++){
            formatStar+="&#11088";
        }
        for(int i=5;i>numberOfStarOfComment;i--){
            formatStar+="&#9734";
        }
        formatStar+="</em> ";
        getJspContext().getOut().write( formatStar);
    }
        
    
}
