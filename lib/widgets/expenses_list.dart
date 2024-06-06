import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  const ExpensesList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount:expenses.length,
        itemBuilder: (context,index)=>ExpenseItem(expenses[index])

    );
    //list with many items is there then do not use column
    //builder method is used to create scrollable lists,but only show them when they are visible.builder(itemBuilder: itemBuilder)
  }
}
