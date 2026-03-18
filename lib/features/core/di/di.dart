import 'package:get_it/get_it.dart';
import 'package:task_manager_app/features/task/data/repositories/task_repository_impl.dart';
import 'package:task_manager_app/features/task/data/services/task_service.dart';
import 'package:task_manager_app/features/task/domain/repository/task_repository.dart';
import 'package:task_manager_app/features/task/presentation/bloc/task_bloc.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton(() => TaskService());
  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(sl()),
  );

  sl.registerFactory(
    () => TaskBloc(sl()),
  );
}
