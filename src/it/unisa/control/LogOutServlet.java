package it.unisa.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.Cart;


@WebServlet("/LogOutServlet")
public class LogOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//con il logout si rilasciano tutti i dati relativi all'utente (Attribute utente, Attribute Ordini, Attribute cart(se esistente))
		
		Cart newCart = new Cart();
		request.getSession().setAttribute("cart", newCart);
		request.getSession().removeAttribute("utente");
		request.getSession().removeAttribute("ordini");
		
		RequestDispatcher out = getServletContext().getRequestDispatcher("/Home.jsp");
		out.forward(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
