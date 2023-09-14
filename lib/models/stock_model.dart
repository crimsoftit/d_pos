class StockModel {
  int? _id;
  String _title = "";
  String _description = "";
  int _priority = 0;
  String _price = "";
  String _bcodeValue = "";
  String _date = "";

  StockModel(
      this._title, this._priority, this._description, this._price, this._bcodeValue, this._date);

  StockModel.withId(this._id, this._title, this._priority, this._description,
      this._price, this._bcodeValue, this._date);

  int? get id => _id;
  String get title => _title;
  String get description => _description;
  int get priority => _priority;
  String get price => _price;
  String get bcodeValue => _bcodeValue;
  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      _priority = newPriority;
    }
  }

  set price(String newPrice) {
    _price = newPrice;
  }

  set bcodeValue(String newbcodeValue) {
    _bcodeValue = newbcodeValue;
  }

  set date(String newDate) {
    _date = newDate;
  }

  // convert a StockModel object into a Map object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['price'] = _price;
    map['bcodeValue'] = _bcodeValue;
    map['date'] = _date;

    return map;
  }

  // extract a StockModel object from a Map object
  StockModel.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _title = map['title'];
    _description = map['description'];
    _priority = map['priority'];
    _price = map['price'];
    _bcodeValue = map['bcodeValue'];
    _date = map['date'];
  }
}
