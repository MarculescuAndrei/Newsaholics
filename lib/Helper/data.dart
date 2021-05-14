import 'package:newsaholic/Models/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "Football";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1511886929837-354d827aae26?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80";

  category.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Badminton";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1559309106-ed14040fd35d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80";

  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Badminton";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1559309106-ed14040fd35d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80";

  category.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Badminton";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1559309106-ed14040fd35d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80";

  category.add(categoryModel);

  return category;
}