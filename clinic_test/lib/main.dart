import 'package:asyncstate/asyncstate.dart';
import 'package:clinic_test/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ClinicCoreConfig(
      title: "Meu Appzao",
      pageBuilder: [
        FlutterGetItPageBuilder(
            page: (_) => const MyHomePage(title: 'Flutter Demo Home Page'),
            path: "/")
      ],
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
  final buttonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(10), shape: const BeveledRectangleBorder());

  @override
  void initState() {
    messageListener(controller);
    super.initState();
  }

  void _incrementCounter() {
    // Nao entendi bem - o asyncloader chamou o loader no core e executou o loading na tela
    Future.delayed(const Duration(seconds: 3)).asyncLoader();
    controller.testFazerAlgo();
    setState(() {
      _counter++;
    });
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
                style: buttonStyle,
                child: const Text("Show Success")),
            const SizedBox(height: 10),
            ElevatedButton(
                style: buttonStyle,
                onPressed: controller.showAnError,
                child: const Text("Show Error")),
            const SizedBox(height: 10),
            ElevatedButton(
                style: buttonStyle,
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
