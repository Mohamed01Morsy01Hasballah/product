class ProductModel{
  dynamic id;
  String? title;
  dynamic price;
  String? description;
  String? image;
  String? category;
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.category,
    this.image,
    this.description
  });
  ProductModel.fromJson(Map<String,dynamic> json){
    id=json['id'];
    title=json['title'];
    price=json['price'];
    description=json['description'];
    image=json['image'];
    category=json['category'];
  }
}