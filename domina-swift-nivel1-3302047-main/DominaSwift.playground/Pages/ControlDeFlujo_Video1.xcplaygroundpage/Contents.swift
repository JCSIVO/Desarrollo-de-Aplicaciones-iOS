//: ### Control de Flujo
//: 1) Error de Swift: 'guard' body must not fall through.

let numero = 50 // 5
let maximo = 35

// La sentencia guard comprueba una condición Booleana, si se cumple la ejecución continua
// Si no pasamos por el Else y obligatoriamente salimos del Scope
func comprobarNumero(){
    guard numero < maximo else {
        print("El número es mayor que el máximo.")
        return
    }
    print("Final de la función")
}

comprobarNumero()

