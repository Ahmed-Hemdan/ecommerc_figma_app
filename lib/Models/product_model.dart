class Product {
  String title;
  String image;
  String oldPrice;
  String realTimePrice;
  String sale;
  double rate;
  String description;
  String cat;

  Product({
    required this.title,
    required this.image,
    required this.oldPrice,
    required this.realTimePrice,
    required this.sale,
    required this.rate,
    required this.description,
    required this.cat,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      image: json['image'],
      oldPrice: json['oldPrice'],
      realTimePrice: json['realTimePrice'],
      sale: json['sale'],
      rate: json['rate'],
      description: json['description'],
      cat: json['cat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image, 
      'oldPrice': oldPrice,
      'realTimePrice': realTimePrice,
      'sale': sale,
      'rate': rate,
      'description': description,
      'cat': cat,
    };
  }
}