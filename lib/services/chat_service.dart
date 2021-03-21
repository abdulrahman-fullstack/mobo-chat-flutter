import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobochat/constants.dart';
import 'package:mobochat/models/conversation_model.dart';

class ChatService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<UserConversation>> conversations;

  Future getConversations(String uid) async {
    Stream<QuerySnapshot> userConvSnapshot = _db
        .collection(ConversationColl)
        .where(ConversationsModel.usersField, arrayContains: uid)
        .snapshots();
    conversations = userConvSnapshot.map(
      (snap) => snap.docs.map(
        (doc) => UserConversation.fromMap(doc.data()),
      ),
    );
  }
}
