import 'package:clinic_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validatorless/validatorless.dart';

class WhoIAmPage extends StatefulWidget {
  const WhoIAmPage({super.key});

  @override
  State<WhoIAmPage> createState() => _WhoIAmPageState();
}

class _WhoIAmPageState extends State<WhoIAmPage> {
  final controller = Injector.get<SelfServiceController>();

  final selfServiceController = Injector.get<SelfServiceController>();

  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _lastNameEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _lastNameEC.dispose();
    super.dispose();
  }

  void continueButtom() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      selfServiceController.completeWhoIAmProcess(
          _nameEC.text, _lastNameEC.text);
    }
  }

  void onSelectPopupMenu(int value) async {
    if (value == 1) {
      final navigatorOf = Navigator.of(context);
      final sp = await SharedPreferences.getInstance();
      sp.clear();
      navigatorOf.pushNamedAndRemoveUntil('/', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        _nameEC.text = '';
        _lastNameEC.text = '';
        controller.clearForm();
      },
      child: Scaffold(
          appBar: ClinicAppBar(actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(value: 1, child: Text("Finalizar Terminal"))
              ],
              onSelected: onSelectPopupMenu,
              child: const IconPopupCustom(),
            )
          ]),
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
                          const Text(
                            'Bem Vindo!',
                            style: ClinicTheme.titleStyle,
                          ),
                          const SizedBox(height: 48),
                          TextFormField(
                            controller: _nameEC,
                            validator:
                                Validatorless.required('Nome Obrigatório'),
                            decoration: const InputDecoration(
                                label: Text('Digite Seu Nome')),
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: _lastNameEC,
                            validator:
                                Validatorless.required('Sobrenome Obrigatório'),
                            decoration: const InputDecoration(
                                label: Text('Digite Seu Sobrenome')),
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
          })),
    );
  }
}
