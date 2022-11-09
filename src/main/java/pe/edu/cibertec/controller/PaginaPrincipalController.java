package pe.edu.cibertec.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;
import pe.edu.cibertec.service.ViajeService;
import pe.edu.cibertec.service.RutaService;
import pe.edu.cibertec.service.BusService;
import pe.edu.cibertec.service.TerminalService;
import pe.edu.cibertec.entity.Viaje;
import pe.edu.cibertec.entity.Ruta;
import pe.edu.cibertec.entity.Bus;
import pe.edu.cibertec.entity.Terminal;

@Controller
@RequestMapping("/index")
public class PaginaPrincipalController {
	
	@GetMapping("")
	public String index(){
		return "index";
		
	}
	@GetMapping("/login")
	public String login(){
		return "login";
		
	}
	

	
		
	}

