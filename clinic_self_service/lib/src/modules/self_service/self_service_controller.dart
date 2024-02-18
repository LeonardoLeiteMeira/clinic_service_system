import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps { none, whoIAm, patient, findPatient, documents, done, restart }

class SelfServiceController with MessageStateMixin {
  final _step = ValueSignal(FormSteps.none);
  FormSteps get step => _step.value;

  void startProcess() {
    _step.forceUpdate(FormSteps.whoIAm);
  }

  void goPatient() {
    _step.forceUpdate(FormSteps.patient);
  }

  void goFindPatient() {
    _step.forceUpdate(FormSteps.findPatient);
  }

  void goDocuments() {
    _step.forceUpdate(FormSteps.documents);
  }

  void goDone() {
    _step.forceUpdate(FormSteps.done);
  }
}
