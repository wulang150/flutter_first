// ignore: file_names
import 'package:flutter/material.dart';

class DeviceSettingVC extends StatelessWidget {
  const DeviceSettingVC({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //获取路由参数  
    String? text=ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: const Text("提示"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(text!),
              ElevatedButton(
                onPressed: () {Navigator.pop(context, "我是返回值");},
                child: const Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
