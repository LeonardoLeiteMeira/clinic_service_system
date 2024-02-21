import 'package:clinic_self_service/src/models/patient_address_modal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {
  final String id;
  final String name;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String document;
  final PatientAddressModel address;
  @JsonKey(name: 'guardian', defaultValue: '')
  final String guardian;
  @JsonKey(name: 'guardian_identification_number', defaultValue: '')
  final String guardianIdentificationNumber;

  PatientModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.document,
    required this.address,
    required this.guardian,
    required this.guardianIdentificationNumber,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);
  Map<String, dynamic> toJson() => _$PatientModelToJson(this);

  PatientModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? document,
    PatientAddressModel? address,
    String? guardian,
    String? guardianIdentificationNumber,
  }) {
    return PatientModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      document: document ?? this.document,
      address: address ?? this.address,
      guardian: guardian ?? this.guardian,
      guardianIdentificationNumber:
          guardianIdentificationNumber ?? this.guardianIdentificationNumber,
    );
  }
}



// {
//   "id": "3dade4b0-c5a9-1ec6-8879-f777bc3cc7b2",
//   "name": "Rodrigo Rahman",
//   "email": "rodrigorahman@academiadoflutter.com.br",
//   "phone_number": "(11) 1231212312",
//   "document": "123.123.123-12",
//   "address": {
//       "cep": "09190390",
//       "street_address": "Rua X",
//       "number": "51",
//       "address_complement": "casa",
//       "state": "SP",
//       "city": "Santo André",
//       "district": "Jardins"
//   },
//   "guardian": "",
//   "guardian_identification_number": ""
// }