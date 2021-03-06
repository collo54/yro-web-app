import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yro/models/avatar_reference.dart';
import 'package:yro/services/firebase_storage_service.dart';
import 'package:yro/services/firestore_service.dart';
import 'package:yro/services/image_picker_service.dart';
import 'package:yro/widgets/avatar.dart';

class AvatorWidget extends StatelessWidget {
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
      final userId = FirebaseAuth.instance.currentUser!.uid;
      await database.setAvatarReference(
          AvatarReference(downloadUrl: downloadUrl, userId: userId));
      // 4. (optional) delete local file as no longer needed
      await file.delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildUserInfo(context: context),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildUserInfo({required BuildContext context}) {
    final database = Provider.of<FirestoreService>(context, listen: false);

    return StreamBuilder<AvatarReference>(
      stream: database.avatarReferenceStream(),
      builder: (context, snapshot) {
        final avatarReference = snapshot.data;
        return Avatar(
          photoUrl: avatarReference?.downloadUrl,
          radius: 35,
          borderColor: Colors.blueGrey[100],
          borderWidth: 1.0,
          onPressed: () => _chooseAvatar(context),
        );
      },
    );
  }
}
