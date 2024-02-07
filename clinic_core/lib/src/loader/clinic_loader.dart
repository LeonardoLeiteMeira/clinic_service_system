import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

final class ClinicLoader extends AsyncOverlay {
  ClinicLoader()
      : super(
            id: 0,
            builder: (BuildContext context, AsyncValue<RouteSettings> state) {
              return Center(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: LoadingAnimationWidget.inkDrop(
                      color: Colors.blue,
                      size: 50,
                    )),
              );
            });
}
