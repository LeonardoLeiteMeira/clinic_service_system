import "package:clinic_system_core/clinic_system_core.dart";

class HomeController with MessageStateMixin {
  void testFazerAlgo() {
    showError("Ocorreu um erro");
  }

  void showAnError() {
    showError("MENSAGEM DE ERRO");
  }

  void showAnInfo() {
    showInfo("MENSAGEM DE INFO");
  }

  void showASuccess() {
    showSuccess("MENSAGEM DE SUCESSO");
  }
}
