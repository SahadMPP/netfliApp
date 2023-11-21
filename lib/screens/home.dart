import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/model/movie_model.dart';
import 'package:netflix_clone/screens/search_screen.dart';
import 'package:netflix_clone/widgets/top_rated_movie_card.dart';
import 'package:netflix_clone/widgets/tranding_card.dart';
import 'package:netflix_clone/widgets/upcoming_movie_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Movie>> trandingMovie;
  late Future<List<Movie>> topRatedMovie;
  late Future<List<Movie>> upcomingMovie;

  @override
  void initState() {
    super.initState();

    trandingMovie = Api().getTrandingMovie();
    topRatedMovie = Api().getTopRatedMovies();
    upcomingMovie = Api().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ));
                },
                icon: const Icon(shadows: [
                  Shadow(
                      color: Colors.black, blurRadius: 10, offset: Offset(8, 8))
                ], Icons.search, size: 35)),
          )
        ],
        title: const Image(
          image: AssetImage('asset/download-removebg-preview.png'),
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('Tranding Movies', style: GoogleFonts.aBeeZee(fontSize: 25)),
              const SizedBox(height: 16),
              FutureBuilder(
                future: trandingMovie,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    return TrendindCard(snapshot: snapshot);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              const SizedBox(height: 36),
              Text('Top rated movies',
                  style: GoogleFonts.aBeeZee(fontSize: 25)),
              const SizedBox(height: 16),
              FutureBuilder(
                future: topRatedMovie,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    return TopRatedMoviesCard(
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              const SizedBox(height: 36),
              Text('Upcoming movies', style: GoogleFonts.aBeeZee(fontSize: 25)),
              const SizedBox(height: 16),
              FutureBuilder(
                future: upcomingMovie,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    return UpcomingMovieCard(snapshot: snapshot);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
