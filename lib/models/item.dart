class Item {
  //Properties:-
  //int id;
  String barCode;
  String name;
  double qty;
  int unitType;
  double unitPrice;
  String notes;
  String image;
  bool isDone; //TODO: You have to change this while inserting
  int listId;
  int categoryId;

  //Constructor:-
  Item(
      {this.barCode,
      this.name,
      this.qty,
      this.unitPrice,
      this.notes,
      this.isDone = false});

  //Convert from Json
  factory Item.fromJson(Map<String, dynamic> json) => Item(
        //id: json["id"],
        barCode: json["barCode"],
        name: json["name"],
        qty: json["qty"],
        //unitType: json["unitType"],
        unitPrice: json["unitPrice"],
        notes: json["notes"],
        //image: json["image"],
        isDone: json["isDone"],
        //listId: json["listId"],
        //categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        //"id": id,
        "barCode": barCode,
        "name": name,
        "qty": qty,
        //"unitType": unitType,
        "unitPrice": unitPrice,
        "notes": notes,
        //"image": image,
        "isDone": isDone,
        //"listId": listId,
        //"categoryId": categoryId,
      };

  //Methods:-
  //this method is to check and uncheck the item
  void toggleDone() {
    isDone = !isDone;

    //because Sqlite doesn't have Bool data type we use 0 & 1 (To use later)
    //i ^= 1;
  }
}
