class MovieModel{

  String vote = '';
  String overview= '';
  String date = '';
  String title = '';
  String poster = '';

  MovieModel({required this.vote, required this.overview, required this.date, required this.title, required this.poster});
}

class Item{
  final items= [
    MovieModel(
        vote: "8.3",
        overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
        date: "2021-12-15",
        title: "Spider-Man: No Way Home",
        poster: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg")
  ];
}
// {"overview":"Peter Parker is unmasked and no longer able to separate "
// "his normal life from the high-stakes of being a super-hero. When he asks"
// " for help from Doctor Strange the stakes become even more dangerous,"
// " forcing him to discover what it truly means to be Spider-Man.",
// "release_date":"2021-12-15",
// "adult":false,
// "backdrop_path":"/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
// "genre_ids":[28,12,878],
// "vote_count":8940,
// "original_language":"en",
// "original_title":"Spider-Man: No Way Home",
// "id":634649,
// "poster_path":"/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
// "video":false,
// "vote_average":8.3,
// "title":"Spider-Man: No Way Home",
// "popularity":5083.954}

