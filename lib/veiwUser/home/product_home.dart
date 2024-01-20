import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../func/fin.dart';
import '../../main.dart';

class ProductHome extends StatefulWidget {
  const ProductHome({super.key});

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  final TextEditingController one = new TextEditingController();
  final TextEditingController two = new TextEditingController();
  final TextEditingController thre = new TextEditingController();
  final TextEditingController four = new TextEditingController();

  final TextEditingController terms = new TextEditingController();
  GlobalKey<FormState> sendMess = new GlobalKey<FormState>();

  bool checRead = false;
  late String id;
  late String idlessor;
  late String nameItme;
  late String Terms;
  String code = "";

  Crud _crud = Crud();

  getItem() async {
    var response = await _crud.postResponse(
        "https://deepmindksa.com/graduation_project_ajar/SelectItem.php",
        {"idItem": sharedPreferences.getString("idItem")});
    return response;
  }

  sendhired(id, Idlessor, nameItme) async {
    if ("${one.text + two.text + thre.text + four.text}" == code) {
      var response = await _crud.postResponse(
        "https://deepmindksa.com/graduation_project_ajar/hired.php",
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
    } else {
      return AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        width: 350,
        title: 'خطأ',
        titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(37, 37, 37, 1),
            fontFamily: "ReadexPro"),
        desc: 'OTP غير صحيح',
        descTextStyle: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(37, 37, 37, 1),
            fontFamily: "ReadexPro"),
        btnOkOnPress: () {},
      )..show();
    }
  }

  sendTomail() async {
    var response = await _crud.postResponse(
      "https://deepmindksa.com/graduation_project_ajar/sendEmail.php",
      {"id": sharedPreferences.getString("id"), "service": "الستأجر"},
    );
    if (response['code'] != null) {
      code = response['code'];
    } else {}
  }

  sendMessage() async {
    var formData = sendMess.currentState;
    if (formData!.validate()) {
      var response = await _crud.postResponse(
        "https://deepmindksa.com/graduation_project_ajar/sendMessage.php",
        {
          "idUserLessor": idlessor,
          "idUserTenant": sharedPreferences.getString("id"),
          "message": terms.text,
          "nameItme": nameItme,
        },
      );
      if (response['status'] == "success") {
        return Navigator.of(context)
            .pushNamedAndRemoveUntil("veiwMain", (route) => false);
      } else {}
    }
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
                          "https://deepmindksa.com/graduation_project_ajar/upload/${snapshot.data["Data"]["pahtImg"]}"),
                      fit: BoxFit.cover,
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
                  Terms = snapshot.data["Data"]["terms"];
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
                        Container(
                          padding: EdgeInsets.all(8),
                          width: double.infinity,
                          height: 80,
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
                                        ? buttonUserYes(
                                            context, screenWidth, screenHeight)
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
                      ],
                    ),
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
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        "بنود العقد",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(37, 37, 37, 1),
                                            fontFamily: "ReadexPro"),
                                      ),
                                    ),
                                    Text(
                                      "$Terms",
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
                                          'تم الاطلع على البنود',
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
                                      child: Row(
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            child: Container(
                                              width: double.infinity,
                                              child: TextButton(
                                                  onPressed: () {
                                                    if (checRead == true) {
                                                      Navigator.pop(context);
                                                      sendTomail();
                                                      return OTP(
                                                          context,
                                                          screenWidth,
                                                          screenHeight);
                                                    }
                                                    return null;
                                                  },
                                                  style: TextButton.styleFrom(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 15),
                                                    backgroundColor:
                                                        checRead == true
                                                            ? Color.fromRGBO(
                                                                0, 30, 65, 1)
                                                            : Color.fromRGBO(
                                                                0, 30, 65, 0.5),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'موافق',
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromRGBO(
                                                            252, 255, 252, 1),
                                                        fontFamily:
                                                            "ReadexPro"),
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            flex: 2,
                                            child: Container(
                                              width: double.infinity,
                                              child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    terms.text = Terms;
                                                    sendTemrs(
                                                        context,
                                                        screenHeight,
                                                        screenWidth);
                                                  },
                                                  style: TextButton.styleFrom(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 15),
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            5, 162, 206, 1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'تعديل',
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromRGBO(
                                                            252, 255, 252, 1),
                                                        fontFamily:
                                                            "ReadexPro"),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
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

  sendTemrs(BuildContext context, double screenWidth, double screenHeight) {
    return showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (context, setState) => AlertDialog(
                  content: Container(
                    width: screenWidth * 0.90,
                    height: screenHeight * 0.80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Form(
                          key: sendMess,
                          child: TextFormField(
                              validator: (value) {
                                if (value!.length <= 0) {
                                  return "ادخل الرسالة";
                                }
                                return null;
                              },
                              controller: terms,
                              textDirection: TextDirection.rtl,
                              minLines: 3,
                              maxLines: 5,
                              style: TextStyle(fontSize: 18),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(25),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Color.fromRGBO(37, 37, 37, 1)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Color.fromRGBO(37, 37, 37, 1)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              )),
                        ),
                        Container(
                          width: double.infinity,
                          child: TextButton(
                              onPressed: () {
                                sendMessage();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                backgroundColor: Color.fromRGBO(0, 30, 65, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'ارسال',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(252, 255, 252, 1),
                                    fontFamily: "ReadexPro"),
                              )),
                        ),
                      ],
                    ),
                  ),
                )));
  }

  OTP(BuildContext context, double screenWidth, double screenHeight) {
    return showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (context, setState) => AlertDialog(
                  content: Container(
                    width: screenWidth * 0.90,
                    height: screenHeight * 0.60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'رمز التحقق',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Form(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 68,
                                    width: 50,
                                    child: TextFormField(
                                      controller: one,
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      style: TextStyle(fontSize: 18),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Color.fromRGBO(
                                                    37, 37, 37, 1)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Color.fromRGBO(
                                                    37, 37, 37, 1)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 68,
                                    width: 50,
                                    child: TextFormField(
                                      controller: two,
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      style: TextStyle(fontSize: 18),
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Color.fromRGBO(
                                                    37, 37, 37, 1)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Color.fromRGBO(
                                                    37, 37, 37, 1)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 68,
                                    width: 50,
                                    child: TextFormField(
                                      controller: thre,
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      style: TextStyle(fontSize: 18),
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Color.fromRGBO(
                                                    37, 37, 37, 1)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Color.fromRGBO(
                                                    37, 37, 37, 1)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 68,
                                    width: 50,
                                    child: TextFormField(
                                      controller: four,
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      style: TextStyle(fontSize: 18),
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Color.fromRGBO(
                                                    37, 37, 37, 1)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Color.fromRGBO(
                                                    37, 37, 37, 1)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          child: TextButton(
                              onPressed: () {
                                sendhired(id, idlessor, nameItme);
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                backgroundColor: checRead == true
                                    ? Color.fromRGBO(0, 30, 65, 1)
                                    : Color.fromRGBO(0, 30, 65, 0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'تحقق',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(252, 255, 252, 1),
                                    fontFamily: "ReadexPro"),
                              )),
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
