import 'package:flutter/material.dart';

class ViewItemTest extends StatefulWidget {
  const ViewItemTest({super.key});

  @override
  State<ViewItemTest> createState() => _ViewItemTestState();
}

class _ViewItemTestState extends State<ViewItemTest> {
  //定义一个controller
  final TextEditingController _unameController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  PointerEvent? _event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('hhhhhh'),
        ),
        body: Center(
            child: Column(
          //最上层的column或row占满主轴方向所有空间，纵轴方向根据子控件的最大宽度
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[Text('hello1'), Text('hello2')],
            ),
            Row(
              children: const <Widget>[
                Text('hello1'),
                Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                Text('hello2')
              ],
            ),
            Row(
              children: <Widget>[
                const Expanded(flex: 1, child: Text('helloname')),
                // Text('helldfdfdfdfdfdfdfo2',style: TextStyle(backgroundColor: Colors.yellow))
                Container(
                  constraints:
                      const BoxConstraints(maxWidth: 150, minWidth: 30),
                  child: const Text('helldfdfddfdfdfdfdfdfdfo2',
                      style: TextStyle(backgroundColor: Colors.yellow),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                )
              ],
            ),
            Column(
              //非首父层的Column，主轴方向不占全部，根据控件高度
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text("rrrrrr"),
              ],
            ),
            // const Padding(padding: EdgeInsets.only(top: 20)),
            // Container(
            //   height: 120.0,
            //   width: 120.0,
            //   color: Colors.blue[50],
            //   child: const Align(
            //     alignment: FractionalOffset(0.2, 0.5),
            //     child: FlutterLogo(
            //       size: 60,
            //     ),
            //   ),
            // ),
            TextField(
              controller: _unameController,
              focusNode: _focusNode,
              decoration: const InputDecoration(
                constraints: BoxConstraints.tightFor(width: 200, height: 55),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(120, 50)),
                onPressed: () {
                  // _unameController.clear();
                  _focusNode.unfocus();
                },
                child: const Text('login')),
            // DecoratedBox(
            //     decoration: BoxDecoration(
            //         gradient: LinearGradient(
            //             colors: [Colors.red, Colors.orange.shade700]), //背景渐变
            //         borderRadius: BorderRadius.circular(3.0), //3像素圆角
            //         boxShadow: const [
            //           //阴影
            //           BoxShadow(
            //               color: Colors.black54,
            //               offset: Offset(2.0, 2.0),
            //               blurRadius: 4.0)
            //         ]),
            //     child: const Padding(
            //       padding:
            //           EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
            //       child: Text(
            //         "Login",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     )),
            // Container(
            //   // color: Colors.red,
            //   width: 200,
            //   height: 100,
            //   margin: const EdgeInsets.only(top: 10),
            //   decoration: BoxDecoration(
            //       color: Colors.red,
            //       border: Border.all(color: Colors.black, width: 1)),
            //   alignment: Alignment.center,
            //   child: const Text(
            //     "hello",
            //     style: TextStyle(color: Colors.black, fontSize: 22),
            //   ),
            // ),
            wContainer(BoxFit.contain),
            // wText("sdfsdfdsfdsdfdfdfddf"),
            // FittedBox(child: wText("sdfsdfdsfddfdfdfdsdfdfaa")),
            SingleLineBox(child: wText("sdfsdfdsfddfdfd")),
            SingleLineBox(child: wText("sdfsdfdsfddfdfdaaa")),
            mulText(s1: "home", s2: "http://www.baidu.com"),
            Row(
              //文字图标
              children: [
                const Text("\uE03e"),
                Icon(Icons.error, color: Colors.blue),
              ],
            ),
            SwitchBtnBox(),
            Listener(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 300.0,
                height: 150.0,
                child: Text(
                  '${_event?.localPosition ?? ''}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPointerDown: (PointerDownEvent event) =>
                  setState(() => _event = event),
              onPointerMove: (PointerMoveEvent event) =>
                  setState(() => _event = event),
              onPointerUp: (PointerUpEvent event) =>
                  setState(() => _event = event),
            ),
          ].map((e) {
            return Padding(
              padding: EdgeInsets.only(top: 4),
              child: e,
            );
          }).toList(),
        )));
  }
}

Widget wContainer(BoxFit fit) {
  return Container(
    width: 50,
    height: 50,
    color: Colors.green,
    child: FittedBox(
      fit: fit,
      child: Container(width: 60, height: 70, color: Colors.red),
      alignment: Alignment.topLeft,
    ),
  );
}

Widget wText(String str) {
  Widget child = Text(str);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [child, child, child],
  );
}

Widget mulText({String? s1, String? s2}) {
  return Text.rich(TextSpan(children: [
    TextSpan(
        text: s1, style: const TextStyle(fontSize: 14, color: Colors.black)),
    TextSpan(
      text: s2,
      style: const TextStyle(fontSize: 14, color: Colors.blue),
    ),
  ]));
}

class SingleLineBox extends StatelessWidget {
  const SingleLineBox({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return FittedBox(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: double.infinity, minWidth: constraints.maxWidth),
          child: child,
        ),
      );
    });
  }
}

class SwitchBtnBox extends StatefulWidget {
  const SwitchBtnBox({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SwitchBtnBoxState createState() => _SwitchBtnBoxState();
}

class _SwitchBtnBoxState extends State<SwitchBtnBox> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _selected,
      onChanged: (value) {
        setState(() {
          _selected = value;
        });
      },
    );
  }
}
