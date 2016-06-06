/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lw.web;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author adm
 */
@WebFilter(filterName = "CharSetFilter", 
        urlPatterns = {"*.jsp","*.view","*.do","*.php","*.asp"}, initParams = {
    @WebInitParam(name = "charset", value = "big5")},
        dispatcherTypes = {DispatcherType.REQUEST, DispatcherType.ERROR})

public class CharsetFilter implements Filter {
    private FilterConfig filterConfig;
    private String charset = "UTF-8";
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        String charset = filterConfig.getInitParameter("charset");
        if(charset!=null){
            this.charset = charset;
        }        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding(charset);
        request.getParameterNames();        
//        response.getContentType("text/html");
        response.setCharacterEncoding(charset);
        response.getWriter();
        
        chain.doFilter(request, response);        
        
        filterConfig.getServletContext().log("Charset set as: "+ charset );
    }

    @Override
    public void destroy() {
    }
    
}
