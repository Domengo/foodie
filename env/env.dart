// env/env.dart

import 'package:envify/envify.dart';
part '../lib/env/env.g.dart';

@Envify()
abstract class Env {
    static const apiKey = _Env.key;
}