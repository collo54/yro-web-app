import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/constants/colors.dart';
import 'package:yro/models/messager_model.dart';
import 'package:yro/services/AuthService.dart';

class NewSignUp extends StatelessWidget {
  final messgeList = Messager;
  final AuthService _auth = AuthService();

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      final user = await auth.signInAnonymously();
      print('uid: ${user.uid}');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width / 2, context),
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

  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        width: width,
        child: _buildMessage(context),
      ),
    ];
  }

  /* Widget _buildMessages() {
    return ListView.separated(
        itemBuilder: (context, index) => _buildMessage(context),
        separatorBuilder: (_, index) => SizedBox(
              height: 15,
            ),
        itemCount: 1);
  }*/

  Widget _buildMessage(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 35, left: 16),
        child: Text(
          "Welcome to yro",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 14, left: 16),
        child: Text(
          "sign up to continue",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black45),
        ),
      ),
      SizedBox(
        height: 16,
      ),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 15), child: _buildForm()),
      SizedBox(
        height: 30,
      ),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: _buildButtons(context)),
    ]);
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          minWidth: 200,
          color: Colors.yellow[700],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(13.0))),
          onPressed: () => _signInAnonymously(context),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              "Sign Up anonymously",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        MaterialButton(
          color: kGreyLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          onPressed: () async {
            dynamic usercredential = await _auth.signInWithGoogle();
            if (usercredential == null) {
              print('error siging in');
            } else {
              print('signed in');
              print(usercredential.uid);
            }
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              "Sign Up with google",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      SizedBox(
        height: 16,
      ),
      TextFormField(
        style: TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          labelText: 'Name',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter your name';
          }
          return null;
        },
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 8,
      ),
      TextFormField(
        style: TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          labelText: 'Email',
        ),
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 8,
      ),
      TextFormField(
        obscureText: true,
        style: TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline_sharp),
          labelText: 'Password',
        ),
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        maxLines: 1,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 8,
      ),
    ];
  }
}
