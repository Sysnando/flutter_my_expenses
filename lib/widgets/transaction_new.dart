import 'package:flutter/material.dart';

class TransactionNew extends StatefulWidget {
  final Function addTransaction;

  TransactionNew(this.addTransaction);

  @override
  _TransactionNewState createState() => _TransactionNewState();
}

class _TransactionNewState extends State<TransactionNew> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final inputTitle = titleController.text;
    final inputAmount = double.parse(amountController.text);

    if(inputTitle.isEmpty || inputAmount <= 0 ) return;

    // widget is a property is just available into the state and has to be called "state"
    widget.addTransaction(inputTitle, inputAmount);

    // close the most top screen
    Navigator.of(context).pop(); 
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController),
            TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData() ,),
            FlatButton(
              textColor: Colors.purple,
              child: Text('Add Transaction'),
              onPressed: () => submitData() ,
            )
          ],
        ),
      ),
    );
  }
}
