import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/di/service_locator.dart';
import '../../domain/entities/person/person_entity.dart';
import '../notifiers/saved_people_notifier.dart';

class PersonDetailPage extends StatefulWidget {
  final PersonEntity person;

  const PersonDetailPage({super.key, required this.person});

  @override
  State<PersonDetailPage> createState() => _PersonDetailPageState();
}

class _PersonDetailPageState extends State<PersonDetailPage> {
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
      appBar: AppBar(title: Text(widget.person.fullName)),
      body: ListenableBuilder(
        listenable: _notifier,
        builder: (context, _) {
          final isSaved = _notifier.people.any(
            (p) => p.uuid == widget.person.uuid,
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: CachedNetworkImageProvider(
                      widget.person.pictureLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton.icon(
                    icon: Icon(isSaved ? Icons.delete : Icons.save),
                    label: Text(isSaved ? 'Remover dos Persistidos' : 'Salvar'),
                    onPressed: () {
                      if (isSaved) {
                        _notifier.deletePerson(widget.person.uuid);
                      } else {
                        _notifier.savePerson(widget.person);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSaved ? Colors.red : null,
                      foregroundColor: isSaved ? Colors.white : null,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildSection('Informações Pessoais', [
                  _buildRow('Nome Completo', widget.person.fullName),
                  _buildRow('Email', widget.person.email),
                  _buildRow('Telefone', widget.person.phone),
                  _buildRow('Celular', widget.person.cell),
                  _buildRow('Gênero', widget.person.gender),
                  _buildRow('Nacionalidade', widget.person.nat),
                  _buildRow('Idade', '${widget.person.dobAge} anos'),
                  _buildRow(
                    'Nascimento',
                    DateFormat.yMMMd().format(widget.person.dobDate),
                  ),
                ]),
                const Divider(),
                _buildSection('Endereço', [
                  _buildRow('Rua', widget.person.streetFull),
                  _buildRow('Cidade', widget.person.cityState),
                  _buildRow('País', widget.person.country),
                  _buildRow('CEP', widget.person.postcode),
                  _buildRow('Timezone', widget.person.timezoneDescription),
                ]),
                const Divider(),
                _buildSection('Cadastro', [
                  _buildRow('Username', widget.person.username),
                  _buildRow(
                    'Registrado em',
                    DateFormat.yMMMd().format(widget.person.registeredDate),
                  ),
                  _buildRow(
                    'ID',
                    '${widget.person.idName} ${widget.person.idValue}'.trim(),
                  ),
                ]),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...children,
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
