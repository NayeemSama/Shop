import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet'),
      ),
      body: Builder(
        builder: (context)=> Center(
          child: ElevatedButton(onPressed: () {
            Scaffold.of(context).showBottomSheet<void>(
                (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                        color: Colors.blueGrey,
                    ),
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('BottomSheet'),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              child: const Text('Close BottomSheet'),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          child: Text('Bottomsheet'),
          ),
        ),
      ),
    );
  }
}
