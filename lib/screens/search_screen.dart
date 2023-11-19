import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/model/movie_model.dart';
import 'package:netflix_clone/model/constent.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<Movie>> serchMovies;

  @override
  void initState() {
    super.initState();
    serchMovies = Api().getMovieForSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF23272E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF23272E),
        elevation: 0,
        toolbarHeight: 65,
        title: TextField(
          onChanged: (value) => runFilter(value),
          maxLength: 5,
          decoration: const InputDecoration(
            hintText: 'Search here',
          ),
        ),
      ),
      body: FutureBuilder(
        future: serchMovies,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(8)),
                height: 40,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    'Movie not fount keep typing...',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return SearcMovieCard(snapshot: snapshot);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  runFilter(String enteredkeyworkd) {
    if (enteredkeyworkd.isEmpty) {
      setState(() {
        serchMovies = Api().getMovieForSearch();
      });
    } else {
      setState(() {
        serchMovies = Api().searchMoviesByKeyword(enteredkeyworkd);
      });
    }
  }
}

class SearcMovieCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const SearcMovieCard({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 40, right: 12, left: 12, bottom: 12),
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            "${Constent.imagePath}${snapshot.data[index].posterPath}",
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        );
      },
    );
  }
}
