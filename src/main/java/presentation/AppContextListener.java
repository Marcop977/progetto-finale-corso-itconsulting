package presentation;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import service.StudenteService;
import service.StudenteServiceImpl;

@WebListener
public class AppContextListener implements ServletContextListener {
    
    private StudenteService studenteService;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        studenteService = new StudenteServiceImpl();
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (studenteService != null) {
            studenteService.close();
        }
    }
}
