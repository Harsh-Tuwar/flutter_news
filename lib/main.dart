import 'package:flutter/material.dart';
import 'package:flutter_news_app/views/home.dart';

void main() => runApp(MyNewsApp());

class MyNewsApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			debugShowCheckedModeBanner: false,
			theme: ThemeData(
				primaryColor: Colors.white
			),
			home: Home()
		);
	}
}