class Item {
  //Properties:-

  String barCode;

  String name;

  double qty;

  int unitType;

  double unitPrice;

  String notes;

  String image;

  bool isDone;

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

  //Methods:-
  //this method is to check and uncheck the item
  void toggleDone() {
    isDone = !isDone;
  }
}
