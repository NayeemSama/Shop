import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart';
import 'package:shop/widgets/itemwidget.dart';

import '../models/MovieModel.dart';

class MovieList extends StatefulWidget {
  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final String poster_url = 'https://image.tmdb.org/t/p/w500';
  List<MovieModel> movieList= [];
  int counter=-1;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print('change');
    });
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await this.getList();
      setState(() {
        // for(int i =0;i<movieList.length;i++){
        //   listKey.currentState?.insertItem(0, duration: const Duration(milliseconds: 500));
        // }
      });
    });
    // print('init');
  }

  @override
  Widget build(BuildContext context) {
    // print('build');
    final dummyList = List.generate(10, (index) => Item().items[0]);
    print(Item().items[0]);
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onDoubleTap: (){
            show();
          },
          child: Text('Movie List')
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (context, index){
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(seconds: 5),
                child: SlideAnimation(
                  duration: Duration(seconds: 3),
                  delay: Duration(seconds: 1),
                  // horizontalOffset: 50.0,
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    duration: Duration(seconds: 3),
                    delay: Duration(seconds: 1),
                    child: ItemWidget(model: movieList[index],click: (){},
                    ),
                  ),
                ),
              );
            },
          ),
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
    // print('get');
  }

  void show() {
    setState(() {
      counter++;
      listKey.currentState?.insertItem(counter, duration: const Duration(milliseconds: 500));
    });
  }
}
//

//
// AnimatedList(
// controller: _scrollController,
// key: listKey,
// initialItemCount: movieList.length,
// itemBuilder: (context, index, animation){
// return SlideTransition(
// position: Tween<Offset>(
// begin: const Offset(-1, 0),
// end: Offset(0, 0),
// ).animate(animation),
// child: ItemWidget(
// model: movieList[index],
// click: (){},
// ),
// );
// },
// ),

//Container(
//           child: AnimationLimiter(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(8.0),
//               itemCount: movieList.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return AnimationConfiguration.staggeredList(
//                   position: index,
//                   duration: const Duration(seconds: 2),
//                   child: SlideAnimation(
//                     verticalOffset: 44.0,
//                     horizontalOffset: 50.0,
//                     child: FadeInAnimation(
//                       child: Padding(
//                         padding: EdgeInsets.all(10),
//                         child: ItemWidget(
//                           model: movieList[index],
//                           click: (){},
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
