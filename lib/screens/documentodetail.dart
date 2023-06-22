import 'package:flutter/material.dart';
import '../model/documento.dart';

class DocumentoDetail extends StatelessWidget {
  final Documento documento;
  const DocumentoDetail({Key? key, required this.documento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Documento")),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Text("Nombre: ${documento.nombre}"),
          Text("Año de Caducidad: ${documento.anocaducidad.toString()}"),
          Text("Id: ${documento.id}")
        ]),
      ),
    );
  }
}
