import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:yro/models/avatar_reference.dart';
import 'package:yro/models/contributor_model.dart';
import 'package:yro/models/likes_model.dart';
import 'package:yro/models/messager_model.dart';
import 'package:yro/services/firestore_path.dart';
import 'package:flutter/foundation.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreService {
  FirestoreService({@required this.uid}) : assert(uid != null);
  final String uid;

  // reads current contributor data
  Stream<List<Contributor>> contributorsStream() {
    final path = FirestorePath.contributors(uid);
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((
          snapshot,
        ) =>
            Contributor.fromMap(snapshot.data(), snapshot.id))
        .toList());
  }

  // deletes contributor data all documents and subcollections
  Future<void> deleteContibutor(Contributor contributor) async {
    final path = FirestorePath.contributor(uid, contributor.id);
    final reference = FirebaseFirestore.instance.doc(path);
    print('delete: $path');
    await reference.delete();
  }

  Future<void> _set({String path, Map<String, dynamic> data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path: $data');
    await reference.set(data);
  }

  //sets contributor data to users collection
  Future<void> setContibutor(Contributor contributor) async {
    await _set(
        path: FirestorePath.contributor(uid, contributor.id),
        data: contributor.toMap());
  }

  Stream<List<Messager>> messagerStream() {
    final reference = FirebaseFirestore.instance
        .collection('guestbook')
        .limit(50)
        .orderBy('timeStamp', descending: true);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((snapshot) => Messager.fromMap(snapshot.data()))
        .toList());
  }

  //reads number of documents in likes collection
  Stream<int> likesStream() {
    final reference = FirebaseFirestore.instance.collection('likes');

    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => (snapshot.docs.length));
  }

  //reads number of documents in likes collection
  Stream<int> likesStream1() {
    final reference = FirebaseFirestore.instance.collection('likes1');

    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => (snapshot.docs.length));
  }

  //reads number of documents in likes collection
  Stream<int> likesStream2() {
    final reference = FirebaseFirestore.instance.collection('likes2');

    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => (snapshot.docs.length));
  }

  //reads number of documents in likes collection
  Stream<int> likesStream3() {
    final reference = FirebaseFirestore.instance.collection('likes3');

    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => (snapshot.docs.length));
  }

  //reads number of documents in likes collection
  Stream<int> likesStream4() {
    final reference = FirebaseFirestore.instance.collection('likes4');

    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => (snapshot.docs.length));
  }

  //reads number of documents in likes collection
  Stream<int> likesStream5() {
    final reference = FirebaseFirestore.instance.collection('likes5');

    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => (snapshot.docs.length));
  }

// adds likes docs to likes collection  in firebase
  Future<DocumentReference> setLikes(Likes likes) async {
    return await FirebaseFirestore.instance
        .collection('likes')
        .add(likes.toMap());
  }

// adds likes docs to likes collection  in firebase
  Future<DocumentReference> setLikes1(Likes likes) async {
    return await FirebaseFirestore.instance
        .collection('likes1')
        .add(likes.toMap());
  }

  // adds likes docs to likes collection  in firebase
  Future<DocumentReference> setLikes2(Likes likes) async {
    return await FirebaseFirestore.instance
        .collection('likes2')
        .add(likes.toMap());
  }

  // adds likes docs to likes collection  in firebase
  Future<DocumentReference> setLikes3(Likes likes) async {
    return await FirebaseFirestore.instance
        .collection('likes3')
        .add(likes.toMap());
  }

// adds likes docs to likes collection  in firebase
  Future<DocumentReference> setLikes4(Likes likes) async {
    return await FirebaseFirestore.instance
        .collection('likes4')
        .add(likes.toMap());
  }

// adds likes docs to likes collection  in firebase
  Future<DocumentReference> setLikes5(Likes likes) async {
    return await FirebaseFirestore.instance
        .collection('likes5')
        .add(likes.toMap());
  }

  // adds messages to guestbook collection  in firebase
  Future<DocumentReference> setMessage(Messager messager) async {
    return await FirebaseFirestore.instance
        .collection('guestbook')
        .add(messager.toMap());
  }

  // deletes documents on likes collection
  Future<void> deleteLikes(Likes likes) async {
    return await FirebaseFirestore.instance.collection('likes').doc().delete();
  }

  // Sets the avatar download url
  Future<void> setAvatarReference(AvatarReference avatarReference) async {
    final path = FirestorePath.avatar(uid);
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(avatarReference.toMap());
  }

  // Reads the current avatar download url
  Stream<AvatarReference> avatarReferenceStream() {
    final path = FirestorePath.avatar(uid);
    final reference =
        FirebaseFirestore.instance.doc /*(collectionPath)*/ /*document*/ (path);
    final snapshots = reference.snapshots();
    return snapshots
        .map((snapshot) => AvatarReference.fromMap(snapshot.data()));
  }
}
//Stream<List<Contributor>>