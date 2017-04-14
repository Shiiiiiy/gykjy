package com.uws.util.word;

import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.OutputStreamWriter;  
import java.io.Writer;  
import java.util.HashMap;  
import java.util.Map;  

import javax.servlet.ServletContext;
  
import freemarker.template.Configuration;  
import freemarker.template.Template;  
/** 导出为word的工具方法
 * @author wangjun
 * */ 
public class WordGenerator {  
    private static Configuration configuration = null;  
    private static Map<String, Template> allTemplates = null;  
    /**模版文件名*/
    private static String fileName = "default";  
    /**需要一个ServletContext对象*/
    private static ServletContext sc = null;  
    public WordGenerator() {  
        throw new AssertionError();  
    }  
    public WordGenerator(String fileName,ServletContext sc) {  
        this.fileName=fileName;
        this.sc=sc;
        configuration = new Configuration();  
        configuration.setDefaultEncoding("utf-8"); 
        allTemplates = new HashMap();
        try { 
        	configuration.setServletContextForTemplateLoading(this.sc,"/plugins/word");//模版统一存放位置
            allTemplates.put("resume", configuration.getTemplate(this.fileName+".ftl"));  
        } catch (IOException e) {  
            e.printStackTrace();  
            throw new RuntimeException(e);  
        }  
    }  
    public static File createDoc(Map<?, ?> dataMap, String type) {  
        String name = "temp" + (int) (Math.random() * 100000) + ".doc";  
        File f = new File(name);  
        Template t = allTemplates.get(type);  
        try {  
            // 这个地方不能使用FileWriter因为需要指定编码类型否则生成的Word文档会因为有无法识别的编码而无法打开  
            Writer w = new OutputStreamWriter(new FileOutputStream(f), "utf-8");  
            t.process(dataMap, w);  
            w.close();  
        } catch (Exception ex) {  
            ex.printStackTrace();  
            throw new RuntimeException(ex);  
        }  
        return f;  
    }  
  
}  