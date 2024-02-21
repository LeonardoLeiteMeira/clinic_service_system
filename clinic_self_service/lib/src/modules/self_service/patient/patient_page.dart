import 'dart:developer';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:clinic_self_service/src/models/self_service_model.dart';
import 'package:clinic_self_service/src/modules/self_service/patient/patient_controller.dart';
import 'package:clinic_self_service/src/modules/self_service/patient/patient_form_mixin.dart';
import 'package:clinic_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:clinic_self_service/src/modules/self_service/widget/self_service_appbar.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage>
    with PatientFormMixin, MessageViewMixin {
  final _formKey = GlobalKey<FormState>();
  final selfServiceController = Injector.get<SelfServiceController>();
  final controller = Injector.get<PatientController>();

  late bool patientFound;
  late bool enableForm;

  @override
  void initState() {
    effect(() {
      log('Testeeeeeee\n\najhahahahahahahah\n');
      if (controller.nextStep) {
        selfServiceController.completePatientProcess(controller.patient!);
      }
    });
    messageListener(controller);
    final SelfServiceModel(:patient) = selfServiceController.model;
    patientFound = patient != null;
    enableForm = !patientFound;
    initializeForm(patient);
    super.initState();
  }

  void submitForm() {
    final valid = _formKey.currentState?.validate() ?? false;
    if (valid) {
      final updatedPatient = updatePatient(selfServiceController.model.patient);
      controller.updatePatient(updatedPatient);
    }
  }

  void editForm() {
    setState(() {
      enableForm = true;
    });
  }

  @override
  void dispose() {
    disposeForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.of(context).size;
    return Scaffold(
      appBar: SelfServiceAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * .85,
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ClinicTheme.orange),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Visibility(
                    visible: patientFound,
                    replacement: Image.asset('assets/images/lupa_icon.png'),
                    child: Image.asset('assets/images/check_icon.png'),
                  ),
                  const SizedBox(height: 24),
                  Visibility(
                    visible: patientFound,
                    replacement: const Text('Cadastro não encontrado',
                        style: ClinicTheme.titleSmallStyle),
                    child: const Text('Cadastro Encontrado',
                        style: ClinicTheme.titleSmallStyle),
                  ),
                  const SizedBox(height: 32),
                  Visibility(
                    visible: patientFound,
                    replacement: const Text(
                      'Preencha o formulário para continuar',
                      style: TextStyle(
                          fontSize: 16,
                          color: ClinicTheme.blue,
                          fontWeight: FontWeight.w500),
                    ),
                    child: const Text(
                      'Confira os dados do seu cadastro',
                      style: TextStyle(
                          fontSize: 16,
                          color: ClinicTheme.blue,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    readOnly: !enableForm,
                    validator: Validatorless.required("Nome obrigatorio!"),
                    controller: nameEC,
                    decoration:
                        const InputDecoration(label: Text('Nome Paciente')),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    readOnly: !enableForm,
                    validator: Validatorless.required("Email obrigatorio!"),
                    controller: emailEC,
                    decoration: const InputDecoration(label: Text('Email')),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    readOnly: !enableForm,
                    validator: Validatorless.required("Telefone obrigatorio!"),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter()
                    ],
                    controller: phoneEC,
                    decoration: const InputDecoration(
                        label: Text('Telefone de Contato')),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    readOnly: !enableForm,
                    validator: Validatorless.required("CPF obrigatorio!"),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter()
                    ],
                    controller: documentEC,
                    decoration:
                        const InputDecoration(label: Text('Digite o seu CPF')),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    readOnly: !enableForm,
                    validator: Validatorless.required("CEP obrigatorio!"),
                    controller: cepEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter()
                    ],
                    decoration: const InputDecoration(label: Text('CEP')),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        flex: 3,
                        child: TextFormField(
                          readOnly: !enableForm,
                          validator:
                              Validatorless.required("Endereço obrigatorio!"),
                          controller: streetEC,
                          decoration:
                              const InputDecoration(label: Text('Endereço')),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          readOnly: !enableForm,
                          validator:
                              Validatorless.required("Numero obrigatorio!"),
                          controller: numberEC,
                          decoration:
                              const InputDecoration(label: Text('Numero')),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: !enableForm,
                          // validator:Validatorless.required("obrigatorio!"),
                          controller: complementEC,
                          decoration:
                              const InputDecoration(label: Text('Complemento')),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          readOnly: !enableForm,
                          validator:
                              Validatorless.required("Estado obrigatorio!"),
                          controller: stateEC,
                          decoration:
                              const InputDecoration(label: Text('Estado')),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: !enableForm,
                          validator:
                              Validatorless.required("Cidade obrigatoria!"),
                          controller: cityEC,
                          decoration:
                              const InputDecoration(label: Text('Cidade')),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          readOnly: !enableForm,
                          validator:
                              Validatorless.required("Bairro obrigatorio!"),
                          controller: districtEC,
                          decoration:
                              const InputDecoration(label: Text('Bairro')),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    readOnly: !enableForm,
                    controller: guardianEC,
                    decoration:
                        const InputDecoration(label: Text('Responsável')),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    readOnly: !enableForm,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter()
                    ],
                    controller: guardianIdentificationNumberEC,
                    decoration: const InputDecoration(
                        label:
                            Text('Documento de identificação do Responsável')),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.only(top: 42.5, bottom: 42.5),
                    child: Visibility(
                      visible: !enableForm,
                      replacement: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: submitForm,
                          child: Visibility(
                            visible: !patientFound,
                            replacement: const Text('SALVAR E CONTINUAR'),
                            child: const Text('CADASTRAR'),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: OutlinedButton(
                                onPressed: editForm,
                                child: const Text('EDITAR'),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () => controller.goNextStep(
                                    selfServiceController.model.patient!),
                                child: const Text('CONTINUAR'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
