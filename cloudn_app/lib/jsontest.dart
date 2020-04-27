import 'dart:convert';

import 'package:flutter/material.dart';


String text1 = '{"body":{"dataType":"JSON","items":{"item":[{"baseDate":"20200427","baseTime":"1100","category":"PTY","nx":59,"ny":126,"obsrValue":"0"},{"baseDate":"20200427","baseTime":"1100","category":"REH","nx":59,"ny":126,"obsrValue":"37"},{"baseDate":"20200427","baseTime":"1100","category":"RN1","nx":59,"ny":126,"obsrValue":"0"},{"baseDate":"20200427","baseTime":"1100","category":"T1H","nx":59,"ny":126,"obsrValue":"15.3"},{"baseDate":"20200427","baseTime":"1100","category":"UUU","nx":59,"ny":126,"obsrValue":"3.6"},{"baseDate":"20200427","baseTime":"1100","category":"VEC","nx":59,"ny":126,"obsrValue":"313"},{"baseDate":"20200427","baseTime":"1100","category":"VVV","nx":59,"ny":126,"obsrValue":"-3.3"},{"baseDate":"20200427","baseTime":"1100","category":"WSD","nx":59,"ny":126,"obsrValue":"4.9"}]},"pageNo":1,"numOfRows":10,"totalCount":8}}';
//var itemsJson = jsonDecode(text1)['items'] as List;
//var tutoJson = jsonDecode(text1)['item'] as List;

void hi(){

  var data = jsonDecode(text1);
  //print(data);
  String a = data.toString();
  //print(a);
  String target = 'category: T1H';
  String target2 = 'category: ';
  int target_num = a.indexOf(target);

  String result;

  result = a.substring(target_num+43, target_num+47);
  print('온도: ' + result);
  //print(a);

  int target2_num = a.indexOf(target2);
  String result2;
  result2 = a.substring(target2_num, (a.substring(target2_num).indexOf("}")+target2_num));

  //print(result2);
}
class AB extends StatelessWidget {
  //List tuto = tutoJson.map((tutoJson) => Tutorial.fromJson(tutoJson)).toList();
  //List tuto2 = tutoJson.map((tutoJson) => Tutorial2.fromJson(tutoJson)).toList();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('lets go'),
                  onPressed: () {
                    //print(tuto);
                    //print(tuto2);
                    //int i;
                    //for(i = 0; i < tuto.length; i++){
                    //    if(tuto[i].toString() == 'T1H')
                    //      break;
                    //}
                    //print(tuto2[i]);
                    hi();
                  },
                ),
              ],
            )));
  }
}
class Body{
  Items items;

  Body({
    this.items,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    items: Items.fromJson(json["items"]),
  );

  Map<String, dynamic> toJson() => {
    "items": items.toJson(),
  };
}
class Items {
  Item item;

  Items({
    this.item,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    item: Item.fromJson(json["item"]),
  );

  Map<String, dynamic> toJson() => {
    "item": item.toJson(),
  };
}

class Item {
  String category;
  String obsrValue;

  Item({
    this.category,
    this.obsrValue,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    category: json["category"],
    obsrValue: json["obsrValue"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "obsrValue": obsrValue,
  };
}

//[{"baseDate":"20200427","baseTime":"1100","category":"PTY","nx":59,"ny":126,"obsrValue":"0"},{"baseDate":"20200427","baseTime":"1100","category":"REH","nx":59,"ny":126,"obsrValue":"37"},{"baseDate":"20200427","baseTime":"1100","category":"RN1","nx":59,"ny":126,"obsrValue":"0"},{"baseDate":"20200427","baseTime":"1100","category":"T1H","nx":59,"ny":126,"obsrValue":"15.3"},{"baseDate":"20200427","baseTime":"1100","category":"UUU","nx":59,"ny":126,"obsrValue":"3.6"},{"baseDate":"20200427","baseTime":"1100","category":"VEC","nx":59,"ny":126,"obsrValue":"313"},{"baseDate":"20200427","baseTime":"1100","category":"VVV","nx":59,"ny":126,"obsrValue":"-3.3"},{"baseDate":"20200427","baseTime":"1100","category":"WSD","nx":59,"ny":126,"obsrValue":"4.9"}]