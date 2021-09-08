import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          width: 1400,
          child: Image.asset("assets/images/watsup1.jpeg", fit: BoxFit.cover),
          // Image.asset("assets/images/watsup2.jpeg", fit: BoxFit.cover),
          // Image.asset("assets/images/watsup5.jpeg", fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 170),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Y  R  O",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        "LandingPage",
                        style: TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/LandingPage');
                      },
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      child: Text(
                        "About Us",
                        style: TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/AboutusPage');
                      },
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      child: Text(
                        "Portfolio",
                        style: TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/Portfoliopage');
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 420,
          width: 800,
          child: Image.asset("assets/images/watsup1.jpeg", fit: BoxFit.cover),
          //  Image.asset("assets/images/watsup2.jpeg", fit: BoxFit.cover),
          // Image.asset("assets/images/watsup5.jpeg", fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Container(
            child: Column(children: <Widget>[
              Text(
                "  Y  R  O ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        "landingPage",
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/LandingPage');
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      child: Text(
                        "About Us",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/AboutusPage');
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      child: Text(
                        "Portfolio",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/Portfoliopage');
                      },
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
