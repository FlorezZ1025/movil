void main(List<String> args) {
  Map<String, dynamic> producto1 = {
    "nombre": "pescado",
    "precio": 1500.0,
    "descuento": 0.25,
  };
  Map<String, dynamic> producto2 = {
    "nombre": "manzana",
    "precio": 500.0,
    "descuento": 0.20,
  };
  Map<String, dynamic> producto3 = {
    "nombre": "xbox",
    "precio": 10000.0,
    "descuento": 0.5,
  };
  List<Map<String, dynamic>> productos = [producto1, producto2, producto3];
  print(
      "El precio final del ${productos[0]["nombre"]} es ${calcularPrecioFinal(productos[0])}");
  print(
      "El precio final del ${productos[1]["nombre"]} es ${calcularPrecioFinal(productos[1])}");

  print(
      "El precio final del ${productos[2]["nombre"]} es ${calcularPrecioFinal(productos[2])}");

}

double calcularPrecioFinal(Map<String, dynamic> producto) {
  const double IVA = 0.19;
  double precio = producto["precio"];
  double descuento = producto["descuento"];

  return precio - precio * descuento + precio * IVA;
}
