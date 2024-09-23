import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToFroDemo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(title: 'ToFroDemo'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var color = "0xffffffff";

  var channel = MethodChannel("nativetoflutter");

  changeColor() async {
    var result = await channel.invokeMethod("getcolor");
    print(result);
    setColor(result);
  }

  sendColor() async {
    var result =
        await channel.invokeMethod("sendColor", {"color": "0xffd1d1d1"});
    setColor(result);
    print(result);
  }

  setColor(String clr) {
    setState(() {
      color = clr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(color)),

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*ElevatedButton(
                onPressed: () {
                  setColor("0xff1f212c");
                },
                child: const Text("Flutter")),*/
            ElevatedButton(
                onPressed: changeColor, child: const Text("Get Color ")),
            ElevatedButton(
                onPressed: sendColor, child: const Text("Send Color "))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
