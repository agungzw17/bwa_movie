part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  final int bottomNavBarIndex;
  final bool isExpired;

  OnMainPage({this.bottomNavBarIndex = 0, this.isExpired = false});

  @override
  List<Object> get props => [bottomNavBarIndex, isExpired];
}

class OnRegistrationPage extends PageState {
  final RegistrationDataModel registrationDataModel;

  OnRegistrationPage(this.registrationDataModel);

  @override
  List<Object> get props => [];
}

class OnPreferencePage extends PageState {
  final RegistrationDataModel registrationDataModel;

  OnPreferencePage(this.registrationDataModel);

  @override
  List<Object> get props => [];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationDataModel registrationDataModel;

  OnAccountConfirmationPage(this.registrationDataModel);

  @override
  List<Object> get props => [];
}

class OnMovieDetailPage extends PageState {
  final MovieModel movieModel;

  OnMovieDetailPage(this.movieModel);

  @override
  // TODO: implement props
  List<Object> get props => [movieModel];

}

class OnTicketDetailPage extends PageState {
  final TicketModel ticket;

  OnTicketDetailPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnSelectSchedulePage extends PageState {
  final MovieDetailModel movieDetailModel;
  OnSelectSchedulePage(this.movieDetailModel);

  @override
  List<Object> get props => [];
}

class OnSelectSeatPage extends PageState {

  final TicketModel ticketModel;
  OnSelectSeatPage(this.ticketModel);

  @override
  List<Object> get props => [ticketModel];
}

class OnCheckoutPage extends PageState {
  final TicketModel ticket;

  OnCheckoutPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnSuccessPage extends PageState {
  final TicketModel ticket;
  final FlutixTransactionModel transaction;

  OnSuccessPage(this.ticket, this.transaction);

  @override
  List<Object> get props => [ticket, transaction];
}