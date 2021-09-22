import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/constants/colors.dart';
import 'package:yro/layouts/chat_content.dart';
import 'package:yro/models/messager_model.dart';
import 'package:yro/services/firestore_service.dart';

class ChatFirebase extends StatefulWidget {
  const ChatFirebase({Key key, this.messager}) : super(key: key);
  final Messager messager;

  static Future<void> show(BuildContext context, {Messager messager}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatFirebase(
          messager: messager,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _ChatFirebaseState createState() => _ChatFirebaseState();
}

class _ChatFirebaseState extends State<ChatFirebase> {
  final _formKey = GlobalKey<FormState>();

  String _name;

  String _message;

  @override
  void initState() {
    super.initState();
    if (widget.messager != null) {
      _name = widget.messager.name;
      // _message = widget.messager.message;
    }
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      form.reset();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      final userId = FirebaseAuth.instance.currentUser.uid;
      final timeStamp = DateTime.now().millisecondsSinceEpoch;
      final time = DateTime.now().toIso8601String();
      final messager = Messager(
          time: time,
          message: _message,
          timeStamp: timeStamp,
          name: _name,
          userId: userId);
      final firestoreservice =
          Provider.of<FirestoreService>(context, listen: false);
      await firestoreservice.setMessage(messager);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(widget.messager == null ? 'New Chat' : 'chat'),
      ),
      body: Center(child: _buildContents()),
      backgroundColor: kPrimaryLight,
      floatingActionButton: MaterialButton(
        color: Colors.indigo[700],
        shape: CircleBorder(side: BorderSide.none),
        onPressed: _submit,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Icon(
            Icons.send,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildContents() {
    return Column(
      children: [
        Expanded(child: Container(child: Chatcontent())),
        Padding(
          padding: const EdgeInsets.only(bottom: 7, left: 25, right: 25),
          child: _buildForm(),
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
      TextFormField(
        decoration: InputDecoration(
          fillColor: kGreyLight.withOpacity(0.2),
          filled: true,
          labelText: 'name',
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
        ),
        initialValue: _name != null ? '$_name' : null,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'enter your name';
          }
          return null;
        },
        onSaved: (value) => _name = value,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        decoration: InputDecoration(
          fillColor: kGreyLight.withOpacity(0.2),
          filled: true,
          labelText: 'enter chat message ...',
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
        ),
        initialValue: _message,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'enter mesage';
          }
          return null;
        },
        onSaved: (value) => _message = value,
        maxLines: 2,
        textAlign: TextAlign.start,
      ),
    ];
  }
}
