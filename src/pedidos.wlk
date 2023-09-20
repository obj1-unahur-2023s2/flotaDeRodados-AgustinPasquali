class Pedido {
	const property distancia
	const property tiempoMaximo
	const property cantidadDePasajeros
	const property velocidad
	const property coloresIncompatibles= #{}
	method velocidadRequerida() = distancia/tiempoMaximo
	method puedeSerSatisfechoPor(unRodado) {
		return unRodado.velocidad() >= 10 +self.velocidadRequerida()
		and unRodado.capacidad() >= cantidadDePasajeros
		and self.esDeColorCompatible(unRodado.color())
	}
	method esDeColorCompatile(unColor){
		return not coloresIncompatibles.contains(unColor)
	}
}
