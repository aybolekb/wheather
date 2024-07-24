import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather/constants/constants.dart';
import 'package:wheather/providers/weather_provider.dart';
import 'package:wheather/widgets/second_container.dart';
import 'package:wheather/widgets/single_day.dart';
import 'package:wheather/widgets/temperture.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();
    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<RepositoryProvider>(context);

    return Scaffold(
      backgroundColor: myConstants.secondaryColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: myConstants.primaryColor,
          actions: const [Icon(Icons.settings)],
          title: Center(child: Text('${provider.weather?.name}'))),
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleDay(),
              SingleDay(),
              SingleDay(),
              SingleDay(),
              SingleDay(),
              SingleDay()
            ],
          ),
        ),
        const SizedBox(
          height: 120,
        ),
        Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            height: size.height * 0.35,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80))),
            child: Stack(clipBehavior: Clip.none, children: [
              Positioned(
                top: -45,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: myConstants.thirdColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  width: size.width,
                  height: 320,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${provider.weather?.clouds.all}',
                            style: const TextStyle(
                                fontSize: 60,
                                color: Color(0xFFBBDAF7),
                                fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '${provider.weather?.weather[0].main}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Temperature(
                            image: 'assets/windspeed.png',
                            title: '',
                            subTitle: '${provider.weather?.wind.speed}km/h',
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Temperature(
                            image: 'assets/humidity.png',
                            title: " ",
                            subTitle: '${provider.weather?.main.humidity}',
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Temperature(
                            image: 'assets/max-temp.png',
                            title: "",
                            color: Colors.white,
                            subTitle: '${provider.weather?.main.tempMax}C',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: -90,
                  left: 20,
                  child: Image.asset(
                    'assets/heavycloud.png',
                    width: 200,
                  ))
            ])),
        Container(
          padding: const EdgeInsets.all(8.0),
          height: 150,
          child: const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [SecondContainer(), SecondContainer()],
            ),
          ),
        )
      ]),
    );
  }
}
