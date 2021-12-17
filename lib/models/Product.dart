// ignore_for_file: file_names
class Product {
  String? name;
  String? price;
  String? units;
  Product.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson["name"];
    price = parsedJson["price"];
    units = parsedJson["units"];
  }
}
