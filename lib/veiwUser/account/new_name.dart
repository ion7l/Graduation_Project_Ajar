import 'package:flutter/material.dart';

import '../../func/fin.dart';
import '../../main.dart';

class NewName extends StatefulWidget {
  const NewName({super.key});

  @override
  State<NewName> createState() => _NewNameState();
}

class _NewNameState extends State<NewName> {
  final TextEditingController name = new TextEditingController();

  GlobalKey<FormState> formMyData = new GlobalKey<FormState>();

  Crud _crud = Crud();

  getDataMy() async {
    var response = await _crud.postResponse(
        "https://deepmindksa.com/graduation_project_ajar/Select.php",
        {"id": sharedPreferences.getString("id")});
    if (response['status'] == "success") {
      name.text = response['Data']['name'];
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDataMy();
  }

  sendData() async {
    var formData = formMyData.currentState;
    if (formData!.validate()) {
      var response = await _crud.postResponse(
        "https://deepmindksa.com/graduation_project_ajar/MyDataupdata.php",
        {
          "id": sharedPreferences.getString("id"),
          "name": name.text,
        },
      );
      if (response['status'] == "success") {
        Navigator.of(context)
            .pushNamedAndRemoveUntil("veiwMain", (route) => false);
      } else {}
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
            'تعديل الملف الشخصي',
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
            child: SingleChildScrollView(
              child: Container(
                height: screenWidth - 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: formMyData,
                        child: TextFormField(
                            controller: name,
                            textDirection: TextDirection.rtl,
                            decoration: const InputDecoration(
                              labelText: "الاسم",
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
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(67, 185, 41, 0.30),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextButton(
                          style: ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(vertical: 20))),
                          onPressed: () async {
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
      ),
    );
  }
}
