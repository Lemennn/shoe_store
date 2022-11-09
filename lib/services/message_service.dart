import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/models/message_model.dart';
import 'package:store/models/product_models.dart';
import 'package:store/models/user_models.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessageFromUserId({int? userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        result.sort((MessageModel a, MessageModel b) =>
            a.createdAt!.compareTo(b.createdAt!));

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }
  
  Future<void> messages({UserModel? user, ProductModel? product,
      bool? isFromUser, String? message}) async {
    try {
      firestore.collection('messages').add({
        'userId': user?.id,
        'userName': user?.username,
        'userImage': user?.profilePhotoUrl,
        'isFromUser': isFromUser,
        'product':
            product is UninitializedProductModel ? {} : product?.toJson(),
        'message': message,
        'created_at': DateTime.now().toString(),
        'updated_at': DateTime.now().toString()
      }).then((value) => print('Pesan Berhasil Dikirim'));
    } catch (e) {
      throw Exception('Pesan gagal Dikirim');
    }
  }

  
}
