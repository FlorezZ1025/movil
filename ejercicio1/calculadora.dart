void main(List<String> args) {
  Map<String, dynamic> producto1 = {
    "nombre":"pescado",
    "precio": 1500.0,
    "descuento": 0.25,
  };
  Map<String, dynamic> producto2 = {
    "nombre":"manzana",
    "precio": 500.0,
    "descuento": 0.20,
  };
  Map<String, dynamic> producto3 = {
    "nombre":"xbox",
    "precio": 10000.0,
    "descuento": 0.5,
  };
  print("El precio final del ${producto1["nombre"]} es ${calcularPrecioFinal(producto1)}");
  print("El precio final del ${producto2["nombre"]} es ${calcularPrecioFinal(producto2)}");
  print("El precio final del ${producto3["nombre"]} es ${calcularPrecioFinal(producto3)}");


}

double calcularPrecioFinal(Map<String, dynamic> producto){
  const double IVA = 0.19;
  double precio = producto["precio"];
  double descuento = producto["descuento"];
  
  return precio - precio*descuento + precio*IVA;
}