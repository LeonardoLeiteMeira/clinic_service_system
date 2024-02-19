import 'package:clinic_self_service/src/models/patient_model.dart';
import 'package:clinic_self_service/src/respositories/patients/patient_repository.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FindPatientController with MessageStateMixin {
  final PatientRepository _patientRepository;

  FindPatientController({required PatientRepository patientRepository})
      : _patientRepository = patientRepository;

  final _patientNotFound = ValueSignal<bool?>(null);
  final _patient = ValueSignal<PatientModel?>(null);

  bool? get patientNotFound => _patientNotFound();
  PatientModel? get patient => _patient();

  Future<void> findPatientByDocument(String document) async {
    final result = await _patientRepository.findPatientByDocument(document);
    bool patientNotFound;
    PatientModel? patient;

    switch (result) {
      case Right(value: PatientModel resultPatient?):
        patient = resultPatient;
        patientNotFound = false;
      case Right(value: _):
        patientNotFound = true;
        patient = null;
      case Left(value: _):
        showError("Erro ao buscar paciente");
        return;
    }
    batch(() {
      _patientNotFound.forceUpdate(patientNotFound);
      _patient.value = patient;
    });
  }

  void continueWithoutDocument() {
    batch(() {
      _patientNotFound.forceUpdate(true);
      _patient.value = null;
    });
  }
}
