

import 'package:flutter/material.dart';
import 'package:flutter_app/UI/movie.dart';

import 'movie_UI/movie_ui.dart';

class ScaffoldE extends StatelessWidget {

  _tapButton() {
    debugPrint("Tapped button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NepFlix",
            style: TextStyle(
                color: Colors.red.withOpacity(0.6))),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.email), onPressed: () => debugPrint("Email Tapped")),
          IconButton(icon: Icon(Icons.access_alarms_sharp), onPressed: _tapButton)
        ],
      ),

      floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.lightGreen,
      child: Icon(Icons.call_missed),
      onPressed: () => debugPrint("I'm the floating button"),),

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text("First")),
        BottomNavigationBarItem(icon: Icon(Icons.accessible_forward), title: Text("Second")),
        BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), title: Text("Third"))
      ], onTap: (int index) => debugPrint("Tapped item : $index") ,),
      backgroundColor: Colors.black54,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton()
            // InkWell( /* To make simple buttons with simple features */
            //   child: Text("Tap me plz",
            //    style: TextStyle(fontSize: 24),),
            //
            //   onTap: () => debugPrint("Tapped..."),
            // )
          ],
        ),
      ),
      // body: Center(
      //   child: Text("Hello there!! I'm being made by some students, "
      //       "thank them for every thing u have and pray for forgiveness",
      //   style: TextStyle(color: Colors.red),),
      // ),
    );
  }
} 

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector( /* This is a custom button where we can add many things to it so
    we have more freedom to make the right thing for a project (complicated button) */
      onTap: () {
        final snackBar = SnackBar(content: Text("Hiiii there"),
        backgroundColor: Colors.lightGreen.shade400,);
        Scaffold.of(context).showSnackBar(snackBar);

        },
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Text("Button"),

      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.redAccent,
      child: Center(
          child: Text(
            "Hello Flutter 2",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              fontStyle: FontStyle.italic,
            ),
          )),
    );

    // return Center(
    //   child: Text("Hello Flutter", textDirection: TextDirection.ltr,),);
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard"),
        centerTitle: true,

      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _getCard(),
            _getAvatar()
          ],
        ),
      ),
    );
  }
}

Container _getAvatar() {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      border: Border.all(color: Colors.redAccent, width: 1.2),
      image: DecorationImage(image: NetworkImage("https://picsum.photos/seed/picsum/300/300"),
      fit: BoxFit.cover)
    ),
  );
}

Container _getCard() {
  return Container(
    width: 350,
    height: 200,
    margin: EdgeInsets.all(55.0),
    decoration: BoxDecoration(
      color: Colors.lightGreen,
      borderRadius: BorderRadius.circular(4.5)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Faisal",
        style: TextStyle(fontSize: 20.9,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w500,
        color: Colors.white),),
        Text("My website is the coolest"),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.person_outline),
            Text("faisal@student.nl")
          ],
        )
      ],
    ),
  );
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "It is a long established fact that a reader will be distracted ",
        "by the readable content of a page when looking at its layout.",
        " The point of using Lorem Ipsum is that it has a more-or-less normal distribution",
        " of letters, as opposed to using 'Content here, content here',",
        " making it look like readable English. Many desktop publishing ",
        "packages and web page editors now use Lorem Ipsum as their default ",
        "model text, and a search for 'lorem ipsum' will uncover many web",
        " sites still in their infancy. Various versions have evolved over",
        " the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8.5)
                    ),
                    child: Center(
                        child: Text(quotes[_index % quotes.length],
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontStyle: FontStyle.italic,
                          fontSize: 16.5
                        ),))),
              ),
            ),

            Divider(thickness: 1.3,),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton.icon(
                  onPressed: _showQuote,
                  color: Colors.amberAccent.shade700,
                  icon: Icon(Icons.wb_sunny),
                  label: Text("Inspire me!", style: TextStyle(
                    fontSize: 18.8,
                    color: Colors.white
                  ),)),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    //increment our index/ counter by 1
    // _index++
    setState(() {
      _index += 1;
    });
  }
}


class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  // final List movies = [
  //   "Titanic",
  //   "Blade Runner",
  //   "Rambo",
  //   "The Avengers",
  //   "Avatar",
  //   "I Am Legend",
  //   "300",
  //   "The Wolf of Wall Street",
  //   "Vikings",
  //   "Interstellar",
  //   "Men in Black",
  //   "Mission Impossible",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NepFlix Movies",
          style: TextStyle(color: Colors.red.shade900),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Color(0xff3B3A47),
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
                children: <Widget> [
                  movieCard(movieList[index], context),
                  Positioned(
                    top: 10.0,
                    child: movieImage(movieList[index].images[0]),),

                ],
            );
        // return Card(
        //   elevation: 3.0,
        //   shadowColor: Colors.yellowAccent,
        //   color: Colors.blueGrey.shade600,
        //   child: ListTile(
        //     leading: CircleAvatar(
        //       backgroundColor: Colors.red.shade800,
        //       child: Container(
        //         width: 200,
        //         height: 200,
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: NetworkImage(movieList[index].images[0]),
        //             fit: BoxFit.cover
        //           ),
        //           color: Colors.red.shade900,
        //           borderRadius: BorderRadius.circular(13.9)
        //         ),
        //         child: null,
        //       ),
        //     ),
        //     trailing: Text("...am nothing"),
        //     title: Text(movieList[index].title,
        //       style: TextStyle(
        //           color: Colors.greenAccent),),
        //     subtitle: Text("${movieList[0].title}"),
        //     onTap: () {
        //       Navigator.push(context, MaterialPageRoute(
        //           builder: (context) => MovieListViewDetails(movieName: movieList.elementAt(index).title,
        //           movie: movieList[index],)));
        //            },
        //
        //     // onTap: () => debugPrint("Movie name: ${movies.elementAt(index)}"),
        //   ),
        // );
      }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.5,),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.white,),),
                      ),
                      Text(
                        "Rating: ${movie.imdbRating} / 10",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey),),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      Text("Released: ${movie.released}",
                          style: mainTextStyle(),),
                      Text(movie.runtime,
                        style: mainTextStyle(),),
                      Text(movie.rated,
                        style: mainTextStyle(),),

                    ],
                  )

                ],

              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(
      builder: (context) => MovieListViewDetails(movieName: movie.title,
              movie: movie)
        ))
      },
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(
        fontSize: 15.0,
        color: Colors.grey
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? "https://picsum.photos/200/300.jpg"),
          fit: BoxFit.cover,
        )
      ),
    );
  }

}

/* New rout ( screen or page) */
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: Text("Movies ", style: TextStyle(color: Colors.red.shade900),),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[0],),
          MovieDetailsHeaderWithPoster(movie: movie,),
          HorizontalLine(),
          MovieDetailsCast(movie: movie,),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.images,)
        ],
      ),
      // body: Center(
      //   child: Container(
      //     child: RaisedButton(
      //       color: Colors.blueGrey.shade600,
      //       child: Text("Go back ${this.movieName}", style: TextStyle(color: Colors.white),),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}




