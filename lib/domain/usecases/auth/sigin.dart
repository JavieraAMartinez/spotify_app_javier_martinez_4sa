import 'package:dartz/dartz.dart';
import 'package:spotify_app_javier_martinez_4sa/core/usecase/usecase.dart';
import 'package:spotify_app_javier_martinez_4sa/data/models/auth/signin_user_req.dart';
import 'package:spotify_app_javier_martinez_4sa/domain/repository/auth/auth.dart';
import 'package:spotify_app_javier_martinez_4sa/service_locator.dart';

class SigninUseCase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
