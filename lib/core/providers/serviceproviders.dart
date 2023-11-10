// ignore_for_file: use_build_context_synchronously

/*    FutureBuilder(
            future: servicesProvider.getCurrentUserDoc(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text(
                    'Hello :${servicesProvider.currentUserDoc?['name']}');
              } else {
                return const Text('Loading.....');
              }
            },
          ),  */

/*   GestureDetector(
              onTap: () {
                servicesProvider.signOut();
                Navigator.pushReplacementNamed(
                  context,
                  'login',
                );
              },
              child: const Icon(Icons.exit_to_app)),
               */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmic/constants/color_palette.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class ServicesProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? docId;
  Map<String, dynamic>? _currentUserDoc;

  //Getters
  FirebaseFirestore? get firestore => _firestore;
  FirebaseAuth? get auth => _auth;
  User? get user => _auth.currentUser;
  Map<String, dynamic>? get currentUserDoc => _currentUserDoc;

// Firebase Authentication functions
  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.accent,
              ),
            );
          });
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      debugPrint('Error: ${e.message}');
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      debugPrint('Error: ${e.message}');
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
      Future.delayed(const Duration(milliseconds: 4000), () {
        Navigator.pushReplacementNamed(context, 'login');
      });
    } on FirebaseAuthException catch (e) {
      debugPrint('Error: ${e.message}');
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
      {required String email, required String fullname}) async {
    try {
      await firestore?.collection('users').add({
        'email': email.trim(),
        'name': fullname.trim(),
      });
    } on FirebaseException catch (e) {
      debugPrint('Error: ${e.message}');
    }
  }

  Future<void> updateUserDetails({
    required String? documentId,
    required String? fullname,
  }) async {
    try {
      getCurrentUserDoc();
      if (documentId != null) {
        await firestore?.collection('users').doc(documentId).update({
          'name': fullname?.trim(),
        });
      }
    } on FirebaseException catch (e) {
      debugPrint('Error: ${e.message}');
    }
  }

  Future<Map<String, dynamic>?> getCurrentUserDoc() async {
    try {
      var collection = await firestore?.collection('users').get();
      if (collection != null) {
        for (var element in collection.docs) {
          if (element['email'] == user?.email) {
            docId = element.id;
            _currentUserDoc = element.data();
            break;
          }
        }
      }
    } on FirebaseException catch (e) {
      debugPrint('Error: ${e.message}');
    }
    return currentUserDoc;
  }
}
