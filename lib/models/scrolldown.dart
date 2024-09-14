import 'package:flutter/widgets.dart';

ScrollController scrolldown() {
  final ScrollController controller = ScrollController();
  controller.jumpTo(controller.position.maxScrollExtent);

  return controller;
}
