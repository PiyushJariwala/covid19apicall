import 'package:covid19apicall/model/Helpdata.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:url_launcher/url_launcher_string.dart';

class HelpLine extends StatefulWidget {
  const HelpLine({Key? key}) : super(key: key);

  @override
  State<HelpLine> createState() => _HelpLineState();
}

class _HelpLineState extends State<HelpLine> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CoWin"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: FutureBuilder(
          future: apiCall(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              HelpData helpData = snapshot.data;
              return Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Helpline Number :",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Expanded(
                      child: Container(
                        height: 500,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount:
                                helpData.data!.contacts!.regional!.length,
                            itemBuilder: (Context, index) {
                              return Card(
                                elevation: 10,
                                child: Container(
                                  height: 60,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${helpData.data!.contacts!.regional![index].loc}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              phoneNumber("${helpData.data!.contacts!.regional![index].number}");
                                            },
                                            child: Text(
                                              "${helpData.data!.contacts!.regional![index].number}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(onPressed: (){
                                        setState(() {
                                          shareNumber("${helpData.data!.contacts!.regional![index].number}");
                                        });
                                      }, icon: Icon(
                                        Icons.share_rounded,
                                        color:
                                        Theme.of(context).primaryColor,
                                      ))

                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Future<HelpData> apiCall() async {
    Uri uri = Uri.parse("https://api.rootnet.in/covid19-in/contacts");
    final respons = await http.get(uri);
    final jsd = convert.jsonDecode(respons.body);

    return HelpData.fromJson(jsd);
  }

  void shareNumber(String hn) {
    Share.share(hn);
  }

  void phoneNumber(String pn)
  async{
    Uri uri = Uri(scheme: 'tel',path: pn,);
await launchUrlString("$uri");
  }
}
