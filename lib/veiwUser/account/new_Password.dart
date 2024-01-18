import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../func/fin.dart';
import '../../main.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController password = new TextEditingController();
  final TextEditingController passwordNew = new TextEditingController();
  final TextEditingController passwordNewTow = new TextEditingController();

  GlobalKey<FormState> formMyData = new GlobalKey<FormState>();

  Crud _crud = Crud();

  sendData() async {
    var formData = formMyData.currentState;
    if (formData!.validate()) {
      var response = await _crud.postResponse(
        "https://deepmindksa.com/graduation_project_ajar/PasswordUpdata.php",
        {
          "id": sharedPreferences.getString("id"),
          "password": password.text,
          "passwordnew": passwordNew.text
        },
      );
      if (response['status'] == "success") {
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
          desc: 'كلمة السر القديمة غير صحيحة',
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
          appBar: AppBar(
            title: const Text(
              "تغيير كلمة السر",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            toolbarHeight: 100,
            backgroundColor: Color.fromRGBO(0, 30, 65, 1),
          ),
          extendBody: true,
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formMyData,
              child: SingleChildScrollView(
                child: Container(
                  height: screenWidth - 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                obscureText: true,
                                controller: password,
                                validator: (value) {
                                  if (value!.length <= 0) {
                                    return "ادخال كلمة السر القديمة";
                                  }
                                  return null;
                                },
                                textDirection: TextDirection.rtl,
                                decoration: const InputDecoration(
                                  labelText: "كلمة السر القديمة",
                                  contentPadding: EdgeInsets.all(25),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromRGBO(37, 37, 37, 1)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromRGBO(37, 37, 37, 1)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                obscureText: true,
                                controller: passwordNew,
                                validator: (value) {
                                  if (value!.length <= 0) {
                                    return "ادخال كلمة السر الجديدة";
                                  }
                                  if (value != passwordNewTow.text) {
                                    return "كلمة السر غير متطابقة";
                                  }
                                  return null;
                                },
                                textDirection: TextDirection.rtl,
                                decoration: const InputDecoration(
                                  labelText: "كلمة السر الجديدة",
                                  contentPadding: EdgeInsets.all(25),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromRGBO(37, 37, 37, 1)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromRGBO(37, 37, 37, 1)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                obscureText: true,
                                controller: passwordNewTow,
                                validator: (value) {
                                  if (value!.length <= 0) {
                                    return "ادخال اعادة كلمة السر الجديدة";
                                  }
                                  return null;
                                },
                                textDirection: TextDirection.rtl,
                                decoration: const InputDecoration(
                                  labelText: "اعادة كلمة السر الجديدة",
                                  contentPadding: EdgeInsets.all(25),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromRGBO(37, 37, 37, 1)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromRGBO(37, 37, 37, 1)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                )),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(67, 185, 41, 0.30),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: TextButton(
                            style: ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(vertical: 20))),
                            onPressed: () {
                              sendData();
                            },
                            child: Text(
                              "حفظ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(67, 185, 41, 1),
                                  fontFamily: "ReadexPro"),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
