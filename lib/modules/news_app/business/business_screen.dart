import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/layouts/news_app/cubit/cubit.dart';
import 'package:learn/layouts/news_app/cubit/states.dart';
import 'package:learn/shared/components/components.dart';

import '../../../shared/cubit/cubit.dart';
import '../web_view/web_view_screen.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {

        var businessList = NewsCubit.get(context).business;

        return newsBuilder(businessList, context);
        //   Scaffold(
        //   appBar: AppBar(
        //     title: const Text(
        //       'News App',
        //       style: TextStyle(
        //         fontSize: 25.0,
        //         fontWeight: FontWeight.w800,
        //       ),
        //     ),
        //     actions: [
        //       // IconButton(
        //       //   onPressed: ()
        //       //   {
        //       //     navigateTo(context,SearchScreen());
        //       //   },
        //       //   icon: Icon(Icons.search),
        //       // ),
        //       IconButton(
        //         onPressed: ()
        //         {
        //           AppCubit.get(context).changeAppMode();
        //         },
        //         icon: Icon(Icons.brightness_4_outlined),
        //       ),
        //     ],
        //   ),
        //   body: ConditionalBuilder(
        //     condition: businessList.isNotEmpty,
        //     builder: (context) => ListView.separated(
        //       itemBuilder: (context, index) => InkWell(
        //         onTap: () {
        //           navigateTo(context, WebViewScreen(businessList[index]['url']));
        //         },
        //         child: Padding(
        //           padding: const EdgeInsets.all(16.0),
        //           child: Row(
        //             children: [
        //               Container(
        //                 height: 120.0,
        //                 width: 120.0,
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(15.0),
        //                   image: DecorationImage(
        //                     fit: BoxFit.cover,
        //                     image: NetworkImage(
        //                       businessList[index]['urlToImage'].toString(),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 10.0,
        //               ),
        //               Expanded(
        //                 child: Container(
        //                   height: 120.0,
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.start,
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Expanded(
        //                         child: Text(
        //                           businessList[index]['title'].toString(),
        //                           style: Theme.of(context).textTheme.bodyLarge,
        //                           key: UniqueKey(),
        //                           // const TextStyle(
        //                           //   fontSize: 18.0,
        //                           //   fontWeight: FontWeight.w600,
        //                           // ),
        //                           maxLines: 3,
        //                           overflow: TextOverflow.ellipsis,
        //                         ),
        //                       ),
        //                       Text(
        //                         businessList[index]['publishedAt'].toString(),
        //                         style: const TextStyle(
        //                           fontSize: 15.0,
        //                           color: Colors.grey,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       separatorBuilder: (context, index) => myDivider(),
        //       itemCount: businessList.length,
        //       physics: const BouncingScrollPhysics(),
        //     ),
        //     fallback: (context) => false
        //         ? Container()
        //         : Center(
        //       child: CircularProgressIndicator(),
        //     ),
        //   ),
        // );
      },
    );
  }
}