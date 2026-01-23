import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/core.dart';
import '../../feature/people/people.dart';
import '../../feature/people/presentation/notifiers/home_notifier.dart';
import '../../feature/people/presentation/notifiers/saved_people_notifier.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonHiveModelAdapter());

  final peopleStorage = HiveStorage<PersonHiveModel>('people_box');
  await peopleStorage.init();

  sl.registerSingleton<Storage<PersonHiveModel>>(peopleStorage);
  sl.registerLazySingleton<AppHttpClient>(() => AppHttpClient());

  sl.registerLazySingleton<PeopleLocalDataSource>(
    () => PeopleLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<PeopleRemoteDataSource>(
    () => PeopleRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<PeopleRepository>(
    () => PeopleRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
  );

  sl.registerLazySingleton(() => GetRandomPersonUseCase(sl()));
  sl.registerLazySingleton(() => SavePersonUseCase(sl()));
  sl.registerLazySingleton(() => DeletePersonUseCase(sl()));
  sl.registerLazySingleton(() => GetSavedPeopleUseCase(sl()));

  sl.registerFactory(
    () => HomeNotifier(getRandomPerson: sl(), savePerson: sl()),
  );
  sl.registerFactory(
    () => SavedPeopleNotifier(
      getSavedPeople: sl(),
      deletePersonUseCase: sl(),
      savePersonUseCase: sl(),
    ),
  );
}
