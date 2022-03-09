import 'package:flutter/material.dart';
import 'package:shop/models/MovieModel.dart';

class ItemWidget extends StatelessWidget {

  final MovieModel model;

  const ItemWidget({Key? key, required this.model})
      : assert(model != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Card(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: ListTile(
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          leading: Image.network( 'https://image.tmdb.org/t/p/w500'+ model.poster),
          title: Text(model.title),
          subtitle: Text(model.overview),
          tileColor: Colors.yellow,
          trailing: Text(model.vote),

        ),
      ),
    );
  }

}
