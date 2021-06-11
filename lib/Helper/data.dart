import 'package:newsaholic/Models/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.imageUrl = "https://sunpeaksventures.com/wp-content/uploads/2020/10/https___blogs-images.forbes.com_alejandrocremades_files_2018_12_business-3605367_1920-1200x741-1.jpg";

  category.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl = "https://monitorulneamt.ro/wp-content/uploads/2018/06/1.jpg";

  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Science";
  categoryModel.imageUrl = "https://img.freepik.com/free-vector/science-education-background_23-2148486901.jpg?size=626&ext=jpg&ga=GA1.2.1614264220.1617235200";

  category.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl = "https://wallpapercave.com/wp/wp4310237.jpg";

  category.add(categoryModel);

  return category;
}