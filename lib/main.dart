import 'package:flutter/material.dart';
import 'package:get_ui/bin/get.dart';
import 'package:menu_bar/menu_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MenuBarWidget(
      barButtons: [
        BarButton(
          text: const Text('File', style: TextStyle(color: Colors.black)),
          submenu: SubMenu(
            menuItems: [
              MenuButton(
                text: const Text('Create Project'),
                onTap: () {},
              ),
              MenuButton(
                text: const Text('Create View'),
                onTap: () {},
              ),
              MenuButton(
                text: const Text('Create Controller'),
                onTap: () => callTask(['get create view:dialogview on bin']),
              ),
              const MenuDivider(),
              MenuButton(
                text: const Text('Exit'),
                onTap: () {},
              ),
            ],
          ),
        ),
        BarButton(
          text: const Text('Help', style: TextStyle(color: Colors.black)),
          submenu: SubMenu(
            menuItems: [
              MenuButton(
                text: const Text('View License'),
                onTap: () {},
              ),
              MenuButton(
                text: const Text('About'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}