import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/veiwUser/home/CardHome.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../func/Logic.dart';
import '../func/fin.dart';
import '../main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexImg = 0;
  final PageController _cont = PageController();

  Crud _crud = Crud();

  int numMessage = 0;

  SelectData() async {
    var response = await _crud.postResponse(
        "https://deepmindksa.com/graduation_project_ajar/SelectMessages.php",
        {"id": sharedPreferences.getString("id")});

    if (response['status'] == "success") {
      numMessage = response['length'].length;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    SelectData();
  }

  String on = "*";

  getItems() async {
    var response = await _crud.postResponse(
        "https://deepmindksa.com/graduation_project_ajar/SelectItems.php",
        {"Sel": on});
    return response;
  }

  getItemsImg() async {
    var response = await _crud.postResponse(
        "https://deepmindksa.com/graduation_project_ajar/SelectItemsImg.php",
        {"Sel": "*"});
    if (response["status"] == "success") {
      indexImg = response['Data'].length;
      if (indexImg > 3) {
        indexImg = 3;
      }
      return response;
    }
    return null;
  }

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
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("messages", (route) => true);
            },
            icon: Stack(
              children: [
                Positioned(
                  child: Icon(Icons.notifications_active_outlined, size: 38),
                ),
                numMessage > 0
                    ? Positioned(
                        top: 0,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(255, 86, 86, 1)),
                          child: Center(child: Text("$numMessage")),
                        ),
                      )
                    : Positioned(child: Text(""))
              ],
            )),
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
                  FutureBuilder(
                      future: getItemsImg(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData &&
                            snapshot.data['status'] != 'fail') {
                          return PageView.builder(
                            controller: _cont,
                            itemCount: indexImg,
                            itemBuilder: (context, index) {
                              return AppBarImg(
                                  snapshot.data['Data'][index]['pahtImg'],
                                  snapshot.data['Data'][index]['ID']);
                            },
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Center(
                          child: Text(""),
                        );
                      }),
                  FutureBuilder(
                      future: getItemsImg(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData &&
                            snapshot.data['status'] != 'fail') {
                          return Container(
                            alignment: const Alignment(0, 1.3),
                            child: SmoothPageIndicator(
                              controller: _cont,
                              count: indexImg,
                              effect: SlideEffect(
                                  dotColor: Color.fromRGBO(0, 119, 141, 1),
                                  activeDotColor:
                                      Color.fromRGBO(114, 217, 247, 1)),
                            ),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Center(
                          child: Text(""),
                        );
                      })
                ],
              )),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    on = "*";
                    setState(() {});
                  },
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
                      elevation: MaterialStatePropertyAll(3),
                      side: MaterialStatePropertyAll(
                          BorderSide(color: Colors.black, width: 1)),
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  child: const Text(
                    "الكل",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(37, 37, 37, 1),
                        fontFamily: "ReadexPro"),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    on = "عقار";
                    setState(() {});
                  },
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
                  onPressed: () {
                    on = "مركبات";
                    setState(() {});
                  },
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
                  onPressed: () {
                    on = "اجهزة اكترونية";
                    setState(() {});
                  },
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
                  onPressed: () {
                    on = "اخرى";
                    setState(() {});
                  },
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
          ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                FutureBuilder(
                    future: getItems(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData &&
                          snapshot.data['status'] != 'fail') {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.70),
                          itemCount: snapshot.data['Data'].length,
                          itemBuilder: (context, index) {
                            return CardHome(
                                type: snapshot.data['Data'][index]['type'],
                                Loc: snapshot.data['Data'][index]['region'],
                                name: snapshot.data['Data'][index]['name'],
                                prise: snapshot.data['Data'][index]['price'],
                                img: snapshot.data['Data'][index]['pahtImg'],
                                id: snapshot.data['Data'][index]['ID']
                                    .toString());
                          },
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
              ]),
        ],
      ),
    );
  }

  AppBarImg(String img, int id) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          sharedPreferences.setString("idItem", "$id");
          Navigator.of(context).pushNamedAndRemoveUntil(
            "productHome",
            (route) => true,
          );
        },
        child: Image.network(
          "https://deepmindksa.com/graduation_project_ajar/upload/$img",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
