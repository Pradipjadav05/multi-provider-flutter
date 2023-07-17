import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  Widget build(BuildContext context) {
    final countProvide = Provider.of<CountProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Notifier Demo"),
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.center,
          child: Consumer<CountProvider>(
            builder: (context, value, child) {
              print("this widget build");
              return Text(
                value.count.toString(),
                style: const TextStyle(fontSize: 50),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvide.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
