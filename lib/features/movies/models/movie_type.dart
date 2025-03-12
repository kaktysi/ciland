enum MovieType {
  movie,
  tvSeries;

  bool get isMovie => this == MovieType.movie;

  String get name => isMovie ? 'movie' : 'tvSeries';
}
