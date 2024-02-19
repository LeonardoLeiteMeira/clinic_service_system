import 'package:clinic_self_service/src/modules/self_service/documents/documents_page.dart';
import 'package:clinic_self_service/src/modules/self_service/documents/scan/documents_scan_page.dart';
import 'package:clinic_self_service/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_page.dart';
import 'package:clinic_self_service/src/modules/self_service/done/done_page.dart';
import 'package:clinic_self_service/src/modules/self_service/find_patient/find_patient_router.dart';
import 'package:clinic_self_service/src/modules/self_service/patient/patient_router.dart';
import 'package:clinic_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:clinic_self_service/src/modules/self_service/self_service_page.dart';
import 'package:clinic_self_service/src/modules/self_service/self_service_routes.dart';
import 'package:clinic_self_service/src/modules/self_service/who_i_am/who_i_am_page.dart';
import 'package:clinic_self_service/src/respositories/patients/patient_repository.dart';
import 'package:clinic_self_service/src/respositories/patients/patient_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SelfServiceModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((_) => SelfServiceController()),
        Bind.lazySingleton<PatientRepository>(
            (i) => PatientRepositoryImpl(restClient: i())),
      ];

  @override
  String get moduleRouteName => "/selfService";

  @override
  Map<String, WidgetBuilder> get pages => {
        SelfServiceRoutes.selfService: (_) => const SelfServicePage(),
        SelfServiceRoutes.whoIAm: (_) => const WhoIAmPage(),
        SelfServiceRoutes.findPatient: (_) => const FindPatientRouter(),
        SelfServiceRoutes.patient: (_) => const PatientRouter(),
        SelfServiceRoutes.documents: (_) => const DocumentsPage(),
        SelfServiceRoutes.documentsScan: (_) => const DocumentsScanPage(),
        SelfServiceRoutes.documentsScanConfirm: (_) =>
            const DocumentsScanConfirmPage(),
        SelfServiceRoutes.done: (_) => const DonePage(),
      };
}
