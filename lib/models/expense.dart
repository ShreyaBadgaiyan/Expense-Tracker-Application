import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';


final formatter=DateFormat.yMd();
const uuid=Uuid();
enum Category{
  food,
  travel,
  leisure,
  work,

}
//these are not string values as we have not write it as ''
//Enum allows us to create a custom type.

const categoryIcons={
  Category.food:Icons.lunch_dining,
  Category.travel:Icons.train,
  Category.leisure:Icons.movie,
  Category.work:Icons.work,
};

class Expense{
  Expense(  {required this.title,
    required this.amount,
    required this.date,required this.category, } )
  :id=uuid.v4();
  //v4 generates unique id
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;//such that this does not allow multiple values,we allow a fixed set of values.

 String get formattedDate{
   return formatter.format(date);
 }
}

//uuid package is used to generate unique ids.