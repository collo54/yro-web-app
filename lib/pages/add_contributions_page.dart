import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/models/contributor_model.dart';
import 'package:yro/pages/home_page.dart';
import 'package:yro/services/firestore_service.dart';

class AddContributionsPage extends StatefulWidget {
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddContributionsPage(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _AddContributionsPageState createState() => _AddContributionsPageState();
}

class _AddContributionsPageState extends State<AddContributionsPage> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  int _contributionpermonth;
  int _deposited;
  int _withdrawn;

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      final contributor = Contributor(
          name: _name,
          contributionPerMonth: _contributionpermonth,
          deposited: _deposited,
          withdrawn: _withdrawn);
      final firestoreservice =
          Provider.of<FirestoreService>(context, listen: false);
      await firestoreservice.createContibutor(contributor);
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomePage(),
          fullscreenDialog: true,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('New Contribution'),
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildForm(),
          ),
        ),
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
      SizedBox(
        height: 16,
      ),
      TextFormField(
        decoration: InputDecoration.collapsed(
            hintText: 'name',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)))),
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
        decoration: InputDecoration.collapsed(
            hintText: 'contibution per month',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)))),
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        onSaved: (value) => _contributionpermonth = int.parse(value) ?? 0,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 8,
      ),
      TextFormField(
        decoration: InputDecoration.collapsed(
            hintText: 'deposited this month',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)))),
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        onSaved: (value) => _deposited = int.parse(value) ?? 0,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 8,
      ),
      TextFormField(
        decoration: InputDecoration.collapsed(
            hintText: 'withdrawn this month',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)))),
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        onSaved: (value) => _withdrawn = int.parse(value) ?? 0,
        maxLines: 2,
        textAlign: TextAlign.center,
        scrollPadding: EdgeInsets.all(16),
      ),
    ];
  }
}
