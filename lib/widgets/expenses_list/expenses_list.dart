import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.removeData,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) removeData;

  @override
  Widget build(context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error,
            margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            ),
          ),
          onDismissed: (dismissedDirection) {
            removeData(expenses[index]);
          },
          key: ValueKey(expenses[index]),
          child: ExpenseItem(expenses[index]),
        );
      },
      itemCount: expenses.length,
    );
  }
}
