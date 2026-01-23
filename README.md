# 📱 Bus2 Flutter Challenge — Random Users

Aplicativo desenvolvido em Flutter como parte do **teste técnico para a vaga de Desenvolvedor(a) Flutter na Bus2**.

O app consome a API pública **RandomUser** e exibe informações de pessoas, com **persistência local** e atualização automática a cada **5 segundos** utilizando **Ticker (não Timer)**, conforme solicitado no desafio.

---

## 🎥 Demonstração — Atualização automática com Ticker

A tela inicial realiza requisições automáticas à API a cada **5 segundos** utilizando **Ticker**, persistindo e adicionando o novo usuário na lista.

![Ticker Demo](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExNDE4bWk5Y2ZicG03M2U5Z2kwM3BjemVzaGh2ZmY3amtyN216Ym8ybyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/kZ0wgselqBvx15Myzz/giphy.gif)

---

## 🎯 Objetivo

Criar um aplicativo Flutter que:

- Consuma dados da API: https://randomuser.me/api/
- Exiba uma lista de pessoas com informações básicas
- Atualize automaticamente a lista a cada **5 segundos** utilizando **Ticker**
- Persista os dados localmente
- Permita visualizar detalhes completos de cada pessoa
- Permita salvar/remover pessoas persistidas
- Tenha uma tela dedicada para usuários persistidos

---

## ✅ Requisitos atendidos

- [x] Orientação a Objetos (OO)
- [x] Parse JSON → Modelo em Dart (DTO)
- [x] Conversão Modelo Dart → Persistência (Hive)
- [x] Padrão MVVM
- [x] Repository Strategy
- [x] Controle de estado (Notifiers)
- [x] Utilização de **Ticker** (não Timer)
- [x] 3 telas implementadas (Home, Details, Persisted)

---

## 🧱 Arquitetura

O projeto segue uma estrutura baseada em **Clean Architecture**, separando responsabilidades em camadas:

- **Data**: DTOs, DataSources, Mappers e Repositories (implementação)
- **Domain**: Entities, UseCases e Repository (contrato)
- **Presentation**: Pages, Notifiers e Widgets (MVVM)

📁 Estrutura do projeto (pasta `lib/`):

```txt
lib/
  core/
    di/service_locator.dart
    network/http_client.dart
    storage/storage.dart
    utils/
      app_exceptions.dart
      to_int.dart

  feature/
    people/
      data/
        datasources/people/
          people_remote_datasource.dart
          people_local_datasource.dart
        dto/
          person_hive_model.dart
          random/...
        mappers/person/
          person_mapper.dart
        repositories/people/
          people_repository_impl.dart

      domain/
        entities/person/
          person_entity.dart
        repositories/people/
          people_repository.dart
        usecases/people/
          get_random_person_use_case.dart
          save_person_use_case.dart
          delete_person_use_case.dart
          get_saved_people_use_case.dart

      presentation/
        notifiers/
          home_notifier.dart
          saved_people_notifier.dart
        pages/
          home_page.dart
          person_detail_page.dart
          saved_people_page.dart
        widgets/
          shaking_card.dart
```
## 📲 Funcionalidades

### 🏠 Tela Inicial (Home)
Arquivo: `lib/feature/people/presentation/pages/home_page.dart`

- Realiza requisição na API e exibe lista de pessoas
- Atualiza automaticamente a cada **5 segundos** utilizando **Ticker**
- Persiste os usuários obtidos localmente
- Cada item da lista navega para a tela de detalhes
- Botão com ícone de database navega para a tela de usuários persistidos

### 👤 Tela de Detalhes
Arquivo: `lib/feature/people/presentation/pages/person_detail_page.dart`

- Exibe todas as informações da pessoa selecionada
- Dados organizados em grupos (seguindo a estrutura retornada pela API)
- Permite salvar ou remover o usuário da persistência

### 💾 Tela de Usuários Persistidos
Arquivo: `lib/feature/people/presentation/pages/saved_people_page.dart`

- Lista todos os usuários persistidos
- Permite acessar detalhes
- Permite remover usuário diretamente da lista
- Ao retornar para a tela anterior, garante que os removidos não permanecem listados

---

## 🔄 Atualização automática com Ticker

O desafio exige o uso de **Ticker** ao invés de `Timer`.

A atualização automática é realizada no fluxo da **Home**, disparando uma nova requisição a cada **5 segundos**, persistindo e adicionando o novo usuário à lista.

---

## 💾 Persistência Local

A persistência foi implementada com **Hive**, utilizando o modelo:

📌 `lib/feature/people/data/dto/person_hive_model.dart`

A conversão entre camadas é feita via Mapper:

📌 `lib/feature/people/data/mappers/person/person_mapper.dart`

---

## 🌐 API utilizada

- Website: https://randomuser.me/
- Endpoint: https://randomuser.me/api/

---

## 🚀 Como rodar o projeto

### Pré-requisitos
- Flutter SDK instalado
- Android Studio / VS Code configurado
- Emulador ou dispositivo físico

### Rodar localmente
```bash
flutter pub get
flutter run
```

---

## 🧪 Gerar arquivos do Hive (TypeAdapter)

Caso necessário, execute:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 📦 Principais dependências

- `hive` / `hive_flutter` → persistência local
- `get_it` → injeção de dependências (`service_locator`)
- `cached_network_image` → cache de imagens
- `intl` → formatação de datas
- `uuid` → geração/manipulação de identificadores

---

## 👨‍💻 Autor

**Gabriel Lima**  
LinkedIn: https://www.linkedin.com/in/sougabriellima/  
GitHub: https://github.com/iBy3l
