import 'package:covid19apicall/model/modeldata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CoWin"),
          backgroundColor: Colors.orange,
        ),
        drawer: Container(
          height: double.infinity,
          width: 250,
          color: Theme.of(context).primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                title: Text("CoWin"),
                backgroundColor: Colors.orange,
              ),

              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/test');
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Testing stats",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                        Icon(Icons.vaccines)
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/hospital');
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Hospitals & beds",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                        Icon(Icons.local_hospital)
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/helpline');
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Contact & helpline",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                        Icon(Icons.phone)
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/notification');
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Notifications",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                        Icon(Icons.notifications)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: FutureBuilder(
          future: apiCall(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              ModelData modelData = snapshot.data;
              return Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
                        child: Text(
                          "Case counts",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: Theme.of(context).primaryColor),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "India",
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "Total Cases",
                                    style: Theme.of(context).textTheme.headline2,
                                  )),
                                  Text(
                                    "${modelData.data!.summary!.total}",
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "Confirmed Cases Indian",
                                    style: Theme.of(context).textTheme.headline2,
                                  )),
                                  Text(
                                    "${modelData.data!.summary!.confirmedCasesIndian}",
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "Confirmed Cases Foreign",
                                    style: Theme.of(context).textTheme.headline2,
                                  )),
                                  Text(
                                    "${modelData.data!.summary!.confirmedCasesForeign}",
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "Discharged",
                                    style: Theme.of(context).textTheme.headline2,
                                  )),
                                  Text(
                                    "${modelData.data!.summary!.discharged}",
                                    style: Theme.of(context).textTheme.headline5,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "Deaths",
                                    style: Theme.of(context).textTheme.headline2,
                                  )),
                                  Text(
                                    "${modelData.data!.summary!.deaths}",
                                    style: Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Cases in Regional",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: modelData.data!.regional!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                              child: Container(
                                height: 150,
                                width: double.infinity,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: Theme.of(context).primaryColor),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${modelData.data!.regional![index].loc}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          "Total Cases",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        )),
                                        Text(
                                          "${modelData.data!.regional![index].totalConfirmed}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          "Discharged",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        )),
                                        Text(
                                          "${modelData.data!.regional![index].discharged}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          "Deaths",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        )),
                                        Text(
                                          "${modelData.data!.regional![index].deaths}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                            Container(
                                              height: 10,
                                              width: (modelData
                                                          .data!
                                                          .regional![index]
                                                          .discharged!
                                                          .toDouble() /
                                                      modelData
                                                          .data!
                                                          .regional![index]
                                                          .totalConfirmed!
                                                          .toDouble()) *
                                                  200,
                                              decoration: BoxDecoration(
                                                color: Colors.green.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "${(((modelData.data!.regional![index].discharged! / modelData.data!.regional![index].totalConfirmed!) * 200) / 2).toStringAsFixed(2)}%",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                            Container(
                                              height: 10,
                                              width: (modelData
                                                          .data!
                                                          .regional![index]
                                                          .deaths!
                                                          .toDouble() /
                                                      modelData
                                                          .data!
                                                          .regional![index]
                                                          .totalConfirmed!
                                                          .toDouble()) *
                                                  400,
                                              decoration: BoxDecoration(
                                                color: Colors.red.shade700,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "${(((modelData.data!.regional![index].deaths!.toInt() / modelData.data!.regional![index].totalConfirmed!.toInt()) * 200) / 2).toStringAsFixed(2)}%",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Future<ModelData> apiCall() async {
    Uri uri = Uri.parse("https://api.rootnet.in/covid19-in/stats/latest");
    var respons = await http.get(uri);
    var jsdcod = convert.jsonDecode(respons.body);

    return ModelData.fromJson(jsdcod);
  }
}
