import 'package:flutter/material.dart';
import 'package:multi_provider/provider/multi_provider.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // double value = 1.0;

  @override
  Widget build(BuildContext context) {
    print("build");
    final provider = Provider.of<MyProviderOne>(context, listen: false);
    final countProvide = Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiple Provider Demo"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer<MyProviderOne>(
            builder: (context, value, child) {
              print("Slider build");
              return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                },
              );
            },
          ),
          Consumer<MyProviderOne>(
            builder: (context, value, child) {
              print("opacity build");
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value),
                      ),
                      child: const Center(
                        child: Text(
                          "Green Color",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value),
                      ),
                      child: const Center(
                        child: Text(
                          "Red Color",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            height: 150,
          ),
          Container(
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvide.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
