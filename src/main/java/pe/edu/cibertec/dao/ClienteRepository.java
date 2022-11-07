package pe.edu.cibertec.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import pe.edu.cibertec.entity.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Integer> {

}
