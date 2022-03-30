part of 'models.dart';

class TicketModel extends Equatable {
  final MovieDetailModel movieDetailModel;
  final TheaterModel theaterModel;
  final DateTime time;
  final String bookingCode;
  final List<String>? seats;
  final String? name;
  final int? totalPrice;

  TicketModel(this.movieDetailModel, this.theaterModel, this.time,
      this.bookingCode, this.seats, this.name, this.totalPrice);

  TicketModel copyWith({
    MovieDetailModel? movieDetailModel,
    TheaterModel? theaterModel,
    DateTime? time,
    String? bookingCode,
    List<String>? seats,
    String? name,
    int? totalPrice,
  }) =>
      TicketModel(
          movieDetailModel ?? this.movieDetailModel,
          theaterModel ?? this.theaterModel,
          time ?? this.time,
          bookingCode ?? this.bookingCode,
          seats ?? this.seats,
          name!,
          totalPrice ?? this.totalPrice);

  String get seatsInString {
    String s = '';

    for(var seat in seats!) {
      s += seat + ((seat != seats!.last) ? ', ' : '');
    }

    return s;
  }

  @override
  List<Object> get props => [
        movieDetailModel,
        theaterModel,
        time,
        bookingCode,
        seats!,
        name!,
        totalPrice!
      ];
}
