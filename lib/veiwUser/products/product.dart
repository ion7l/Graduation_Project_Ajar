import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/main.dart';
import 'package:image_picker/image_picker.dart';

import '../../func/fin.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  String type = "النوع";
  String loc = "المنطقة";

  String code = "";

  final TextEditingController one = new TextEditingController();
  final TextEditingController two = new TextEditingController();
  final TextEditingController thre = new TextEditingController();
  final TextEditingController four = new TextEditingController();

  final TextEditingController name = new TextEditingController();
  final TextEditingController descrep = new TextEditingController();
  final TextEditingController Terms = new TextEditingController();
  final TextEditingController prise = new TextEditingController();

  File? myfile;

  GlobalKey<FormState> formProduct = new GlobalKey<FormState>();

  Crud _crud = Crud();

  sendPorduct() async {
    if (myfile == null) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.scale,
        desc: 'ارفاق صورة للمنتج من فضلك',
        descTextStyle: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(37, 37, 37, 1),
            fontFamily: "ReadexPro"),
        btnOkOnPress: () {},
      )..show();
    } else {
      var formData = formProduct.currentState;
      if (formData!.validate()) {
        if ("${one.text + two.text + thre.text + four.text}" == code) {
          var response = await _crud.postRequestwithFile(
              "https://deepmindksa.com/graduation_project_ajar/porductupload.php",
              {
                "name": name.text,
                "descrep": descrep.text,
                "terms": Terms.text,
                "type": type,
                "loc": loc,
                "prise": prise.text,
                "idUser": sharedPreferences.getString("id")
              },
              myfile!);

          if (response['status'] == "success") {
            Navigator.of(context)
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
    }
  }

  sendTomail() async {
    var response = await _crud.postResponse(
      "https://deepmindksa.com/graduation_project_ajar/sendEmail.php",
      {"id": sharedPreferences.getString("id"), "service": "نشر"},
    );
    if (response['code'] != null) {
      code = response['code'];
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
            title: const Text(
              "منتجاتي",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            toolbarHeight: 100,
            backgroundColor: Color.fromRGBO(0, 30, 65, 1),
          ),
          extendBody: true,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 6,
                  child: ListView(
                    children: [
                      Form(
                          key: formProduct,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                  validator: (value) {
                                    if (value!.length <= 0) {
                                      return "ادخل اسم المنتج";
                                    }
                                    return null;
                                  },
                                  controller: name,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(fontSize: 18),
                                  decoration: const InputDecoration(
                                    labelText: "الاسم",
                                    contentPadding: EdgeInsets.all(25),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color:
                                                Color.fromRGBO(37, 37, 37, 1)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color:
                                                Color.fromRGBO(37, 37, 37, 1)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                  )),
                              SizedBox(height: 25),
                              TextFormField(
                                  validator: (value) {
                                    if (value!.length <= 0) {
                                      return "ادخل وصف المنتج";
                                    }
                                    return null;
                                  },
                                  controller: descrep,
                                  textDirection: TextDirection.rtl,
                                  minLines: 3,
                                  maxLines: 5,
                                  style: TextStyle(fontSize: 18),
                                  decoration: const InputDecoration(
                                    labelText: "الوصف",
                                    contentPadding: EdgeInsets.all(25),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color:
                                                Color.fromRGBO(37, 37, 37, 1)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color:
                                                Color.fromRGBO(37, 37, 37, 1)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                  )),
                              SizedBox(height: 25),
                              TextFormField(
                                  validator: (value) {
                                    if (value!.length <= 0) {
                                      return "ادخل بنود العقد";
                                    }
                                    return null;
                                  },
                                  controller: Terms,
                                  textDirection: TextDirection.rtl,
                                  minLines: 3,
                                  maxLines: 5,
                                  style: TextStyle(fontSize: 18),
                                  decoration: const InputDecoration(
                                    labelText: "بنود",
                                    contentPadding: EdgeInsets.all(25),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color:
                                                Color.fromRGBO(37, 37, 37, 1)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color:
                                                Color.fromRGBO(37, 37, 37, 1)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                  )),
                              SizedBox(height: 25),
                              Container(
                                height: 73,
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: DropdownButton(
                                  borderRadius: BorderRadius.circular(30),
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  hint: Text(type),
                                  items: [
                                    DropdownMenuItem(
                                        child: Text('عقار'), value: 'عقار'),
                                    DropdownMenuItem(
                                        child: Text('مركبات'), value: 'مركبات'),
                                    DropdownMenuItem(
                                        child: Text('اجهزة اكترونية'),
                                        value: 'اجهزة اكترونية'),
                                    DropdownMenuItem(
                                        child: Text('اخرى'), value: 'اخرى'),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      type = value!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 25),
                              Container(
                                height: 73,
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: DropdownButton(
                                  borderRadius: BorderRadius.circular(30),
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  hint: Text(loc),
                                  items: [
                                    DropdownMenuItem(
                                        child: Text('الرياض'), value: 'الرياض'),
                                    DropdownMenuItem(
                                        child: Text('جدة'), value: 'جدة'),
                                    DropdownMenuItem(
                                        child: Text('مكةالمكرمة'),
                                        value: 'مكةالمكرمة'),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      loc = value!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 25),
                              TextFormField(
                                  controller: prise,
                                  validator: (value) {
                                    if (value!.length <= 0) {
                                      return "ادخل سعر المنتج";
                                    }
                                    return null;
                                  },
                                  textDirection: TextDirection.rtl,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 18),
                                  decoration: const InputDecoration(
                                    labelText: "السعر",
                                    contentPadding: EdgeInsets.all(25),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color:
                                                Color.fromRGBO(37, 37, 37, 1)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color:
                                                Color.fromRGBO(37, 37, 37, 1)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                  )),
                              SizedBox(height: 25),
                              Container(
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: myfile == null
                                      ? Color.fromRGBO(5, 162, 206, 1)
                                      : Color.fromRGBO(67, 185, 41, 1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(15))),
                                        builder: (context) {
                                          return Container(
                                            height: 180,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8, right: 8),
                                                  child: Text(
                                                    'اختيار الصورة من',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            "ReadexPro"),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    XFile? xfile =
                                                        await ImagePicker()
                                                            .pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .gallery);
                                                    if (xfile != null) {
                                                      myfile = File(xfile.path);
                                                      Navigator.pop(context);
                                                    }
                                                    setState(() {});
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'المعرض',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                "ReadexPro"),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Icon(
                                                        Icons.photo_outlined,
                                                        color: Colors.black,
                                                        size: 35,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  color: Colors.black,
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    XFile? xfile =
                                                        await ImagePicker()
                                                            .pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .camera);
                                                    if (xfile != null) {
                                                      myfile = File(xfile.path);
                                                      Navigator.pop(context);
                                                    }
                                                    setState(() {});
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'الكاميرا',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                "ReadexPro"),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .camera_alt_outlined,
                                                        color: Colors.black,
                                                        size: 35,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'ارفاق صورة',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  252, 255, 252, 1),
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "ReadexPro"),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.photo,
                                          color:
                                              Color.fromRGBO(252, 255, 252, 1),
                                          size: 60,
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(height: 25),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 30, 65, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextButton(
                      onPressed: () async {
                        sendTomail();
                        OTP(context, screenWidth, screenHeight);
                      },
                      child: Text(
                        "نشر",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(252, 255, 252, 1),
                            fontFamily: "ReadexPro"),
                      )),
                ),
              ],
            ),
          )),
    );
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
                                sendPorduct();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                backgroundColor: Color.fromRGBO(0, 30, 65, 1),
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
