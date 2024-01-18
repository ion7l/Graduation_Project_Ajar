import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/func/fin.dart';
import 'package:graduation_project/veiwUser/products/productCard.dart';
import 'package:provider/provider.dart';

import '../func/Logic.dart';
import '../main.dart';
import 'main_veiw.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> with Crud {
  Crud _crud = Crud();

  getPro() async {
    var response = await _crud.postResponse(
        "https://deepmindksa.com/graduation_project_ajar/SelectProMy.php",
        {"id": sharedPreferences.getString("id")});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            FutureBuilder(
                future: getPro(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData && snapshot.data['status'] != 'fail') {
                    return ListView.builder(
                      itemCount: snapshot.data['Data'].length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CardPro(
                            id: snapshot.data['Data'][index]['ID'].toString(),
                            name: snapshot.data['Data'][index]['name'],
                            descrep: snapshot.data['Data'][index]
                                ['description'],
                            prise: snapshot.data['Data'][index]['price'],
                            img: snapshot.data['Data'][index]['pahtImg']);
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(0, 39, 65, 1),
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("product", (route) => true);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
