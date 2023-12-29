import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final text;
  final icon;
  final onPressed;
  const Button({Key? key, this.text, required this.icon, required this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              Color(0xff886AE2)),
        ),
        child: Row(
          children: [
            Text("${text}", style: TextStyle(color: Color(0xff0F0817)),),
            icon,
          ],
        ));
  }
}
