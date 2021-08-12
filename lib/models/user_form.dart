import 'package:flutter/material.dart';
import 'package:yro/models/user_model.dart';

typedef OnDelete();

class UserForm extends StatefulWidget {
  final Userre user;
  final state = _UserFormState();
  final OnDelete onDelete;

  UserForm({Key key, this.user, this.onDelete});
  // ignore: empty_constructor_bodies
  @override
  _UserFormState createState() => state;
  bool isValid() => state.validate();
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(
                  Icons.people,
                  color: Colors.black,
                ),
                title: Text(
                  'Registration form',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.save),
                    onPressed: () {},
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  initialValue: widget.user.uid,
                  onSaved: (val) => widget.user.uid,
                  validator: (val) => val.length > 3 ? null : 'member number',
                  decoration: InputDecoration(
                      labelText: 'member number',
                      hintText: 'enter your member number'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  initialValue: widget.user.email,
                  onSaved: (val) => widget.user.email,
                  validator: (val) => val.contains('@') ? null : 'email',
                  decoration: InputDecoration(
                      labelText: 'email', hintText: 'enter your email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  initialValue: widget.user.password,
                  onSaved: (val) => widget.user.password,
                  validator: (val) => val.length > 6 ? null : 'password',
                  decoration: InputDecoration(
                      labelText: 'password', hintText: 'enter your password'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validate() {
    var valid = form.currentState.validate();
    if (valid) form.currentState.save();
    return valid;
  }
}
