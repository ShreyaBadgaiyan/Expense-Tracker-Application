import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

  final _titleController=TextEditingController();
  //handles user input
  //deletes controller when not in use so use dispose method

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Title'),
              hintText: 'Add Title here'
            ),


          ),

          Row(
            children: [
              ElevatedButton(
                  onPressed: (){
                    print(_titleController.text);
                  },
                  child: Text('Save Expense'))
            ],
          )

        ],
      ),
    );
  }
}
