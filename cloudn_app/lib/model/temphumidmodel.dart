import 'dart:convert';

class Item{
  String category;
  int obsrValue;

  Item(this.category, this.obsrValue);

  factory Item.fromJson(dynamic json){
    return Item(json['category'] as String, json['obsrValue'] as int);
  }

  @override
  String toString(){
    return '{${this.category}, ${this.obsrValue}}';
  }
}

class Items{
  Item item;

  Items(this.item);

  factory Items.fromJson(dynamic json){
    return Items(Item.fromJson(json['item']));
  }

  @override
  String toString(){
    return '${this.item}';
  }
}

class Body{
  Items items;

  Body(this.items);

  factory Body.fromJson(dynamic json){
    return Body(Items.fromJson(json['items']));
  }

  @override
  String toString(){
    return '${this.items}';
  }
}

class Response {
  Body body;

  Response(this.body);

  factory Response.fromJson(dynamic json){
    return Response(Body.fromJson(json['body']));
  }

  @override
  String toString(){
    return '${this.body}';
  }
}

class HumidList {
  Response response;

  HumidList(this.response);

  factory HumidList.fromJson(dynamic json){
    return HumidList(Response.fromJson(json['response']));
  }

  @override
  String toString(){
    return '${this.response}';
  }
}