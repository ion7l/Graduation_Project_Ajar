import 'package:flutter/material.dart';

import '../../main.dart';

class CardHome extends StatelessWidget {
  final String name;
  final String type;
  final String Loc;
  final String prise;
  final String id;
  final String img;
  const CardHome(
      {super.key,
      required this.name,
      required this.type,
      required this.Loc,
      required this.prise,
      required this.img,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 7,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(
              "https://deepmindksa.com/graduation_project_ajar/upload/$img",
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
                  margin: EdgeInsets.only(left: 6),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(85, 164, 195, 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '$type',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(252, 255, 252, 1),
                        fontFamily: "ReadexPro"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(85, 164, 195, 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '$Loc',
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
            child: Text(
              '$name',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(37, 37, 37, 1),
                  fontFamily: "ReadexPro"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '$prise',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(37, 37, 37, 1),
                  fontFamily: "ReadexPro"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7, right: 7, bottom: 2),
            child: Center(
              child: Container(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      sharedPreferences.setString("idItem", "$id");
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        "productHome",
                        (route) => true,
                      );
                    },
                    style: TextButton.styleFrom(
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
            ),
          ),
        ],
      ),
    );
  }
}
