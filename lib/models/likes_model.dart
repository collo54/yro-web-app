class Likes {
  final String? likes;
  final String? userId;
  Likes({
    this.likes,
    this.userId,
  });

  factory Likes.fromMap(Map<String, dynamic> data) {
    final String? likes = data['true'];
    final String? userId = data['userId'];

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
