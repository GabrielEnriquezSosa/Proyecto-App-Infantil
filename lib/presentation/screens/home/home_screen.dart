import 'package:flutter/material.dart';
import 'package:proyecto_infantil/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Menu de Principal"),
        centerTitle: true,
        backgroundColor: const Color(0x71D59F09),
      ),
      endDrawer: SideMenu(scaffoldKey: scaffoldKey),
      body: Container(
        decoration: BoxDecoration(color: const Color(0xDDD59E09)),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/img/logo_tecnm.png",
                  fit: BoxFit.cover,
                  height: 100,
                ),
                Expanded(
                  child: Text(
                    "Técnologico Nacional de México",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Exo2',
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Instituto Técnologico de Tuxtepec",
              style: TextStyle(
                fontSize: 33,
                fontFamily: 'Exo2',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Image.asset("assets/img/ittux_logo.png", fit: BoxFit.contain),
            SizedBox(height: 100),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  "assets/img/logo_ittux.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
