
import fu.swp.utils.RoleAndRequestMapper;
import java.util.Arrays;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import fu.swp.model.Role.Type;

public class ApplicationServletContext implements ServletContextListener {

    protected RoleAndRequestMapper roleAndRequestMapper = new RoleAndRequestMapper();

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        registerResourcePage();
    }

    public void registerResourcePage() {
        //Insert .jsp or Servlet mapping here NOTE: (Without slash /)!!!!
        roleAndRequestMapper.register("E-Learner/adminDashboard.jsp", Arrays.asList(Type.admin));
        roleAndRequestMapper.register("normal-lession.jsp", Arrays.asList(Type.admin, Type.customer, Type.teacher, Type.student));
        roleAndRequestMapper.register("adminTask", Arrays.asList(Type.admin));
        roleAndRequestMapper.register("userTask", Arrays.asList(Type.customer));
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

}
