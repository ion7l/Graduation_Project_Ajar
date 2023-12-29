import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../func/Logic.dart';

class MainVeiw extends StatefulWidget {
  const MainVeiw({super.key});

  @override
  State<MainVeiw> createState() => _MainVeiwState();
}

class _MainVeiwState extends State<MainVeiw> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Consumer<Logiec>(
            builder: (context, value, child) => Scaffold(
                  body: value.Page[value.index],
                )));
  }
}
