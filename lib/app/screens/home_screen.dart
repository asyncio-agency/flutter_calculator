import 'package:flutter/material.dart';
import 'package:smart_calculator/app/widgets/title_section_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const TitleSectionWidget(
              starNb: 12,
              mainTitle: "Toto",
              mainSubtitle: "Sub title",
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: double.infinity,
                    color: Colors.black,
                    child: const Center(
                      child: Text(
                        'Bonjour',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: double.infinity,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.deepPurple,
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.cyan,
            ),
          ],
        ),
      ),
    );
  }
}
