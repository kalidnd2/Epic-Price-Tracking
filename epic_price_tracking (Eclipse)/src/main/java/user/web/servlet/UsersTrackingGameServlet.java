package user.web.servlet;

import user.domain.User;
import user.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class UsersTrackingGameServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService userservice = new UserService();
        try {
	        Map<String,String[]> paramMap = req.getParameterMap();
	
	        List<String> info = new ArrayList<String>();
	
	        for(String name : paramMap.keySet()) {
	
	            String[] values = paramMap.get(name);
	            info.add(values[0]);
	            System.out.println(name + ": " + Arrays.toString(values));
	        }
	        String gameId =  info.get(0);
	        
	            req.setAttribute("UserList", userservice.getUsersTrackingGame(gameId));

        } catch (InstantiationException | IllegalAccessException
                | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        req.getRequestDispatcher("/jsps/user/usersTrackingGameList.jsp").forward(req, resp);
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
