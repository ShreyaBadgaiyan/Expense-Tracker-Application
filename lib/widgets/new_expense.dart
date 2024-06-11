import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

  final _titleController=TextEditingController();
  final _amountController=TextEditingController();
   DateTime? _selectedDate;
   Category _selectedCategory=Category.leisure;
  //handles user input
  //deletes controller when not in use so use dispose method

  void _presentDatePicker()async{
    final firstDate=DateTime(1980);
    final lastDate=DateTime(2040);
final pickedDate= await
    showDatePicker(
        context: context,
        firstDate:firstDate,
        lastDate: lastDate
    ) ;

setState(() {
  _selectedDate=pickedDate;
});
    }

    //     .then((value){
    //
    // })



    //once the value is gotten the future thing works because by default showDatepicker is a future function which denotes that we do not have the value now but will be having it in the future.
    //or else we can use await async method
void _submitExpenseData(){
    //validating data selected by user
  final enteredAmount=double.tryParse(_amountController.text);
  //this method returns a string if able to convert the string to double or else returns a null if not able to convert the string to double.
  final amountIsInValid=enteredAmount==null||enteredAmount<=0;
  if(_titleController.text.trim().isEmpty ||
      amountIsInValid ||
      _selectedDate==null ){
showDialog(
    context: context,
    builder: (ctx)=> AlertDialog(
      title: const Text('Invalid Input'),
      content: const Text('Please make sure a valid title,amount,date and category was entered.'),
      actions: [
        TextButton(
            onPressed:(){
              Navigator.pop(ctx);
              },
            child: const Text('Okay'))
      ],
    ));
return;

  }

  //...
  widget.onAddExpense(
      Expense(
          title: _titleController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory));
  Navigator.pop(context);

}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.fromLTRB(16,48,16,16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Title'),
              hintText: 'Add Title here',
              prefixIcon: Icon(Icons.title),
            ),


          ),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.money),
                      label: Text('Amount'),
                      hintText: 'Add Amount here'
                  ),


                ),
              ),
              SizedBox(
                width: 16,
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [

                    Text(
                      _selectedDate==null?'No date selected':
                        formatter.format(_selectedDate!)
                      
                    ),
                    IconButton(
                        onPressed: (){
                          _presentDatePicker();
                        },
                        icon: Icon(Icons.calendar_month))

                  ],

                ),
              )
            ],
          ),

          SizedBox(height: 10,),
          Row(
            children: [

              DropdownButton(
                //Dropdown button does not support a controller
                value: _selectedCategory,

                  items:Category.values.map(
                          (category)=>DropdownMenuItem(
                            value: category,
                              child: Text(category.name.toUpperCase()))).toList(),
                  onChanged: (value){
                    if(value==null){
return;
                    }
                    //This part only executes when value is non null
                    setState(() {
                      _selectedCategory=value;
                    });
                  }),


              Spacer(),
              ElevatedButton(
                  onPressed:() {
              _submitExpenseData();
              }
                  ,
                  child: Text('Save Expense')),

              SizedBox(width: 10,),

              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                    //pop closes current context

                  },
                  child: Text('Cancel'))
            ],
          )

        ],
      ),
    );
  }
}
