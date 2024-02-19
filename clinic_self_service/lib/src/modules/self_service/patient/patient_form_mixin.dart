import 'package:clinic_self_service/src/models/patient_model.dart';
import 'package:clinic_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:flutter/material.dart';

mixin PatientFormMixin on State<PatientPage> {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneEC = TextEditingController();
  final documentEC = TextEditingController();
  final cepEC = TextEditingController();
  final streetEC = TextEditingController();
  final numberEC = TextEditingController();
  final complementEC = TextEditingController();
  final stateEC = TextEditingController();
  final cityEC = TextEditingController();
  final districtEC = TextEditingController();
  final guardianEC = TextEditingController();
  final guardianIdentificationNumberEC = TextEditingController();

  void disposeForm() {
    nameEC.dispose();
    emailEC.dispose();
    phoneEC.dispose();
    documentEC.dispose();
    cepEC.dispose();
    streetEC.dispose();
    numberEC.dispose();
    complementEC.dispose();
    stateEC.dispose();
    cityEC.dispose();
    districtEC.dispose();
    guardianEC.dispose();
    guardianIdentificationNumberEC.dispose();
    super.dispose();
  }

  void initializeForm(final PatientModel? patientModel) {
    if (patientModel != null) {
      nameEC.text = patientModel.name;
      emailEC.text = patientModel.email;
      phoneEC.text = patientModel.phoneNumber;
      documentEC.text = patientModel.document;
      cepEC.text = patientModel.address.cep;
      streetEC.text = patientModel.address.streetAddress;
      numberEC.text = patientModel.address.number;
      complementEC.text = patientModel.address.complement;
      stateEC.text = patientModel.address.state;
      cityEC.text = patientModel.address.city;
      districtEC.text = patientModel.address.district;
      guardianEC.text = patientModel.guardian;
      guardianIdentificationNumberEC.text =
          patientModel.guardianIdentificationNumber;
    }
  }
}
