import "package:clinic_system_core/clinic_system_core.dart";

class HomeController with MessageStateMixin {
  void testFazerAlgo() {
    showSuccess("Increase number +1");
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
