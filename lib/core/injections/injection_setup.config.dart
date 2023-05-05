// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/app_db/app_db_repository_impl.dart' as _i4;
import '../../data/gpt/repository_impl/gpt_repository_impl.dart' as _i6;
import '../../domain/app_db/app_db_repository.dart' as _i3;
import '../../domain/gpt/reposiotory/gpt_repository.dart' as _i5;
import '../../presentation/bloc/gpt_model/gpt_model_bloc.dart' as _i8;
import '../../presentation/bloc/user/user_bloc.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AppDbRepository>(
      () => _i4.AppDbRepositoryImplementation());
  gh.lazySingleton<_i5.GptRepository>(() => _i6.GptRepositoryImpl());
  gh.factory<_i7.UserBloc>(() => _i7.UserBloc(get<_i5.GptRepository>()));
  gh.factory<_i8.GptModelBloc>(
      () => _i8.GptModelBloc(get<_i5.GptRepository>()));
  return get;
}
