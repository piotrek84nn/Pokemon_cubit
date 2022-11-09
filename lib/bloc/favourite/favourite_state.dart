part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {
  final List<Favourite> favourites = <Favourite>[];

  @override
  List<Object> get props => [favourites];
}

class InitialFavourite extends FavouriteState {
  InitialFavourite();
}

class FavouritesLoaded extends FavouriteState {
  @override
  final List<Favourite> favourites;

  FavouritesLoaded(this.favourites);

  @override
  List<Object> get props => [favourites];
}
