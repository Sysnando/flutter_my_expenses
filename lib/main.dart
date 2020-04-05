import 'package:flutter/material.dart';
import './pages/home.dart';

void main() => runApp(Expenses());

class Expenses extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: HomePage(),
      // this them will be shared in the whole app material components by using theme.of(context)
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.cyan,
        fontFamily: 'Quicksand', // has to match the id on the fonts name
        // default content theme
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
          button: TextStyle(
            color: Colors.white
          )
        ),
        // default bar theme
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ),
    );
  }
}