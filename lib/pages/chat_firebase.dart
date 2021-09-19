import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      final timeZone = DateTime.now().timeZoneName;
      final time = DateTime.now().toIso8601String();
      print(timeZone);
      final messager = Messager(
          time: time,
          message: _message,
          timeZone: timeZone,
          timeStamp: timeStamp,
          name: _name,
          userId: userId);
      final firestoreservice =
          Provider.of<FirestoreService>(context, listen: false);
      await firestoreservice.setMessage(messager);
      /* await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomePage(),
          fullscreenDialog: true,
        ),);*/

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(widget.messager == null ? 'New Chat' : ' chat'),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Save',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: _submit,
          ),
        ],
      ),
      body: _buildContents(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContents() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 400, child: Chatcontent()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildForm(),
          ),
        ],
      ),
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
          labelText: 'name',
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
        height: 8,
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'enter chat message',
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
      SizedBox(
        height: 16,
      ),
    ];
  }
}
