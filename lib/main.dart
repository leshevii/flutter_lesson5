import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainPage()));
}

List<Map<String, Icon>> data = const [
  {'Home': Icon(Icons.home)},
  {'Profile': Icon(Icons.person)},
  {'Images': Icon(Icons.image)},
];

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        centerTitle: true,
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(Icons.account_circle_rounded),
            );
          })
        ],
      ),
      endDrawer: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 250),
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.asset(
                'assets/art.jpg',
                fit: BoxFit.cover,
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(height: 10),
            const Text('Username')
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(75),
                  child: Image.asset(
                    'assets/art.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            for (var e in data)
              TileData(
                text: e.keys.first,
                icon: e.values.first,
              ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Выход'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Регистрация'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Photo'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.album), label: 'Albums'),
        ],
      ),
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 200,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Expanded(
                            child: Icon(Icons.credit_card),
                            flex: 1,
                          ),
                          Expanded(
                            child: Text('Сумма'),
                            flex: 4,
                          ),
                          Expanded(
                            child: Text('200 руб'),
                            flex: 1,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Оплатить',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade300),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}

class TileData extends StatelessWidget {
  late String text;
  late Icon icon;
  TileData({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
    );
  }
}
