import 'package:flutter/material.dart';
import '../model/backend.dart';
import '../model/documento.dart';
import '../widgets/documentowidget.dart';
import 'documentodetail.dart';

class DocumentoList extends StatefulWidget {
  final String titulo;

  const DocumentoList({Key? key, required this.titulo}) : super(key: key);

  @override
  _DocumentoListState createState() => _DocumentoListState();
}

class _DocumentoListState extends State<DocumentoList> {
  var documentos = Backend().getDocumentos();

  void markDocumentoComoVisto(int id) {
    Backend().markDocumentoComoVisto(id);
    setState(() {
      documentos = Backend().getDocumentos();
    });
  }

  void deleteDocumento(int id) {
    Backend().deleteDocumento(id);
    setState(() {
      documentos = Backend().getDocumentos();
    });
  }

  void showDetail(Documento documento) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DocumentoDetail(documento: documento);
    }));

    Backend().markDocumentoComoVisto(documento.id);
    setState(() {
      documentos = Backend().getDocumentos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.titulo)),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) => DocumentoWidget(
                documento: documentos[index],
                onTap: showDetail,
                onSwipe: deleteDocumento,
                onLongPress: markDocumentoComoVisto),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  color: Colors.black,
                  thickness: 4,
                ),
            itemCount: documentos.length));
  }
}
