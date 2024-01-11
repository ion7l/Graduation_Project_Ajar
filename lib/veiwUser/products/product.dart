import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: ListView(
                    children: [
                      Form(
                          child: Column(
                        children: [
                          TextFormField(
                              textDirection: TextDirection.rtl,
                              decoration: const InputDecoration(
                                labelText: "الاسم",
                                contentPadding: EdgeInsets.all(25),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color.fromRGBO(37, 37, 37, 1)), borderRadius: BorderRadius.all(Radius.circular(30))),
                                border: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color.fromRGBO(37, 37, 37, 1)), borderRadius: BorderRadius.all(Radius.circular(30))),
                              )),
                          SizedBox(height: 25),
                          TextFormField(
                              textDirection: TextDirection.rtl,
                              decoration: const InputDecoration(
                                labelText: "الوصف",
                                contentPadding: EdgeInsets.all(25),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color.fromRGBO(37, 37, 37, 1)), borderRadius: BorderRadius.all(Radius.circular(30))),
                                border: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color.fromRGBO(37, 37, 37, 1)), borderRadius: BorderRadius.all(Radius.circular(30))),
                              )),
                          SizedBox(height: 25),
                          Container(
                            height: 73,
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(30),
                              isExpanded: true,
                              underline: SizedBox(),
                              hint: Text('النوع'),
                              items: [
                                DropdownMenuItem(child: Text('data'), value: 'data'),
                                DropdownMenuItem(child: Text('data'), value: 'data'),
                                DropdownMenuItem(child: Text('data'), value: 'data'),
                                DropdownMenuItem(child: Text('data'), value: 'data'),
                              ],
                              onChanged: (value) {},
                            ),
                          ),
                          SizedBox(height: 25),
                          Container(
                            height: 73,
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(30),
                              isExpanded: true,
                              underline: SizedBox(),
                              hint: Text('المنطقة'),
                              items: [
                                DropdownMenuItem(child: Text('data'), value: 'data'),
                                DropdownMenuItem(child: Text('data'), value: 'data'),
                                DropdownMenuItem(child: Text('data'), value: 'data'),
                                DropdownMenuItem(child: Text('data'), value: 'data'),
                              ],
                              onChanged: (value) {},
                            ),
                          ),
                          SizedBox(height: 25),
                          TextFormField(
                              textDirection: TextDirection.rtl,
                              decoration: const InputDecoration(
                                labelText: "السعر",
                                contentPadding: EdgeInsets.all(25),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color.fromRGBO(37, 37, 37, 1)), borderRadius: BorderRadius.all(Radius.circular(30))),
                                border: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color.fromRGBO(37, 37, 37, 1)), borderRadius: BorderRadius.all(Radius.circular(30))),
                              )),
                          SizedBox(height: 25),
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(5, 162, 206, 1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                                    builder: (context) {
                                      return Container(
                                        height: 180,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8, right: 8),
                                              child: Text(
                                                'اختيار الصورة من',
                                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'المعرض',
                                                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    Icons.photo_outlined,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.black,
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'الكاميرا',
                                                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    Icons.camera_alt_outlined,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'ارفاق صور',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.photo,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(height: 25),
                        ],
                      ))
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(0, 39, 65, 1),
                        ),
                        child: Center(
                            child: Text(
                          'نشر',
                          style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                        )),
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
