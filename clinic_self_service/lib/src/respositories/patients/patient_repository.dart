import 'package:clinic_self_service/src/models/patient_model.dart';
import 'package:clinic_system_core/clinic_system_core.dart';

abstract interface class PatientRepository {
  Future<Either<RespositoryExcepetion, PatientModel?>> findPatientByDocument(
      String document);
}
