import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends StatefulWidget {
  const SharedPreference({Key? key}) : super(key: key);

  @override
  _SharedPreferenceState createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {

  int _counter = 0;
  SharedPreferences? preferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePreference().whenComplete((){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${this.preferences?.getString("name")}',style: TextStyle(fontSize: 35)),
            RichText(
              text: TextSpan(children: [
                TextSpan(text: '${this.preferences?.getStringList("infoList")?[0]}',style: TextStyle(fontSize: 25, color: Colors.grey)),
                TextSpan(text: '   ',style: TextStyle(fontSize: 25, color: Colors.grey)),
                TextSpan(text: '${this.preferences?.getStringList("infoList")?[1]}',style: TextStyle(fontSize: 25, color: Colors.grey)),
              ]),
            ),
            Text(
              'The button this many times:',
            ),
            Text(
              '${this.preferences?.getInt("counter") ?? 0}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment\'s Value' ,
        child: Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() async{
    setState(() {
      _counter++;
      this.preferences?.setInt("counter", _counter);
    });
  }

  Future<void> initializePreference() async{
    this.preferences = await SharedPreferences.getInstance();
    this.preferences?.setString("name", "Nayeem");
    this.preferences?.setStringList("infoList", ["Android","Flutter"]);
    this.preferences?.setInt("counter", 100);
  }
}
