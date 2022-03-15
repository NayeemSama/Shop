import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({Key? key}) : super(key: key);

  @override
  _WidgetsPageState createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(
              color: Colors.red,
              child: Text(
                'hello',
                style: TextStyle(),
                textDirection: TextDirection.rtl,
              )),
          actions: [
            Icon(Icons.home),
            Icon(Icons.back_hand),
          ],
          flexibleSpace: Container(
            height: 50,
            color: Colors.deepPurpleAccent,
            child: Text('space'),
          ),
          bottom: PreferredSize(preferredSize: Size(10.0, 10.0), child: Text('bottom')),
          title: Text('Widget Page')),
      body: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 100
              ),
              child: CupertinoButton.filled(onPressed: () {},
                child: const Text('Enabled'),),
            ),
            Container(
                height: 200,
                width: 300,
                color: Colors.deepPurpleAccent,
                child: Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(padding: EdgeInsets.all(10),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 200,
                        maxHeight: 100
                      ),
                      child: Container(color: Colors.blue,),
                    )),
                  ),
                ),
            ),
            Row(
              children: [
                RichText(
                  text: TextSpan(text: 'hello ', style: TextStyle(color: Colors.red, fontSize: 20), children: [
                    TextSpan(text: 'beautiful ', style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic, fontSize: 20)),
                    TextSpan(text: 'world', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w900, fontSize: 20)),
                  ]),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  transform: Matrix4.rotationZ(0.2), //6.283
                  child: FlutterLogo(size: 300, style: FlutterLogoStyle.markOnly),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {}),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// Placeholder(
// strokeWidth: 12,
// fallbackHeight: 0.5,
// fallbackWidth: 0.2,
// )
