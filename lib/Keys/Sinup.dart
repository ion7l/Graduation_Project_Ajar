import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';

import '../func/fin.dart';
import '../main.dart';

class Sinup extends StatefulWidget {
  const Sinup({super.key});

  @override
  State<Sinup> createState() => _SinupState();
}

class _SinupState extends State<Sinup> {
  final TextEditingController nameUser = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController pass = new TextEditingController();

  GlobalKey<FormState> formSinup = new GlobalKey<FormState>();

  Crud _crud = Crud();

  sendSinup() async {
    var formData = formSinup.currentState;
    if (formData!.validate()) {
      var response = await _crud
          .postResponse("https://deepmindksa.com/graduation_project_ajar/sinup.php", {
        "name": nameUser.text,
        "email": email.text,
        "pass": pass.text,
      });

      if (response['status'] == "success") {
        sharedPreferences.setString("id", response['Data']['ID'].toString());
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .pushNamedAndRemoveUntil("veiwMain", (route) => false);
      } else {
        return AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.scale,
          title: 'خطأ',
          titleTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(37, 37, 37, 1),
              fontFamily: "ReadexPro"),
          desc: 'الايميل مستخدم بالفعل',
          descTextStyle: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(37, 37, 37, 1),
              fontFamily: "ReadexPro"),
          btnOkOnPress: () {},
        )..show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Color.fromRGBO(0, 39, 65, 1),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 220,
                color: Color.fromRGBO(0, 39, 65, 1),
                child: Center(
                  child: Image.asset(
                    "images/snapedit_1701538982263.png",
                    height: 130,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    width: double.infinity,
                    height: screenWidth - 220,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(252, 255, 252, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 9,
                          child: Form(
                            key: formSinup,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 15, bottom: 10),
                                    child: Text("تسجيل",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(37, 37, 37, 1),
                                            fontFamily: "ReadexPro"))),
                                TextFormField(
                                    controller: nameUser,
                                    validator: (value) {
                                      if (value!.length <= 0) {
                                        return "ادخل الاسم";
                                      }
                                      return null;
                                    },
                                    textDirection: TextDirection.rtl,
                                    decoration: const InputDecoration(
                                      labelText: "الاسم",
                                      contentPadding: EdgeInsets.all(20),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color.fromRGBO(
                                                  37, 37, 37, 1)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color.fromRGBO(
                                                  37, 37, 37, 1)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                    )),
                                TextFormField(
                                    controller: email,
                                    validator: (value) {
                                      if (value!.length <= 0) {
                                        return "ادخل الايميل";
                                      }
                                      return null;
                                    },
                                    textDirection: TextDirection.rtl,
                                    decoration: const InputDecoration(
                                      labelText: "الايميل",
                                      contentPadding: EdgeInsets.all(20),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color.fromRGBO(
                                                  37, 37, 37, 1)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color.fromRGBO(
                                                  37, 37, 37, 1)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                    )),
                                TextFormField(
                                    controller: pass,
                                    validator: (value) {
                                      if (value!.length <= 0) {
                                        return "ادخل كلمة السر";
                                      }
                                      return null;
                                    },
                                    textDirection: TextDirection.rtl,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      labelText: "كلمة السر",
                                      contentPadding: EdgeInsets.all(20),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color.fromRGBO(
                                                  37, 37, 37, 1)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color.fromRGBO(
                                                  37, 37, 37, 1)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                    )),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(114, 217, 247, 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: TextButton(
                                      style: ButtonStyle(
                                          padding: MaterialStatePropertyAll(
                                              EdgeInsets.symmetric(
                                                  horizontal: 50,
                                                  vertical: 15))),
                                      onPressed: () async {
                                        sendSinup();
                                      },
                                      child: Text(
                                        "تسجيل",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                                252, 255, 252, 1),
                                            fontFamily: "ReadexPro"),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "هل لديك حساب؟",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(37, 37, 37, 1),
                                    fontFamily: "ReadexPro"),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      "login",
                                      (route) => true,
                                    );
                                  },
                                  child: Text(
                                    "تسجيل الدخول",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(114, 217, 247, 1),
                                        fontFamily: "ReadexPro"),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
