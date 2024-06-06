import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense,{super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16
          ),
          child: Column(
            children: [
              Text(expense.title),
              SizedBox(height: 4,),
              Row(
                children: [
                  Text('${expense.amount.toStringAsFixed(2)}'),
                  //asFixed means upto 2 places the integer will be given

                  const Spacer(),
                //Takes up all the space
                  //pushes text to left and row to right
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      const SizedBox(width: 8,),
                      Text(expense.formattedDate)
                    ],
                    
                  )
                ],
              )
            ],
          )),
    );
  }
}
