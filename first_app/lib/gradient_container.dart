import 'package:first_app/dice_roller.dart';
// import 'package:first_app/text_builder.dart';
import 'package:flutter/material.dart';

const alignmentLeft = Alignment.topLeft;
const alignmentRight = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.firstColor, this.secondColor, {super.key});
  final Color firstColor;
  final Color secondColor;
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            firstColor,
            secondColor,
          ],
          begin: alignmentLeft,
          end: alignmentRight,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
