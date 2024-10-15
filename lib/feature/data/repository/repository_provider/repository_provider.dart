import 'package:rent_home/feature/data/api_provider/api_provider.dart';
import 'package:rent_home/feature/data/models/register_model.dart';

class RepositoryProvider {
  Future<void> getRegister(RegisterModel register) async => await ApiProvider.getRegister(register);
}
