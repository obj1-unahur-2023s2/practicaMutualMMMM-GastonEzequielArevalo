class Actividad{
	var property idioma
	
	method implicaEsfuerzo()
	
	method sirveParaBroncearse()
	
	method diasDeActividad()
	
	method esRecomendada(unSocio)
	
}

class Viaje inherits Actividad{
	
	method condicionGeneral(){
		return idioma.size() > 2
	}
	
	method esInteresante()
	
	override method esRecomendada(unSocio){
		return self.esInteresante() and unSocio.leAtrae(self) and (not unSocio.contains(self))
	}
	
}

class ViajeDePlaya inherits Viaje{
	var largoDeLaPlaya
	
	override method implicaEsfuerzo(){
		return largoDeLaPlaya > 1200
	}
	
	override method sirveParaBroncearse(){
		return true
	}
	
	override method diasDeActividad(){
		return largoDeLaPlaya / 500
	}
	
	override method esInteresante(){
		return self.condicionGeneral()
	}
}


class ViajeDeExcursionACiudad inherits Viaje{
	var cantidadDeAtraccionesAVisitar
	
	override method implicaEsfuerzo(){
		return cantidadDeAtraccionesAVisitar.between(5,8)
	}
	
	override method sirveParaBroncearse(){
		return false
	}
	
	override method diasDeActividad(){
		return cantidadDeAtraccionesAVisitar / 2
	}
	
	override method esInteresante(){
		return self.condicionGeneral() or cantidadDeAtraccionesAVisitar == 5
	}
}

class ViajeDeExcursionACiudadTropical inherits ViajeDeExcursionACiudad{
	
	override method implicaEsfuerzo(){
		return cantidadDeAtraccionesAVisitar.between(5,8)
	}
	
	override method sirveParaBroncearse(){
		return true
	}
	
	override method diasDeActividad(){
		return super() + 1
	}
}

class SalidaDeTrekking inherits Viaje{
	
	var kilometrosDeSendero
	var cantidadDeDiasDeSol
	
	override method implicaEsfuerzo(){
		return kilometrosDeSendero > 80
	}
	
	override method sirveParaBroncearse(){
		return cantidadDeDiasDeSol > 200 or (cantidadDeDiasDeSol.between(100,200) and kilometrosDeSendero > 120)
	}
	
	override method diasDeActividad(){
		return kilometrosDeSendero / 50
	}
	
	override method esInteresante(){
		return self.condicionGeneral() and cantidadDeDiasDeSol > 140
	}
}

class ClaseDeGimnasia inherits Actividad{
	
	override method esRecomendada(unSocio){
		return unSocio.edad().between(20,30)
	}
	
	
	override method idioma(){
		return "Espaniol"
	}
	
	override method diasDeActividad(){
		return 1
	}
	
	override method implicaEsfuerzo(){
		return true
	}
	 override method sirveParaBroncearse(){
	 	return false
	 }
}

class TallerLiterario inherits Actividad{
	const librosQueTrabaja = []
	
	method idiomasUsados(){
		return librosQueTrabaja.maps({libro => libro.idioma()})
	}
	
	override method diasDeActividad(){
		return librosQueTrabaja.size() + 1
	}
	
	method hayUnLibroDeMasDe500Pag(){
		return librosQueTrabaja.any({libro => libro.cantDePaginas() > 500})
	}
	
	method todosLosLibrosSonDelMismoAutor(){
		const nombreDeUnAutor = librosQueTrabaja.get(0).nombreDelAutor()
		
		return librosQueTrabaja.all({libro => libro.nombreDelAutor() == nombreDeUnAutor})
	}
	
	method hayMasDeUnLibro(){
		return librosQueTrabaja.size() > 1
	}
	
	override method implicaEsfuerzo(){
		return self.hayUnLibroDeMasDe500Pag() or (self.todosLosLibrosSonDelMismoAutor() and self.hayMasDeUnLibro())
	}
	
	override method sirveParaBroncearse(){
		return false
	}
	
	override method esRecomendada(unSocio){
		return unSocio.idiomasQueHabla().size() >= 2
	}
}

class Libro{
	var idioma
	var cantPaginas
	var nombreDelAutor
	
	method idioma(){
		return idioma
	}
	
	method cantPaginas(){
		return cantPaginas
	}
	
	method nombreDelAutor(){
		return nombreDelAutor
	}
}


