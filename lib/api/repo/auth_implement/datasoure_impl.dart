import '../../api_manger.dart';
import '../../model/login/Login_respons.dart';
import '../../model/register/Register_respons.dart';

import '../auth_repositroy/auth_repositroy.dart';

class RepoDataSourceImplement implements RepoDataSource {
apiManger? APIManger;
RepoDataSourceImplement(this.APIManger);
@override
Future<LoginRespons?> login(String phone, String password) async{
  var response= await login(phone, password);
  return response;

}

@override
Future<RegisterRespons?> register(String name, String phone,
    String age, String gender, String nid, String address, String password)async {
  var response = APIManger?.register(name: name,
      phone: phone,
      NId: nid,
      age: age,
      gender: gender,
      address: address,
      password: password);
  return response;
}

}