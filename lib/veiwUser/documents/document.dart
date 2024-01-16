import 'package:flutter/material.dart';

import '../../func/fin.dart';
import '../../main.dart';

class Document extends StatefulWidget {
  const Document({super.key});

  @override
  State<Document> createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  Crud _crud = Crud();
  String nameItem = "";
  String nameTenant = "";
  String nameLessor = "";
  String? id = sharedPreferences.getString("idItem");

  SelectData() async {
    var response = await _crud.postResponse(
        "http://10.0.2.2/graduation_project_ajar/SelectDocumentItems.php",
        {"id": sharedPreferences.getString("idItem")});

    if (response['status'] == "success") {
      nameItem = response['Data']['name'];
      nameTenant = response['DataTenant']['name'];
      nameLessor = response['DataLessor']['name'];
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
            "$nameItem-${sharedPreferences.getString("idItem")}",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: Color.fromRGBO(0, 30, 65, 1),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  constraints: BoxConstraints(minHeight: 300),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تم استاجر وتم ابرام هذا العقد رقم $id اسم المنتاج $nameItem وان المستأجر قد استأجر السلعة",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(37, 37, 37, 1),
                            fontFamily: "ReadexPro"),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "وان الطرافان قد وافقو على الشروط التالية:-",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(37, 37, 37, 1),
                            fontFamily: "ReadexPro"),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "اولا يجب الالتزام بالموعد الخاص بسداد رسوم الإيجار. لابد من توثيق العقد من خلال أحد الموثقين (عقد الالكتروني).ويجب المحافظة على شكل والجودة الخاص بالسلعة المؤجرة من قبل الاطراف وأيضا المحافظة على الأشياء التي توجد بالسلعة المؤجرة.",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(37, 37, 37, 1),
                            fontFamily: "ReadexPro"),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(children: [
                        Text(
                          "اسم المستأجر",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(37, 37, 37, 1),
                              fontFamily: "ReadexPro"),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "$nameTenant",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(37, 37, 37, 1),
                              fontFamily: "ReadexPro"),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "تم التوثيق",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(37, 37, 37, 1),
                                  fontFamily: "ReadexPro"),
                            ),
                            Icon(
                              Icons.check_box_outlined,
                              color: Color.fromRGBO(67, 185, 41, 1),
                            )
                          ],
                        )
                      ]),
                    ),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Text(
                            "اسم المؤجر",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(37, 37, 37, 1),
                                fontFamily: "ReadexPro"),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "$nameLessor",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(37, 37, 37, 1),
                                fontFamily: "ReadexPro"),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "تم التوثيق",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(37, 37, 37, 1),
                                      fontFamily: "ReadexPro"),
                                ),
                                Icon(
                                  Icons.check_box_outlined,
                                  color: Color.fromRGBO(67, 185, 41, 1),
                                )
                              ]),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
