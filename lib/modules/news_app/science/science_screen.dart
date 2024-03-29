import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/news_app/cubit/cubit.dart';
import '../../../layouts/news_app/cubit/states.dart';
import '../../../shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {

        var scienceList = NewsCubit.get(context).science;

        return newsBuilder(scienceList, context);
      },
    );
  }
}
