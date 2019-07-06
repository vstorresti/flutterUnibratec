class Person {
  int id;
  String name, city, address;
  Person({this.id, this.name, this.city, this.address});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json["id"],
      name: json["name"],
      city: json["city"],
      address: json["address"],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'city': city, 'address': address};
  }
}