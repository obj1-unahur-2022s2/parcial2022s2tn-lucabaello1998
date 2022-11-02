import plantas.*

class Parcela {
	const ancho
	const largo
	const property horasSol
	const property plantas = #{}
	
	method superficie() = ancho * largo
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
		}else{
			plantas.add(planta)
		}
	}
	
	method parcelaIdealQuinoa() = plantas.any({p=>p.altura()<1.5})
	
}

class ParcelaEcologica inherits Parcela{
	method seAsociaBien(parcela) = not self.tieneComplicaciones() and plantas.all({p=>p.parcelaIdeal(parcela)})
}

class ParcelaIndustrial inherits Parcela{
	method seAsociaBien() = plantas.size() <= 2 and plantas.all({p=>p.esFuerte()})
}