import 'package:bet_kray/Login/UserRepository/user_repository.dart';
import 'package:bet_kray/Login/bloc/login_bloc.dart';
import 'package:bet_kray/common/widget/drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
// import 'package:gojjoapp/screens/home.dart';

void main() {
  group('Profile Page', () {
    testWidgets("finding a drawer widget by type", (WidgetTester tester) async {
      const testKey = Key("drawer");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: MaterialApp(
          home: AppDrawer(
            key: testKey,
          ),
        ),
      ));
      expect(find.byKey(testKey), findsWidgets);
    });

    testWidgets("finding an icon widget by type", (WidgetTester tester) async {
      const testKey = Key("container");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: MaterialApp(
          home: AppDrawer(
            key: testKey,
          ),
        ),
      ));
      expect(find.byKey(testKey), findsWidgets);
    });

    testWidgets("finding a text by key", (WidgetTester tester) async {
      const testKey = Key("user");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: MaterialApp(
          home: AppDrawer(
            key: testKey,
          ),
        ),
      ));
      expect(find.byKey(testKey), findsWidgets);
    });

    testWidgets("finding a sizedbox widget by type",
        (WidgetTester tester) async {
      // const testKey = Key("user");
      // Build an App with a gesture detector widget that displays the letter .
     const testKey = Key("ismi");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: MaterialApp(
          home: AppDrawer(
            key: testKey,
          ),
        ),
      ));
      expect(find.byKey(testKey), findsWidgets);
    });

    testWidgets("finding an icon widget by key", (WidgetTester tester) async {
      const testKey = Key("icons");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: MaterialApp(
          home: AppDrawer(
            key: testKey,
          ),
        ),
      ));
      expect(find.byKey(testKey), findsWidgets);
    });

    testWidgets("finding a column widget by type", (WidgetTester tester) async {
      const testKey = Key("colu");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: MaterialApp(
          home: AppDrawer(
            key: testKey,
          ),
        ),
      ));
      expect(find.byKey(testKey), findsWidgets);
    });

    testWidgets("finding a ListTile widget by type",
        (WidgetTester tester) async {
      const testKey = Key("row");
      // Build an App with a gesture detector widget that displays the letter .
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: MaterialApp(
          home: AppDrawer(
            key: testKey,
          ),
        ),
      ));
      expect(find.byKey(testKey), findsWidgets);
    });

    testWidgets("finding a listile widget by type",
        (WidgetTester tester) async {
          const testKey = Key("buttonicon");
      await tester.pumpWidget(BlocProvider(
        create: (context) => LoginBloc(loginRepository: LoginRepository()),
        child: MaterialApp(
          home: AppDrawer(
            key: testKey,
          ),
        ),
      ));
      expect(find.byKey(testKey), findsWidgets);
    });

  });
}
