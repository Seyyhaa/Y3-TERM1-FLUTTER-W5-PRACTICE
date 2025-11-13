import 'package:flutter/material.dart';

enum Button { primary, secondary, disable }

enum Position { left, right }

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                button: "Submit",
                icon: Icons.check,
                buttonType: Button.primary,
                 iconPosition: Position.left,
              ),
               CustomButton(
                button: "Time",
                icon: Icons.access_time,
                buttonType: Button.secondary,
                iconPosition: Position.right,
              ),
               CustomButton(
                button: "Account",
                icon: Icons.compare_arrows,
                buttonType: Button.disable,
                iconPosition: Position.right,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final String button;
  final IconData icon;
  final Position? iconPosition;
  final Button? buttonType;

  const CustomButton({
    super.key,
    required this.icon,
    required this.button,
    this.iconPosition,
    this.buttonType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: switch (buttonType ?? Button.primary) {
          Button.primary => Colors.blue,
          Button.secondary => Colors.green,
          Button.disable => Colors.grey,
        },
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 10, right: 20, top: 15, bottom: 15),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: (iconPosition == Position.right)
              ? [
                  Text(
                    button,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  const SizedBox(width: 10),
                  Icon(icon, color: Colors.white, size: 20),
                ]
              : [
                  Icon(icon, color: Colors.white, size: 20),
                  const SizedBox(width: 10),
                  Text(
                    button,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
        ),
      ),
    );
  }
}
