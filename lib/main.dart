import 'package:flutter/material.dart';
import 'package:graduation_project/Keys/Login.dart';
import 'package:graduation_project/Keys/Sinup.dart';
import 'package:graduation_project/veiwUser/account/new_Password.dart';
import 'package:graduation_project/veiwUser/home/product_home.dart';
import 'package:graduation_project/veiwUser/main_veiw.dart';
import 'package:graduation_project/veiwUser/account/new_name.dart';
import 'package:graduation_project/veiwUser/products/product.dart';
import 'package:provider/provider.dart';
import 'Start/start.dart';

import 'Start/startUo.dart';
import 'func/Logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Logiec(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StartUp(),
          routes: {
            "start": (context) => Start(),
            "login": (context) => Login(),
            "sinup": (context) => Sinup(),
            "veiwMain": (context) => MainVeiw(),
            "newName": (context) => NewName(),
            "newPassword": (context) => NewPassword(),
            "productHome": (context) => ProductHome(),
            "product": (context) => Product(),
          },
        ));
  }
}
