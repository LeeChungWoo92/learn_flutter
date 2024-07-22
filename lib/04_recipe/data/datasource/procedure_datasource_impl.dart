import 'package:learn_flutter/04_recipe/data/datasource/procedure_datasource.dart';
import 'package:learn_flutter/04_recipe/data/model/procedure.dart';

class ProcedureDatasourceImpl implements ProcedureDatasource {
  @override
  Future<List<Procedure>> getProcedures() async {
    return [
      const Procedure(
        title: 'Step 1',
        content:
            'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?',
      ),
      const Procedure(
        title: 'Step 2',
        content:
            'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur? Tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?',
      ),
      const Procedure(
        title: 'Step 3',
        content:
            'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?',
      ),
      const Procedure(
          title: 'Step 4',
          content:
              'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?'),
    ];
  }
}
