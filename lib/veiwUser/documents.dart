import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../func/Logic.dart';
import '../func/fin.dart';
import '../main.dart';
import 'documents/documentsCard.dart';

class Documents extends StatefulWidget {
  const Documents({super.key});

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  Crud _crud = Crud();

  getDoc() async {
    var response = await _crud.postResponse(
        "https://deepmindksa.com/graduation_project_ajar/SelectDocument.php",
        {"id": sharedPreferences.getString("id")});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الوثائق",
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
      body: ListView(
        children: [
          FutureBuilder(
              future: getDoc(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData && snapshot.data['status'] != 'fail') {
                  return ListView.builder(
                    itemCount: snapshot.data['Data'].length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return DocumentsCard(
                        name: snapshot.data['Data'][index]['name'],
                        id: snapshot.data['Data'][index]['ID'],
                      );
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
              })
        ],
      ),
    );
  }
}
