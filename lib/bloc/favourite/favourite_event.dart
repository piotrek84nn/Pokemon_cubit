part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable{
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavourites extends FavouriteEvent {
  const LoadFavourites();
}

class ReorderItemsOnList extends FavouriteEvent {
  late int oldIndex;
  late int newIndex;

  ReorderItemsOnList(this.oldIndex, this.newIndex);

  @override
  List<Object> get props => [oldIndex, newIndex];
}

