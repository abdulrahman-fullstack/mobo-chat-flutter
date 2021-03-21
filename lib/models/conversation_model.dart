import 'package:cloud_firestore/cloud_firestore.dart';

class ConversationsModel {
  static String usersField = 'users';
  static String lastMsgField = 'last_message';
  static String lastMsgSenderField = 'last_message_sender';
  static String unseenCountField = 'unseen_count';
}

class UserConversation {
  final List<String> users;
  final String lastMsg;
  final String lastMsgSender;
  final int unseenCount;

  UserConversation(
    this.users,
    this.lastMsg,
    this.lastMsgSender,
    this.unseenCount,
  );

  factory UserConversation.fromMap(Map data) {
    return UserConversation(
      data[ConversationsModel.usersField],
      data[ConversationsModel.lastMsgField],
      data[ConversationsModel.lastMsgSenderField],
      data[ConversationsModel.unseenCountField],
    );
  }
}
