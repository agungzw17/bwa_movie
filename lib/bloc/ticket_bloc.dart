import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bwa_movie/models/models.dart';
import 'package:bwa_movie/services/services.dart';
import 'package:equatable/equatable.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketState([])) {
    on<BuyTicket>((event, emit) async* {
      await TicketServices.saveTicket(event.userID, event.ticket);

      List<TicketModel> tickets = state.tickets + [event.ticket];

      emit(TicketState(tickets));
    });
    on<GetTickets>((event, emit) async* {
      List<TicketModel> tickets = await TicketServices.getTickets(event.userID);

      emit(TicketState(tickets));
    });
  }

  // @override
  // Stream<TicketState> mapEventToState(
  //     TicketEvent event,
  //     ) async* {
  //   if(event is BuyTicket) {
  //     await TicketServices.saveTicket(event.userID, event.ticket);
  //
  //     List<TicketModel> tickets = state.tickets + [event.ticket];
  //
  //     yield TicketState(tickets);
  //   } else if(event is GetTickets) {
  //     List<TicketModel> tickets = await TicketServices.getTickets(event.userID);
  //
  //     yield TicketState(tickets);
  //   }
  // }
}
