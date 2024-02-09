import 'package:flutter/material.dart';


class AdditionalInfoItems extends StatelessWidget {
  final IconData icon;
  final String name;
  final String value;
  const AdditionalInfoItems({super.key, required this.icon, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Icon(icon,size: 32,),
        SizedBox(
          height: 5,
        ),
        Text(name,style: TextStyle(
            fontSize: 14
        ),),
        SizedBox(
          height: 5,
        ),
        Text(value,style: TextStyle(
            fontSize: 14
        ),)
      ],
    );
  }
}
