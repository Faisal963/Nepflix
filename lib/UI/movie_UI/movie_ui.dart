import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../movie.dart';



class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Icon(Icons.play_circle_outline, size: 100,
            // color: Colors.white,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x004242425), Color(0xff4242425)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            ),
          ),
          height: 80,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Row(
        children: <Widget>[
          // MoviePoster(poster: movie.images[0].toString(),),
          // SizedBox(width: 16,),
          Expanded(child: MovieDetailsHeader(movie: movie))
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width /4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(poster),
                  fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {

  final List<String> posters;

  const MovieDetailsExtraPosters({Key key, this.posters}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text("has been reviewed".toUpperCase(),
            style: TextStyle(
                fontSize: 14,
                color: Colors.white70
            ),),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8,),
            itemCount: posters.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(posters[index]),
                        fit: BoxFit.cover)
                ),

              ),
            ),
          ),

        )
      ],
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(movie.title,
          style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
              fontSize: 24
          ),
        ),
        // Text("${movie.year} . ${movie.genre}".toUpperCase(),
        //   style: TextStyle(
        //       fontWeight: FontWeight.w400,
        //       color: Colors.cyan
        //   ),),
        // Text.rich(TextSpan(style: TextStyle(
        //   fontSize: 12, fontWeight: FontWeight.w300,
        //   color: Colors.lightGreenAccent
        // ), children: <TextSpan> [
        //   TextSpan(
        //       // style: mainTextStyle(),
        //       text: movie.plot
        //   ),
        //   TextSpan(
        //       text: " More...",
        //       style: mainTextStyle()
        //   )
        // ]))
      ],
    );
  }
  TextStyle mainTextStyle() {
    return TextStyle(
        fontSize: 12.0,
        color: Colors.grey
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;

  const MovieField({Key key, this.field, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$field : ", style: TextStyle(
            color: Colors.yellow,
            fontSize: 12,
            fontWeight: FontWeight.w300
        ),),
        Expanded(
          child: Text(value, style: TextStyle(
              color: Colors.blue,
              fontSize: 12,
              fontWeight: FontWeight.w300
          )),
        ),
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          // new Container(
          //   child: new GridView.count(
          //     // Create a grid with 2 columns. If you change the scrollDirection to
          //     // horizontal, this produces 2 rows.
          //     crossAxisCount: 2,
          //     // Generate 5 widgets that display their index in the List.
          //     children: List.generate(5, (index) {
          //       return Center(
          //         child: Text(
          //           'Item $index',
          //           style: Theme.of(context).textTheme.headline5,
          //         ),
          //       );
          //     }),
          //   ),
          // ),
          MovieField(field: "Released ",value: movie.released,),
          MovieField(field: "Cast ",value:movie.actors),
          MovieField(field: "Directors ", value: movie.director),
          MovieField(field: "Awards", value: movie.awards),

        ],
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,

      ),
    );
  }
}
