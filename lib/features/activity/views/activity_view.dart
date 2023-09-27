import 'package:flutter/material.dart';
import 'package:zumda/shared/appbar_widget.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: 'Activity',
      ),
    );
  }
}
