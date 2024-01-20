import 'package:flutter/material.dart';

import '../../../func/fin.dart';
import '../../../main.dart';
import 'MessageCard.dart';

class Messags extends StatefulWidget {
  const Messags({super.key});

  @override
  State<Messags> createState() => _MessagsState();
}

class _MessagsState extends State<Messags> {
  Crud _crud = Crud();

  getMess() async {
    var response = await _crud.postResponse(
        "https://deepmindksa.com/graduation_project_ajar/SelectMessages.php",
        {"id": sharedPreferences.getString("id")});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "الاشعارات",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            toolbarHeight: 100,
            backgroundColor: Color.fromRGBO(0, 30, 65, 1),
          ),
          body: ListView(
            children: [
              FutureBuilder(
                  future: getMess(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData && snapshot.data['status'] != 'fail') {
                      return ListView.builder(
                        itemCount: snapshot.data['Data'].length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return MessagsCard(
                            name: snapshot.data['Data'][index]['nameitme'],
                            id: snapshot.data['Data'][index]['ID'],
                          );
                        },
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Center(
                      child: Text(""),
                    );
                  })
            ],
          ),
        ));
  }
}
