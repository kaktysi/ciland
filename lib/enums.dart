// ignore_for_file: constant_identifier_names

enum Genre {
  DRAMA,
  COMEDY,
  DOCUMENTARY,
  ACTION,
  ROMANCE,
  THRILLER,
  CRIME,
  HORROR,
  ADVENTURE,
  FAMILY,
  ANIMATION,
  REALITYTV,
  MYSTERY,
  MUSIC,
  TALKSHOW,
  FANTASY,
  HISTORY,
  BIOGRAPHY,
  SCIFI,
  SPORT,
  MUSICAL,
  ADULT,
  WAR,
  NEWS,
  GAMESHOW,
  WESTERN,
  SHORT,
  FILMNOIR;

  String get namePrint {
    switch (this) {
      case Genre.DRAMA:
        return 'Drama';
      case Genre.COMEDY:
        return 'Comedy';
      case Genre.DOCUMENTARY:
        return 'Documentary';
      case Genre.ACTION:
        return 'Action';
      case Genre.ROMANCE:
        return 'Romance';
      case Genre.THRILLER:
        return 'Thriller';
      case Genre.CRIME:
        return 'Crime';
      case Genre.HORROR:
        return 'Horror';
      case Genre.ADVENTURE:
        return 'Adventure';
      case Genre.FAMILY:
        return 'Family';
      case Genre.ANIMATION:
        return 'Animation';
      case Genre.REALITYTV:
        return 'Reality-TV';
      case Genre.MYSTERY:
        return 'Mystery';
      case Genre.MUSIC:
        return 'Music';
      case Genre.TALKSHOW:
        return 'Talk-Show';
      case Genre.FANTASY:
        return 'Fantasy';
      case Genre.HISTORY:
        return 'History';
      case Genre.BIOGRAPHY:
        return 'Biography';
      case Genre.SCIFI:
        return 'Sci-Fi';
      case Genre.SPORT:
        return 'Sport';
      case Genre.MUSICAL:
        return 'Musical';
      case Genre.ADULT:
        return 'Adult';
      case Genre.WAR:
        return 'War';
      case Genre.NEWS:
        return 'News';
      case Genre.GAMESHOW:
        return 'Game-Show';
      case Genre.WESTERN:
        return 'Western';
      case Genre.SHORT:
        return 'Short';
      case Genre.FILMNOIR:
        return 'Film-Noir';
    }
  }
}
