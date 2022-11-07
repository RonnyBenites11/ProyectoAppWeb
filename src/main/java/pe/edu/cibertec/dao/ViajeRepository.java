package pe.edu.cibertec.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import pe.edu.cibertec.entity.Viaje;

public interface ViajeRepository extends JpaRepository<Viaje, Integer> {
}
