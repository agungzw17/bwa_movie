import 'package:bwa_movie/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'page_state.dart';
part 'page_event.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage()) {
    on<GoToSplashPage>((event, emit) => emit(OnSplashPage()));
    on<GoToLoginPage>((event, emit) => emit(OnLoginPage()));
    on<GoToMainPage>((event, emit) => emit(OnMainPage(bottomNavBarIndex: event.bottomNavBarIndex, isExpired: event.isExpired)));
    on<GoToRegistrationPage>((event, emit) => emit(OnRegistrationPage(event.registrationDataModel)));
    on<GoToPreferencePage>((event, emit) => emit(OnPreferencePage(event.registrationDataModel)));
    on<GoToAccountConfirmationPage>((event, emit) => emit(OnAccountConfirmationPage(event.registrationDataModel)));
    on<GoToMovieDetailPage>((event, emit) => emit(OnMovieDetailPage(event.movieModel)));
    on<GoToSelectSchedulePage>((event, emit) => emit(OnSelectSchedulePage(event.movieDetailModel)));
    on<GoToSelectSeatPage>((event, emit) => emit(OnSelectSeatPage(event.ticketModel)));
    on<GoToCheckoutPage>((event, emit) => emit(OnCheckoutPage(event.ticket)));
    on<GoToSuccessPage>((event, emit) => emit(OnSuccessPage(event.ticket, event.transaction)));
    on<GoToTicketDetailPage>((event, emit) => emit(OnTicketDetailPage(event.ticket)));
  }
  // PageBloc() : super(OnInitialPage());
  //
  // @override
  // Stream<PageState> mapEventToState(PageEvent event) async* {
  //   if (event is GoToSplashPage) {
  //     yield OnSplashPage();
  //   } else if (event is GoToLoginPage) {
  //     yield OnLoginPage();
  //   } else if (event is GoToMainPage) {
  //     yield OnMainPage(bottomNavBarIndex: event.bottomNavBarIndex, isExpired: event.isExpired);
  //   } else if(event is GoToRegistrationPage) {
  //     yield OnRegistrationPage(event.registrationDataModel);
  //   } else if(event is GoToPreferencePage) {
  //     yield OnPreferencePage(event.registrationDataModel);
  //   } else if(event is GoToAccountConfirmationPage) {
  //     yield OnAccountConfirmationPage(event.registrationDataModel);
  //   } else if (event is GoToMovieDetailPage) {
  //     yield OnMovieDetailPage(event.movieModel);
  //   } else if (event is GoToSelectSchedulePage) {
  //     yield OnSelectSchedulePage(event.movieDetailModel);
  //   } else if (event is GoToSelectSeatPage) {
  //     yield OnSelectSeatPage(event.ticketModel);
  //   } else if (event is GoToCheckoutPage) {
  //     yield OnCheckoutPage(event.ticket);
  //   } else if (event is GoToSuccessPage) {
  //     yield OnSuccessPage(event.ticket, event.transaction);
  //   } else if (event is GoToTicketDetailPage) {
  //     yield OnTicketDetailPage(event.ticket);
  //   }
  // }
}
