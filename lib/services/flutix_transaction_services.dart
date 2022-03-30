part of 'services.dart';

class FlutixTransactionServices {
  static CollectionReference transactionCollection =
  FirebaseFirestore.instance.collection('transactions');

  static Future<void> saveTransaction(
      FlutixTransactionModel flutixTransaction) async {
    await transactionCollection.doc().set({
      'userID': flutixTransaction.userID,
      'title': flutixTransaction.title,
      'subtitle': flutixTransaction.subtitle,
      'time': flutixTransaction.time?.millisecondsSinceEpoch,
      'amount': flutixTransaction.amount,
      'picture': flutixTransaction.picture
    });
  }

  static Future<List<FlutixTransactionModel>> getTransaction(String userID) async {
    QuerySnapshot snapshot = await transactionCollection.get();

    var documents = snapshot.docs
        .where((document) => document['userID']== userID);

    return documents
        .map((e) => FlutixTransactionModel(
        userID: e['userID'],
        title: e['title'],
        subtitle: e['subtitle'],
        time: DateTime.fromMillisecondsSinceEpoch(e['time']),
        amount: e['amount'],
        picture: e['picture']))
        .toList();
  }
}
