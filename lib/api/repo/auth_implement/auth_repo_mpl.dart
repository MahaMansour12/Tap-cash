

import '../auth_repositroy/auth_repositroy.dart';

class authI_repository_mplement implements AuthRepo{
RepoDataSource repoDataSource;
authI_repository_mplement(this.repoDataSource);
  @override
  Future<String?> login(String phone, String password) async{
   var respnse= await repoDataSource.login(phone, password);
   return respnse?.token;
  }

  @override
  Future<String?> register(String name, String phone, String age, String gender, String nid, String address, String password) async{
    var respnse= await repoDataSource.register( name,  phone,  age, gender, nid,  address, password) ;
    return respnse?.message;
  }
}



