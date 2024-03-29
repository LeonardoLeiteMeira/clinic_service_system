import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IconPopupCustom extends StatelessWidget {
  const IconPopupCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 64),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: ClinicTheme.orange,
            width: 2,
          ),
        ),
        child: const Icon(Icons.more_horiz_rounded, color: ClinicTheme.orange),
      ),
    );
  }
}
