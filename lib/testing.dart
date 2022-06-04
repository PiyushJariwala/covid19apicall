import 'package:covid19apicall/model/test.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TestingStats extends StatefulWidget {
  const TestingStats({Key? key}) : super(key: key);

  @override
  State<TestingStats> createState() => _TestingStatsState();
}

class _TestingStatsState extends State<TestingStats> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CoWin"),
          backgroundColor: Colors.orange,
        ),
        body: FutureBuilder(
          future: apiCall(),
          builder: (context, AsyncSnapshot snapshot) {
            if(snapshot.hasError)
              {
                return Text("${snapshot.error}");
              }
            else if(snapshot.hasData)
              {
                TestingData testingData = snapshot.data;
                return Card(
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3,color: Theme.of(context).primaryColor),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text("Day :",style: Theme.of(context).textTheme.headline3)),
                            Text("${testingData.data!.day}",style: Theme.of(context).textTheme.headline3),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("Total Samples Tested : ",style: Theme.of(context).textTheme.headline3)),
                            Text("${testingData.data!.totalSamplesTested}",style: Theme.of(context).textTheme.headline3),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(child: Text("Total Individuals Tested : ",style: Theme.of(context).textTheme.headline3)),
                            Text("0",style: Theme.of(context).textTheme.headline3),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(child: Text("Total Positive Cases : ",style: Theme.of(context).textTheme.headline3)),
                            Text("0",style: Theme.of(context).textTheme.headline3),
                          ],
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

  Future<TestingData> apiCall() async {
    Uri uri =
        Uri.parse("https://api.rootnet.in/covid19-in/stats/testing/latest");
    var respons = await http.get(uri);
    var jsdcod = convert.jsonDecode(respons.body);

    return TestingData.fromJson(jsdcod);
  }
}
