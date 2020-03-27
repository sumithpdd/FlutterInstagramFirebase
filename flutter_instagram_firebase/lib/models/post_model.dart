import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id, imageUrl, caption, authorId;
  final dynamic likes;
  final Timestamp timestamp;

  Post({
    this.id,
    this.imageUrl,
    this.caption,
    this.likes,
    this.authorId,
    this.timestamp,
  });
  factory Post.fromDoc(DocumentSnapshot doc) {
    return Post(
      id: doc.documentID,
      imageUrl: doc['imageUrl'],
      caption: doc['caption'],
      likes: doc['likes'],
      authorId: doc['authorId'],
      timestamp: doc['timestamp'],
    );
  }
}
