
import 'package:meta/meta.dart';

class Document {
  final String name;
  final bool isFile;
  final List<Document> childData;

  Document( {
    @required this.name,
    this.isFile = false,
    this.childData = const <Document>[],
  });
}