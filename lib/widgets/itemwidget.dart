import 'package:flutter/material.dart';
import 'package:shop/models/MovieModel.dart';

class ItemWidget extends StatelessWidget {

  final MovieModel model;
  final Function click;

  const ItemWidget({Key? key, required this.model, required this.click})
      : assert(model != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 10.0, horizontal: 20.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 190,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Image.network( 'https://image.tmdb.org/t/p/w500'+ model.poster ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(model.title,style: TextStyle(fontSize: 20),maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Expanded(
                          child: Text(model.overview,
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey)),
                        ),
                        Text(model.date),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(model.vote,style: TextStyle(color: Colors.red))),
              ],
            ),
          ),
        ),
      ),
    );



    // ClipRRect(
    //   borderRadius: BorderRadius.all(Radius.circular(20)),
    //   child: Card(
    //     // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    //     child: ListTile(
    //       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    //       leading: Image.network( 'https://image.tmdb.org/t/p/w500'+ model.poster),
    //       title: Text(model.title),
    //       subtitle: Text(model.overview),
    //       tileColor: Colors.yellow,
    //       trailing: Text(model.vote),
    //       onLongPress: click(),
    //     ),
    //   ),
    // );

  }

}
