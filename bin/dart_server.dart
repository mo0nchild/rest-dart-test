import 'dart:io';

import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';

void main(List<String> arguments) async {
  var app = Router();

  app.get('/', (Request request) {
    final indexFile = File('bin/build/index.html').readAsStringSync();
    return Response.ok(indexFile, headers: {'content-type': 'text/html'});
  });

  app.get('/<file|.*>', createStaticHandler('bin/build/assets'));
  app.post('/data', (Request req) async {
    print(req.url);
    await req.readAsString().then((value) => print(value));
    return Response.ok('hello');
  });

  await io.serve(app, 'localhost', 8000).then((value) {
    return print('http://localhost:${value.port}');
  });
}
