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
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author adm
 */
public class PerformanceFilter implements Filter {
    private FilterConfig filterConfig;
    private String prefix = "Performance";
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //1.
        this.filterConfig = filterConfig;
        
        //2.
        String prefix = filterConfig.getInitParameter("prefix");
        if (prefix!=null){
            this.prefix = prefix;
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    long begin = System.currentTimeMillis();
        
        
    chain.doFilter(request, response);
    
    long gap = System.currentTimeMillis() - begin;
    
    filterConfig.getServletContext().log(prefix + ", 執行" + ((HttpServletRequest)request).getRequestURI() + "花費" + gap + "ms ");
    
    }

    @Override
    public void destroy() {
    }
    
    
    
}
