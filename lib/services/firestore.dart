import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class FireStoreProvider {
  Firestore _firestore = Firestore.instance;
  int linkID;
  String userLink;
  List userLinkList;

  Future<String> getLink(linkCode) async {
    final linkList = await _firestore
        .collection('links')
        .where("id", isEqualTo: linkCode)
        .getDocuments();
    for (var link in linkList.documents) {
      print(link.data);
      userLinkList = link.data.values.toList();
      print(userLinkList);
      userLink = userLinkList[0];
    }
    return userLink;
  }

  Future<int> getCode(linkText) async {
    linkID = Random().nextInt(99999);
    _firestore.collection('links').add({'link': linkText, 'id': linkID});
    return linkID;
  }
}
