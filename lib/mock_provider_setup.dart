import 'package:pockemon_cubit/repository/pokemon_repository/pokemon_mock_repository.dart';
import 'package:pockemon_cubit/repository/pokemon_repository/pokemon_repository.dart';
import 'package:pockemon_cubit/service/sql_service.dart';
import 'package:pockemon_cubit/service/sql_service_mock.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> mock_providers = [
  ...mock_independentServices,
];


List<SingleChildWidget> mock_independentServices = [
  Provider<SqliteService>(create: (_) => SqliteServiceMock()),
  Provider<PokemonRepository>(create: (_) => PokemonMockRepository()),
];
