import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 39, 65, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Center(
              child: Image.asset(
                "images/snapedit_1701538982263.png",
                height: 130,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 240,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("مرحباَ بك",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(37, 37, 37, 1),
                        fontFamily: "ReadexPro")),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(114, 217, 247, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextButton(
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15))),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          "login",
                          (route) => true,
                        );
                      },
                      child: Text(
                        "تسجيل الدخول",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(252, 255, 252, 1),
                            fontFamily: "ReadexPro"),
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(114, 217, 247, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextButton(
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 95, vertical: 15))),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          "sinup",
                          (route) => true,
                        );
                      },
                      child: Text(
                        "تسجيل",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(252, 255, 252, 1),
                            fontFamily: "ReadexPro"),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
