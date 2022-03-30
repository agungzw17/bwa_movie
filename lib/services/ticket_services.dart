part of 'services.dart';

class TicketServices {
  static CollectionReference ticketCollection = FirebaseFirestore.instance.collection('tickets');

  static Future<void> saveTicket(String id, TicketModel ticketModel) async {
    await ticketCollection.doc().set({
      'movieID': ticketModel.movieDetailModel.id ?? "",
      'userID': id,
      'theaterName': ticketModel.theaterModel.name,
      'time': ticketModel.time.millisecondsSinceEpoch,
      'bookingCode': ticketModel.bookingCode,
      'seats': ticketModel.seatsInString,
      'name': ticketModel.name,
      'totalPrice': ticketModel.totalPrice
    });
  }

  static Future<List<TicketModel>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.get();
    var documents = snapshot.docs
        .where((document) => document['userID'] == userId);

    List<TicketModel> tickets = [];
    for (var document in documents) {
      MovieDetailModel movieDetailModel =
      await MovieServices.getDetails(null, movieID: document['movieID']);
      tickets.add(TicketModel(
          movieDetailModel,
          TheaterModel(document['theaterName']),
          DateTime.fromMillisecondsSinceEpoch(document['time']),
          document['bookingCode'],
          document['seats'].toString().split(','),
          document['name'],
          document['totalPrice']));
    }

    return tickets;
  }
}