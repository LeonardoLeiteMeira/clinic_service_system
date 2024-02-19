import 'package:clinic_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SelfServiceAppBar extends ClinicAppBar {
  SelfServiceAppBar({super.key})
      : super(actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(value: 1, child: Text("Reiniciar Processo"))
            ],
            onSelected: (value) {
              final selfServiceController =
                  Injector.get<SelfServiceController>();
              selfServiceController.restartProcess();
            },
            child: const IconPopupCustom(),
          )
        ]);
}
