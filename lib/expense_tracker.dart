import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses=[
    Expense(
        category:Category.work,
        title: 'Flutter Udemy course',
        amount: 399,
        date: DateTime.now()),

    Expense(
        category:Category.travel,
        title: 'Puri',
        amount: 2000,
        date: DateTime.now()),

    Expense(
        category:Category.leisure,
        title: 'Cinema',
        amount: 500,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Column(
         children:  [
          const Text('The chart'),
           Expanded(child: ExpensesList(expenses: _registeredExpenses))
           //When using list inside list, use expanded otherwise it wont be visible.

        ],
      ),

    );
  }
}
