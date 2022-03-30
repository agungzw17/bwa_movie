part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  final int bottomNavBarIndex;
  final bool isExpired;

  GoToMainPage({this.bottomNavBarIndex = 0, this.isExpired = false});

  @override
  List<Object> get props => [bottomNavBarIndex, isExpired];
}

class GoToRegistrationPage extends PageEvent {
  final RegistrationDataModel registrationDataModel;

  GoToRegistrationPage(this.registrationDataModel);

  @override
  List<Object> get props => [];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationDataModel registrationDataModel;

  GoToPreferencePage(this.registrationDataModel);

  @override
  List<Object> get props => [];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationDataModel registrationDataModel;

  GoToAccountConfirmationPage(this.registrationDataModel);

  @override
  List<Object> get props => [];
}

class GoToMovieDetailPage extends PageEvent {
  final MovieModel movieModel;

  GoToMovieDetailPage(this.movieModel);

  @override
  List<Object> get props => [movieModel];
}

class GoToTicketDetailPage extends PageEvent {
  final TicketModel ticket;

  GoToTicketDetailPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoToSelectSchedulePage extends PageEvent {
  final MovieDetailModel movieDetailModel;
  GoToSelectSchedulePage(this.movieDetailModel);

  @override
  List<Object> get props => [movieDetailModel];
}

class GoToSelectSeatPage extends PageEvent {
  final TicketModel ticketModel;
  GoToSelectSeatPage(this.ticketModel);

  @override
  List<Object> get props => [ticketModel];
}

class GoToCheckoutPage extends PageEvent {
  final TicketModel ticket;

  GoToCheckoutPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoToSuccessPage extends PageEvent {
  final TicketModel ticket;
  final FlutixTransactionModel transaction;

  GoToSuccessPage(this.ticket, this.transaction);

  @override
  List<Object> get props => [ticket, transaction];
}
