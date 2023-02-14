import 'package:flutter/material.dart';

dynamic getData(dynamic data){
  switch (data.runtimeType.toString()) {
    case "String":
      return Text(data);
    default:
  }
}