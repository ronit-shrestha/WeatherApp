import 'package:flutter/material.dart';
import 'package:weatherapp/classes.dart';
import 'package:weatherapp/httpservice.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controlcity = TextEditingController();
  WeatherResponse? r;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: controlcity,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "City",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(onPressed: _search, child: Text('Search'))
            ],
          ),
          SizedBox(height: 20),
          if (r != null)
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.blue,
              child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .3,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${r?.name.toUpperCase()}',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Image.network(
                            'https://openweathermap.org/img/wn/${r?.icon.icon}.png'),
                        Text(
                          '${r?.temp.temp}\u2103',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${r?.description.description.toUpperCase()}',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Min: ${r?.tempmin.tempmin}\u2103,  Max: ${r?.tempmax.tempmax}\u2103',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            )
        ],
      ),
    )));
  }

  _search() async {
    final weather = await HttpService().gethttpservice(controlcity.text);
    setState(() {
      r = weather;
      controlcity.clear();
    });
  }
}
