import 'package:dartz/dartz.dart';
import 'package:spotify_app_javier_martinez_4sa/core/usecase/usecase.dart';
import 'package:spotify_app_javier_martinez_4sa/data/models/auth/create_user_req.dart';
import 'package:spotify_app_javier_martinez_4sa/domain/repository/auth/auth.dart';
import 'package:spotify_app_javier_martinez_4sa/service_locator.dart';

class SignupUseCase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
