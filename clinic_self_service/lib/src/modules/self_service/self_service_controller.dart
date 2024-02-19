import 'package:clinic_self_service/src/models/patient_model.dart';
import 'package:clinic_self_service/src/models/self_service_model.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps { none, whoIAm, patient, findPatient, documents, done, restart }

class SelfServiceController with MessageStateMixin {
  final _step = ValueSignal(FormSteps.none);
  var _model = SelfServiceModel();
  FormSteps get step => _step.value;
  SelfServiceModel get model => _model;

  void startProcess() {
    _step.forceUpdate(FormSteps.whoIAm);
  }

  void clearForm() => _model.clear();

  void restartProcess() {
    _step.forceUpdate(FormSteps.restart);
    clearForm();
  }

  void completeWhoIAmProcess(String name, String lastName) {
    _model = _model.copyWith(name: () => name, lastName: () => lastName);
    _step.forceUpdate(FormSteps.findPatient);
  }

  void completeFindPatientProcess(PatientModel? patient) {
    _model = _model.copyWith(patient: () => patient);
    _step.forceUpdate(FormSteps.patient);
  }
}
