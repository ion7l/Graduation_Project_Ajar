import 'package:flutter/material.dart';

import '../../func/fin.dart';
import '../../main.dart';

class CardPro extends StatelessWidget {
  Crud _crud = Crud();

  DeleItm() async {
    var response = await _crud.postResponse(
        "http://10.0.2.2/graduation_project_ajar/Dele.php",
        {"id": sharedPreferences.getString("idItem"), "img": img});
  }

  final String name;
  final String descrep;
  final String prise;
  final String img;
  final String id;
  CardPro(
      {super.key,
      required this.name,
      required this.descrep,
      required this.prise,
      required this.img,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Card(
        elevation: 7,
        child: Row(
          children: [
            Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              '$name',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(37, 37, 37, 1),
                                  fontFamily: "ReadexPro",
                                  overflow: TextOverflow.ellipsis),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            width: 100,
                            child: Text(
                              '$descrep',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(37, 37, 37, 1),
                                  fontFamily: "ReadexPro",
                                  overflow: TextOverflow.ellipsis),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 75,
                            child: TextButton(
                              onPressed: () {
                                sharedPreferences.setString("idItem", "${id}");
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  "updata",
                                  (route) => true,
                                );
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Color.fromRGBO(5, 162, 206, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'تعديل',
                                style: TextStyle(
                                    color: Color.fromRGBO(252, 255, 252, 1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ReadexPro"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('$prise',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(37, 37, 37, 1),
                                  fontFamily: "ReadexPro")),
                          Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 75,
                            child: TextButton(
                              onPressed: () {
                                sharedPreferences.setString("idItem", "${id}");
                                DeleItm();
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    "veiwMain", (route) => false);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Color.fromRGBO(255, 86, 86, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'حذف',
                                style: TextStyle(
                                    color: Color.fromRGBO(252, 255, 252, 1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "ReadexPro"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            Flexible(
              flex: 2,
              child: Container(
                height: 170,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  child: Image.network(
                    "http://192.168.1.36/graduation_project_ajar/upload/$img",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
