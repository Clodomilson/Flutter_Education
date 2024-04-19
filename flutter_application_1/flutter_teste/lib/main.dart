import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppBarDemo extends StatelessWidget {
  const AppBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtenha uma instância de MaterialLocalizations para acessar os textos localizados
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Cor de fundo do AppBar
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            tooltip: localizations.openAppDrawerTooltip,
            onPressed: () {
              // Abre o Drawer ao clicar no ícone do menu
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(
          'AppBar Title',
        ),
        actions: [
          IconButton(
            tooltip: 'Favorite',
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('First'),
                ),
                PopupMenuItem(
                  child: Text('Second'),
                ),
                PopupMenuItem(
                  child: Text('Third'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Home Tab',
        ),
      ),
      // Adiciona o Drawer ao Scaffold
      drawer: Drawer(
        child: ListView(
          // Defina os itens no Drawer
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Ação ao selecionar "Home"
                Navigator.pop(context); // Fechar o Drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Ação ao selecionar "Settings"
                Navigator.pop(context); // Fechar o Drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Ação ao selecionar "About"
                Navigator.pop(context); // Fechar o Drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar Demo',
      localizationsDelegates: const [
        // Configurações para internacionalização com flutter_localizations
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        // Lista de idiomas suportados
        Locale('en', 'US'), // Inglês
        Locale('pt', 'BR'), // Português do Brasil
      ],
      home: const AppBarDemo(),
    );
  }
}