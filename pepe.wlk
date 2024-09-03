// PERSONAS

object pepe {
	var categoria = cadete
    var bonoResultados = nulo
    var bonoPresentismo = nulo
    var faltas = 0

    method categoria(_categoria) {
        categoria = _categoria
    }

    method sueldoNeto() {
        return categoria.sueldoNeto()
    }

    method bonoResultados(tipo) {
        bonoResultados = tipo
    }

    method bonoPresentismo(tipo) {
        bonoPresentismo = tipo
    }

    method faltas() {
        return faltas
    }

    method faltas(dias) {
        faltas = dias
    }

    method sueldo() {
        return self.sueldoNeto() + bonoResultados.monto(self) + bonoPresentismo.monto(self)
    }
}

object sofia {
    
    var categoria = cadete
    var bonoResultados = nulo

    method categoria(_categoria) {
        categoria = _categoria
    }

    method bonoResultados(tipo) {
        bonoResultados = tipo
    }

    method sueldoNeto() {
        return categoria.sueldoNeto() * 1.3
    }
    
    method sueldo() {
        return self.sueldoNeto() + bonoResultados.monto(self)
    }
}

object roque {
    var sueldoNeto = 28000
    var bonoResultados = nulo

    method sueldo() {
        return sueldoNeto + bonoResultados.monto(self) + 9000
    }
}

object ernesto {
    var compa = pepe
    var bonoPresentismo = nulo
    const faltas = 0

    method compa(empleado) {
        compa = empleado
    }

    method sueldoNeto() {
        return compa.sueldoNeto()
    }

    method sueldo() {
        return self.sueldoNeto() + bonoPresentismo.monto(self)
    }
}

//CATEGORIAS

object cadete {
    var sueldoNeto = 20000

    method sueldoNeto() {
        return sueldoNeto
    }
}

object gerente {
    var sueldoNeto =  15000

    method sueldoNeto() {
        return sueldoNeto
    }
}

object vendedor {
    var sueldoNeto = 16000

    method sueldoNeto() {
        return sueldoNeto
    }

    method activarAumentoPorMuchasVentas() {
        sueldoNeto = sueldoNeto * 1.25
    }

    method desactivarAumentoPorMuchasVentas() {
        sueldoNeto = sueldoNeto / 1.25
    }
}

object medioTiempo {
    var categoriaBase = cadete

    method categoriaBase(categoria) {
        categoriaBase = categoria
    }

    method sueldoNeto() {
        return categoriaBase.sueldoNeto() / 2
    }
}

// BONOS POR RESULTADOS

object porcentaje {
    method monto(empleado) {
        return empleado.sueldoNeto() * 0.1
    }
}

object montoFijo {
    method monto(empleado) {
        return 800
    }
}

object nulo {
    method monto(empleado) {
        return 0
    }
}

// BONOS POR PRESENTISMO

object normal {
    method monto(empleado) {
        return if (empleado.faltas() == 0) 2000 
            else if (empleado.faltas() == 1) 1000 
            else 0
    }
}

object ajuste {
    method monto(empleado) {
        return if (empleado.faltas() == 0) 100 
            else 0
    }
}

object demagogico {
    method bono(empleado) {
        return if (empleado.sueldoNeto() < 18000) 500 
            else 300
    }
}