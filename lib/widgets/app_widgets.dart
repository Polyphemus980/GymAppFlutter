import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final List<Widget>? actions;
  final String title;
  final Widget? child;
  const AppScaffold({super.key, this.actions, required this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        actionsIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )),
        ),
        actions: actions,
      ),
      body: child,
    );
  }
}
