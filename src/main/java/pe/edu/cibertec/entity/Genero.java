package pe.edu.cibertec.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="tb_genero")
public class Genero {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_genero")
	private Integer codigo;
	@Column(name = "desc_gen")
	private String descripcion;
	
	@JsonIgnore
	//relación uno "TipoMedicamento" a muchos "Medicamento"
	@OneToMany(mappedBy = "tipogen")//Asociación
	private List<Cliente> listaGeneros;

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public List<Cliente> getListaGeneros() {
		return listaGeneros;
	}

	public void setListaGeneros(List<Cliente> listaGeneros) {
		this.listaGeneros = listaGeneros;
	}

}
