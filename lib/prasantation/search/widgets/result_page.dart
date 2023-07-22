import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/prasantation/search/widgets/title.dart';




import '../../../application/search/search_bloc.dart';

// const imageUrl =
//     'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        khight,
        const  SearchTitle(title: 'Movies & Tv'),
        khight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.2 / 3.3,
                shrinkWrap: true,
                children: List.generate(20, (index) {
                  final movie = state.searchResultList[index];
                  return MainCard(imageUrl: movie.posterImageUrl);
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
           const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}











// import 'package:flutter/cupertino.dart';
// import 'package:netflix_api/core/constants.dart';


// import 'package:netflix_api/prasantation/search/widgets/title.dart';



// // const searchImage = 'assets/images/screen_search/pic 5.jpg';

// class SearchResultWidget extends StatelessWidget {
//   const SearchResultWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         khight,
//         const SearchTitle(title: 'Movise  &  TV'),
//         khight,
//         Expanded(
//           child: GridView.count(
//             shrinkWrap: true,
//             crossAxisCount: 3,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 10,
//             childAspectRatio: 2.2/3.3,
//             children: List.generate(25, (index) {
           
//            final movie = state.SearchResultWidget[index];
//               return Maincard( imageUrl: '$imageAppendUrl${movie.posterPath}');
//             }),
//           ),
//         ),
//         khight,
        
//       ],
//     );
//   }
// }

// class Maincard extends StatelessWidget {
 
//   final String imageUrl;
//   const Maincard({super.key,required this.imageUrl,});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: NetworkImage(imageUrl),
//           fit: BoxFit.cover
//         ),
//       borderRadius: BorderRadius.circular(5)
//       ),
//     );
//   }
// }
