package mall.client.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DBListener implements ServletContextListener {

    public void contextDestroyed(ServletContextEvent sce)  { 
    	System.out.println("contextDestroyed");
    }

    public void contextInitialized(ServletContextEvent sce)  { 
        try {
        	Class.forName("org.mariadb.jdbc.Driver");
        	System.out.println("mariadb로딩 성공");
        } catch(Exception e) {
        	System.out.println("mariadb로딩 실패");
        	e.printStackTrace();
        }
    }
	
}
