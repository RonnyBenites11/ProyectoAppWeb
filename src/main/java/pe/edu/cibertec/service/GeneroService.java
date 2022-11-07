package pe.edu.cibertec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.edu.cibertec.dao.GeneroRepository;

import pe.edu.cibertec.entity.Genero;


@Service
public class GeneroService {
	@Autowired
	private GeneroRepository repo;
	
	public void grabar(Genero bean) {
		repo.save(bean);
	}
	public void eliminar(Integer cod) {
		repo.deleteById(cod);
	}
	public Genero buscar(Integer cod) {
		return repo.findById(cod).orElse(null);
	}
	public List<Genero> listarTodos(){
		return repo.findAll();
	}
}
