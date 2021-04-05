import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Article extends StatefulWidget {
	final String articleURL;
	Article({this.articleURL});

	@override
	_ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
	final Completer<WebViewController> _completer = Completer<WebViewController>();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Row(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
					Text('Flutter'),
					Text('News', style: TextStyle(color: Colors.blue))
					],
				),
				centerTitle: true,
				actions: [
					Opacity(
						opacity: 0,
						child: Container(
							padding: EdgeInsets.symmetric(horizontal: 16),
							child: Icon(Icons.save),
						),
					)
				],
				elevation: 0.0,
			),
			body: Container(
				height: MediaQuery.of(context).size.height,
        		width: MediaQuery.of(context).size.width,
				child: WebView(
					initialUrl: widget.articleURL,
					onWebViewCreated: (WebViewController webViewController) {
						_completer.complete(webViewController);
					}
				),
			)
		);
	}
}
