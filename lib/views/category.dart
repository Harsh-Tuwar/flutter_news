import 'package:flutter/material.dart';
import 'package:flutter_news_app/helper/news.dart';
import 'package:flutter_news_app/models/ArticleModel.dart';
import 'package:flutter_news_app/views/article.dart';

class CategoryClass extends StatefulWidget {
  final String categoryTitle;
  CategoryClass({this.categoryTitle});

  @override
  _CategoryClassState createState() => _CategoryClassState();
}

class _CategoryClassState extends State<CategoryClass> {
  List<ArticleModel> newsItems = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews newNews = CategoryNews();
    await newNews.getCategoryNews(widget.categoryTitle);
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
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
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
                      }),
                )
              ],
            ),
          )
      ),
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