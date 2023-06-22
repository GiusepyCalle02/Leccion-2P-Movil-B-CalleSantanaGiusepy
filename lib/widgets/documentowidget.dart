import 'package:flutter/material.dart';
import '../model/documento.dart';

class DocumentoWidget extends StatelessWidget {
  final Documento documento;
  final Function onTap;
  final Function onSwipe;
  final Function onLongPress;

  const DocumentoWidget(
      {Key? key,
      required this.documento,
      required this.onTap,
      required this.onSwipe,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        onSwipe(documento.id);
      },
      onLongPress: () {
        onLongPress(documento.id);
      },
      onTap: () {
        onTap(documento);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 80.0,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 12.0,
                decoration: BoxDecoration(
                    color: documento.revisado
                        ? Colors.transparent
                        : Colors.lightGreen,
                    shape: BoxShape.circle),
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Nombre: ${documento.nombre}"),
                  Text(
                      "Año de Caducidad: ${documento.anocaducidad.toString()}"),
                  Text("Id: ${documento.id.toString()}")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
