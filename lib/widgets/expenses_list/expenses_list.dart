import 'package:exprensetracker/models/expense.dart';
import 'package:exprensetracker/widgets/expenses_list/expense_items.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{

  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(itemCount: expenses.length,
    itemBuilder: (ctx, index)=>
    Dismissible(
      
      key: ValueKey(expenses[index]),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 75, 75, 75)
        ),
        child:const Row(

          mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 130.0), // Adjust padding as needed
        ),
        Text(
          'Swipe to Delete', // Your text here
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
      ],
    ),
        ),


      onDismissed: (direction) {
        onRemoveExpense(expenses[index]);
      },
      child:  ExpenseItem(expenses[index])
      )
    );
  }
}