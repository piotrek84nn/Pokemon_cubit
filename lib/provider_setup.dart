
import 'package:http/http.dart' as http;
import 'package:pockemon_cubit/repository/pokemon_repository/pokemon_repository.dart';
import 'package:pockemon_cubit/repository/pokemon_repository/pokemon_repository_imp.dart';
import 'package:pockemon_cubit/service/sql_service.dart';
import 'package:pockemon_cubit/service/sql_service_imp.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];


List<SingleChildWidget> independentServices = [
  Provider<SqliteService>(create: (_) => SqliteServiceImp.initService()),
  Provider<PokemonRepository>(create: (_) => PokemonRepositoryImp(client: http.Client())),
];


List<SingleChildWidget> dependentServices = [
];

List<SingleChildWidget> uiConsumableProviders = [
];
