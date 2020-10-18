// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:infrastructure/src/platform_info_api.dart';
import 'package:injectable/injectable.dart';

import 'platform_info.dart';

/// Environment names
const _dev = 'dev';
const _android = 'android';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<PlatformInfo>(() => AndroidInfo(), registerFor: {_dev, _android});
  return get;
}
