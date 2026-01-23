import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/service_locator.dart';
import '../notifiers/home_notifier.dart';
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
        title: const Text('Random Users'),
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
      body: ListenableBuilder(
        listenable: _notifier,
        builder: (context, _) {
          if (_notifier.isLoading && _notifier.people.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_notifier.people.isEmpty) {
            return const Center(child: Text('Aguardando usuários...'));
          }

          return ListView.separated(
            itemCount: _notifier.people.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final person = _notifier.people[index];
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
    );
  }
}
