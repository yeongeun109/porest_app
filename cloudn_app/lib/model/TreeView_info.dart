import 'package:cloudnapp/model/TreeView_document.dart';

int i = 1, j = 1;
List a = [];
List<Document> documentList = [
  Document(
    name: '대륭포스트타워',
    isFile: false,
    childData: [
      Document(name: 'Floor 11'
          , childData: [
        Document(
            name: 'Zone '+ (i++).toString(),
            childData: [
              Document(
                  name: 'Plant ' + (j++).toString(),
                  isFile: false,
                  childData: [
                    Document(
                      name: 'Leaf 1',
                      isFile: false,
                    ),
                    Document(
                      name: 'Leaf 2',
                      isFile: false,
                    ),
                  ]
              ),
              Document(
                name: 'Plant ' + (j++).toString(),
                isFile: false,
              ),
              Document(
                name: 'Tree 1',
                isFile: false,
              ),
            ]),
        Document(
          name: 'Zone ' + (i++).toString(),
          isFile: true,
        ),
      ]),
      Document(
        name: 'Floor 12',
        isFile: true,
      ),
    ],
  ),
];
