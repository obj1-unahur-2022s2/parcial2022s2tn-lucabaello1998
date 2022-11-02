import parcelas.*
import plantas.*

object inta{
	var property parcelasEstudiadas=#{}
	
	method agregarParcela(parcela) = parcelasEstudiadas.add(parcela) 
	
	method plantasPorParcela() = parcelasEstudiadas.sum({parcela=>parcela.plantas().size()})
	method promedioDePlantas() = self.plantasPorParcela().div(parcelasEstudiadas.size())
	
	method parcelaConMayorAsociadas() = parcelasEstudiadas.max({p=>p.seAsociaBien()})
	method parcelas4omasPlantas() = parcelasEstudiadas.filter({p=>p.plantas().size()>4})
	//No esta completo
	method parcelaMasAutosustentable() = self.parcelas4omasPlantas()
}