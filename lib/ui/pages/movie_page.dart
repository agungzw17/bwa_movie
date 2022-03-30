part of 'pages.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //note: header
        Container(
          decoration: BoxDecoration(
            color: accentColor1,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) {
              if (userState is UserLoaded) {
                print(
                    "masuk metode userLoaded imageForenya ${imageFileToUpload.toString()}");
                if (imageFileToUpload != null) {
                  uploadImage(imageFileToUpload ?? File("")).then((downloadURL) {
                    print("masuk metode uploadImage");
                    imageFileToUpload = null;

                    BlocProvider.of<UserBloc>(context).add(UpdateData(profileImage: downloadURL));
                  });
                } else {
                  print("tidak masuk metode uploadImage ");
                }

                return Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0xff5f5588), width: 1)),
                      child: Stack(
                        children: <Widget>[
                          SpinKitFadingCircle(color: accentColor2, size: 50),
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: (userState
                                                  .userModel.profilePicture ==
                                              "")
                                          ? AssetImage("assets/user_pic.png") as ImageProvider
                                          : NetworkImage("${userState
                                          .userModel.profilePicture}"),
                                      fit: BoxFit.cover))),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              78,
                          child: Text(
                            userState.userModel.name ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: (whiteTextFont.copyWith(fontSize: 18)),
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: "id_ID",
                                  decimalDigits: 0,
                                  symbol: "IDR ")
                              .format(userState.userModel.balance),
                          style: yellowNumberFont.copyWith(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        )
                      ],
                    )
                  ],
                );
              } else {
                return SpinKitFadingCircle(color: accentColor2, size: 50);
              }
            },
          ),
        ),

        //note: now playing
        Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
            child: Text(
              "Now Playing",
              style: blackTextFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<MovieModel> movies = movieState.movies!.sublist(0, 10);

              return ListView.builder(
                itemBuilder: (_, index) => Container(
                  margin: EdgeInsets.only(
                      left: (index == 0) ? defaultMargin : 0,
                      right: (index == movies.length - 1) ? defaultMargin : 16),
                  child: MovieCard(
                    onTap: () {

                      BlocProvider.of<PageBloc>(context).add(GoToMovieDetailPage(movies[index]));
                    },
                    movieModel: movies[index],
                  ),
                ),
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
              );
            } else {
              return SpinKitFadingCircle(color: mainColor, size: 50);
            }
          }),
        ),

        //note: brose movie
        Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
            child: Text(
              "Browse Movie",
              style: blackTextFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold),
            )),
        BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
          if (userState is UserLoaded) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      userState.userModel.selectedGenres!.length,
                      (index) => BrowseButton(
                          userState.userModel.selectedGenres![index])),
                ));
          } else {
            return SpinKitFadingCircle(
              color: mainColor,
              size: 50,
            );
          }
        }),

        //note: coming soon
        Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
            child: Text(
              "Coming Soon",
              style: blackTextFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 160,
          child: BlocBuilder<MovieBloc, MovieState>(builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<MovieModel> movies = movieState.movies!.sublist(10);

              return ListView.builder(
                itemBuilder: (_, index) => Container(
                  margin: EdgeInsets.only(
                      left: (index == 0) ? defaultMargin : 0,
                      right: (index == movies.length - 1) ? defaultMargin : 16),
                  child: ComingSoonCard(
                    movies[index],
                  ),
                ),
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
              );
            } else {
              return SpinKitFadingCircle(color: mainColor, size: 50);
            }
          }),
        ),

        //note: get lucky day
        Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
            child: Text(
              "Get Lucky Day",
              style: blackTextFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold),
            )),
        Column(
            children: dummyPromo
                .map((e) => Padding(
                      padding: EdgeInsets.fromLTRB(
                          defaultMargin, 0, defaultMargin, 16),
                      child: PromoCard(e),
                    ))
                .toList()),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
