class AvatarReference {
  AvatarReference({this.downloadUrl, this.userId});
  final String downloadUrl;
  final String userId;
  factory AvatarReference.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String downloadUrl = data['downloadUrl'];
    final String userId = data['userId'];
    if (downloadUrl == null) {
      return null;
    }
    return AvatarReference(downloadUrl: downloadUrl, userId: userId);
  }

  Map<String, dynamic> toMap() {
    return {
      'downloadUrl': downloadUrl,
      'userId': userId,
    };
  }
}
