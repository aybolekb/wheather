import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wheather/data/dio_service.dart';
import 'package:wheather/constants/city.dart';
import 'package:wheather/constants/constants.dart';
import 'package:wheather/models/weather.dart';
import 'package:wheather/providers/weather_provider.dart';
import 'package:wheather/ui/second_screen.dart';
import 'package:wheather/widgets/single_day.dart';
import 'package:wheather/widgets/temperture.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Constants myConstants = Constants();

  List<City> selectedCities = City.getSelectedCities();

  @override
  void initState() {
    Provider.of<RepositoryProvider>(context, listen: false)
        .getCityWeather(city: 'london');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    final provider = Provider.of<RepositoryProvider>(context);
    bool openIs = true;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Visibility(
          visible: provider.isWeatherLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: Image.asset(
                          'assets/profile.png',
                          width: 50,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 24,
                          ),
                          Text("${provider.weather?.name}"),
                          const SizedBox(
                            width: 40,
                          ),
                          Visibility(
                              visible: openIs,
                              replacement: Container(
                                color: Colors.red,
                                child: const Column(
                                  children: [Text('kjhugfc')],
                                ),
                              ),
                              child: PopupMenuButton(
                                child: const Icon(Icons.keyboard_arrow_down),
                                onSelected: (value) {
                                  provider.getCityWeather(city: value);
                                },
                                itemBuilder: (context) => List.generate(
                                  selectedCities.length,
                                  (index) => PopupMenuItem(
                                    value: selectedCities[index].city,
                                    child: Text(selectedCities[index].city),
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${provider.weather?.name}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("Monday 2 May"),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(clipBehavior: Clip.none, children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: myConstants.primaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      width: size.width,
                      height: 250,
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
                            height: 100,
                          ),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "${provider.weather?.weather[0].main}",
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                    ),
                    Positioned(
                        top: -20,
                        left: 20,
                        child: Image.asset(
                          'assets/heavycloud.png',
                          width: 200,
                        ))
                  ])
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Temperature(
                    image: 'assets/windspeed.png',
                    title: 'Wind Speed',
                    subTitle: '${provider.weather?.wind.speed}km/h',
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Temperature(
                    image: 'assets/humidity.png',
                    title: " Humidity",
                    subTitle: '${provider.weather?.main.humidity}',
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Temperature(
                    image: 'assets/max-temp.png',
                    title: "Max Temp",
                    subTitle: '${provider.weather?.main.tempMax}C',
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    'Next 7 Days',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: myConstants.primaryColor),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Text("data"),
                    ...List.generate(
                      6,
                      (index) => SingleDay(onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SecondScreen(),
                            ));
                      }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
