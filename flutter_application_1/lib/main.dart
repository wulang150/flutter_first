import 'package:flutter/material.dart';
import 'package:flutter_application_1/dragTest.dart';

import 'deviceSetting.dart';
import 'viewItemTest.dart';
import 'shareMain.dart';
import 'layoutDemo.dart';
import 'FDMAIDetailVC.dart';
import './model/FDMAIModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      routes: {
        "settingPage": (context) => const DeviceSettingVC(),
        "viewTest": (context) => const ViewItemTest(),
        "dragTest": (context) => const DragTest(),
        "shareView": ((context) => const ShareMain()),
        "layoutDemo": ((context) => const LayoutDemo()),
        "aiDetailVC": ((context) => const FDMAIDetailVC()),
        "/": (context) =>
            const MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const StateLifecycleTest(),
      onGenerateRoute: (RouteSettings settings) {
        //如果push了不在路由表的view，就会执行到这里
        String? routeName = settings.name;
        print(routeName);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _switchSelected = false;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many time:',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: 'Home',
              ),
              TextSpan(
                  text: 'https://baidu.com',
                  style: TextStyle(
                    color: Colors.blue,
                  )),
            ])),
            TextButton(
              child: const Text("open new route"),
              onPressed: () {
                //导航到新路由
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) {
                //     return const DeviceSettingVC(
                //       text: 'hello world',
                //     );
                //   }),
                // ).then((value) {
                //   // ignore: avoid_print
                //   print("路由返回值: $value");
                // });

                // Navigator.of(context)
                //     .pushNamed('settingPage', arguments: "hellwoldabcss")
                //     .then((value) {
                //   print("路由返回值: $value");
                // });
                Navigator.of(context).pushNamed('viewTest');
              },
            ),
            OutlinedButton(
                onPressed: (() {
                  // print('hello...');
                  Navigator.of(context).pushNamed("dragTest");
                }),
                child: const Text('comfirm')),
            OutlinedButton(
                onPressed: (() {
                  Navigator.of(context)
                      .pushNamed("aiDetailVC", arguments: FDMAILevelType.high);
                  // debugDumpApp();
                }),
                child: const Text("next")),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100.0,
            ),
            Image.asset(
              "images/add_video_icon.png",
              fit: BoxFit.contain,
              // width: 100,
              // height: 100,
            ),
            Switch(
              value: _switchSelected, //当前状态
              onChanged: (value) {
                //重新构建页面
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Echo extends StatelessWidget {
  const Echo({
    Key? key,
    required this.text,
    this.backgroundColor = Colors.grey, //默认为灰色
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

class StateLifecycleTest extends StatelessWidget {
  const StateLifecycleTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CounterWidget();
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key, this.initValue = 0});

  final int initValue;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('$_counter'),
          //点击后计数器自增
          onPressed: () => setState(
            () => ++_counter,
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}
