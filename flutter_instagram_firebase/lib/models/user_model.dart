import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id, name, profileImageUrl, email, bio;

  User({
    this.id,
    this.name,
    this.profileImageUrl,
    this.email,
    this.bio,
  });
  factory User.fromDoc(DocumentSnapshot doc){
    return User(
      id: doc.documentID,
      name: doc['name'],
      profileImageUrl:doc['profileImageUrl'] ,
      email: doc['email'],
      bio: doc['bio'] ??'',
    );
  }
}
