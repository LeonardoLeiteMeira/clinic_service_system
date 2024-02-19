import 'package:brasil_fields/brasil_fields.dart';
import 'package:clinic_self_service/src/modules/self_service/find_patient/find_patient_controller.dart';
import 'package:clinic_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:clinic_self_service/src/modules/self_service/widget/self_service_appbar.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class FindPatientPage extends StatefulWidget {
  const FindPatientPage({super.key});

  @override
  State<FindPatientPage> createState() => _FindPatientPageState();
}

class _FindPatientPageState extends State<FindPatientPage>
    with MessageViewMixin {
  final selfServiceController = Injector.get<SelfServiceController>();
  final controller = Injector.get<FindPatientController>();

  final _formKey = GlobalKey<FormState>();
  final cpfEC = TextEditingController();

  @override
  void initState() {
    effect(() {
      final FindPatientController(:patient, :patientNotFound) = controller;
      if (patient != null || patientNotFound != null) {
        selfServiceController.completeFindPatientProcess(patient);
      }
    });
    super.initState();
  }

  void resetProcess(int value) {
    selfServiceController.restartProcess();
  }

  void continueButtom() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      controller.findPatientByDocument(cpfEC.text);
    }
  }

  void withOutDocument() {
    controller.continueWithoutDocument();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.of(context).size;
    return Scaffold(
        appBar: SelfServiceAppBar(),
        body: LayoutBuilder(builder: (_, constraints) {
          return SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background_login.png'),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  width: sizeOf.width * .8,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Image.asset('assets/images/logo_vertical.png'),
                        const SizedBox(height: 48),
                        TextFormField(
                          controller: cpfEC,
                          validator: Validatorless.required('CPF Obrigatório'),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter()
                          ],
                          decoration: const InputDecoration(
                              label: Text('Digite CPF do Paciente')),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            const Text(
                              'Não sabe o CPF do Paciente?',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ClinicTheme.blue,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextButton(
                                onPressed: withOutDocument,
                                child: const Text(
                                  'Clique Aqui',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ClinicTheme.orange,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                            width: sizeOf.width * .8,
                            height: 48,
                            child: ElevatedButton(
                                onPressed: continueButtom,
                                child: const Text('Continuar'))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
