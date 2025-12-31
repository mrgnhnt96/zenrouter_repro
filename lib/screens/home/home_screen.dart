import 'package:flutter/material.dart';
import 'package:zen_router_poc/widgets/tabs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Tabs(child: Center(child: Text('Home Screen.')));
  }
}
