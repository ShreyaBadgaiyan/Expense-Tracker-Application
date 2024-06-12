import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        category: Category.work,
        title: 'Flutter Udemy course',
        amount: 399,
        date: DateTime.now()),
    Expense(
        category: Category.travel,
        title: 'Puri',
        amount: 2000,
        date: DateTime.now()),
    Expense(
        category: Category.leisure,
        title: 'Cinema',
        amount: 500,
        date: DateTime.now())
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        //to avoid overlapping of inputs and keyboard
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));

//mon clicking backdrop this removes.
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense Deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {

    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    //print(MediaQuery.of(context).size.width);

    Widget mainContent = const Center(
      child: Text('No expenses found, Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: (Expense expense) => removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
          ),
          //used to display button in top of screen at the appBar
        ],
      ),
      body:
      width<height?
      Column(
        children: [
         // const Text('The chart'),
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent)
          //When using list inside list, use expanded otherwise it wont be visible.
        ],
      ):

      Row(
        children: [
          // const Text('The chart'),
          Expanded(child: Chart(expenses: _registeredExpenses)),
          Expanded(child: mainContent)
          //When using list inside list, use expanded otherwise it wont be visible.
        ],
      )
      ,
    );
  }
}
