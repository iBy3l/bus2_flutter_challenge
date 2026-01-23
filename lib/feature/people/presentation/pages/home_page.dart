import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/service_locator.dart';
import '../notifiers/home_notifier.dart';
import '../widgets/shaking_card.dart';
import 'person_detail_page.dart';
import 'saved_people_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final HomeNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = sl<HomeNotifier>()..init(this);
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        actions: [
          IconButton(
            icon: const Icon(Icons.storage),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SavedPeoplePage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ValueListenableBuilder<double>(
            valueListenable: _notifier.timeProgress,
            builder: (context, value, _) {
              return LinearProgressIndicator(value: value);
            },
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: _notifier,
              builder: (context, _) {
                return ListView.separated(
                  itemCount:
                      _notifier.people.length + (_notifier.isLoading ? 1 : 0),
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    if (_notifier.isLoading && index == 0) {
                      return const ShakingCard(); // Show shaking card at top
                    }

                    final adjustedIndex = _notifier.isLoading
                        ? index - 1
                        : index;
                    final person = _notifier.people[adjustedIndex];

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          person.pictureThumbnail,
                        ),
                      ),
                      title: Text(person.fullName),
                      subtitle: Text(person.email),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => PersonDetailPage(person: person),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
