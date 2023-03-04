import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/user.dart';

class BackendProvider extends StateNotifier<User> {
  BackendProvider() : super(User(username: '', email: '', id: ''));
}
