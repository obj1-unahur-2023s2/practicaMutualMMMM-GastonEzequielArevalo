class Viaje{	
	const idioma = []
	
	method idioma(){
		return idioma
	}
	
	method implicaEsfuerzo()
	
	method sirveParaBroncearse()
	
	method dias()
	
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

