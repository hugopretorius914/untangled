import 'package:flutter/widgets.dart';
import 'package:untangled/untangled.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const UntangledApp(
      themeData: ThemeData(
        buttonTheme: ButtonTheme(),
        chipTheme: ChipTheme(),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _chipSelected = false;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> views = [
      Center(
        child: Button(
          label: '{label}',
          onTap: () {},
        ),
      ),
      Center(
        child: Chip(
          label: '{label}',
          onTap: () => setState(() {
            _chipSelected = !_chipSelected;
          }),
          active: _chipSelected,
        ),
      ),
    ];
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => setState(() {
                      _selectedIndex = 0;
                    }),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Button',
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => setState(() {
                      _selectedIndex = 1;
                    }),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Chip',
                      ),
                    ),
                  ),
                ],
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.3),
                ),
                child: SizedBox(
                  height: double.maxFinite,
                  width: 1,
                ),
              ),
              Expanded(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: views,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
