import 'package:flutter/material.dart';
import 'package:nim_181011450578/data_service.dart';
import 'package:nim_181011450578/weather_model.dart';

//roby chairul
//181011450578

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  DataService dataService = DataService();
  Weather weather = Weather();
  bool isFetch = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: isFetch ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                                'http://openweathermap.org/img/wn/${weather.icon}@2x.png'
                                ),
                            Text(
                              '${weather.temp}°C',
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                            Text(weather.name + " is " + weather.description,  
                            // style: TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            )   
                          ],
                        ) : SizedBox(
                          child: Text("Data belum dapat ditampilkan",
                          style: TextStyle(
                            color: Colors.green[200]
                          ),
                          ),
                        ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 248,
                        height: 50,
                        padding: EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: controller,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hoverColor: Colors.teal[100],
                            hintText: "Masukkan Nama Kota",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.green[100]
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                          onPressed: () async {
                            isFetch = true;
                            weather = await dataService.fetchData(controller.text);
                            setState(() {});
                          },
                          child: Text("Cari Kota"),
                          style: ElevatedButton.styleFrom(
                             primary: Colors.green[800],
                             minimumSize: Size(150, 50),
                          ),
                      ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
