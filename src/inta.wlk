import parcelas.*
import plantas.*

object inta{
	var property parcelasEstudiadas=#{}
	
	method plantasPorParcela() = parcelasEstudiadas.sum({parcela=>parcela.plantas().size()})
	method promedioDePlantas() = self.plantasPorParcela() / parcelasEstudiadas.size()
	
	method parcelaConMayorAsociadas() = parcelasEstudiadas.max({p=>p.seAsociaBien()})
	method parcelaMasAutosustentable() = parcelasEstudiadas.count({p=>p.size() > 4}) and self.parcelaConMayorAsociadas()
}