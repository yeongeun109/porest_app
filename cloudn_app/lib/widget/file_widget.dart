import 'package:flutter/material.dart';


class FileWidget extends StatelessWidget {
  final String fileName;

  FileWidget({@required this.fileName,});

  @override
  Widget build(BuildContext context) {
    Widget fileNameWidget = Text(this.fileName);
    Icon fileIcon = Icon(Icons.insert_drive_file);

    return Card(
      elevation: 0.0,
      child: ListTile(
        leading: fileIcon,
        title: fileNameWidget,
        onTap: (){},
      ),
    );
  }
}