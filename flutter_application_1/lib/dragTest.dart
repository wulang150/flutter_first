import 'package:flutter/material.dart';

class DragTest extends StatefulWidget {
  const DragTest({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DragTestState createState() {
    return _DragTestState();
  }
}

class _DragTestState extends State<DragTest> {
  double _top = 0.0;
  double _left = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('drag'),
        ),
        body: Center(
          child: Stack(
            children: [
              Positioned(
                  top: _top,
                  left: _left,
                  child: GestureDetector(
                    child: CircleAvatar(child: Text('A')),
                    onPanDown: (details) =>
                        print('drag start => ${details.globalPosition}'),
                    onPanUpdate: (details) {
                      setState(() {
                        _top += details.delta.dy;
                        _left += details.delta.dx;
                      });
                    },
                    onPanEnd: (details) => print('drag end'),
                  )),
            ],
          ),
        ));
  }
}
