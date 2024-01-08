import 'dart:math';

import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ProductHome extends StatefulWidget {
  const ProductHome({super.key});

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            leading: Text(""),
            flexibleSpace: Image(
              image: NetworkImage(
                  "https://wallpapers.com/images/featured-full/laptop-murjp1nk4lp1idlt.jpg"),
              fit: BoxFit.cover,
            ),
            backgroundColor: Colors.transparent,
            toolbarHeight: 200,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'اسم المنتج',
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
                                    color: Color.fromRGBO(85, 164, 195, 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  'النوع',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(252, 255, 252, 1),
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
                                    color: Color.fromRGBO(85, 164, 195, 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  'المنطقة',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(252, 255, 252, 1),
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
                                offset:
                                    Offset(0, -1), // changes position of shadow
                              ),
                            ]),
                        child: Center(
                          child: Text(
                            'وصف المنتج',
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
                            child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(252, 255, 252, 1),
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
                                )),
                          ),
                        ),
                        Container(
                          child: Flexible(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'SAR',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(252, 255, 252, 1),
                                        fontFamily: "ReadexPro"),
                                  ),
                                  Text(
                                    'السعر',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(252, 255, 252, 1),
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
          ),
        ));
  }
}
