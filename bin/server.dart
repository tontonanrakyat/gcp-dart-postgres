import 'dart:io';

import 'package:postgres/postgres.dart';

void main() async {
  var port = int.tryParse(Platform.environment['PORT'] ?? '8080');
  var address = InternetAddress.anyIPv4;
  var server = await HttpServer.bind(address, port);
  // var socket = Socket.connect(host, port);

  server.listen((request) async {
    var string = 'hello world';
    var connection = PostgreSQLConnection(
      // '/cloudsql/coba-data-base:asia-southeast1:postgresinstance/.s.PGSQL.1433',
      '10.71.65.3',
      5432,
      'postgres',
      username: 'postgres',
      password: 'password',
    );
    await connection.open();
    string = 'Connected to Postgres database...';

    // akayyyyy

    // oyyyy

    // if (request.method == 'GET') {
    //   var idx = request.uri.path.substring(1);
    //   var results = await connection.query('''
    //     SELECT * FROM users WHERE id=$idx
    //   ''');
    //   string = results.toString();
    // } else if (request.method == 'POST') {
    //   final namex = request.uri.queryParameters['name'];
    //   final agex = int.parse(request.uri.queryParameters['age']);
    //   await connection.query('''
    //     INSERT INTO users (name,age)
    //     VALUES ('$namex',$agex)
    //   ''');
    //   string = '$namex & $agex have been posted';
    // } else if (request.method == 'PUT') {
    //   final namex = request.uri.queryParameters['name'];
    //   final agex = int.parse(request.uri.queryParameters['age']);
    //   await connection.query('''
    //     UPDATE users SET age=$agex
    //     WHERE (name='$namex')
    //   ''');
    //   string = '$namex has been updated';
    // } else if (request.method == 'DELETE') {
    //   final idx = request.uri.queryParameters['id'];
    //   await connection.query('''
    //     DELETE FROM users WHERE id=$idx
    //   ''');
    //   string = 'user with id = $idx has been deleted';
    // }

    request
      ..response.write(string)
      ..response.close();
  });
}
