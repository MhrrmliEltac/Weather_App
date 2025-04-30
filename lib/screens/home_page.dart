import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_data_model.dart';
import 'package:weather_app/services/get_weather_data.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    List<WeatherModel> _weathers = [];
    List day = [];
    double? fixedDegree;

    void getData() async {
        _weathers = await WeatherData().getWeatherData();
        final splitDay =
            _weathers == []
                ? ''
                : _weathers.map((item) => item.day.substring(0, 3));
        String cleaned = splitDay
            .toString()
            .replaceAll('(', '')
            .replaceAll(')', '');
        day = cleaned.split(",").map((e) => e.trim()).toList();
        setState(() {});
    }

    @override
    void initState() {
        getData();
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
                children: [
                    SizedBox.expand(
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                        Color(0xff30bbbb),
                                        Color(0xff6cd6d6),
                                        Color(0xff95ffff),
                                    ],
                                    stops: [0, 0.18, 0.87],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                ),
                                image: DecorationImage(
                                    image: AssetImage("assets/PEm_sLmJT-w.png"),
                                    fit: BoxFit.cover,
                                ),
                            ),
                        ),
                    ),
                    Center(
                        child:
                        _weathers.length == 0
                            ? CircularProgressIndicator(color: Colors.white)
                            : SingleChildScrollView(
                                child: Column(
                                    children: [
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemCount: _weathers.length,
                                            itemBuilder:
                                            (context, index) => Padding(
                                                padding: EdgeInsets.all(20),
                                                child: Opacity(
                                                    opacity: 0.8,
                                                    child: Container(
                                                        margin: EdgeInsets.symmetric(
                                                            horizontal: 26,
                                                        ),
                                                        decoration: BoxDecoration(
                                                            color: Color(0xff63C9C9),
                                                            borderRadius: BorderRadius.circular(39),
                                                        ),
                                                        width: 362,
                                                        height: 318,
                                                        child: Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.center,
                                                            children: [
                                                                Row(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment.spaceAround,
                                                                    children: [
                                                                        Text(
                                                                            "${day[index]} ${_weathers[index].date}",
                                                                            style: TextStyle(
                                                                                fontSize: 23,
                                                                                fontFamily: "Roboto",
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w500,
                                                                            ),
                                                                        ),
                                                                        Icon(
                                                                            Icons.favorite_border,
                                                                            color: Colors.white,
                                                                            size: 30,
                                                                        ),
                                                                    ],
                                                                ),
                                                                SizedBox(height: 20),
                                                                ListTile(
                                                                    title: Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                            Text(
                                                                                _weathers[index].degree +
                                                                                    "\u00B0",
                                                                                style: TextStyle(
                                                                                    color: Colors.white,
                                                                                    fontSize: 42,
                                                                                    fontFamily: "Roboto",
                                                                                    fontWeight: FontWeight.w700,
                                                                                ),
                                                                            ),
                                                                            Image(
                                                                                image: NetworkImage(
                                                                                    _weathers[index].icon,
                                                                                ),
                                                                                width: 80,
                                                                                height: 80,
                                                                            ),
                                                                        ],
                                                                    ),
                                                                ),
                                                                SizedBox(height: 20),
                                                                Row(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment.spaceAround,
                                                                    children: [
                                                                        Opacity(
                                                                            opacity: 0.7,
                                                                            child: Container(
                                                                                alignment: Alignment.center,
                                                                                width: 132,
                                                                                height: 74,
                                                                                decoration: BoxDecoration(
                                                                                    color: Color(0xff16C9C9),
                                                                                    borderRadius:
                                                                                    BorderRadius.circular(
                                                                                        22,
                                                                                    ),
                                                                                ),
                                                                                child: Column(
                                                                                    mainAxisAlignment:
                                                                                    MainAxisAlignment
                                                                                        .center,
                                                                                    children: [
                                                                                        Text(
                                                                                            "Highest",
                                                                                            style: TextStyle(
                                                                                                color: Colors.white,
                                                                                                fontSize: 22,
                                                                                                fontWeight:
                                                                                                FontWeight.w500,
                                                                                                fontFamily: "Roboto",
                                                                                            ),
                                                                                        ),
                                                                                        Text(
                                                                                            _weathers[index].max +
                                                                                                "C",
                                                                                            style: TextStyle(
                                                                                                color: Colors.white,
                                                                                                fontSize: 25,
                                                                                                fontWeight:
                                                                                                FontWeight.w500,
                                                                                                fontFamily: "Roboto",
                                                                                            ),
                                                                                        ),
                                                                                    ],
                                                                                ),
                                                                            ),
                                                                        ),
                                                                        Opacity(
                                                                            opacity: 0.7,
                                                                            child: Container(
                                                                                alignment: Alignment.center,
                                                                                width: 132,
                                                                                height: 74,
                                                                                decoration: BoxDecoration(
                                                                                    color: Color(0xff16C9C9),
                                                                                    borderRadius:
                                                                                    BorderRadius.circular(
                                                                                        22,
                                                                                    ),
                                                                                ),
                                                                                child: Column(
                                                                                    mainAxisAlignment:
                                                                                    MainAxisAlignment
                                                                                        .center,
                                                                                    children: [
                                                                                        Text(
                                                                                            "Lowest",
                                                                                            style: TextStyle(
                                                                                                color: Colors.white,
                                                                                                fontSize: 22,
                                                                                                fontWeight:
                                                                                                FontWeight.w500,
                                                                                                fontFamily: "Roboto",
                                                                                            ),
                                                                                        ),
                                                                                        Text(
                                                                                            _weathers[index].min +
                                                                                                "C",
                                                                                            style: TextStyle(
                                                                                                color: Colors.white,
                                                                                                fontSize: 25,
                                                                                                fontWeight:
                                                                                                FontWeight.w500,
                                                                                                fontFamily: "Roboto",
                                                                                            ),
                                                                                        ),
                                                                                    ],
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                    ),
                ],
            ),
        );
    }
}
