import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Video Call App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AgoraClient client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: 'c0624f466e9d4377af3dbd5ebb2e52e0', channelName: "test"),
      enabledPermission: [Permission.camera, Permission.microphone]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          AgoraVideoViewer(client: client, layoutType: Layout.floating,floatingLayoutContainerHeight: 208,floatingLayoutContainerWidth: 380,floatingLayoutMainViewPadding: EdgeInsets.fromLTRB(0,0,0,0),floatingLayoutSubViewPadding: EdgeInsets.fromLTRB(0,0,0,0),
          disabledVideoWidget: Container(color: Colors.white,child: Center(child:Text("Video Is Disabled"),),
          ),
          showAVState: true,showNumberOfUsers: true,),
          AgoraVideoButtons(client: client),
        ],
      ),
    );
  }
}
