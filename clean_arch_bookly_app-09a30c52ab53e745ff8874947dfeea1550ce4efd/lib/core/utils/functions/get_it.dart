import 'package:bookly/Features/home/data/repositries/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../../Features/home/data/data_sources/local_home_repo_data_source.dart';
import '../../../Features/home/data/data_sources/remote_home_repo_data_source.dart';
import '../api_service.dart';

final GetIt  getIt = GetIt.instance;

void setupServiceLocator(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(localHomeRepoDataSource: LocalHomeRepoDataSourceImp(),
    remoteHomeRepoDataSource: RemoteHomeRepoDataSourceImp(getIt.get<ApiService>())));
}
