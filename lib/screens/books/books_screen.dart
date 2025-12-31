import 'package:flutter/material.dart';
import 'package:zen_router_poc/routes/routes.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                coordinator.push(BookRoute('1'));
              },
              child: Text('Book 1'),
            ),
          ],
        ),
      ),
    );
  }
}
