import 'package:get_it/get_it.dart';
import 'package:gradebook/core/services/txconnect_service.dart';
import 'package:gradebook/core/services/txconnect_service_lib.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<TxConnectService>(() => TxConnectServiceLib());
}
