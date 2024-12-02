class CartoonModel {
  final String title, thumb, id;

  CartoonModel.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      thumb = json['thumb'],
      id = json['id'];
}