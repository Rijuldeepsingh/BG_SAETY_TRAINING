package controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ServerStartupListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("*********************************************");
        System.out.println("BG_SAFETY_PROJECT Application Started Up!");
        System.out.println("*********************************************");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("*********************************************");
        System.out.println("BG_SAFETY_PROJECT Application Shutting Down!");
        System.out.println("*********************************************");
    }
}