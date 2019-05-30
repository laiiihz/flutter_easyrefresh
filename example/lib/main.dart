import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'widget/sample_list_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // App名字
      title: 'EasyRefresh',
      // App主题
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      // 主页
      home: _Example(),
//      localizationsDelegates: const [
//        S.delegate,
//        GlobalMaterialLocalizations.delegate,
//        GlobalWidgetsLocalizations.delegate
//      ],
    );
  }
}

class _Example extends StatefulWidget {
  @override
  _ExampleState createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<_Example> {

  EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EasyRefresh"),
      ),
      body: Center(
          child: EasyRefresh(
            controller: _controller,
            onRefresh: () {},
            onLoadMore: () {},
            builder: CustomRefreshWidgetBuilder(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return SampleListItem(
                    text: '$index',
                    bgColor: index%2==0 ? Colors.grey[300] : Colors.transparent,
                  );
                },
              )
            ).builder,
          )
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
            onPressed: () {
              _controller.callRefresh();
            },
            child: Text("Refresh", style: TextStyle(color: Colors.black))),
        FlatButton(
            onPressed: () {
              _controller.callLoadMore();
            },
            child: Text("Load more", style: TextStyle(color: Colors.black))),
      ]
    );
  }
}