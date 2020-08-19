import 'package:flutter/material.dart';
import 'package:temtem_api_wrapper/temtem_api_wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'temtem_api_wrapper Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'temtem_api_wrapper Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TemTemApi _api = TemTemApi();

  List<TemTemApiTem> _responseContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: const Text('Load All TemTems'),
              onPressed: () {
                _api
                    .getTemTems()
                    .then((value) => setState(() => _responseContent = value));
              },
            ),
            Expanded(
              child: ListView.builder(
                  itemCount:
                      _responseContent == null ? 0 : _responseContent.length,
                  itemBuilder: (context, index) => ListTile(
                        leading: Image.network(
                            _responseContent[index].portraitWikiUrl),
                        title: Text(_responseContent[index].name),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
