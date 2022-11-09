import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pockemon_cubit/models/favourite_model.dart';
import 'package:pockemon_cubit/service/sql_service.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final SqliteService sqlService;

  FavouriteBloc(this.sqlService) : super(InitialFavourite()) {
    on<FavouriteEvent>((event, emit) async {
      if (event is LoadFavourites) {
        await _loadFavouritesList(emit, event);
      } else if (event is ReorderItemsOnList) {
        await _reorderItemsOnList(emit, event);
      }
    });
  }

  Future<void> _loadFavouritesList(
      Emitter<FavouriteState> emit, LoadFavourites event) async {
    emit(InitialFavourite());
    List<Favourite>? favList = await sqlService.getItems();
    if (favList != null) {
      favList.sort((a, b) => a.position.compareTo(b.position));
      emit(FavouritesLoaded(favList));
    } else {
      emit(InitialFavourite());
    }
  }

  Future<void> _reorderItemsOnList(
      Emitter<FavouriteState> emit, ReorderItemsOnList event) async {
    final favItems = state.favourites;
    if (event.oldIndex < event.newIndex) {
      event.newIndex -= 1;
    }
    final item = favItems.removeAt(event.oldIndex);
    favItems.insert(event.newIndex, item.copyWith(position: event.newIndex));
    for (int i = 0; i < favItems.length; i++) {
      favItems[i].position = i;
      await sqlService.addOrUpdateItem(favItems[i]);
    }
    emit(FavouritesLoaded(favItems));
  }
}
