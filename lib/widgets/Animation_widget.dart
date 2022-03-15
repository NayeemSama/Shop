import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({Key? key}) : super(key: key);

  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    selected = !selected;}
                    );
                  }, child: Text('Press'),
              ),
              Expanded(
                child: Container(
                  child: AnimatedAlign(
                    alignment: selected ? Alignment.centerRight : Alignment.centerLeft,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    child: const FlutterLogo(size: 50.0),
                  ),
                ),
              )
            ],
          ),
          Row(

          )
        ],
      ),
    );
  }
}
