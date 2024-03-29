import 'package:flutter_news_app/models/CategoryModel.dart';

List<CategoryModel> getCategories() {
	List<CategoryModel> categories = [];
	CategoryModel categoryModel;
	
	// 1
	categoryModel = new CategoryModel();
	categoryModel.categoryName = "Business";
	categoryModel.imgUrl = "https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1355&q=80";
	categories.add(categoryModel);
	
	//2
	categoryModel = new CategoryModel();
	categoryModel.categoryName = "Entertainment";
	categoryModel.imgUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
	categories.add(categoryModel);

	//3
	categoryModel = new CategoryModel();
	categoryModel.categoryName = "General";
	categoryModel.imgUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
	categories.add(categoryModel);

	//4
	categoryModel = new CategoryModel();
	categoryModel.categoryName = "Health";
	categoryModel.imgUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
	categories.add(categoryModel);

	//5
	categoryModel = new CategoryModel();
	categoryModel.categoryName = "Science";
	categoryModel.imgUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
	categories.add(categoryModel);

	//5
	categoryModel = new CategoryModel();
	categoryModel.categoryName = "Sports";
	categoryModel.imgUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
	categories.add(categoryModel);

	//5
	categoryModel = new CategoryModel();
	categoryModel.categoryName = "Technology";
	categoryModel.imgUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
	categories.add(categoryModel);

	return categories;
}
