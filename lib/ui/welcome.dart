import 'package:flutter/material.dart';
import 'package:wheather/constants/city.dart';
import 'package:wheather/constants/constants.dart';
import 'package:wheather/ui/home.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();

    List<City> cities =
        City.citiesList.where((city) => city.isDefault == false).toList();
    List<City> selectedCities = City.getSelectedCities();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: myConstants.secondaryColor,
        title: Text('${selectedCities.length} selected'),
      ),
      body: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (BuildContext context, int index) {
            final city = cities[index];
            return Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: size.height * 0.08,
              width: size.width,
              decoration: BoxDecoration(
                  border: city.isSelected == true
                      ? Border.all(
                          color: myConstants.secondaryColor.withOpacity(0.6),
                          width: 2)
                      : Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: myConstants.primaryColor.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3))
                  ]),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        city.isSelected = !city.isSelected;
                      });
                    },
                    child: Image.asset(
                      city.isSelected == true
                          ? 'assets/checked.png'
                          : 'assets/unchecked.png',
                      width: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    city.city,
                    style: TextStyle(
                        color: city.isSelected == true
                            ? myConstants.primaryColor
                            : Colors.black54),
                  )
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: myConstants.secondaryColor,
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Home()));
        },
        child: const Icon(Icons.pin_drop),
      ),
    );
  }
}
