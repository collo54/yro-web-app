class AvatarReference {
  AvatarReference({this.downloadUrl, this.userId});
  final String? downloadUrl;
  final String? userId;
  factory AvatarReference.fromMap(Map<String, dynamic>? data) {
    final String? downloadUrl = data!['downloadUrl'];
    final String? userId = data['userId'];

    return AvatarReference(downloadUrl: downloadUrl, userId: userId);
  }

  Map<String, dynamic> toMap() {
    return {
      'downloadUrl': downloadUrl,
      'userId': userId,
    };
  }
}
