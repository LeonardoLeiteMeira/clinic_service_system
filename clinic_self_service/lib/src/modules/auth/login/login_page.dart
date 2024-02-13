import 'package:clinic_self_service/src/modules/auth/login/login_controller.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  final emailTE = TextEditingController();
  final passwordTE = TextEditingController();
  final controller = Injector.get<LoginController>();

  @override
  void dispose() {
    emailTE.dispose();
    passwordTE.dispose();
    super.dispose();
  }

  @override
  void initState() {
    effect(() {
      if (controller.logged) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
    messageListener(controller);
    super.initState();
  }

  void _login() async {
    final valid = formKey.currentState?.validate() ?? false;
    if (valid) {
      await controller.login(emailTE.text, passwordTE.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          minHeight: sizeOf.height,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(40),
            constraints: BoxConstraints(
              maxWidth: sizeOf.width * 0.8,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Form(
              key: formKey,
              child: Column(children: [
                const Text('Login', style: ClinicTheme.titleStyle),
                const SizedBox(height: 32),
                TextFormField(
                  controller: emailTE,
                  validator: Validatorless.multiple([
                    Validatorless.required("Email obrigatorio"),
                    Validatorless.email("Email invalido"),
                  ]),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 24),
                Watch(
                  (_) => TextFormField(
                    obscureText: controller.obscurePassword,
                    validator: Validatorless.required("Senha obrigatoria"),
                    controller: passwordTE,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: controller.toggleObscurePassword,
                          icon: Icon(controller.obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off)),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: sizeOf.width * 0.8,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text('ENTRAR'),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    ));
  }
}
