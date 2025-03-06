import 'package:ciland/features/movie_details/entity/movie_details.dart';
import 'package:ciland/features/movie_details/repository/movie_details_repository.dart';

class MovieDetailsUseCase {
  final AbstractMovieDetailsRepository _movieDetailsRepository;

  MovieDetailsUseCase(this._movieDetailsRepository);

  Future<MovieDetails> getMovieDetails(String id) async {
    var movieDetails = await _movieDetailsRepository.getMovieDetails(id);
    return MovieDetails.fromModel(movieDetails);
  }
}

