import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('layout')),
      // body: Center(
      //   child: Column(
      //     //默认主轴占用全部控件，纵轴看子控件大小
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(

      //         color: Colors.red,
      //         child: Text("sdfsdfdsfsdf"),
      //       ),
      //       Text("sdfsss"),
      //   ])
      // )
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Container(
      //       child: Text("hello"),
      //       color: Colors.red,
      //     ),
      //     Text("sdfsss"),
      //   ],
      // ),
      body: PageViewTestDemo(),
    );
  }
}

//pageView
class PageViewTestDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      onPageChanged: (value) {debugPrint("current page $value");},
      controller: PageController(
        initialPage: 1,
        // keepPage: false,
        viewportFraction: 0.85
      ),
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.yellow,
          child: const Text("page1"),
        ),
        Container(
          color: Colors.blue,
          child: const Text("page2"),
        ),
        Container(
          color: Colors.red,
          child: const Text("page3"),
        ),
      ],
    );
  }
}

//stack
class StackTestDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        // width: double.infinity,
        // height: double.infinity,
        // color: Colors.red,
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Text("hello"),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: 100,
                        maxWidth: 50
                      ),
                      color: Colors.red,
                      child:
                          Icon(Icons.ac_unit, color: Colors.blue, size: 32.0),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 30,
                    height: 30,
                  ),
                  const Positioned(
                      left: 10,
                      top: 12,
                      child: Icon(Icons.ac_unit_rounded,
                          color: Colors.blue, size: 32.0)),
                ],
              ),
              AspectRatio(
                  aspectRatio: 16.0 / 9.0,
                  child: Container(
                    color: Colors.yellow,
                  ))
            ]),
      );
  }
}