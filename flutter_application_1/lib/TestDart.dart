import 'package:flutter/material.dart';

class TestDart extends StatefulWidget{
  const TestDart({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TestDartState();
  }

}

class _TestDartState extends State<StatefulWidget> with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print("initState:只执行一次");
  }
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print("dispose: 组件移除时");
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies:在initState后立即调用,可以调用多次");
  }
  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
///回到主页面时刷新数据
    if (state == AppLifecycleState.resumed) {
      print("resumed");
    }
    if (state == AppLifecycleState.inactive) {
      print("inactive");
    }
    if (state == AppLifecycleState.paused) {
      print("paused");
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TestDart"),
      ),
      body: Column(
        children: [
          Text("helloWorld"),
        ]
      ),
    );
  }

}