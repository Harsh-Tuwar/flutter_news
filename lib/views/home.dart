import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/helper/data.dart';
import 'package:flutter_news_app/helper/news.dart';
import 'package:flutter_news_app/models/ArticleModel.dart';
import 'package:flutter_news_app/models/CategoryModel.dart';
import 'package:flutter_news_app/views/article.dart';
import 'package:flutter_news_app/views/category.dart';

class Home extends StatefulWidget {
	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	List<CategoryModel> categories = [];
	List<ArticleModel> newsItems = [];
	bool _loading = true;

	@override
	void initState() {
		super.initState();
		categories = getCategories();
		getNews();
	}

	getNews() async {
		News newNews = News();
		await newNews.getNews();
		newsItems = newNews.news;

		setState(() {
			_loading = false;
		});
	}

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
				elevation: 0.0,
			),
			body: _loading ? Center( 
				child: Container(
					child: CircularProgressIndicator(),
				)
			) : SingleChildScrollView(
				child: Container(
					child: Column(
						children: <Widget>[
							Container(
								padding: EdgeInsets.symmetric(horizontal: 16),
								height: 70,
								child: ListView.builder(
									itemCount: categories.length,
									shrinkWrap: true,
									scrollDirection: Axis.horizontal,
									itemBuilder: (context, index) {
										return CategoryTile(
											imgUrl: categories[index].imgUrl,
											categoryName: categories[index].categoryName
										);
									}
								)
							),
							Container(
								padding: EdgeInsets.only(top: 16),
								child: ListView.builder(
									padding: EdgeInsets.symmetric(horizontal: 16),
									shrinkWrap: true,
									physics: ClampingScrollPhysics(),
									itemCount: newsItems.length,
									itemBuilder: (context, index) {
										return BlogTile(
											title: newsItems[index].title,
											imgURL: newsItems[index].urlToImage,
											desc: newsItems[index].description,
											url: newsItems[index].url,
										);
									}
								),
							)
						],
					),
				)
			)
		);
	}
}

class CategoryTile extends StatelessWidget {
	final String imgUrl;
	final String categoryName;

	CategoryTile({this.imgUrl, this.categoryName});

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () {
				Navigator.push(
					context,
					MaterialPageRoute(
						builder: (context) => CategoryClass(
							categoryTitle: categoryName.toLowerCase()
						)
					)
				);
			},
			child: Container(
				margin: EdgeInsets.only(right: 16),
				child: Stack(
				children: <Widget>[
					ClipRRect(
						borderRadius: BorderRadius.circular(6),
						child: CachedNetworkImage(width: 120, height: 60, fit: BoxFit.cover, imageUrl: imgUrl)
					),
					Container(
						alignment: Alignment.center,
						width: 120,
						decoration: BoxDecoration(
							borderRadius: BorderRadius.circular(6),
							color: Colors.black26,
						),
						height: 60,
						child: Text(
							categoryName,
							style: TextStyle(
								color: Colors.white,
								fontSize: 14,
								fontWeight: FontWeight.w500
							)
						),
					)
				],
				),
			)
		);
	}
}


class BlogTile extends StatelessWidget {
	final String imgURL;
	final String title;
	final String desc;
	final String url;

	BlogTile({ 
		@required this.imgURL,
		@required this.title,
		@required this.desc,
		@required this.url
	});

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () {
				Navigator.push(
					context,
					MaterialPageRoute(
						builder: (context) => Article(
							articleURL: url,
						)
					)
				);
			},
			child: Container(
				padding: EdgeInsets.only(bottom: 20),
				decoration: BoxDecoration(
					borderRadius: BorderRadius.circular(5.0),
					color: Colors.white,
					boxShadow: [
					BoxShadow(
						color: Colors.grey,
						offset: Offset(0.0, 1.0), //(x,y)
						blurRadius: 6.0,
					),
					]
				),
				margin: EdgeInsets.only(bottom: 16),
				child: Column(
					children: [
						ClipRRect(
							child: Image.network(
								imgURL,
								height: 200,
								width: MediaQuery.of(context).size.width,
								fit: BoxFit.cover
							),
							borderRadius: BorderRadius.circular(6),
						),
						SizedBox(height: 8), 
						Padding(
							child: Text(
								title,
								maxLines: 2,
								style: TextStyle(
									fontSize: 18,
									color: Colors.black87,
									fontWeight: FontWeight.w500
								),
							),
							padding: EdgeInsets.symmetric(horizontal: 16),
						),
						SizedBox(height: 8), 
						Padding(
							child: Text(
								desc,
								maxLines: 3,
								style: TextStyle(
									color: Colors.black54,
									fontSize: 14
								),
							),
							padding: EdgeInsets.symmetric(horizontal: 16)
						)
					]
				),
			)
		);
	}
}