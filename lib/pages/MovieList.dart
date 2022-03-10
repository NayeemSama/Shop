import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shop/widgets/itemwidget.dart';

import '../models/MovieModel.dart';

class MovieList extends StatefulWidget {
  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final String poster_url = 'https://image.tmdb.org/t/p/w500';

  final List<MovieModel> movieList= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await this.getList();
      setState(() { });
    });
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => Item().items[0]);
    print(Item().items[0]);
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onDoubleTap: (){
            getList();
          },
          child: Text('Movie List')
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (context, index){
              return ItemWidget(
                model: movieList[index],
                click: (){
                  // getList();
                },
              );
            }
        ),
      ),
    );
  }

  Future<void> getList() async {
    Response response = await get(Uri.parse('https://api.themoviedb.org/3/account/nayeem12345/watchlist/movies?api_key=59f1582165daf34054cc783100d84133&language=en-US&session_id=36fe167fa210a1efef9747425e8cd2ebf5b62b91&sort_by=created_at.asc'));
    Map data = jsonDecode(response.body);
    List array = data['results'];
    for(int i = 0; i<array.length;i++){
      Map item = array[i];
      MovieModel model =  MovieModel(vote: item['vote_average'].toString(), overview: item['overview'], date: item['release_date'], title: item['original_title'], poster: item['poster_path']);
      movieList.add(model);
    }
  }
}
