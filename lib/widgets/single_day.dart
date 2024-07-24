import 'package:flutter/material.dart';

class SingleDay extends StatelessWidget {
  final Function()? onTap;
  const SingleDay({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: 90,
          height: 150,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color(0xFFA5BCF4),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(color: Colors.white, blurRadius: 1, spreadRadius: 0),
              ]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '17C',
                  style: TextStyle(color: Colors.white),
                ),
                Image.asset(
                  'assets/heavycloud.png',
                  width: 50,
                ),
                const Text(
                  '17C',
                  style: TextStyle(color: Colors.white),
                ),
              ]),
        ),
      ),
    );
  }
}
