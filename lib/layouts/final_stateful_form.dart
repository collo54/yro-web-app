import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/constants/colors.dart';
import 'package:yro/services/AuthService.dart';

enum EmailSignInFormType { signIn, register }

class FinalstatefulForm extends StatefulWidget {
  @override
  _FinalstatefulFormState createState() => _FinalstatefulFormState();
}

class _FinalstatefulFormState extends State<FinalstatefulForm> {
  final _formKey = GlobalKey<FormState>();
  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  String _email;
  String _password;

  void _toogleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    final form = _formKey.currentState;
    form.reset();
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      final user = await auth.signInAnonymously();
      print('uid: ${user.uid}');
    } catch (e) {
      print(e);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      final user = await auth.signInWithGoogle();
      print('uid: ${user.uid}');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _submit() async {
    try {
      if ((_formType == EmailSignInFormType.signIn) &&
          (_validateAndSaveForm())) {
        print('$_email');
        final auth = Provider.of<AuthService>(context, listen: false);
        await auth.signInWithEmailAndPassword(_email, _password);
      } else {
        print('$_email');
        final auth = Provider.of<AuthService>(context, listen: false);
        await auth.createUserWithEmailAndPassword(_email, _password);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
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
            color: Colors.white70,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        width: width,
        child: _buildMessage(context),
      ),
    ];
  }

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
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          minWidth: 200,
          color: Colors.green[700],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(13.0))),
          onPressed: _submit,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              primaryText,
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
        TextButton(
          onPressed: _toogleFormType,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              secondaryText,
              style: TextStyle(
                  color: kPrimaryDark,
                  fontSize: 15,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
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
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          onPressed: () => _signInWithGoogle(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/google-logo.png"),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Sign Up with google",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontStyle: FontStyle.normal),
                ),
              ],
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
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      SizedBox(
        height: 8,
      ),
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'enter your email';
          }
          return null;
        },
        initialValue: _email,
        onSaved: (value) => _email = value,
        style: TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          labelText: 'Email',
        ),
        keyboardType: TextInputType.emailAddress,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 16,
      ),
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'enter your password';
          }
          return null;
        },
        onSaved: (value) => _password = value,
        initialValue: _password,
        obscureText: true,
        style: TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline_sharp),
          labelText: 'Password',
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
