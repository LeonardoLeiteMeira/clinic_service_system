import 'package:flutter/material.dart';

class DocumentsScanConfirmPage extends StatefulWidget {
  const DocumentsScanConfirmPage({super.key});

  @override
  State<DocumentsScanConfirmPage> createState() =>
      _DocumentsScanConfirmPageState();
}

class _DocumentsScanConfirmPageState extends State<DocumentsScanConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scan Confirm'),
        ),
        body: const Center(
          child: Text('Documents Scan Confirm Page'),
        ));
  }
}
