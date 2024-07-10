import 'package:flutter/material.dart';
import 'package:learn_flutter/01_widget_rule/data/model/profile.dart';

class CreatorProfile extends StatelessWidget {
  final void Function(String) onFollowTap;
  final Profile profile;
  final bool isFollow;

  const CreatorProfile({
    super.key,
    required this.profile,
    required this.onFollowTap,
    required this.isFollow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.network(
              profile.imageUrl,
              // Replace with the correct image URL or asset
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Colors.green,
                    ),
                    Text(
                      profile.locationName,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 130,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isFollow ? Colors.grey : Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                onFollowTap.call(isFollow ? 'Follow' : 'UnFollow');
              },
              child: Text(
                isFollow ? 'Follow' : 'UnFollow',
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
