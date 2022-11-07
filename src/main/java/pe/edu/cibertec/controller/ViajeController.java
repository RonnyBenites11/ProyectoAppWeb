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
import pe.edu.cibertec.entity.Viaje;
import pe.edu.cibertec.entity.Ruta;
import pe.edu.cibertec.entity.Bus;

@Controller
@RequestMapping("/viaje")
public class ViajeController {
	@Autowired
	private RutaService servicioRut;
	
	@Autowired
	private BusService servicioBu;
	
	@Autowired
	private ViajeService servicioVia;
	
	@RequestMapping("/lista")
	public String lista(Model model) {
		List<Ruta> infoR=servicioRut.listarTodos();
		model.addAttribute("rutas", infoR);
		
		List<Bus> infoB=servicioBu.listarTodos();
		model.addAttribute("buses", infoB);
		
		List<Viaje> infoVia=servicioVia.listarTodos();
		model.addAttribute("viajes", infoVia);
		
		return "viaje";
	}
	
	@RequestMapping("/buscar")
	@ResponseBody
	public Viaje buscar(@RequestParam("codigo") Integer cod) {
		return servicioVia.buscarPorID(cod);
	}
	
	@RequestMapping("/grabar")
	public String grabar(@RequestParam("codigo") Integer cod, 
			@RequestParam("fecpartida") String fecPartida,
			@RequestParam("fecllegada") String fecLlegada, 
			@RequestParam("ruta") Integer codRuta, @RequestParam("bus") Integer codBus,
			RedirectAttributes redirect) {	
		try {
			Viaje via = new Viaje();
			via.setCodigo(cod);
			via.setFechaPartida(LocalDateTime.parse(fecPartida));
			via.setFechaLlegada(LocalDateTime.parse(fecLlegada));
			//via.setFechaPartida(fecPartida);
			//via.setFechaLlegada(fecLlegada);
			
			Ruta rut= new Ruta();
			Bus bu = new Bus();
			rut.setCodigo(codRuta);
			bu.setCodigo(codBus);
			via.setRuta(rut);
			via.setBus(bu);
						
			servicioVia.grabar(via);
			if(cod==0)
				redirect.addFlashAttribute("MENSAJE","Viaje registrado!");
			else
				redirect.addFlashAttribute("MENSAJE","Viaje actualizado!");
		}catch(Exception e) {
			redirect.addFlashAttribute("MENSAJE","ERROR! No se logro actualizar Viaje");
			e.printStackTrace();
		}
		
		return "redirect:/viaje/lista";
	}
	
	@RequestMapping("/eliminar")
	public String eliminar(@RequestParam("codigo") int cod ,RedirectAttributes redirect) {
		try {
			servicioVia.eliminar(cod);
			redirect.addFlashAttribute("MENSAJE","Viaje eliminado!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/viaje/lista";
	}
}
