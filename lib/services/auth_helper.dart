import 'dart:io';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthentificationHelper {
  final BuildContext context;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthentificationHelper(this.context);

  Future<void> showSnackBar(String message) async {
    await Flushbar(message: message).show(context);
  }

  void loading() {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              backgroundColor: Colors.transparent,
              children: [CircularProgressIndicator()],
            ));
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      loading();
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      showSnackBar("Votre compte a été bien créé");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar("Mot de passe facile à deviner");
      } else if (e.code == 'email-already-in-use') {
        showSnackBar("Email déjà en cours d'utilisation");
      } else if (e.code == 'invalid-email') {
        showSnackBar("Email invalide");
      }
    } on SocketException catch (_) {
      showSnackBar("Veuillez vous connecter à internet");
    } catch (e) {
      showSnackBar("Erreur inconnue...Veuillez réessayer !");
    }
    Get.back();
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-disabled') {
        showSnackBar("Votre compte est désactive, contactez admin");
      } else if (e.code == 'user-not-found') {
        showSnackBar("Compte inexistant");
      } else if (e.code == 'invalid-email') {
        showSnackBar("Email invalide");
      } else if (e.code == 'wrong-password') {
        showSnackBar("Mot de passe incorrect");
      }
    } on SocketException catch (_) {
      showSnackBar("Veuillez vous connecter à internet");
    } catch (e) {
      showSnackBar("Erreur inconnue...Veuillez réessayer !");
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    Future.wait([
      _googleSignIn.signOut(),
      _firebaseAuth.signOut(),
    ]);
  }
}
