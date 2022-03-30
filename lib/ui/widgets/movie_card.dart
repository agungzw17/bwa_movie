part of 'widgets.dart';

class MovieCard extends StatefulWidget {
  final MovieModel? movieModel;
  final Function? onTap;

  MovieCard({this.movieModel, this.onTap});

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Container(
          height: 140,
          width: 210,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(
                      imageBaseURL + "/w500/" + "${widget.movieModel?.backdropPath}"),
                  fit: BoxFit.cover)),
          child: Container(
            height: 140,
            width: 210,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.61),
                      Colors.black.withOpacity(0)
                    ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${widget.movieModel?.title}",
                  style: whiteTextFont,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                RatingStars(voteAverage: widget.movieModel?.voteAvarage ?? 0.0,)
              ],
            ),
          )),
    );
  }
}
