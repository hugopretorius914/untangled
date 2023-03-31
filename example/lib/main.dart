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
      theme: ThemeData(
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
  List<int> _selectedTopics = [];

  void addTopic(int idx) {
    setState(() {
      _selectedTopics = _selectedTopics..add(idx);
    });
  }

  void removeTopic(int idx) {
    setState(() {
      _selectedTopics = _selectedTopics
        ..removeWhere((element) => element == idx);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> views = [
      Center(
        child: Button(
          label: '{label}',
          onTap: () {
            Theme.of(context).setLight(!Theme.of(context).light);
          },
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
      Center(
        child: Column(children: [
          for (final v in FontVariant.values.toList())
            Typography(
              v.defaultText,
              variant: v,
            )
        ]),
      ),
      Center(
        child: Button(
          label: 'Switch Theme',
          onTap: () {
            Theme.of(context).setLight(!Theme.of(context).light);
          },
        ),
      ),
      Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Typography(
                'Select your interests',
                variant: FontVariant.headline,
              ),
              gapVMedium,
              const Typography(
                  'The topics you choose will have an affect on your feed. You can always come back later...'),
              gapVMedium,
              gapVMedium,
              gapVMedium,
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  for (final t in _topics)
                    Chip(
                      label: t,
                      active: _selectedTopics.contains(_topics.indexOf(t)),
                      onTap: () => _selectedTopics.contains(_topics.indexOf(t))
                          ? addTopic(_topics.indexOf(t))
                          : removeTopic(_topics.indexOf(t)),
                    ),
                ],
              ),
              gapVMedium,
              gapVMedium,
              Button(onTap: () {}, label: 'Continue'),
            ],
          ),
        ),
      ),
    ];
    return Stack(
      children: [
        Canvas(
          child: Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Chip(
                        onTap: () => setState(() {
                          _selectedIndex = 0;
                        }),
                        label: 'Button',
                        active: _selectedIndex == 0,
                      ),
                      gapHSmall,
                      Chip(
                        onTap: () => setState(() {
                          _selectedIndex = 1;
                        }),
                        label: 'Chip',
                        active: _selectedIndex == 1,
                      ),
                      gapHSmall,
                      Chip(
                        onTap: () => setState(() {
                          _selectedIndex = 2;
                        }),
                        label: 'Typography',
                        active: _selectedIndex == 2,
                      ),
                      gapHSmall,
                      Chip(
                        onTap: () => setState(() {
                          _selectedIndex = 3;
                        }),
                        label: 'Theme',
                        active: _selectedIndex == 3,
                      ),
                      gapHSmall,
                      Chip(
                        onTap: () => setState(() {
                          _selectedIndex = 4;
                        }),
                        label: 'Case Study',
                        active: _selectedIndex == 4,
                      ),
                    ],
                  ),
                ),
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.3),
                ),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 1,
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

const gapVExtraSmall = SizedBox(
  height: 5,
);

const gapVSmall = SizedBox(
  height: 10,
);

const gapVMedium = SizedBox(
  height: 20,
);

const gapHExtraSmall = SizedBox(
  width: 5,
);

const gapHSmall = SizedBox(
  width: 10,
);

const gapHMedium = SizedBox(
  width: 20,
);

const _topics = [
  'Artificial Intelligence',
  'Climate Change',
  'Mental Health',
  'Online Privacy',
  'Cybersecurity',
  'Renewable Energy',
  'Blockchain Technology',
  'Space Exploration',
  'Robotics',
  'Augmented Reality',
  'Virtual Reality',
  'Internet of Things',
  'Machine Learning',
  'Cryptocurrency',
  'Future of Work',
  'Education Reform',
  'Aging Population',
  'Healthcare Technology',
  'Social Media',
  'Digital Transformation',
  'E-commerce',
  '5G Technology',
  'Autonomous Vehicles',
  'Quantum Computing',
  'Smart Cities',
  'Food Sustainability',
  'Gender Equality',
  'Diversity and Inclusion',
  'Ocean Conservation',
  'Nuclear Energy',
  'Wildlife Conservation',
  'Poverty Alleviation',
  'Humanitarian Aid',
  'Mental Health Stigma',
  'Cyberbullying',
  'Sustainable Fashion',
  'Renewable Agriculture',
  'Homelessness',
  'Clean Water Access',
  'Globalization and its Effects',
];
