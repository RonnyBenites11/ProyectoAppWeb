package pe.edu.cibertec.controller;

import org.springframework.stereotype.Controller;
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
@RequestMapping("/pagina-principal")
public class PaginaPrincipalController {
	@Autowired
	private RutaService servicioRut;
	
	@Autowired
	private TerminalService servicioTer;
	
	@Autowired
	private ViajeService servicioVia;
	
	@RequestMapping("/")
	public String lista(Model model) {
		List<Ruta> infoR=servicioRut.listarTodos();
		model.addAttribute("rutas", infoR);
		
		List<Terminal> infoT=servicioTer.listarTodos();
		model.addAttribute("terminales", infoT);
		
		List<Viaje> infoV=servicioVia.listarTodos();
		model.addAttribute("viajes", infoV);
		
		return "pagina-principal";
	}
	@RequestMapping("/login")
	public String login(Model model) {
		List<Ruta> infoR=servicioRut.listarTodos();
		model.addAttribute("rutas", infoR);
		
		List<Terminal> infoT=servicioTer.listarTodos();
		model.addAttribute("terminales", infoT);
		
		List<Viaje> infoV=servicioVia.listarTodos();
		model.addAttribute("viajes", infoV);
		
		return "login";
	}
}
