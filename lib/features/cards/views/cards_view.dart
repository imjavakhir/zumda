import 'package:flutter/material.dart';
import 'package:zumda/shared/appbar_widget.dart';

class CardsView extends StatelessWidget {
  const CardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: 'Cards',
      ),
    );
  }
}
