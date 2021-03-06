package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.OrderBean;
import it.unisa.model.UserBean;
import it.unisa.model.DS.OrderModelDS;
import it.unisa.model.DS.UserModelDS;
import it.unisa.model.Model.OrderModel;
import it.unisa.model.Model.UserModel;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static boolean isDataSource = true;

	static UserModel model= new UserModelDS();
	static OrderModelDS model2 = new OrderModelDS();

    public LoginServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String ID= request.getParameter("username");
		String password= request.getParameter("password");
		UserBean user= new UserBean();
		HttpSession Sessione = request.getSession(true);
		RequestDispatcher out;
		
		ArrayList<OrderBean> orders = new ArrayList <OrderBean>();
		
	
		if (exists(ID, password)) {			
			try {
				user= model.doRetrieveByKey(ID);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			try {
				 orders = model2.doRetrieveAll(user.getID());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.getSession().setAttribute("ordini", orders);
			Sessione.setAttribute("utente", user);
			Sessione.setAttribute("ordini", orders);
			request.getSession().setAttribute("utente", user);
			
		}
		
		else {
			request.getSession().setAttribute("Controllo", "login");
			out =getServletContext().getRequestDispatcher("/Login.jsp");
			request.getSession().setAttribute("esito",false);
			out.forward(request, response);	
			return;
		}
		
		out =getServletContext().getRequestDispatcher("/Home.jsp");
		out.forward(request, response);	
	}
	
	
	
	private static boolean exists(String ID, String password) {
		ArrayList <UserBean>  users= null;
		UserBean user= new UserBean();
		try {
			users = model.doRetrieveAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for (int i=0; i<users.size(); i++) {
			user= users.get(i);
			
			if (ID.contentEquals(user.getID()) && password.contentEquals(user.getPassword())){
				return true;
			}
		}
		
		return false;
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
