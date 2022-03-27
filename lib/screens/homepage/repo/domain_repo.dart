import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:money_tracker/models/domain.dart';

class DomainRepo {
  late FirebaseDatabase db;
  late FirebaseAuth auth;

  DomainRepo() {
    auth = FirebaseAuth.instance;
    db = FirebaseDatabase.instance;
  }

  getDomainsUrl() {
    return "users/${auth.currentUser!.uid}/domains/";
  }

  Future<List<DomainModel>> fetchDomains() async {
    DataSnapshot snap = await db.ref(getDomainsUrl()).get();
    List<DomainModel> domains = [];

    if (snap.value != null && snap.value != "") {
      Map<dynamic, dynamic> data = snap.value as Map;
      data.forEach((key, value) {
        domains.add(DomainModel(key));
      });
    }

    return domains;
  }

  Future<void> addDomain(String domain) {
    return db.ref(getDomainsUrl()).child(domain).set("");
  }

  removeDomain(String domain) {
    db.ref(getDomainsUrl()).child(domain).remove();
  }
}
