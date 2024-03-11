import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_chat/src/services/auth0_service.dart';

class Profile extends StatefulWidget {
  final Credentials? credentials;
  const Profile({Key? key, this.credentials}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _nicknameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the nickname controller with the nickname from credentials if available
    _nicknameController.text = widget.credentials?.user.nickname ?? '';
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  handleSaveDisplayName() {
    final auth0Service = Auth0Service();

    auth0Service.updateUser(widget.credentials?.user.sub ?? '', {
      'nickname': _nicknameController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300, // Set your desired width here
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_VLz-YY6O2ZWcQN5tXnJOvBMctJ_WG28uxw&usqp=CAU',
              ),
            ),
            SizedBox(height: 10), // Adds space between the avatar and TextField
            Text('Email: ${widget.credentials?.user.email}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            TextField(
              controller: _nicknameController,
              decoration: InputDecoration(
                labelText: 'Display Name',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
                hintText: 'Enter your display name',
              ),
            ),
            ElevatedButton(
                onPressed: handleSaveDisplayName, child: Text('Save'))
            // Add more widgets or buttons as needed
          ],
        ),
      ),
    );
  }
}
