class Documento {
  final int id;
  final String nombre;
  final int anocaducidad;
  bool revisado;

  Documento(
      {required this.id,
      required this.nombre,
      required this.anocaducidad,
      this.revisado = false});
}
