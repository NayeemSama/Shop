import 'package:flutter/material.dart';
import 'package:shop/widgets/itemwidget.dart';

import '../models/MovieModel.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => Item().items[0]);
    print(Item().items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index){
              return ItemWidget(model: dummyList[index]);
            }
        ),
      ),
    );
  }

}
