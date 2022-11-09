import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pockemon_cubit/bloc/favourite/favourite_bloc.dart';
import 'package:pockemon_cubit/widgets/favourites/reorderable_davourites_list.dart';

class FavouriteWidget extends StatefulWidget {
  const FavouriteWidget({Key? key}) : super(key: key);

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  @override
  void initState() {
    BlocProvider.of<FavouriteBloc>(context).add(const LoadFavourites());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon'),
          backgroundColor: Colors.blueAccent,
        ),
        body: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  Expanded(
                      child: ReorderableFavouritesList(state.favourites,
                          _reorderListItems))
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _reorderListItems(int oldPosition, int newPosition) {
    BlocProvider.of<FavouriteBloc>(context).add(ReorderItemsOnList(oldPosition, newPosition));
  }
}
