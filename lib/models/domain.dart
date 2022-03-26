// import 'package:firebase_database/firebase_database.dart';

class DomainModel {
  late String name;

  DomainModel(this.name);

  // DomainModel.fromSnapshot(DataSnapshot snapshot)
  //     : name = snapshot.value["name"];

  toJson() {
    return {
      "name": name,
      "date": DateTime.now().toString(),
    };
  }
}
