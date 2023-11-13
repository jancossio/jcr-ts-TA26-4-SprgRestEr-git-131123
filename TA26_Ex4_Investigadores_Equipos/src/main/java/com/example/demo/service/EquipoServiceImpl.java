package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IEquipoDAO;
import com.example.demo.dto.Equipo;

@Service
public class EquipoServiceImpl implements IEquipoService{

	@Autowired
	IEquipoDAO iEquipoDAO;
	
	@Override
	public List<Equipo> listarEquipos(){
		return iEquipoDAO.findAll();
	}
	
	@Override
	public Equipo guardarEquipo(Equipo cajero) {
		return iEquipoDAO.save(cajero);
	}
	
	@Override
	public Equipo obtenerEquipo(String id) {
		return iEquipoDAO.findById(id).get();
	}
	
	@Override
	public Equipo actualizarEquipo(Equipo cajero) {
		return iEquipoDAO.save(cajero);
	}
	
	@Override
	public void eliminarEquipo(String id) {
		iEquipoDAO.deleteById(id);
	}
}
