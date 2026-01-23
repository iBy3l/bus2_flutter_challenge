import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/service_locator.dart';
import '../notifiers/saved_people_notifier.dart';
import 'person_detail_page.dart';

class SavedPeoplePage extends StatefulWidget {
  const SavedPeoplePage({super.key});

  @override
  State<SavedPeoplePage> createState() => _SavedPeoplePageState();
}

class _SavedPeoplePageState extends State<SavedPeoplePage> {
  late final SavedPeopleNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = sl<SavedPeopleNotifier>()..loadPeople();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuários Persistidos')),
      body: ListenableBuilder(
        listenable: _notifier,
        builder: (context, _) {
          if (_notifier.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_notifier.people.isEmpty) {
            return const Center(child: Text('Nenhum usuário salvo.'));
          }

          return ListView.separated(
            itemCount: _notifier.people.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final person = _notifier.people[index];
              return Dismissible(
                key: Key(person.uuid),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) {
                  _notifier.deletePerson(person.uuid);
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      person.pictureThumbnail,
                    ),
                  ),
                  title: Text(person.fullName),
                  subtitle: Text(person.cityState),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _notifier.deletePerson(person.uuid);
                    },
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (_) => PersonDetailPage(person: person),
                          ),
                        )
                        .then((_) {
                          if (context.mounted) {
                            _notifier.loadPeople();
                          }
                        });
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
