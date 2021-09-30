class CartItemModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const DESC = "desc";
  static const QUANTITY = "quantity";
  static const DISCOUNT = "discount";
  static const PRICE = "price";


  int? id;
  String? image;
  String? desc;
  int? quantity;
  double? discount;
   double? price;



  CartItemModel({ this.id, this.image, this.desc, this.quantity, this.discount});

  CartItemModel.fromMap(Map<String, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    desc = data[DESC];
    quantity = data[QUANTITY];
    discount = data[DISCOUNT]!.toDouble();
    price = data[PRICE].toDouble();

  }

  Map toJson() => {
    ID: id, 
    IMAGE: image, 
    DESC: desc,
    QUANTITY: quantity,
    DISCOUNT: discount,
    PRICE: price
  };

}