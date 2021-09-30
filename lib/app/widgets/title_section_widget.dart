import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TitleSectionWidget extends StatelessWidget {
  final int starNb;
  final String mainTitle;
  final String mainSubtitle;

  const TitleSectionWidget({Key? key, required this.starNb, required this.mainTitle, required this.mainSubtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      
      width: double.infinity,
      height: 70,
      child: Row(
        children: [
          Expanded(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mainTitle,
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                Text(
                  mainSubtitle,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.normal),
                ),
              ],
            )),
          ),
          const SizedBox(
            width: 50,
            child: Icon(Icons.star, color: Colors.deepOrange, size: 34),
          ),
          Container(
            width: 50,
            child: Text(
              "$starNb",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
