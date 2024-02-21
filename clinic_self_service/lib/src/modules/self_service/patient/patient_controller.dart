import 'package:clinic_self_service/src/models/patient_model.dart';
import 'package:clinic_self_service/src/respositories/patients/patient_repository.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PatientController with MessageStateMixin {
  final PatientRepository _patientRepository;
  PatientModel? patient;
  final _nextStep = signal<bool>(false);
  PatientController({required PatientRepository patientRepository})
      : _patientRepository = patientRepository;

  bool get nextStep => _nextStep();
  Future<void> updatePatient(PatientModel model) async {
    final result = await _patientRepository.update(model);

    switch (result) {
      case Left(value: _):
        showError("Erro para atualizar paciente");
      case Right(value: _):
        showInfo("Paciente atualizado com sucesso");
        goNextStep(model);
    }
  }

  void goNextStep(PatientModel modelToNextStep) {
    patient = modelToNextStep;
    _nextStep.value = true;
    untracked(() {
      _nextStep.value = false;
    });
  }
}
