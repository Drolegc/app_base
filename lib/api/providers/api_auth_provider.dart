import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:only_sugar_admin/api/base_provider.dart';
import 'package:only_sugar_admin/models/models.dart';
import 'package:only_sugar_admin/shared/utils/either_utils.dart';

class ApiAuthProvider {
  final BaseProvider _api;

  ApiAuthProvider(this._api);

  Future<Either<ServerError, Map>> login(
      String identifier, String password) async {
    final res = await _api.post(
        '/auth/local', {"identifier": identifier, "password": password},
        headers: {});

    if (res.hasError) return Left(ServerError(res.bodyString!));

    return Right(
        {'user': User.fromJson(res.body['user']), 'jwt': res.body['jwt']});
  }

  Future<Response> me() {
    return _api.post('/me', {});
  }
}
