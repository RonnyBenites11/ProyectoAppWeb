package pe.edu.cibertec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.edu.cibertec.dao.TipoDocRepository;
import pe.edu.cibertec.entity.TipoDocumento;


@Service
public class TipoService {
	@Autowired
	private TipoDocRepository repo;
	
	public void grabar(TipoDocumento bean) {
		repo.save(bean);
	}
	public void eliminar(Integer cod) {
		repo.deleteById(cod);
	}
	public TipoDocumento buscar(Integer cod) {
		return repo.findById(cod).orElse(null);
	}
	public List<TipoDocumento> listarTodos(){
		return repo.findAll();
	}
}
