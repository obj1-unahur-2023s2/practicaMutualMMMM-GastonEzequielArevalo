import Actividades.*

class Socio {
	const actividadesQueRealizo = []
	const maximoDeActividades
	const edad
	const idiomasQueHabla = []
	
	method edad(){
		return edad
	}
	
		
	method idiomasQueHabla(){
		return idiomasQueHabla
	}
	
	method esAdoradorDelSol(){
		return actividadesQueRealizo.all({actividad => actividad.sirveParaBroncearse()})
	}
	
	method actividadesReforzadas(){
		return actividadesQueRealizo.filter({actividad => actividad.implicaEsfuerzo()})
	}
	
	method registrarUnaActividad(actividadARegistrar){
		if(actividadesQueRealizo.size() >= maximoDeActividades){
			actividadesQueRealizo.add(actividadARegistrar)
		}
		else{
			self.error("El socio supero el maximo de actividades")
		}
	}
	
	method leAtrae(unaActividad)
}

class SocioTranquilo inherits Socio{
	
	override method leAtrae(unaActividad){
		return unaActividad.diasDeActividad() > 4
	}
}

class SocioCoherente inherits Socio{
	
	override method leAtrae(unaActividad){
		if(self.esAdoradorDelSol()){
			return unaActividad.debeServirParaBroncearse()
		}
		else{
			return unaActividad.implicaEsfuerzo()
		}
	}
}

class SocioRelajado inherits Socio{
	
	override method leAtrae(unaActividad){
		return unaActividad.idioma().contains(idiomasQueHabla)
	}
}


