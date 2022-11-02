import parcelas.*

class Planta {
	const anioObtenida = "desconocido" //No debían estar inicializados
	var property altura = "desconocido" //No debían estar inicializados
	var property horasSolTolerado = "desconocido" //horasSolTolerado debía ser un método abstracto
	
	method esFuerte() = self.horasSolTolerado() > 10
	method daSemilla() = self.esFuerte()
	method espacioOcupado() = null  // debía ser un método abstracto
	
	//implementacion de parcelas ideales
	method parcelaIdeal(parcela) 
	
	//implementacion de bien asociadas
	method bienAsociada(parcela) = parcela.seAsociaBien()
}

class Menta inherits Planta {
	override method horasSolTolerado() = 6
	override method daSemilla() = super() or altura > 4 //4metros
	override method espacioOcupado() = altura * 3
	
	//implementacion de parcelas ideales
	
	override method parcelaIdeal(parcela) = parcela.superficie() > 6
	
}

class Soja inherits Planta{
	
	override method horasSolTolerado(){
		if(altura<0.5){
			return 6
		}if(altura.between(0.5,1)){
			return 7
		}else{
			return 9
		}
	}
	
	override method daSemilla() = super() or (anioObtenida > 2007 and altura > 1) //faltaron un parentesis 
	override method espacioOcupado() = altura / 2
	
	//implementacion de parcelas ideales
	
	override method parcelaIdeal(parcela) = parcela.horasSol() == self.horasSolTolerado()
	
}

class Quinoa inherits Planta{
	
	var property OrigenSemillaAnterior = 2000
	
	override method espacioOcupado() = 0.5
	override method daSemilla() = super() or OrigenSemillaAnterior < 2005
	
	//implementacion de parcelas ideales
	
	override method parcelaIdeal(parcela) = parcela.parcelaIdealQuinoa()
}

class SojaTransgenica inherits Soja{
	override method daSemilla() = false
	
	//implementacion de parcelas ideales
	
	override method parcelaIdeal(parcela) = parcela.cantidadPlantas() == 1
	
	
	
}

class HierbaBuena inherits Menta{
	override method espacioOcupado() = super() * 2
}