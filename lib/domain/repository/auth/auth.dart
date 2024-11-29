import 'package:dartz/dartz.dart';
import 'package:spotify_app_javier_martinez_4sa/data/models/auth/create_user_req.dart';
import 'package:spotify_app_javier_martinez_4sa/data/models/auth/signin_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);
}
