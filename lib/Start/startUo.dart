import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartUp extends StatefulWidget {
  const StartUp({super.key});

  @override
  State<StartUp> createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  final PageController _cont = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 39, 65, 1),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
                margin: const EdgeInsets.only(bottom: 30),
                width: double.infinity,
                height: 330,
                child: Stack(children: [
                  PageView(controller: _cont, children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("images/Agreement-bro.png",
                                height: 300, width: 300),
                            Text(
                              "نحن اختيارك اذا كان تبحث عن الامان في الصفقات ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(252, 255, 252, 1),
                                  fontFamily: "ReadexPro"),
                            )
                          ],
                        )),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("images/Signing a contract-bro.png",
                                height: 260, width: 260),
                            Text(
                              "سهولة في توقيع العقود بين الطرفين",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(252, 255, 252, 1),
                                  fontFamily: "ReadexPro"),
                            )
                          ],
                        )),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Positioned(
                                      child: Image.asset(
                                          "images/House searching-bro.png",
                                          height: 230,
                                          width: 230)),
                                  Positioned(
                                      top: 15,
                                      right: 70,
                                      child: Image.asset(
                                          "images/Horror video game-bro.png",
                                          height: 230,
                                          width: 230)),
                                  Positioned(
                                      top: 35,
                                      left: 40,
                                      child: Image.asset(
                                          "images/City driver-rafiki.png",
                                          height: 230,
                                          width: 230)),
                                ],
                              ),
                            ),
                            Text(
                              "كل ماتحتاجه لتاجير او استاجره متوفر في مكان واحد",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(252, 255, 252, 1),
                                  fontFamily: "ReadexPro"),
                            )
                          ],
                        ))
                  ]),
                  Container(
                    alignment: const Alignment(0, 1.3),
                    child: SmoothPageIndicator(
                      controller: _cont,
                      count: 3,
                      effect: SlideEffect(
                          dotColor: Color.fromRGBO(0, 119, 141, 1),
                          activeDotColor: Color.fromRGBO(252, 255, 252, 1)),
                    ),
                  )
                ])),
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(114, 217, 247, 1),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextButton(
                  style: ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 110, vertical: 8))),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("start", (route) => false);
                  },
                  child: Text(
                    "البدء",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(252, 255, 252, 1),
                        fontFamily: "ReadexPro"),
                  )),
            ),
          ]),
        ));
  }
}
