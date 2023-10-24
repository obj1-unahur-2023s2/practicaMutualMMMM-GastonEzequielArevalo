class Mutual{
	const idioma = []
	
	method idioma(){
		return idioma
	}
	
	method implicaEsfuerzo()
	
	method sirveParaBroncearse()
	
	method dias()
}

class Viaje inherits Mutual{
	
	method esInteresante(){
		return idioma.size() >= 2
	}
}

class ViajeDePlaya inherits Viaje{
	
	var largoDeLaPlaya
	
	override method dias(){
		return largoDeLaPlaya / 500
	}
	
	override method implicaEsfuerzo(){
		return largoDeLaPlaya > 1200
	}
	
	override method sirveParaBroncearse(){
		return true
	}
}

class ViajeDeExcursion inherits Viaje{
	var cantidadDeatracciones
	
	override method dias(){
		return cantidadDeatracciones / 2
	}
	
	override method implicaEsfuerzo(){
		return cantidadDeatracciones.between(5,8)
	}
	
	override method sirveParaBroncearse(){
		return false
	}
	
	override method esInteresante(){
		return super() or cantidadDeatracciones == 5
	}
}

class ViajeDeExcursionTropical inherits ViajeDeExcursion{
	
	override method dias(){
		return super() + 1
	}
	
	override method implicaEsfuerzo(){
		return cantidadDeatracciones.between(5,8)
	}
	
	override method sirveParaBroncearse(){
		return true
	}
}

class SalidaDeTrekking inherits Viaje{
	var kmDeSenderos
	var diasDeSolPorAnio
	
	override method dias(){
		return kmDeSenderos / 50
	}
	
	override method implicaEsfuerzo(){
		return kmDeSenderos > 80
	}
	
	override method sirveParaBroncearse(){
		return diasDeSolPorAnio > 200 or (diasDeSolPorAnio.between(100,200) and kmDeSenderos > 200)
	}
	
	override method esInteresante(){
		return super() and diasDeSolPorAnio > 140
	}
}

class ClaseDeGimnasia inherits Mutual{
	
	override method idioma(){
		return "Espaniol"
	}
	
	override method dias(){
		return 1
	}
	
	override method implicaEsfuerzo(){
		return true
	}
	
	override method sirveParaBroncearse(){
		return false
	}	
}

class Socio inherits Mutual{
	
	const actividadesQueRealizo = []
	const maximoDeActividadesQuePuedeHacer
	
	method esAdoradorDelSol(){
		return actividadesQueRealizo.all({actividad => actividad.sirveParaBroncearse()})
	}
	
	method actividadesReforzadas(){
		return actividadesQueRealizo.filter({actividad => actividad.implicaEsfuerzo()})
	}
	
	method registrarActividad(unaActividad){
		if(actividadesQueRealizo.size() > maximoDeActividadesQuePuedeHacer){
			self.error("Ya realizo el maximo de actividades permitidas")
		}
		else{
			actividadesQueRealizo.add(unaActividad)
		}
	}
	
	
}
