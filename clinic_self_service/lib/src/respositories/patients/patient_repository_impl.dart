import 'dart:developer';

import 'package:clinic_self_service/src/models/patient_model.dart';
import 'package:clinic_self_service/src/respositories/patients/patient_repository.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:dio/dio.dart';

class PatientRepositoryImpl implements PatientRepository {
  final RestClient restClient;

  PatientRepositoryImpl({required this.restClient});

  @override
  Future<Either<RepositoryExcepetion, PatientModel?>> findPatientByDocument(
      String document) async {
    try {
      final Response(:List data) = await restClient.auth
          .get('/patients', queryParameters: {'document': document});

      if (data.isEmpty) {
        return Right(null);
      }
      return Right(PatientModel.fromJson(data.first));
    } on DioException catch (e, s) {
      log("Error ao buscar o paciente por documento", error: e, stackTrace: s);
      return Left(RepositoryExcepetion(
          message: "Error ao buscar o paciente por documento"));
    }
  }

  @override
  Future<Either<RepositoryExcepetion, Unit>> update(
      PatientModel patient) async {
    try {
      await restClient.auth
          .put('/patients/${patient.id}', data: patient.toJson());
      return Right(Unit());
    } on DioException catch (e, s) {
      log("Error ao atualizar o paciente", error: e, stackTrace: s);
      return Left(
          RepositoryExcepetion(message: "Error ao atualizar o paciente"));
    }
  }
}
