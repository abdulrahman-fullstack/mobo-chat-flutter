import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobochat/models/conversation_model.dart';
import 'package:provider/provider.dart';

class Chat extends StatelessWidget {
  // final AuthService _authService = AuthService();
  // final ChatService _chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    List<UserConversation> conversations =
        Provider.of(context)<List<UserConversation>>(context);
    User _currentUser = Provider.of(context)<User>(context);

    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Chats",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25.0,
                        fontFamily: 'BalooBhaina'),
                  ),
                ),
              ],
            ),
            ...conversations.map((conv) => Text(conv.users.first))
          ],
        ),
      ),
    );
  }
}
