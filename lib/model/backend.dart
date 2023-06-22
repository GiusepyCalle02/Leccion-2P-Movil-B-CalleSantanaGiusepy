import 'documento.dart';

class Backend {
  static final Backend _backend = Backend._internal();

  factory Backend() {
    return _backend;
  }

  Backend._internal();

  final _documentos = [
    Documento(
        id: 1,
        nombre: "Documento de Identidad de Giusepy Calle",
        anocaducidad: 2030),
    Documento(
        id: 2,
        nombre: "Documento de pasaporte de Giusepy Calle",
        anocaducidad: 2025),
    Documento(
        id: 3,
        nombre: "Documento de Licencia de Conducir de Giusepy Calle",
        anocaducidad: 2027),
    Documento(
        id: 4,
        nombre: "Documento de certificado de votación de Giusepy Calle",
        anocaducidad: 2023),
  ];

  List<Documento> getDocumentos() {
    return _documentos;
  }

  void markDocumentoComoVisto(int id) {
    var indice = _documentos.indexWhere((documento) => documento.id == id);
    _documentos[indice].revisado = true;
  }

  void deleteDocumento(int id) {
    _documentos.removeWhere((usuario) => usuario.id == id);
  }
}
