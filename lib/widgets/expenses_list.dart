import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount:expenses.length,
        itemBuilder: (context,index)=>Dismissible(
          onDismissed: (direction){
            //direction is of swipping
            onRemoveExpense(expenses[index]);
          },
            key: ValueKey(expenses[index]),
        child: ExpenseItem(expenses[index]))

    );
    //Dismissible helps to swipe the list items in order to delete them
    //list with many items is there then do not use column
    //builder method is used to create scrollable lists,but only show them when they are visible.builder(itemBuilder: itemBuilder)
  }
}
