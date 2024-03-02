import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/modules/counter_app/counter/cubit/cubit.dart';
import 'package:learn/modules/counter_app/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state)
        {
          if(state is CounterMinusState) print('minus state ${state.counter}');
          if(state is CounterPlusState) print('plus state ${state.counter}');
        },
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      CounterCubit.get(context).minus();
                    },
                    child: Text(
                      'Minus',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      CounterCubit.get(context).plus();
                    },
                    child: Text(
                      'Plus',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),),
                ],
              ),
            ),

          );
        },
      ),
    );
  }
}

