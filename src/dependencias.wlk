import rodados.*
import pedidos.*
class Dependencia{
	const rodados = []
	
	method ningunoSatisface(pedido){
		return rodados.any({r => pedido.puedeSerSatisfechoPor(r)})
	}
	method pedidosInsatisfechos(){
		return pedidos.filter({p=> self.ningunoSatisface(p)})
	}
	
	const property cantidadDeEmpleados
	
	method agregarAFlota(rodado){
		rodados.add(rodado)
	}
	method quitarDeFlota(rodado){
		rodados.remove(rodado)
	}
	method pesoTotalFlota(){
		rodados.sum({rodado => rodado.peso()})
	}
	method todosSuperanXVelocidad(velocidad){
		return rodados.all({r=>r.velocidad() >= velocidad})
		
	}
	
	method estaBienEquipada(){
		
		return rodados.size() >= 3 && self.todosSuperanXVelocidad(100)
	}
	
	method capacidadTotalEnColor(color){
		return (self.rodadosDe_(color)).sum({r=>r.capacidad()})
	}
	
	method rodadosDe_(color){
		return rodados.filter({r=>r.color()==color})
	}
	method colorDelRodadoMasRapido(){
		return self.rodadoMasRapido().color()
	}
	
	method rodadoMasRapido() {
		if(rodados.isEmpty()){
			self.error("No se puede calcular el maximo")
		}
		return rodados.max({r=>r.velocidad()})
		
	}
	
	method capacidadFaltante(){
		return 0.max(cantidadDeEmpleados - self.capacidadDeLaFlota() )
	}
	
	method capacidadDeLaFlota() {
		return rodados.sum({r=>r.capacidad()})
	}
	method esGrande(){
		return cantidadDeEmpleados >= 40 and rodados.size() >=5
	}
}
