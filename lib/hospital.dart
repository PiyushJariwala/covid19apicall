import 'package:covid19apicall/model/hospitaldata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HospitalDetails extends StatefulWidget {
  const HospitalDetails({Key? key}) : super(key: key);

  @override
  State<HospitalDetails> createState() => _HospitalDetailsState();
}

class _HospitalDetailsState extends State<HospitalDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CoWin"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: FutureBuilder(
          future: hospitalApicall(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              HospitalData hospitalData = snapshot.data;
              return Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "Hospitals & beds",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 500,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: hospitalData.data!.regional!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 3,color: Theme.of(context).primaryColor),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('${hospitalData.data!.regional![index].state}',style: Theme.of(context).textTheme.headline6,),
                                    Row(
                                      children: [
                                        Expanded(child: Text("Total Hospitals :",style: Theme.of(context).textTheme.headline2,)),
                                        Text('${hospitalData.data!.regional![index].totalHospitals}',style: Theme.of(context).textTheme.headline2,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: Text("Total Beds :",style: Theme.of(context).textTheme.headline2,)),
                                        Text('${hospitalData.data!.regional![index].totalBeds}',style: Theme.of(context).textTheme.headline2,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: Text("Rural Hospitals :",style: Theme.of(context).textTheme.headline2,)),
                                        Text('${hospitalData.data!.regional![index].ruralHospitals}',style: Theme.of(context).textTheme.headline2,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: Text("Rural Beds :",style: Theme.of(context).textTheme.headline2,)),
                                        Text('${hospitalData.data!.regional![index].ruralBeds}',style: Theme.of(context).textTheme.headline2,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: Text("Urban Hospitals :",style: Theme.of(context).textTheme.headline2,)),
                                        Text('${hospitalData.data!.regional![index].urbanHospitals}',style: Theme.of(context).textTheme.headline2,),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Expanded(child: Text("Urban Beds :",style: Theme.of(context).textTheme.headline2,)),
                                        Text('${hospitalData.data!.regional![index].urbanBeds}',style: Theme.of(context).textTheme.headline2,),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Future<HospitalData> hospitalApicall() async {
    Uri uri = Uri.parse("https://api.rootnet.in/covid19-in/hospitals/beds");
    final res = await http.get(uri);
    final jsd = convert.jsonDecode(res.body);

    return HospitalData.fromJson(jsd);
  }
}
