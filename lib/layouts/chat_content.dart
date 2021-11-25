import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yro/constants/colors.dart';
import 'package:yro/models/messager_model.dart';
import 'package:yro/models/user_model.dart';
import 'package:yro/services/firebase_storage_service.dart';
import 'package:yro/services/firestore_service.dart';
import 'package:yro/services/image_picker_service.dart';
import 'package:yro/widgets/avatar.dart';

class Chatcontent extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          decoration: BoxDecoration(
              color: kPrimaryLight,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          width: width,
          child: _buildMessages(),
        ),
      ),
    ];
  }

  Widget _buildMessages() {
    return ListView.separated(
        itemBuilder: (context, index) => _buildMessage(context),
        separatorBuilder: (_, index) => SizedBox(
              height: 15,
            ),
        itemCount: 1);
  }

  Future<void> _chooseAvatar(BuildContext context) async {
    try {
      // 1. Get image from picker
      final imagePicker =
          Provider.of<ImagePickerService>(context, listen: false);
      final file = await imagePicker.pickImage(source: ImageSource.gallery);
      final storage =
          Provider.of<FirebaseStorageService>(context, listen: false);
      final downloadUrl = await storage.uploadAvatar(file: file);
      // 3. Save url to Firestore
      final database = Provider.of<FirestoreService>(context, listen: false);

      await database.setMessage(Messager(downloadUrl: downloadUrl));
      // 4. (optional) delete local file as no longer needed
      await file.delete();
    } catch (e) {
      print(e);
    }
  }

  Widget _buildMessage(BuildContext context) {
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    final user = Provider.of<Userre>(context);
    return StreamBuilder<List<Messager>>(
      stream: firestoreservice.messagerStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messager = snapshot.data!;
          if (messager.isNotEmpty) {
            final children = messager
                .map((messager) => Row(
                      children: [
                        PreferredSize(
                          preferredSize: Size.fromHeight(50.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Avatar(
                                  onPressed: () => user.uid == messager.userId
                                      ? _chooseAvatar(context)
                                      : null,
                                  photoUrl: user.uid == messager.userId
                                      ? messager.downloadUrl ?? user.photoUrl
                                      : null,
                                  radius: 30),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    messager.name!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(messager.time!.substring(0, 16)),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                messager.message!,
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
                .toList();
            return Column(
              children: children,
            );
          }
          return Row(
            children: [
              SizedBox(width: 10),
              Flexible(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text('')
                      ],
                    ),
                    Text(
                      '',
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('error occurred'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width),
          );
        } else {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }
}
