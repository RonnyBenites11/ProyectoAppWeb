package pe.edu.cibertec.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pe.edu.cibertec.entity.Cliente;
import pe.edu.cibertec.entity.Genero;
import pe.edu.cibertec.entity.TipoDocumento;
import pe.edu.cibertec.service.ClienteService;
import pe.edu.cibertec.service.GeneroService;
import pe.edu.cibertec.service.TipoService;




@Controller
@RequestMapping("/cliente")
public class clienteController {
	@Autowired
	private ClienteService sercli;
	
	@Autowired
	private TipoService sertipo;
	@Autowired
	private GeneroService sergen;
	@RequestMapping("/lista")
	public String inicio(Model model) {
		//recuperar lista de medicamentos
		List<Cliente> info=sercli.listarTodos();
		//recuperar lista de tipos medicamentos
		//List<TipoMedicamento> data=servicioTipo.listarTodos();
		//recuperar lista de laboratorio
		List<TipoDocumento> tipodoc=sertipo.listarTodos();
		List<Genero> generocli=sergen.listarTodos();
		//crear atributo
		model.addAttribute("clientes", info);
		//model.addAttribute("tipos",data);
		model.addAttribute("docuemntos",tipodoc);
		model.addAttribute("generos",generocli);
		
		return "cliente";
	}
	@RequestMapping("/grabar")
	public String grabar(@RequestParam("codigo") int cod,@RequestParam("cod_cli") int cod_cli,
						 @RequestParam("tipo") int Codtipo,
					     @RequestParam("nombre") String nombre,@RequestParam("apellido") String apellido,
					     @RequestParam("edad") int edad,@RequestParam("tipogen") int tipogen,
					    
					     RedirectAttributes redirect) {
		try {
			//crear objeto de la entidad Medicamento
			Cliente bean=new Cliente();
			//setear
			bean.setCodigo(cod);
			bean.setCod_cli(cod_cli);
			TipoDocumento tipo=new TipoDocumento();
			//setear
			tipo.setCodigo(Codtipo);
			bean.setTipo(tipo);
			
			bean.setNombre(nombre);
			bean.setApellido(apellido);
			bean.setEdad(edad);
			Genero gen = new Genero();
			gen.setCodigo(tipogen);
			bean.setTipogen(gen);
		
			//crear objeto de la entidad TipoMedicamento
			
			//enviar el objeto "tipo" al objeto "bean"
		
			//invocar al mñetodo grabar
			sercli.grabar(bean);
			//
			if(cod==0)
				redirect.addFlashAttribute("MENSAJE","Cliente registrado");
			else
				redirect.addFlashAttribute("MENSAJE","Cliente actualizado");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/cliente/lista";
	}
	@RequestMapping("/buscarPorID")
	@ResponseBody
	public Cliente buscarPorID(@RequestParam("codigo") int cod) {
		Cliente cli=sercli.buscar(cod);
		return cli;
		
	}
	@RequestMapping("/eliminarPorID")
	public String eliminarPorID(@RequestParam("codigo") int cod,RedirectAttributes redirect) {
		try {
			sercli.eliminar(cod);
			redirect.addFlashAttribute("MENSAJE","Cliente eliminado");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/cliente/lista";
	}
}
