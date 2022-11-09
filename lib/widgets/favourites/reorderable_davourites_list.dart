import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pockemon_cubit/models/favourite_model.dart';

class ReorderableFavouritesList extends StatefulWidget {
  ReorderableFavouritesList(this.favourites, this.functionForReorder);

  final List<Favourite>? favourites;
  Function(int a, int b) functionForReorder;

  @override
  State<ReorderableFavouritesList> createState() =>
      _ReorderableFavouritesListState();
}

class _ReorderableFavouritesListState extends State<ReorderableFavouritesList> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color evenItemColor = colorScheme.secondary.withOpacity(0.15);
    final Color draggableItemColor = colorScheme.secondary;

    Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(0, 6, animValue)!;
          return Material(
            elevation: elevation,
            color: draggableItemColor,
            shadowColor: draggableItemColor,
            child: child,
          );
        },
        child: child,
      );
    }

    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      proxyDecorator: proxyDecorator,
      onReorder: _refreshList,
      children: <Widget>[
        for (int index = 0; index < widget.favourites!.length; index += 1)
          Card(
              elevation: 6,
              key: UniqueKey(),
              child: ListTile(
                  tileColor: evenItemColor,
                  leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.network(
                        widget.favourites![index].imgUrl,
                        errorBuilder: (context, url, error) {
                          return const Icon(Icons.error);
                        },
                      )),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  trailing: const Icon(Icons.more_vert),
                  title: Text('${widget.favourites?[index].name}'))),
      ], // reorderList,
    );
  }

  void _refreshList(int oldIndex, int newIndex) {
    setState(() {
      widget.functionForReorder.call(oldIndex, newIndex);
    });
  }
}
