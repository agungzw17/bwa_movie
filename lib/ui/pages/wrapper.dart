part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);

    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        // BlocProvider.of<PageBloc>(context).add(GoToSplashPage());
        context.read<PageBloc>().add(GoToSplashPage());
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        prevPageEvent = GoToMainPage();
        // BlocProvider.of<PageBloc>(context).add(GoToMainPage());
        context.read<PageBloc>().add(GoToMainPage());

        // BlocProvider.of<UserBloc>(context).add(LoadUser(firebaseUser.uid));
        context.read<UserBloc>().add(LoadUser(firebaseUser.uid));

        // BlocProvider.of<TicketBloc>(context).add(GetTickets(firebaseUser.uid));
        context.read<TicketBloc>().add(GetTickets(firebaseUser.uid));

      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnRegistrationPage)
                    ? SignUpPage(pageState.registrationDataModel)
                    : (pageState is OnPreferencePage)
                        ? PreferencePage(pageState.registrationDataModel)
                        : (pageState is OnAccountConfirmationPage)
                            ? AccountConfirmationPage(
                                pageState.registrationDataModel)
                            : (pageState is OnMovieDetailPage)
                                ? MovieDetailPage(pageState.movieModel)
                                : (pageState is OnSelectSchedulePage)
                                    ? SelectSchedulePage(pageState.movieDetailModel)
                                    : (pageState is OnSelectSeatPage)
                                        ? SelectSeatPage(pageState.ticketModel)
                                        : (pageState is OnCheckoutPage)
                                            ? CheckoutPage(pageState.ticket)
                                            : (pageState is OnSuccessPage)
                                                ? SuccessPage(pageState.ticket,
                                                    pageState.transaction)
                                                : (pageState
                                                        is OnTicketDetailPage)
                                                    ? TicketDetailPage(
                                                        pageState.ticket)
                                                    : MainPage());
  }
}
