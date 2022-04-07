import 'package:annix/services/global.dart';
import 'package:annix/widgets/square_icon_button.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final String id;

  const FavoriteButton({Key? key, required this.id}) : super(key: key);

  @override
  FavoriteButtonState createState() => FavoriteButtonState();
}

class FavoriteButtonState extends State<FavoriteButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isLoading
          ? CircularProgressIndicator()
          : Icon(
              Global.anniv!.favorites.containsKey(widget.id)
                  ? Icons.favorite_outlined
                  : Icons.favorite_border_outlined,
            ),
      onPressed: () async {
        if (!Global.anniv!.favorites.containsKey(widget.id)) {
          setState(() {
            isLoading = true;
          });
          await Global.anniv!.addFavorite(widget.id);
          setState(() {
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = true;
          });
          await Global.anniv!.removeFavorite(widget.id);
          setState(() {
            isLoading = false;
          });
        }
      },
    );
  }
}
