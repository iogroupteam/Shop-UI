
class ShoesModel {
    ShoesModel({
        this.model,
        this.price,
        this.isSave,
        this.colors,
        this.sizes,
        this.images,
    });

    String? model;
    double? price;
    bool? isSave;
    List<String>? colors;
    List<int>? sizes;
    List<String>? images;

    factory ShoesModel.fromJson(Map<String, dynamic> json) => ShoesModel(
        model: json["model"],
        price: json["price"].toDouble(),
        isSave: json["is_save"],
        colors: List<String>.from(json["colors"].map((x) => x)),
        sizes: List<int>.from(json["sizes"].map((x) => x)),
        images: List<String>.from(json["images"].map((x) => x)),
    );


}
