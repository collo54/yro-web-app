import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/constants/colors.dart';
import 'package:yro/models/likes_model.dart';
import 'package:yro/models/user_model.dart';
import 'package:yro/services/firestore_service.dart';
import 'package:yro/widgets/pic_card.dart';
import 'package:yro/widgets/radio_favourite_widget.dart';

class Photolayout extends StatefulWidget {
  @override
  _PhotoLayoutState createState() => _PhotoLayoutState();
}

class _PhotoLayoutState extends State<Photolayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width / 4, context),
          );
        } else {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width, context),
          );
        }
      },
    );
  }

  Future<void> _submit() async {
    final user = Provider.of<Userre>(context, listen: false);
    final userId = user.uid;
    final likes = Likes(likes: 'true', userId: userId);
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    await firestoreservice.setLikes(likes);
  }

  Future<void> _submit1() async {
    final user = Provider.of<Userre>(context, listen: false);
    final userId = user.uid;
    final likes = Likes(likes: 'true', userId: userId);
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    await firestoreservice.setLikes1(likes);
  }

  Future<void> _submit2() async {
    final user = Provider.of<Userre>(context, listen: false);
    final userId = user.uid;
    final likes = Likes(likes: 'true', userId: userId);
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    await firestoreservice.setLikes2(likes);
  }

  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: kPrimaryLight,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          width: width,
          child: Column(
            children: [
              _buildPhoto1(
                context,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildnumberoflikes(context),
                  YesNoSelection(
                    onPressed: _submit,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.greenAccent[400],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          width: width,
          child: Column(
            children: [
              _buildPhoto2(
                context,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildnumberoflikes1(context),
                  YesNoSelection(
                    onPressed: _submit1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.amberAccent[400],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          width: width,
          child: Column(
            children: [
              _buildPhoto3(
                context,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildnumberoflikes2(context),
                  YesNoSelection(
                    onPressed: _submit2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ];
  }

  Widget _buildnumberoflikes(BuildContext context) {
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    // final user = Provider.of<Userre>(context);
    return StreamBuilder<int>(
      stream: firestoreservice.likesStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messager = snapshot.data;
          if (messager != null) {
            return Text(
              messager.toString(),
            );
          }
          return Text('0');
        }
        if (snapshot.hasError) {
          return Center(child: Text('error occurred'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildnumberoflikes1(BuildContext context) {
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    // final user = Provider.of<Userre>(context);
    return StreamBuilder<int>(
      stream: firestoreservice.likesStream1(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messager = snapshot.data;
          if (messager != null) {
            return Text(
              messager.toString(),
            );
          }
          return Text('0');
        }
        if (snapshot.hasError) {
          return Center(child: Text('error occurred'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildnumberoflikes2(BuildContext context) {
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    // final user = Provider.of<Userre>(context);
    return StreamBuilder<int>(
      stream: firestoreservice.likesStream2(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messager = snapshot.data;
          if (messager != null) {
            return Text(
              messager.toString(),
            );
          }
          return Text('0');
        }
        if (snapshot.hasError) {
          return Center(child: Text('error occurred'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildPhoto1(
    BuildContext context,
  ) {
    return PicCard(
      contributor: null,
      caption: 'top planters',
      heading: 'conservation day',
      name: 'assets/images/watsup1.jpeg',
      onTap: () {},
    );
  }

  Widget _buildPhoto2(
    BuildContext context,
  ) {
    return PicCard(
      contributor: null,
      caption: 'top planters',
      heading: 'conservation day',
      name: 'assets/images/watsup2.jpeg',
      onTap: () {},
    );
  }

  Widget _buildPhoto3(
    BuildContext context,
  ) {
    return PicCard(
      contributor: null,
      caption: 'top planters',
      heading: 'conservation day',
      name: 'assets/images/pic2.jpg',
      onTap: () {},
    );
  }
}

class Photo1layout extends StatefulWidget {
  @override
  _Photo1LayoutState createState() => _Photo1LayoutState();
}

class _Photo1LayoutState extends State<Photo1layout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width / 4, context),
          );
        } else {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width, context),
          );
        }
      },
    );
  }

  Future<void> _submit3() async {
    final user = Provider.of<Userre>(context, listen: false);
    final userId = user.uid;
    final likes = Likes(likes: 'true', userId: userId);
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    await firestoreservice.setLikes3(likes);
  }

  Future<void> _submit4() async {
    final user = Provider.of<Userre>(context, listen: false);
    final userId = user.uid;
    final likes = Likes(likes: 'true', userId: userId);
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    await firestoreservice.setLikes4(likes);
  }

  Future<void> _submit5() async {
    final user = Provider.of<Userre>(context, listen: false);
    final userId = user.uid;
    final likes = Likes(likes: 'true', userId: userId);
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    await firestoreservice.setLikes5(likes);
  }

  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.indigoAccent[400],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          width: width,
          child: Column(
            children: [
              _buildPhoto1(
                context,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildnumberoflikes3(context),
                  YesNoSelection(
                    onPressed: _submit3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          width: width,
          child: Column(
            children: [
              _buildPhoto2(
                context,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildnumberoflikes4(context),
                  YesNoSelection(
                    onPressed: _submit4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.greenAccent[400],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          width: width,
          child: Column(
            children: [
              _buildPhoto3(
                context,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildnumberoflikes5(context),
                  YesNoSelection(
                    onPressed: _submit5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ];
  }

  Widget _buildnumberoflikes3(BuildContext context) {
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    // final user = Provider.of<Userre>(context);
    return StreamBuilder<int>(
      stream: firestoreservice.likesStream3(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messager = snapshot.data;
          if (messager != null) {
            return Text(
              messager.toString(),
            );
          }
          return Text('0');
        }
        if (snapshot.hasError) {
          return Center(child: Text('error occurred'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildnumberoflikes4(BuildContext context) {
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    // final user = Provider.of<Userre>(context);
    return StreamBuilder<int>(
      stream: firestoreservice.likesStream4(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messager = snapshot.data;
          if (messager != null) {
            return Text(
              messager.toString(),
            );
          }
          return Text('0');
        }
        if (snapshot.hasError) {
          return Center(child: Text('error occurred'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildnumberoflikes5(BuildContext context) {
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    // final user = Provider.of<Userre>(context);
    return StreamBuilder<int>(
      stream: firestoreservice.likesStream5(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messager = snapshot.data;
          if (messager != null) {
            return Text(
              messager.toString(),
            );
          }
          return Text('0');
        }
        if (snapshot.hasError) {
          return Center(child: Text('error occurred'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildPhoto1(
    BuildContext context,
  ) {
    return PicCard(
      contributor: null,
      caption: 'top planters',
      heading: 'conservation day',
      name: "assets/images/pic3.jpg",
      onTap: () {},
    );
  }

  Widget _buildPhoto2(
    BuildContext context,
  ) {
    return PicCard(
      contributor: null,
      caption: 'top planters',
      heading: 'conservation day',
      name: "assets/images/pic6.jpg",
      onTap: () {},
    );
  }

  Widget _buildPhoto3(
    BuildContext context,
  ) {
    return PicCard(
      contributor: null,
      caption: 'top planters',
      heading: 'conservation day',
      name: "assets/images/pic4.jpg",
      onTap: () {},
    );
  }
}
