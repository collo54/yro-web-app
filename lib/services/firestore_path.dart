class FirestorePath {
  static String avatar(String uid) => 'avatar/$uid';
  static String contributor(String uid, String contributorId) =>
      'users/$uid/contributors/$contributorId';
  static String contributors(String uid) => 'users/$uid/contributors/';
}
