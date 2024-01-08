import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../func/Logic.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _cont = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "أجِار",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Color.fromRGBO(0, 30, 65, 1),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey,
            ),
          )
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Consumer<Logiec>(
        builder: (context, value, child) => FloatingNavbar(
          // ignore: non_constant_identifier_names
          onTap: (val) {
            Provider.of<Logiec>(context, listen: false).updateIndex(val);
          },
          currentIndex: value.index,
          iconSize: 37,
          items: [
            FloatingNavbarItem(icon: Icons.home, title: "الرئيسية"),
            FloatingNavbarItem(
                icon: Icons.production_quantity_limits_rounded,
                title: "منتجاتي"),
            FloatingNavbarItem(
              icon: Icons.file_copy_rounded,
              title: "الوثائق",
            ),
            FloatingNavbarItem(icon: Icons.account_box, title: "الحساب"),
          ],
          backgroundColor: const Color.fromRGBO(0, 39, 65, 1),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: double.infinity,
              height: 200,
              child: Stack(
                children: [
                  PageView(controller: _cont, children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcTwGTmgN4WclFT5_MqG2LWj9nSsaabJ_hdFIxxBFf_SPblOvYwmOQdGu6cSOEmULMLm595LQ_FahMEgDtjqqDU",
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://wallpapers.com/images/featured-full/laptop-murjp1nk4lp1idlt.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://wallpapers.com/images/featured/house-u7pcf18vqolaatio.webp',
                        fit: BoxFit.cover,
                      ),
                    )
                  ]),
                  Container(
                    alignment: const Alignment(0, 1.3),
                    child: SmoothPageIndicator(
                      controller: _cont,
                      count: 3,
                      effect: SlideEffect(
                          dotColor: Color.fromRGBO(0, 119, 141, 1),
                          activeDotColor: Color.fromRGBO(114, 217, 247, 1)),
                    ),
                  )
                ],
              )),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
                      elevation: MaterialStatePropertyAll(3),
                      side: MaterialStatePropertyAll(
                          BorderSide(color: Colors.black, width: 1)),
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: const Text(
                    "عقار",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(37, 37, 37, 1),
                        fontFamily: "ReadexPro"),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
                      elevation: MaterialStatePropertyAll(3),
                      side: MaterialStatePropertyAll(
                          BorderSide(color: Colors.black, width: 1)),
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: const Text(
                    "مركبات",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(37, 37, 37, 1),
                        fontFamily: "ReadexPro"),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
                      elevation: MaterialStatePropertyAll(3),
                      side: MaterialStatePropertyAll(
                          BorderSide(color: Colors.black, width: 1)),
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: const Text(
                    "اجهزة اكترونية",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(37, 37, 37, 1),
                        fontFamily: "ReadexPro"),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
                      elevation: MaterialStatePropertyAll(3),
                      side: MaterialStatePropertyAll(
                          BorderSide(color: Colors.black, width: 1)),
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: const Text(
                    "أخرى",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(37, 37, 37, 1),
                        fontFamily: "ReadexPro"),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.transparent,
            height: 5,
          ),
          // Is Code The Item
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.84),
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 7,
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(
                        'https://wallpapers.com/images/featured-full/laptop-murjp1nk4lp1idlt.jpg',
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 3),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(85, 164, 195, 1),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              'النوع',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10,
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
                                horizontal: 15, vertical: 3),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(85, 164, 195, 1),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              'المنطقة',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(252, 255, 252, 1),
                                  fontFamily: "ReadexPro"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'اسم المنتج',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(37, 37, 37, 1),
                                fontFamily: "ReadexPro"),
                          ),
                          Text(
                            'السعر',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(37, 37, 37, 1),
                                fontFamily: "ReadexPro"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 7, right: 7, bottom: 2),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              "productHome",
                              (route) => true,
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 55),
                            backgroundColor: Color.fromRGBO(0, 30, 65, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'اطلاع',
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
            ],
          ),
        ],
      ),
    );
  }
}
