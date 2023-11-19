import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/model/movie_model.dart';
import 'package:netflix_clone/model/constent.dart';

class DetileScreen extends StatelessWidget {
  final Movie movie;
  const DetileScreen({super.key, required this.movie});
  Widget backBotton(context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.only(top: 16, left: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF23272E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_rounded)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF23272E),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: backBotton(context),
            backgroundColor: const Color(0xFF23272E),
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: FlexibleSpaceBar(
                title: Text(
                  movie.title,
                  style: GoogleFonts.belleza(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                background: Image.network(
                  '${Constent.imagePath}${movie.posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    'Overview',
                    style: GoogleFonts.belleza(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    movie.overView,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Text(
                              'Realise Date :',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              movie.releaseDate,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: 20,
                              width: 20,
                              child: Image(
                                image: AssetImage(
                                    'asset/Screenshot_2023-11-13_160837-removebg-preview.png'),
                                height: 3,
                              ),
                            ),
                            Text(
                              movie.voteAverage.toString(),
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
