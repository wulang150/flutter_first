import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_tableview/flutter_tableview.dart';
import '../model/post.dart';

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
      body: TableViewDemo(),
    );
  }
}

//tableView
// ignore: must_be_immutable
class TableViewDemo extends StatelessWidget{
  // How many section.
  int sectionCount = 3;

  // Get row count.
  int _rowCountAtSection(int section) {
    if (section == 0) {
      return 5;
    } else if (section == 1) {
      return 10;
    } else {
      return 20;
    }
  }

  // Section header widget builder.
  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    return InkWell(
      onTap: () {
        print('click section header. -> section:$section');
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16.0),
        color: Color.fromRGBO(220, 220, 220, 1),
        // height: 100,
        child: Text('I am section header -> section:$section'),
      ),
    );
  }

  // cell item widget builder.
  Widget _cellBuilder(BuildContext context, int section, int row) {
    return InkWell(
      onTap: () {
        print('click cell item. -> section:$section row:$row');
      },
      child: Container(
        padding: EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Color.fromRGBO(240, 240, 240, 1),
        ))),
        // height: 50.0,
        child: Text('I am celldd -> section:$section  row$row'),
      ),
    );
  }

  // Each section header height;
  double _sectionHeaderHeight(BuildContext context, int section) {
    return 20.0;
  }

  // Each cell item widget height.
  double _cellHeight(BuildContext context, int section, int row) {
    return 50.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //FlutterTableView
      child: FlutterTableView(
        sectionCount: sectionCount,
        rowCountAtSection: _rowCountAtSection,
        sectionHeaderBuilder: _sectionHeaderBuilder,
        cellBuilder: _cellBuilder,
        sectionHeaderHeight: _sectionHeaderHeight,
        cellHeight: _cellHeight,
      ),
    );
  }
}
//listView
class ListViewTestDemo extends StatelessWidget {
  
  Widget _listItemBuilder(BuildContext context, int idx) {
    
    return InkWell(
      splashColor: Color.fromARGB(255, 93, 5, 5),
      highlightColor: Color.fromARGB(255, 49, 41, 41),
      onTap: () {
        debugPrint("helloworld $idx");
      },
      child: Container(
        // color: Color.fromRGBO(232, 232, 232, 1.0),
        padding:
            const EdgeInsets.only(top: 10, left: 20, bottom: 10, right: 22),
        margin: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(posts[idx].name),
            Text(posts[idx].age),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: posts.length, itemBuilder: _listItemBuilder);
  }
}

//pagebuilder
class PageViewBuilderDemo extends StatelessWidget {
  const PageViewBuilderDemo({super.key});

  Widget _pageItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(posts[index].name),
          Text(posts[index].age),
        ],
      ),
    );

    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text(posts[index].name),
    //     Text(posts[index].age),
    //   ],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) {
        debugPrint("current page $value");
      },
      controller: PageController(
          initialPage: 1,
          // keepPage: false,
          viewportFraction: 0.85),
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}

//pageView
class PageViewTestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      onPageChanged: (value) {
        debugPrint("current page $value");
      },
      controller: PageController(
          initialPage: 1,
          // keepPage: false,
          viewportFraction: 0.85),
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
class StackTestDemo extends StatelessWidget {
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
                    constraints: BoxConstraints(maxHeight: 100, maxWidth: 50),
                    color: Colors.red,
                    child: Icon(Icons.ac_unit, color: Colors.blue, size: 32.0),
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
