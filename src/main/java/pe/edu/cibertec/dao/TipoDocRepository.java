package pe.edu.cibertec.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import pe.edu.cibertec.entity.TipoDocumento;

public interface TipoDocRepository extends JpaRepository<TipoDocumento, Integer> {

}
