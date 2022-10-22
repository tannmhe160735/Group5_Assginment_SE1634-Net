/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import Entity.Voucher;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class HttpUtil {

    public String value;
    public HttpUtil(String value){
        this.value = value;
    }
    public <T> List<T> toModel(Class<T> tClass){
        try {
            ObjectMapper mapper = new ObjectMapper();
            List<T> list = mapper.readValue(value, mapper.getTypeFactory().constructCollectionType(List.class, tClass));
            return list;
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static HttpUtil of(BufferedReader br) throws IOException {
     StringBuilder sb = new StringBuilder();
     try{
         String line;
         while((line=br.readLine())!=null){
             sb.append(line);
         }
     }catch(Exception e){
         e.printStackTrace();
     }

        return new HttpUtil(sb.toString());
    }
}
