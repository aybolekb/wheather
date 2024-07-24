import 'package:flutter/material.dart';
import 'package:wheather/constants/constants.dart';
import 'package:wheather/ui/welcome.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Welcome()));
        },
        child: Container(
          color: myConstants.primaryColor.withOpacity(0.5),
          width: size.width,
          height: size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/get-started.png'),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    height: 50,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(
                        color: myConstants.primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Center(
                      child: Text(
                        'Get started',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
