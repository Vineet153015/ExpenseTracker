import 'package:exprensetracker/widgets/charts/chart.dart';
import 'package:exprensetracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:exprensetracker/models/expense.dart';
import 'package:exprensetracker/widgets/expenses_list/expenses_list.dart';


class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Expenses();
  }
}

class _Expenses extends State<Expenses>{

  final List<Expense> _registeredExpenses = [
    Expense(title: 'Chai', amount: 20, date: DateTime.now(), category: Category.food),
    Expense(title: 'Delhi', amount: 437.98, date: DateTime.now(), category: Category.travel)
  ];

  void _openAddExpenseoverlay(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx)=> 
    NewExpense(onAddExpense: _addExpense)
    );
  }


  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _remoeExpense(Expense expense){
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
      
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration:const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(label: 'Undo', onPressed: (){
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        }),
        )
      );
  }



  @override
  Widget build(BuildContext context) {

    Widget mainContent = const Center(
      child: Text('No Expense found. Start Adding some!!'),
    );

    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(
                expenses: _registeredExpenses,
                onRemoveExpense: _remoeExpense,
                );
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Your Expenses!!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 73, 73, 73),
        actions: [
          IconButton(onPressed: _openAddExpenseoverlay, icon: const Icon(Icons.add),color: Colors.white,)
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Chart(expenses: _registeredExpenses),
            Expanded(
              child: mainContent
            )
          ],
        ),
      ),
    );
  }
}