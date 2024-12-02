class CartoonDetailModel {
  final String title, about, genre, age;

  CartoonDetailModel.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      about = json['about'],
      genre = json['genre'],
      age   = json['age'];
}