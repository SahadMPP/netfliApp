import 'dart:convert';
import 'package:netflix_clone/model/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/model/constent.dart';

class Api {
  static const trandingUri =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constent.apiKey}";
  static const topRatedMoviesUri =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constent.apiKey}";
  static const upcomingMoviesUri =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constent.apiKey}";
  static const searchMoviesUri =
      "https://api.themoviedb.org/3/movie/popular?api_key=${Constent.apiKey}";
  static const search = "https://api.themoviedb.org/3/search/movie";

  Future<List<Movie>> getTrandingMovie() async {
    final response = await http.get(Uri.parse(trandingUri));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body)["results"] as List)
          .map((movie) => Movie.fromJson(movie))
          .toList();
    } else {
      throw Exception('Something wrong fetching trending movies');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedMoviesUri));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)["results"] as List)
          .map((movie) => Movie.fromJson(movie))
          .toList();
    } else {
      throw Exception('Something wrong fetching Top rated movies movies');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(upcomingMoviesUri));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)["results"] as List)
          .map((movie) => Movie.fromJson(movie))
          .toList();
    } else {
      throw Exception('Something wrong fetching Upcomig movies movies');
    }
  }

  Future<List<Movie>> getMovieForSearch() async {
    final response = await http.get(Uri.parse(searchMoviesUri));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)["results"] as List)
          .map((movie) => Movie.fromJson(movie))
          .toList();
    } else {
      throw Exception('Something wrong fetching Search movies movies');
    }
  }

  Future<List<Movie>> searchMoviesByKeyword(String keyword) async {
    keyword.contains(keyword.toLowerCase());
    final response = await http
        .get(Uri.parse('$search?query=$keyword&api_key=${Constent.apiKey}'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)["results"] as List)
          .map((movie) => Movie.fromJson(movie))
          .toList();
    } else {
      throw Exception('Something wrong fetching Search movies movies');
    }
  }
}
