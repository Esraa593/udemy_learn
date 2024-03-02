import 'dart:math';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/shared/components/components.dart';
import 'package:learn/shared/components/constants.dart';
import 'package:learn/shared/cubit/cubit.dart';
import 'package:learn/shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        List tasks = AppCubit.get(context).newTasks;

        return tasksBuilder(
            tasks: tasks,
            icon: Icons.table_view,
            text: 'No Tasks Yet, Please, Add Some Tasks!');
      },

    );
  }




}
