package pe.edu.cibertec.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pe.edu.cibertec.dao.DepartamentoRepository;
import pe.edu.cibertec.entity.Departamento;

@Service
public class DepartamentoService {
	@Autowired
	private DepartamentoRepository repo;
	
	public List<Departamento> listarTodos(){
		return repo.findAll();
	}
}
