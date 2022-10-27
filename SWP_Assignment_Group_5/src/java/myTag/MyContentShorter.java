/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package myTag;

import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

/**
 *
 * @author Thinkpad
 */
public class MyContentShorter extends SimpleTagSupport {

    private String content1 = "";
    private String formatContent1 = "";

    public MyContentShorter() {
    }

    public void setContent1(String content1) {
        this.content1 = content1;
    }

    public void setFormatContent1(String formatContent1) {
        this.formatContent1 = formatContent1;
    }

    @Override
    public void doTag() throws IOException {
        if (content1.length() < 300) {
            getJspContext().getOut().write(content1);
        } else {
            formatContent1 = content1.substring(0, 300);
            getJspContext().getOut().write(formatContent1 + "...");
        }

    }
}
