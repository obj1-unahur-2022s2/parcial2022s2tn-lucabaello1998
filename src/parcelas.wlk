import plantas.*

class Parcela {
	const ancho
	const largo
	const property horasSol
	const property plantas = #{}
	
	method superficie() = ancho * largo
	method cantidadPlantas() = plantas.size() //faltaban los paréntesis y no compilaba
	method cantidadMaxima(){ 
		if(ancho>largo){return self.superficie().div(5)}
		else{return self.superficie().div(3)+largo}
	}
	method tieneComplicaciones() = plantas.any({p=>p.horasSolTolerado()<horasSol})
	method plantarPlanta(planta){
		if(self.cantidadMaxima() == plantas.size()){
			self.error("no se puede plantar, ya que estas al maximo de capacidad permitida")
		}
		if(planta.horasSolTolerado()>horasSol+2){
			self.error("la planta no puede ser colocada ya que supera el maximo de horas de sol de la parcela")
		}
		//No hace falta el ese. Cuando se produce una excepcion se corta el flujo	
		plantas.add(planta)
		
	
	}
	
	method seAsociaBien(unaPlanta) = null //Debía ser un método abstracto y recibir una planta
	method parcelaIdealQuinoa() = plantas.all({p=>p.altura()<1.5}) //todas esten por debajo de 1.5
	
}

class ParcelaEcologica inherits Parcela{
	method seAsociaBien(unaPlanta) = not self.tieneComplicaciones() and unaPlanta.parcelaIdeal(self)
}

class ParcelaIndustrial inherits Parcela{
	//method seAsociaBien() = plantas.size() <= 2 and plantas.all({p=>p.esFuerte()})
}