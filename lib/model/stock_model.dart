class StockModel {
  int? _id;
  String _title = "";
  String _description = "";
  int _priority = 0;

  StockModel(this._title, this._priority, this._description);

  StockModel.withId(this._id, this._title, this._priority, this._description);

  int? get id => _id;
  String get title => _title;
  String get description => _description;
  int get priority => _priority;

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

  // convert a StockModel object into a Map object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;

    return map;
  }

  // extract a StockModel object from a Map object
  StockModel.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _title = map['title'];
    _description = map['description'];
    _priority = map['priority'];
  }
}
