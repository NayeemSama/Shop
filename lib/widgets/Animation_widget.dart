import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({Key? key}) : super(key: key);

  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> with TickerProviderStateMixin {
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  bool selected5 = false;
  bool selected6 = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

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
                onPressed: () {
                  setState(() {
                    selected1 = !selected1;
                  });
                },
                child: Text('Press'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  child: AnimatedAlign(
                    alignment: selected1 ? Alignment.centerRight : Alignment.centerLeft,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    child: const FlutterLogo(size: 50.0),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selected2 = !selected2;
                  });
                },
                child: Text('Press'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                    child: selected2
                        ? AnimatedBuilder(
                            animation: _controller,
                            child: FlutterLogo(size: 50.0),
                            builder: (BuildContext context, Widget? child) {
                              return Transform.rotate(angle: _controller.value * 2.0 * math.pi, child: child);
                            })
                        : FlutterLogo(size: 50.0)),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selected3 = !selected3;
                  });
                },
                child: Text('Press'),
              ),
              SizedBox(width: 10),
              Flexible(
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(selected3 ? 70 : 8),
                    color: selected3 ? Colors.red : Colors.blue,
                  ),
                  width: selected3 ? 70 : 150,
                  height: selected3 ? 70 : 70,
                  alignment: selected3 ? Alignment.centerLeft : Alignment.centerRight,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: const FlutterLogo(size: 50),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selected4 = !selected4;
                  });
                },
                child: Text('Press'),
              ),
              SizedBox(width: 10),
              Container(
                  child: AnimatedCrossFade(
                duration: const Duration(seconds: 2),
                firstChild: const FlutterLogo(style: FlutterLogoStyle.markOnly, size: 50.0),
                secondChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 50.0),
                crossFadeState: selected4 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              ))
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selected5 = !selected5;
                  });
                },
                child: Text('Press'),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(seconds: 1),
                    style: selected5? TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 25):TextStyle(fontStyle: FontStyle.italic,color: Colors.blue,fontSize: 20),
                    child: Text('Hello World'),
                    curve: Curves.fastOutSlowIn,
                    softWrap: false,
                  )
              )
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selected6 = !selected6;
                  });
                },
                child: Text('Press'),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: AnimatedOpacity(
                    opacity: selected6? 1:0.5,
                    duration: const Duration(seconds: 1),
                    child: const FlutterLogo(size: 50.0),
                  ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
