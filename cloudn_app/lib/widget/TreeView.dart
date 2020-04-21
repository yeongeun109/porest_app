import 'package:cloudnapp/model/TreeView_info.dart';
import 'package:flutter/material.dart';
import 'package:tree_view/tree_view.dart';
import 'package:cloudnapp/widget/directory_widget.dart';
import 'package:cloudnapp/widget/file_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:cloudnapp/model/TreeView_document.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TreeView(
      parentList: _getParentList(),
    );
  }
  List<Parent> _getParentList() {
    List<Parent> parentList = [];

    documentList.forEach((document) {
      Parent parent = _getParent(document: document);
      parentList.add(parent);
    });
    return parentList;
  }

  Parent _getParent({@required Document document}) {
    ChildList childList =
    document.isFile ? null : _getChildList(document: document);

    return Parent(
      parent: _getDocumentWidget(document: document),
      childList: childList,
    );
  }

  ChildList _getChildList({@required Document document}) {
    List<Widget> widgetList = [];

    List<Document> childDocuments = document.childData;
    childDocuments.forEach((childDocument) {
      widgetList.add(Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: _getParent(document: childDocument),
      ));
    });
    return ChildList(children: widgetList);
  }

  Widget _getDocumentWidget({@required Document document}) => document.isFile
      ? _getFileWidget(document: document)
      : _getDirectoryWidget(document: document);

  DirectoryWidget _getDirectoryWidget({@required Document document}) =>
      DirectoryWidget(
        directoryName: document.name,
      );

  FileWidget _getFileWidget({@required Document document}) => FileWidget(
    fileName: document.name,
  );
}
