import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  // It is simple function to upload user info for ths collection
  Future addUserInfo(Map<String, dynamic> userInfoMap, String id) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  // Now Add the firebase that is Add Product Data
  Future addProduct(Map<String, dynamic> productInfoMap) {
    // Use Add method because something are add to firebase not store
    return FirebaseFirestore.instance
        .collection("Products")
        .add(productInfoMap);
  }

  // Function Create for acces data from firebase to the user side
  Future<Stream<QuerySnapshot>> getallProducts(String category) async {
    return FirebaseFirestore.instance
        .collection("Products")
        .where("Category", isEqualTo: category)
        .snapshots();
  }


  Future updateWalletAmount(String id, String amount) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .update({
          "walletAmount": amount,
        });
  }

  Future addWalletTransaction(String id, Map<String, dynamic> transactionMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("transactions")
        .add(transactionMap);
  }

  Stream<QuerySnapshot> getWalletTransactions(String id) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("transactions")
        .orderBy("date", descending: true)
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> searchProducts(
    String searchText, String category) async {
  return FirebaseFirestore.instance
      .collection("Products")
      .where("Category", isEqualTo: category)
      .where("Name", isGreaterThanOrEqualTo: searchText)
      .where("Name", isLessThanOrEqualTo: searchText + '\uf8ff')
      .snapshots();
}

}
