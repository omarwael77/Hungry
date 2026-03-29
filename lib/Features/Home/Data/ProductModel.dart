class ProductModel{
  int id;
  String name;
  String description;
  String price;
  String rating;
  String image;


  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.image,
  });

  factory ProductModel.fromJson(Map
                    <String,dynamic> json) {
    return ProductModel(
      id: json["id"] ,
      name: json["name"]  ,
      description: json["description"],
      price: json["price"],
      rating: json["rating"],
      image: json["image"], 
       
    );
  }

}