import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ServicesProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<String> _docIDs = [];

  //Getters
  FirebaseFirestore? get firestore => _firestore;
  FirebaseAuth? get auth => _auth;
  User? get user => _auth.currentUser;
  List<String> get docIds => _docIDs;
// Firebase Authentication functions
  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            );
          });
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Center(
            child: Text(
              'Password reset link sent, check your email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Center(
            child: Text(
              e.message!,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }

// Firebase Cloud firestore functions
  Future<void> storeUserDetails(
      int age, String email, String fullname, String location) async {
    try {
      await firestore?.collection('Users').add({
        'age': age,
        'email': email.trim(),
        'full name': fullname.trim(),
        'location': location.trim(),
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }

  Future<void> getDocId() async {
    try {
      var collection = await firestore?.collection('Users').get();
      if (collection != null) {
        for (var element in collection.docs) {
          _docIDs.add(element.reference.id);
        }
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }

  getUserDetails(String documentId) {
    return FutureBuilder(
      future: firestore?.collection('Users').doc(documentId).get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data?.data() as Map<String, dynamic>;

          return Text(
              'First Name : ${data['full name']}\n Nationality: ${data['location']}\n Age:${data['age']}');
        } else {
          return const Text('Loading.....');
        }
      },
    );
  }

  Future<void> updateUserDetails({
    required String? documentId,
    int? age,
    String? email,
    String? fullname,
    String? location,
  }) async {
    try {
      if (documentId != null) {
        await firestore?.collection('Users').doc(documentId).update({
          'age': age,
          'email': email?.trim(),
          'full name': fullname?.trim(),
          'location': location?.trim(),
        });
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }
}
