import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_app/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData("Mumbai");
  }

  TextEditingController searchControlller = TextEditingController();
  ApiCall apiCall = ApiCall();
  Weather? data;

  //!fetch api data

  @override
  Widget build(BuildContext context) {
    final scaffoldContext = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.lightBlueAccent,
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getData(searchControlller.text),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                data != null) {
              return SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.lightBlueAccent,
                        Colors.blue.shade700,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      //!search container
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  if (searchControlller.text == "") {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Search Field is Empty!"),
                                      backgroundColor: Colors.redAccent,
                                    ));
                                  } else if (searchControlller
                                      .text.isNotEmpty) {
                                    getData(searchControlller.text);
                                    setState(() {});
                                    searchControlller.clear();
                                  }
                                },
                                child: const Icon(Icons.search_rounded)),
                            const SizedBox(
                              width: 3,
                            ),
                            Expanded(
                              child: TextField(
                                controller: searchControlller,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search for any city'),
                                onSubmitted: (cityName) {
                                  if (cityName.isNotEmpty) {
                                    getData(cityName);
                                    setState(() {});
                                    searchControlller.clear();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          Expanded(
                            //! city name
                            child: CityDetails(
                              dataDescription: '${data!.description}',
                              dataI: '${data!.icon}',
                              dataName: '${data!.cityName}',
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            //! Temperature container

                            child: TempContainer(
                              data: '${data!.temp}',
                            ),
                          ),
                        ],
                      ),

                      //! other weather containers
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ContWidget(
                            data: '${data!.humidity}',
                            WeatherIcons: WeatherIcons.humidity,
                            prefix: 'percent',
                          ),
                          ContWidget(
                            data: '${data!.wind}',
                            WeatherIcons: WeatherIcons.cloudy_windy,
                            prefix: 'km/hr',
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Future<void> getData(String cityName) async {
    Weather? result = await apiCall.getCurrentWeather(cityName);
    if (result == null) {
      _showCityNotFoundMessage(context, "City not found!");
    } else {
      setState(() {
        data = result;
      });
    }
  }

  void _showCityNotFoundMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
