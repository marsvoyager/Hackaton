package com.marseweb;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Modelo.FabricantePOJO;
import com.Modelo.FabricantePOJO.IpParametros;

import com.jpalibom.marse.LibroStock;
import com.jpalibom.marse.TABLE2;
import com.jpalibrom.Servicio;


/**
 * Servlet implementation class Controlador
 */
@WebServlet("/Controlador")
public class Controlador extends HttpServlet 
implements FabricantePOJO.IpParametros{
	private static final long serialVersionUID = 1L;
       
	HttpServletRequest mirequest;
	HttpServletResponse miresponse;
	
	protected Servicio servicio;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controlador() {
        super();
        servicio = new Servicio();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		mirequest = request;
		miresponse = response;
		String forwardUrl = "/index.jsp";
		int opcionmenu=0; //para redireccionar al siguiente jsp
		String resultadoAviso = "Algo no va bien;";
		
		/*
		 * Gesttion de POST
		 * 
		 * */
		String procesaropcion=request.getParameter("_proc_action");
		if(procesaropcion!= null) {
			if(procesaropcion.equalsIgnoreCase("_alta")) {
				FabricantePOJO ifabr = new LibroStock.Fabric() {
					public Object fabricar(IpParametros params){
						Controlador micontrolrd = (Controlador)params;
						LibroStock nuevostck = new LibroStock();
						
						String titulo=mirequest.getParameter("__titulo");
						nuevostck.setTitulo(titulo);
						String precio=mirequest.getParameter("__precio");
												
						try {
							nuevostck.setPrecio(Integer.parseInt(precio));
							nuevostck = servicio.alta(nuevostck);							
						}
						catch(Exception e) {
							e.printStackTrace();
							nuevostck=null;
						}//finally {}
						
						return nuevostck;				
				}
				};
			LibroStock nuevostck= (LibroStock)ifabr.fabricar(this);
			resultadoAviso="";
			if(nuevostck==null)
				resultadoAviso += "NO SE A�ADI� EL LIBRO, DATOS INCORRECTOS;).<br/>";
			else
			resultadoAviso += "Stock inventado dado de alta ;).<br/>";
			//A�adamos datos!!!
						
			List<LibroStock> result = servicio.consulta();
			mirequest.setAttribute("_Stock",result);
			}
			else if(procesaropcion.equalsIgnoreCase("_baja")) {
		
				servicio.baja(
						Integer.parseInt(
						mirequest.getParameter("_idstocklibro"))						
						);				
			}
			else if(procesaropcion.equalsIgnoreCase("_modificar")) {
				LibroStock nuevostck
				= new LibroStock();
				nuevostck.setId(Integer.parseInt(
						mirequest.getParameter("_idstocklibro")));
				nuevostck.setTitulo(mirequest.getParameter("_modificaobajatitulo"));
				nuevostck.setPrecio(Integer.parseInt(
						mirequest.getParameter("_modificaobajaprecio")));
				
				
				nuevostck = servicio.modifica(nuevostck);
				
				resultadoAviso="";
				if(nuevostck==null)
					resultadoAviso += "NO SE A�ADI� EL LIBRO, DATOS INCORRECTOS;).<br/>";
				else
				resultadoAviso += "Stock inventado dado de alta ;).<br/>";
				
			}
		}
		/*
		 * Gestion de GET
		 *
		 * NO HACE FALTA!!
		 * */
		//String stropcion=request.getParameter("action");
		//if(stropcion == null) {
			
			/*A�adamos datos!!!
			/*FabricantePOJO ifabr = new LibroStock.Fabric() {
				public Object fabricar(IpParametros params){
					Controlador micontrolrd = (Controlador)params;
					LibroStock nuevostck = new LibroStock();
					nuevostck.setTitulo("LPIC-I: Preparaci�n a la certificaci�n");
					nuevostck.setPrecio(60);
					nuevostck = servicio.alta(nuevostck);
					return nuevostck;				
			}
			};
			LibroStock nuevostck= (LibroStock)ifabr.fabricar(this);
			resultadoAviso="";
			resultadoAviso += "Stock inventado dado de alta ;).<br/>";
			//A�adamos datos!!!
						
			-------------------*/
			
		List<TABLE2> resultTC = servicio.consultaTC();
		mirequest.setAttribute("_TABLEC",resultTC);
		
		List<LibroStock> result = servicio.consulta();
		mirequest.setAttribute("_Stock",result);

		//}
		//else {}
		
		switch(opcionmenu)
		{
		//break;
		case 0:
			forwardUrl = "/index.jsp";
			resultadoAviso += "Escoge opciones";
		default:
			forwardUrl = "/index.jsp";
		}
		request.setAttribute("_resultado", resultadoAviso);

		
		
		
		request.getRequestDispatcher(forwardUrl).forward(request, response);
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
