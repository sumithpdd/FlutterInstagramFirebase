import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_firebase/models/user_model.dart';
import 'package:flutter_instagram_firebase/screens/edit_profile_screen.dart';
import 'package:flutter_instagram_firebase/utilities/constants.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  const ProfileScreen({this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: usersRef.document(widget.userId).get(),
          builder: (BuildContext context, AsyncSnapshot snapshots) {
            if (!snapshots.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            User _user = User.fromDoc(snapshots.data);
            return ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.grey ,
                        backgroundImage: _user.profileImageUrl.isEmpty
                            ? AssetImage('assets/images/user_placeholder.jpg')
                            : CachedNetworkImageProvider(_user.profileImageUrl),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '12',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text('Posts',
                                        style: TextStyle(
                                          color: Colors.black54,
                                        ))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '386',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text('followers',
                                        style: TextStyle(
                                          color: Colors.black54,
                                        ))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '345',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text('following',
                                        style: TextStyle(
                                          color: Colors.black54,
                                        ))
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: 200.0,
                              child: FlatButton(
                                  onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                EditProfileScreen(user: _user)),
                                      ),
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  child: Text(
                                    'Edit Profile',
                                    style: TextStyle(fontSize: 18.0),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _user.name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        height: 80.0,
                        child: Text(
                          _user.bio,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Divider()
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
