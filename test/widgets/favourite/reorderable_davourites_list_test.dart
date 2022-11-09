import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pockemon_cubit/service/sql_service_mock.dart';
import 'package:pockemon_cubit/widgets/favourites/reorderable_davourites_list.dart';
import 'package:pockemon_cubit/widgets/widget_test_ext.dart';

void main() {
  setUp(() {});
  tearDown(() {});

  _loadWidget(WidgetTester tester, ReorderableFavouritesList widget) async {
    await tester.loadWidget(
        widget: Column(
      children: <Widget>[Expanded(child: widget)],
    ));
  }

  void reorderFunction(int a, int b) {
    debugPrint('Calling reordering function with args: $a, $b');
  }

  testWidgets("Favourites list - not empty", (WidgetTester tester) async {
    await _loadWidget(
      tester,
      ReorderableFavouritesList(
        SqliteServiceMock().favList,
        reorderFunction,
      ),
    );
    final count = tester.widgetList<Card>(find.byType(Card)).length;

    expect(find.byType(ReorderableListView), findsOneWidget);
    expect(count, SqliteServiceMock().favList.length);
  });

  testWidgets("Favourites list - is empty", (WidgetTester tester) async {
    await _loadWidget(
      tester,
      ReorderableFavouritesList(
        const [],
        reorderFunction,
      ),
    );
    final count = tester.widgetList<Card>(find.byType(Card)).length;

    expect(find.byType(ReorderableListView), findsOneWidget);
    expect(count, 0);
  });

  testWidgets("Favourites list - Reload", (WidgetTester tester) async {
    await _loadWidget(
      tester,
      ReorderableFavouritesList(
        SqliteServiceMock().favList,
        reorderFunction,
      ),
    );
    reorderFunction.call(1, 4);
    final count = tester.widgetList<Card>(find.byType(Card)).length;

    expect(find.byType(ReorderableListView), findsOneWidget);
    expect(count, SqliteServiceMock().favList.length);
  });
}
