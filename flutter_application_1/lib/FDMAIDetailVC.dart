import 'package:flutter/material.dart';
import './model/FDMAIModel.dart';

class FDMAIDetailVC extends StatefulWidget {
  const FDMAIDetailVC({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    return FDMAIDetailVCState();
  }
}

class FDMAIDetailVCState extends State<FDMAIDetailVC> {
  @override
  Widget build(BuildContext context) {

    //获取路由参数  
    FDMAILevelType level = ModalRoute.of(context)!.settings.arguments as FDMAILevelType;
    return Scaffold(
      appBar: AppBar(
        title: const Text("AIDetailVC"),
      ),
      body: Container(
          color: Color.fromRGBO(0x10, 0x12, 0x15, 1.0),
          child: Column(
            children: [
              AiHeadView(val: 60, level: level),
              createLineView(EdgeInsets.only(top: 40, left: 20, right: 20)),
              level==FDMAILevelType.disable? 
              Padding(padding: EdgeInsets.all(0)):
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: FDMAIDetailList(level: level)
                  ))
            ],
          )),
    );
  }
}

class AiHeadView extends StatelessWidget {
  const AiHeadView({super.key, required this.val, required this.level});

  final FDMAILevelType level;
  final int val;
  final String content =
      "Thes AI wills hes issue error alerts after it has been printing for a while. It needs to compare the print results several times to confirm before issuing an alert.";
  @override
  Widget build(BuildContext context) {
 
    return Column(
        children: [
      const Padding(padding: EdgeInsets.only(top: 30)),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(findAIImageByLevel(level),
              width: 48, height: 48),
          Image.asset(
            "images/ai_face_img_1.png",
            width: 117,
          )
        ],
      ),
      level!=FDMAILevelType.disable?
      Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 4),
        child: Text("$val%",
            style: TextStyle(
                color: level==FDMAILevelType.high? Colors.green:Colors.yellow,
                fontWeight: FontWeight.w700,
                fontSize: 48)),
      ):Padding(padding: EdgeInsets.only(top: 0)),
      Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 8, right: 12),
        child: const Text("AI Accuracy",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16)),
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 8, right: 12),
        child: Text(content,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14)),
      ),
    ].map((e) {
      return Padding(
        padding: const EdgeInsets.only(left: 40),
        child: e,
      );
    }).toList());
  }
}

class FDMAIDetailList extends StatelessWidget {
  FDMAIDetailList({super.key, required this.level});

  final FDMAILevelType level;
  final List<FDMAIModel> dataArr = [
    FDMAIModel(
        title: "Camera calibration",
        leftImg: "images/ai_camera_icon.png",
        detail: "Please calibrate the camera before the next print"),
    FDMAIModel(
        title: "Ambient light",
        leftImg: "images/ai_light_icon.png",
        detail: "Please adjust the ambient light."),
    FDMAIModel(
        title: "Material Color and Hot Bed contrast",
        leftImg: "images/ai_contrast_icon.png",
        detail:
            "It is recommended to print with a material of a different color than the PEI board.")
  ];

  Widget _itemBuilderFunc(BuildContext content, int idx) {
    return Container(
        // width: double.infinity,
        // margin: EdgeInsets.only(top: 16, bottom: 0),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: 16)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(dataArr[idx].leftImg, width: 18),
            Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.only(left: 8, right: 12),
                    child: Text(dataArr[idx].title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16)))),
            Image.asset(dataArr[idx].leftImg, width: 18),
          ],
        ),
        level != FDMAILevelType.high
            ? Container(
                width: double.infinity,
                // color: Color.fromRGBO(0xff, 0xff, 0xff, 0.15),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 19, top: 12),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0xff, 0xff, 0xff, 0.15),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Text(dataArr[idx].detail,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14)),
              )
            : Padding(padding: EdgeInsets.all(0)),

        idx != dataArr.length - 1
            ? createLineView(EdgeInsets.only(top: 16))
            : Padding(padding: EdgeInsets.only(top: 16)),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _itemBuilderFunc,
      itemCount: dataArr.length,
    );
  }
}


Widget createLineView(EdgeInsetsGeometry margin) {
  return Container(
    height: 1,
    width: double.infinity,
    margin: margin,
    color: Color.fromRGBO(0xff, 0xff, 0xff, 0.1),
  );
}

String findAIImageByLevel(FDMAILevelType level){
  String imgStr = "images/printing_ai_icon_accuracy.png";
  if(level==FDMAILevelType.mid){
    imgStr = "images/printing_ai_icon_accuracy_poor.png";
  }
  if(level==FDMAILevelType.disable){
    imgStr = "images/printing_ai_icon_accuracy_u.png";
  }
  return imgStr;
}