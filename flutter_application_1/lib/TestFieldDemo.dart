import 'package:flutter/material.dart';

class TestFieldDemo extends StatelessWidget {
  const TestFieldDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TextField")),
      body: const Center(
        child: TestFormDemo(),
      ),
    );
  }
  
}

class TestFormDemo extends StatefulWidget {
  const TestFormDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TextFormState();
  }
}

class _TextFormState extends State<TestFormDemo> {

  final formState = GlobalKey<FormState>();
  late String username, pwd;

  void comfirmAction(){
    if(formState.currentState!.validate()){
      formState.currentState?.save();
      debugPrint("username=$username, password=$pwd");
    }
    
  }

  String? validUsername(value){
    if(value.length<=0){
      return "username is requested";
    }
    return null;
  }
  String? validPassword(value){
    if(value.length<=0){
      return "password is requested";
    }
    return null;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "username",
              ),
              onSaved: (newValue) {
                username = newValue!;
              },
              validator: validUsername,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "password",
              ),
              onSaved: (newValue) {
                pwd = newValue!;
              },
              validator: validPassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(height: 20),
            
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              padding: const EdgeInsets.all(0),
              // color: Colors.blue,
              child: MaterialButton(
                height: 50,
                highlightElevation: 0.0,
                elevation: 0.0,
                color: Colors.blue,
                onPressed: comfirmAction, 
                child: const Text("Login", style: TextStyle(color: Colors.white))
              ),
            )
          ],
        )),
    );
  }
  
}



class TestFieldDemos extends StatefulWidget {
  const TestFieldDemos({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TextfieldState();
  }
}
class _TextfieldState extends State<TestFieldDemos> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text = "hello";
    textEditingController.addListener(() {
      debugPrint("input: ${textEditingController.text}");
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TextField")),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: textEditingController,
              // onChanged: (value) {
              //   debugPrint("value: $value");
              // },
              onSubmitted: (value) {
                debugPrint("value: $value");
              },
              decoration: InputDecoration(
                // labelText: "title",
                hintText: "input username",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ));
  }
}
