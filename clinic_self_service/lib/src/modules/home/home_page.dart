import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: ClinicAppBar(
        actions: [
          PopupMenuButton<int>(
              child: const IconPopupCustom(),
              itemBuilder: (_) => [
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text("Iniciar T1"),
                    ),
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text("Finalizar T1"),
                    )
                  ])
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
            margin: const EdgeInsets.only(top: 112),
            width: sizeOf.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ClinicTheme.orange),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Bem vindo!!!',
                    style: ClinicTheme.titleStyle,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: sizeOf.width * 0.8,
                    height: 48,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Iniciar Terminal")),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
