import 'package:flutter/material.dart';
import 'package:pbma7/pemesanan.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class rating extends StatelessWidget {
  const rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rating Produk')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // * rating Bar
            const Text('Beri Penilaian'),
            RatingBarIndicator(
              rating: 3,
              itemCount: 5,
              itemSize: 50,
              direction: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Icon(Icons.star, color: Colors.amber);
              },
            ),

            const SizedBox(height: 30),
            // * rating Bar Change
            const Text('Pilihlah Bintang Dibawah Ini'),
            RatingBar.builder(
              itemCount: 5,
              initialRating: 2,
              minRating: 1,
              allowHalfRating: true,
              direction: Axis.horizontal,
              itemPadding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (value) {
                print(value);
              },
            ),
            const SizedBox(height: 30),
            // * rating Bar Change
            const Text('Seberapa Puaskah Pengalamanmu'),
            RatingBar.builder(
              initialRating: 3,
              itemCount: 5,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return const Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return const Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return const Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return const Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return const Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                  default:
                    return const Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                }
              },
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ],
        ),
      ),
    );
  }
}