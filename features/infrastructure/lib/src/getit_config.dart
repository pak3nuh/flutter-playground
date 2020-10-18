import 'package:get_it/get_it.dart';
import 'package:infrastructure/src/getit_config.config.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
void configureInfrastructureGetIt(GetIt getIt, Set<String> environments) {
  $initGetIt(getIt, environmentFilter: AllEnvironments(environments));
}

class AllEnvironments extends EnvironmentFilter {
  AllEnvironments(Set<String> environments) : super(environments);

  @override
  bool canRegister(Set<String> depEnvironments) {
    return depEnvironments.isEmpty ||
        this.environments.containsAll(depEnvironments);
  }
}
