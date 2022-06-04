import 'package:covid19apicall/model/notificationdata.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("CoWin"),
            backgroundColor: Colors.orange,
          ),
          body: FutureBuilder(
          future: notificationApiCall(),
            builder: (context,AsyncSnapshot snapshot) {
            if(snapshot.hasError)
              {
                return Text("${snapshot.error}");
              }
            else if(snapshot.hasData){
              NotificationData notificationData = snapshot.data;
              return Container(
                height: double.infinity,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Notifications",style: Theme.of(context).textTheme.headline1,),

                    Expanded(
                      child: Container(
                        height: 500,
                        width: double.infinity,
                        child: ListView.builder(itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){
                              String? pass;
                              pass = notificationData.data!.notifications![index].link;
                              Navigator.pushNamed(context, '/web',arguments: pass);
                            },
                            child: Card(
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 3,color: Theme.of(context).primaryColor),
                                  color: Colors.white,
                                ),
                                child: Expanded(child: Text("${notificationData.data!.notifications![index].title}",style: Theme.of(context).textTheme.headline2,),),
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
          )),
    );
  }

  Future<NotificationData> notificationApiCall() async {
    Uri uri = Uri.parse("https://api.rootnet.in/covid19-in/notifications");
    final res = await http.get(uri);
    final jsd = convert.jsonDecode(res.body);

    return NotificationData.fromJson(jsd);
  }
}
