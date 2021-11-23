class Likes {
  final String likes;
  final String userId;
  Likes({
    this.likes,
    this.userId,
  });

  factory Likes.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String likes = data['true'];
    final String userId = data['userId'];

    if (likes == null) {
      return null;
    }
    return Likes(
      likes: likes,
      userId: userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "likes": likes,
      "userId": userId,
    };
  }
}
