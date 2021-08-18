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
          height: 620,
          width: 1400,
          child: Image.asset('assets/images/watsup1.jpeg', fit: BoxFit.cover),
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
                        "Home",
                        style: TextStyle(color: Colors.black87, fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/Home');
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
                        Navigator.of(context).pushNamed('/Aboutus');
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
          child: Image.asset('assets/images/watsup1.jpeg', fit: BoxFit.cover),
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
                    color: Colors.black87,
                    fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        "Home",
                        style: TextStyle(color: Colors.black87),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/Home');
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      child: Text(
                        "About Us",
                        style: TextStyle(color: Colors.black87),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/Aboutus');
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      child: Text(
                        "Portfolio",
                        style: TextStyle(color: Colors.black87),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/Portfoliopage');
                      },
                    ),
                    /*Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: MaterialButton(
                      padding: EdgeInsets.all(2),
                      color: Colors.green[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 40.0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  )*/
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
