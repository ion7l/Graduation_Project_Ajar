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
      appBar: AppBar(
        title: const Text(
          "الحساب",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Color.fromRGBO(0, 30, 65, 1),
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
      body: const Center(
        child: Text("Account"),
      ),
    );
  }
}