import 'package:flutter/material.dart';

import '../../../func/fin.dart';
import '../../../main.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  Crud _crud = Crud();
  String nameItem = "";
  String nameTenant = "";
  String Message = "";
  String? id = sharedPreferences.getString("idItem");

  SelectData() async {
    var response = await _crud.postResponse(
        "https://deepmindksa.com/graduation_project_ajar/SelectMessage.php",
        {"id": sharedPreferences.getString("idItem")});

    if (response['status'] == "success") {
      nameItem = response['Data']['nameitme'];
      nameTenant = response['DataTenant']['name'];
      Message = response['Data']['message'];
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    SelectData();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "$nameItem",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: Color.fromRGBO(0, 30, 65, 1),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(minHeight: 300),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$nameTenant:",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(37, 37, 37, 1),
                        fontFamily: "ReadexPro"),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "${Message}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(37, 37, 37, 1),
                        fontFamily: "ReadexPro"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
