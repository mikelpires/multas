package com.ipartek.formacion.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.modelo.pojo.Agente;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/index")
public class IndexController extends HttpServlet {
	

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		HttpSession session = request.getSession();
		
		Agente agente = new Agente();
		agente.setId(1);
		agente.setNombre("tackleberry");
		agente.setPlaca(5433);

		session.setAttribute("agente", agente);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	

}
