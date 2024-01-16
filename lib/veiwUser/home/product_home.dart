import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../func/fin.dart';
import '../../main.dart';

class ProductHome extends StatefulWidget {
  const ProductHome({super.key});

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  bool checRead = false;
  late String id;
  late String idlessor;
  late String nameItme;

  Crud _crud = Crud();

  getItem() async {
    var response = await _crud.postResponse(
        "http://10.0.2.2/graduation_project_ajar/SelectItem.php",
        {"idItem": sharedPreferences.getString("idItem")});
    return response;
  }

  sendhired(id, Idlessor, nameItme) async {
    var response = await _crud.postResponse(
      "http://10.0.2.2/graduation_project_ajar/hired.php",
      {
        "idItme": id,
        "nameItme": nameItme,
        "idUserLessor": Idlessor,
        "idUserTenant": sharedPreferences.getString("id")
      },
    );
    if (response['status'] == "success") {
      return Navigator.of(context)
          .pushNamedAndRemoveUntil("veiwMain", (route) => false);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            leading: Text(""),
            flexibleSpace: FutureBuilder(
                future: getItem(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Image(
                      image: NetworkImage(
                          "http://192.168.1.36/graduation_project_ajar/upload/${snapshot.data["Data"]["pahtImg"]}"),
                      fit: BoxFit.cover,
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text("Loading...."),
                    );
                  }
                  return Center(
                    child: Text("Loading...."),
                  );
                }),
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 200,
          ),
          body: FutureBuilder(
              future: getItem(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  id = snapshot.data["Data"]["ID"].toString();
                  idlessor = snapshot.data["Data"]["idUser"].toString();
                  nameItme = snapshot.data["Data"]["name"];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 5,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${snapshot.data['Data']['name']}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(37, 37, 37, 1),
                                        fontFamily: "ReadexPro"),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 7),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(85, 164, 195, 1),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          "${snapshot.data['Data']['type']}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  252, 255, 252, 1),
                                              fontFamily: "ReadexPro"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 13,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 7),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(85, 164, 195, 1),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          "${snapshot.data['Data']['region']}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  252, 255, 252, 1),
                                              fontFamily: "ReadexPro"),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                constraints: BoxConstraints(minHeight: 200),
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(252, 255, 252, 1),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 10,
                                        offset: Offset(0,
                                            -1), // changes position of shadow
                                      ),
                                    ]),
                                child: Center(
                                  child: Text(
                                    '${snapshot.data['Data']['description']}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(37, 37, 37, 1),
                                        fontFamily: "ReadexPro"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            height: 90,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 30, 65, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 8,
                                  child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: snapshot.data['Data']['idUser']
                                                  .toString() ==
                                              sharedPreferences.getString("id")
                                          ? buttonUserYes(context, screenWidth,
                                              screenHeight)
                                          : buttonUserNo(context, screenWidth,
                                              screenHeight)),
                                ),
                                Container(
                                  child: Flexible(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'ر.س.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    252, 255, 252, 1),
                                                fontFamily: "ReadexPro"),
                                          ),
                                          Text(
                                            '${snapshot.data['Data']['price']}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    252, 255, 252, 1),
                                                fontFamily: "ReadexPro"),
                                          ),
                                        ],
                                      )),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: SizedBox(),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("Loading...."),
                  );
                }
                return Center(
                  child: Text("Loading...."),
                );
              }),
        ));
  }

  TextButton buttonUserNo(
      BuildContext context, double screenWidth, double screenHeight) {
    return TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => StatefulBuilder(
                  builder: (context, setState) => AlertDialog(
                        content: Container(
                          width: screenWidth * 0.90,
                          height: screenHeight * 0.60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 6,
                                child: ListView(
                                  children: [
                                    Text(
                                      "اولا يجب الالتزام بالموعد الخاص بسداد رسوم الإيجار. لابد من توثيق العقد من خلال أحد الموثقين (عقد الالكتروني).ويجب المحافظة على شكل والجودة الخاص بالسلعة المؤجرة من قبل الاطراف وأيضا المحافظة على الأشياء التي توجد بالسلعة المؤجرة.",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(37, 37, 37, 1),
                                          fontFamily: "ReadexPro"),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'تم الاطلع على الشروط',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromRGBO(37, 37, 37, 1),
                                              fontFamily: "ReadexPro"),
                                        ),
                                        Checkbox(
                                            value: checRead,
                                            onChanged: (val) {
                                              checRead = val!;
                                              setState(() {});
                                            }),
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: TextButton(
                                          onPressed: () {
                                            checRead == true
                                                ? sendhired(
                                                    id, idlessor, nameItme)
                                                : null;
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15),
                                            backgroundColor: checRead == true
                                                ? Color.fromRGBO(0, 30, 65, 1)
                                                : Color.fromRGBO(
                                                    0, 30, 65, 0.5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Text(
                                            'موافق',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    252, 255, 252, 1),
                                                fontFamily: "ReadexPro"),
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )));
        },
        style: TextButton.styleFrom(
          backgroundColor: Color.fromRGBO(252, 255, 252, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "استأجر",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(37, 37, 37, 1),
                  fontFamily: "ReadexPro"),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.handshake_outlined,
              color: Color.fromRGBO(37, 37, 37, 1),
              size: 40,
            )
          ],
        ));
  }

  TextButton buttonUserYes(
      BuildContext context, double screenWidth, double screenHeight) {
    return TextButton(
        onPressed: () {
          sharedPreferences.setString("idItem", "${id}");
          Navigator.of(context).pushNamedAndRemoveUntil(
            "updata",
            (route) => true,
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: Color.fromRGBO(252, 255, 252, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "تعديل",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(37, 37, 37, 1),
                  fontFamily: "ReadexPro"),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.border_color_rounded,
              color: Color.fromRGBO(37, 37, 37, 1),
              size: 40,
            )
          ],
        ));
  }
}
