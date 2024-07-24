import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather/constants/constants.dart';
import 'package:wheather/providers/weather_provider.dart';

class Temperature extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final Color color;

  const Temperature({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();
    final provider = Provider.of<RepositoryProvider>(context);
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: myConstants.primaryColor.withOpacity(0.3),
          ),
          child: Image.asset(
            image,
            width: 50,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subTitle,
          style: TextStyle(fontWeight: FontWeight.bold, color: color),
        )
      ],
    );
  }
}
