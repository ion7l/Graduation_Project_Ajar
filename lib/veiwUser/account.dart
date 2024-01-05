import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../func/Logic.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          children: [
            Container(
              width: double.infinity,
              height: 180,
              margin: EdgeInsets.only(bottom: 20),
              color: Color.fromRGBO(0, 30, 65, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  Text(
                    "الاسم",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(252, 255, 252, 1),
                        fontFamily: "ReadexPro"),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, -1), // changes position of shadow
                  ),
                ],
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("newName", (route) => true);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                    backgroundColor: Color.fromRGBO(252, 255, 252, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'تعديل الملف الشخصي',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(37, 37, 37, 1),
                            fontFamily: "ReadexPro"),
                      ),
                      Icon(
                        Icons.account_box_rounded,
                        color: Color.fromRGBO(37, 37, 37, 1),
                        size: 40,
                      )
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, -1), // changes position of shadow
                  ),
                ],
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "newPassword", (route) => true);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                    backgroundColor: Color.fromRGBO(252, 255, 252, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "تغيير كلمة السر",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(37, 37, 37, 1),
                            fontFamily: "ReadexPro"),
                      ),
                      Icon(
                        Icons.lock_outline,
                        color: Color.fromRGBO(37, 37, 37, 1),
                        size: 40,
                      )
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, -1), // changes position of shadow
                  ),
                ],
              ),
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                    backgroundColor: Color.fromRGBO(255, 146, 146, 0.25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "تسجيل الخروج",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(37, 37, 37, 1),
                            fontFamily: "ReadexPro"),
                      ),
                      Icon(
                        Icons.logout_outlined,
                        color: Color.fromRGBO(242, 78, 30, 1),
                        size: 40,
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}
