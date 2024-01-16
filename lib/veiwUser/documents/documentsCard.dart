import 'package:flutter/material.dart';

import '../../main.dart';

class DocumentsCard extends StatelessWidget {
  final name;
  final id;
  const DocumentsCard({super.key, this.name, this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: InkWell(
        onTap: () {
          sharedPreferences.setString("idItem", "$id");
          Navigator.of(context)
              .pushNamedAndRemoveUntil("document", (route) => true);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 7,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$name-$id',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.file_copy_rounded,
                  size: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
