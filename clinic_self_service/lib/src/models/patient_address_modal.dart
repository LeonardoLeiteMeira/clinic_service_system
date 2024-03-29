import 'package:json_annotation/json_annotation.dart';

part 'patient_address_modal.g.dart';

@JsonSerializable()
class PatientAddressModel {
  final String cep;
  @JsonKey(name: 'street_address')
  final String streetAddress;
  final String state;
  final String city;
  final String district;
  final String number;
  @JsonKey(name: 'address_complement', defaultValue: '')
  final String complement;

  PatientAddressModel({
    required this.cep,
    required this.streetAddress,
    required this.state,
    required this.city,
    required this.district,
    required this.number,
    required this.complement,
  });

  factory PatientAddressModel.fromJson(Map<String, dynamic> json) =>
      _$PatientAddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$PatientAddressModelToJson(this);
}
