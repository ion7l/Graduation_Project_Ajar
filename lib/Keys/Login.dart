import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                        Form(
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 30),
                                  child: Text("تسجيل الدخول",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(37, 37, 37, 1),
                                          fontFamily: "ReadexPro"))),
                              TextFormField(
                                  textDirection: TextDirection.rtl,
                                  decoration: const InputDecoration(
                                    labelText: "الايميل",
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
                              SizedBox(
                                height: 35,
                              ),
                              TextFormField(
                                  textDirection: TextDirection.rtl,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: "كلمة السر",
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
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(114, 217, 247, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: TextButton(
                                    style: ButtonStyle(
                                        padding: MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 15))),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                        "veiwMain",
                                        (route) => false,
                                      );
                                    },
                                    child: Text(
                                      "تسجيل الدخول",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(252, 255, 252, 1),
                                          fontFamily: "ReadexPro"),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ليس لديك حساب؟",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(37, 37, 37, 1),
                                  fontFamily: "ReadexPro"),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    "sinup",
                                    (route) => true,
                                  );
                                },
                                child: Text(
                                  "تسجيل",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(114, 217, 247, 1),
                                      fontFamily: "ReadexPro"),
                                ))
                          ],
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
