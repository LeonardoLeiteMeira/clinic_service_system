import 'package:clinic_test/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:clinic_system_core/clinic_system_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with MessageViewMixin {
  int _counter = 0;
  final controller = HomeController();

  @override
  void initState() {
    messageListener(controller);
    super.initState();
  }

  void _incrementCounter() {
    controller.testFazerAlgo();
    setState(() {
      _counter++;
    });
  }

  void _showError() {
    controller.showError("Teste");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: controller.showASuccess,
                child: const Text("Show Success")),
            ElevatedButton(
                onPressed: controller.showAnError,
                child: const Text("Show Error")),
            ElevatedButton(
                onPressed: controller.showAnInfo,
                child: const Text("Show info")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}