import 'package:clinic_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:clinic_self_service/src/modules/self_service/self_service_routes.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SelfServicePage extends StatefulWidget {
  const SelfServicePage({super.key});

  @override
  State<SelfServicePage> createState() => _SelfServicePageState();
}

class _SelfServicePageState extends State<SelfServicePage>
    with MessageViewMixin {
  final controller = Injector.get<SelfServiceController>();
  @override
  void initState() {
    messageListener(controller);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.startProcess();
      effect(() {
        final step = controller.step;
        String baseRoute = "/selfService";
        switch (step) {
          case FormSteps.none:
            return;
          case FormSteps.whoIAm:
            baseRoute += SelfServiceRoutes.whoIAm;
          case FormSteps.patient:
            baseRoute += SelfServiceRoutes.patient;
          case FormSteps.findPatient:
            baseRoute += SelfServiceRoutes.findPatient;
          case FormSteps.documents:
            baseRoute += SelfServiceRoutes.documents;
          case FormSteps.done:
            baseRoute += SelfServiceRoutes.done;
          case FormSteps.restart:
            Navigator.of(context).popUntil(ModalRoute.withName('/selfService'));
            controller.startProcess();
            return;
        }
        Navigator.of(context).pushNamed(baseRoute);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
