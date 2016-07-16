/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.web;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Enumeration;
import java.util.Properties;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author adm
 */
public class VisitorsCountListener implements ServletContextListener, HttpSessionListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext application = sce.getServletContext();
        Properties props= new Properties();
        String path = application.getRealPath("/WEB-INF/lw.properties");
        File file = new File(path);
        try(FileReader reader = new FileReader(file); ) {
            props.load(reader);
            application.log("Read Visit Count SUCCESSFULLY!");
        } catch (Exception ex) {
            application.log("Read Visit Counter FAILED!");
        }
        Enumeration names = props.propertyNames();
        while(names.hasMoreElements()){
            String name = (String)names.nextElement();
            String value = props.getProperty(name);
            if(value!=null && value.matches("\\d+")){
                application.setAttribute(name, Integer.parseInt(value));
            }else if(value!=null){
                application.setAttribute(name, value);
            }else{
                application.log("Read visit counter failed!!");
            }
        }
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContext application = sce.getServletContext();
        Properties props= new Properties();
        String path = application.getRealPath("/WEB-INF/lw.properties");
        File file = new File(path);
        Enumeration<String> names = application.getAttributeNames();
        
        while(names.hasMoreElements()){
            String name = names.nextElement();
            Object value = application.getAttribute(name);
            if(name.indexOf("lw.app.")==0)
            if(name.indexOf("lw.app.")==0)
                props.setProperty(name, value.toString());
        }
        try(FileWriter writer = new FileWriter(file);) {
            props.store( writer, "Visit Counter!");
            application.log("Record Visit Counter SUCCESSFULLY");
            
        } catch (Exception ex) {
            application.log("Record Visit Counter FAILED!");
        }
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        ServletContext application = se.getSession().getServletContext();
        Properties props= new Properties();
        String path = application.getRealPath("/WEB-INF/lw.properties");
        File file = new File(path);
        try(FileReader reader = new FileReader(file); ) {
            props.load(reader);
            application.log("Read Visit Count SUCCESSFULLY!");
        } catch (Exception ex) {
            application.log("Read Visit Counter FAILED!");
        }
        Enumeration names = props.propertyNames();
        while(names.hasMoreElements()){
            String name = (String)names.nextElement();
            String value = props.getProperty(name);
            
            if(value!=null && value.matches("\\d+")){
                application.setAttribute(name, Integer.parseInt(value));
            }else if(value!=null){
                application.setAttribute(name, value);
            }else{
                application.log("Read visit counter failed!!");
            }
        }
        
        
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        //TODO
    }
}
