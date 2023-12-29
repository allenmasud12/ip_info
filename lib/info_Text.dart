import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final text;
  const InfoText({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("${text}", style: TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 18.0, fontWeight: FontWeight.bold),),
        )
      ],
    );;
  }
}
