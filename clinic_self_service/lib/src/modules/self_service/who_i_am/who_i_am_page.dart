import 'package:clinic_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class WhoIAmPage extends StatefulWidget {
  const WhoIAmPage({super.key});

  @override
  State<WhoIAmPage> createState() => _WhoIAmPageState();
}

class _WhoIAmPageState extends State<WhoIAmPage> {
  final controller = Injector.get<SelfServiceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Who I Am")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Who I Am Page"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.goFindPatient,
              child: const Text("Find Patient"),
            ),
          ],
        ),
      ),
    );
  }
}
