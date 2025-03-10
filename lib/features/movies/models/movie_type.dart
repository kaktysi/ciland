enum MovieType {
  movie,
  tvSeries;

  bool get isMovie => this == MovieType.movie;
}