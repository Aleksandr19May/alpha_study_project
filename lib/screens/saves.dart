import 'package:flutter/material.dart';



//dsdd


class Saves extends StatelessWidget {
  const Saves({super.key});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          width: widthScreen,
          height: 62,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            color: Colors.white,
          ),
         
          
        ),
      ],
    );
  }
}