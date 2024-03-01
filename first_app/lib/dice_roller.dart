import "package:flutter/material.dart";
import "dart:math";

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var diceNum = randomizer.nextInt(6) + 1;
  void rollDice() {
    setState(() {
      var temp = randomizer.nextInt(6) + 1;
      if (temp == diceNum) {
        rollDice();
      } else {
        diceNum = temp;
      }
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/dice-$diceNum.png",
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        // OutlinedButton(onPressed: onPressed, child: child)
        // ElevatedButton(onPressed: onPressed, child: child)
        TextButton(
          // onPressed: () { //write the code here}
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(
            //   top: 20,
            // ),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text("Roll Dice"),
        )
      ],
    );
  }
}
