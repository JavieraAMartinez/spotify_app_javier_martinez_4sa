import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app_javier_martinez_4sa/data/models/auth/create_user_req.dart';
import 'package:spotify_app_javier_martinez_4sa/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);

      return const Right("El inicio de sesión fue exitoso");
    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == 'email-invalido') {
        message = "No se encontró usuario con ese correo electrónico";
      } else if (e.code == "credenciales-invalidas") {
        message = "Contraseña incorrecta";
      }
      return left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      FirebaseFirestore.instance.collection("Users").add({
        "name": createUserReq.fullName,
        "email": data.user?.email,
      });

      return const Right("El registro fue exitoso");
    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == 'weak-password') {
        message = "La contraseña es débil";
      } else if (e.code == "correo-electronico-en-uso") {
        message = "El correo electrónico ya está en uso";
      }
      return left(message);
    }
  }
}
