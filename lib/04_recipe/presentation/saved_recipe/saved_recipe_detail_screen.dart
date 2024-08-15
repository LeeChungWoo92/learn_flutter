import 'package:flutter/material.dart';
import 'package:learn_flutter/01_widget_rule/presentation/component/recipe_link_card_widget.dart';
import 'package:learn_flutter/03_food_recipe_app/ui/color_styles.dart';
import 'package:learn_flutter/03_food_recipe_app/ui/fonts.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';
import 'package:learn_flutter/04_recipe/presentation/component/ingrident_item_widget.dart';
import 'package:learn_flutter/04_recipe/presentation/component/procedure_item_widget.dart';
import 'package:learn_flutter/04_recipe/presentation/component/profile_widget.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/component/recipe_card_widget.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipe_detail_view_model.dart';
import 'package:learn_flutter/04_recipe/ui/snack_bar_utils.dart';

import '../../../01_widget_rule/data/model/profile.dart';

enum PopUpItem { share, rate, review, bookmark }

class SavedRecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;
  final SavedRecipeDetailViewModel viewModel;

  const SavedRecipeDetailScreen({
    super.key,
    required this.recipe,
    required this.viewModel,
  });

  @override
  State<SavedRecipeDetailScreen> createState() => _SavedRecipeDetailScreenState();
}

class _SavedRecipeDetailScreenState extends State<SavedRecipeDetailScreen> {
  static const profile = Profile(
    imageUrl: 'https://cdn.pixabay.com/photo/2020/06/25/16/25/micky-mouse-5340128_1280.jpg',
    name: '미키마우스',
    locationName: 'Lagos,Nigeria',
  );

  bool isFollow = false;

  void toggleFollow(String message) {
    setState(() {
      isFollow = !isFollow;
    });
  }

  PopUpItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<PopUpItem>(
            color: Colors.white,
            icon: const Icon(Icons.more_horiz),
            initialValue: selectedItem,
            onSelected: (PopUpItem item) {
              setState(() {
                selectedItem = item;
                if (selectedItem == PopUpItem.share) {
                  showRecipeLinkDialog(context);
                }
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<PopUpItem>>[
              const PopupMenuItem<PopUpItem>(
                value: PopUpItem.share,
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text('share'),
                ),
              ),
              const PopupMenuItem<PopUpItem>(
                value: PopUpItem.rate,
                child: ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Rate Recipe'),
                ),
              ),
              const PopupMenuItem<PopUpItem>(
                value: PopUpItem.review,
                child: ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Review'),
                ),
              ),
              const PopupMenuItem<PopUpItem>(
                value: PopUpItem.bookmark,
                child: ListTile(
                  leading: Icon(Icons.bookmark),
                  title: Text('Unsave'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(tag: widget.recipe.imageUrl, child: RecipeCardWidget(recipe: widget.recipe)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.recipe.foodName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Material(
                    child: Text(
                      '(13k Reviews)',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ProfileWidget(profile: profile, onFollowTap: toggleFollow, isFollow: isFollow),
              const SizedBox(height: 8),
              tabBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBar() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(
            height: 58,
            child: TabBar(
              labelStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                height: 17 / 11,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                height: 17 / 11,
              ),
              tabs: const [
                Tab(
                  text: 'Ingredient',
                  height: 33,
                ),
                Tab(
                  text: 'Procedure',
                  height: 33,
                ),
              ],
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: ColorStyles.primary100Color,
                borderRadius: BorderRadius.circular(10),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
              labelColor: ColorStyles.whiteColor,
              unselectedLabelColor: ColorStyles.primary80Color,
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            height: 450,
            child: TabBarView(
              children: [
                ingredientList(),
                proceduretList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ingredientList() {
    final ingridents = widget.viewModel.state.ingrident;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/ic_food.png'),
                const SizedBox(width: 5),
                Text('1 serve',
                    style: Fonts.smallerTextRegular.copyWith(
                      color: ColorStyles.gray3Color,
                    )),
              ],
            ),
            Text('${widget.viewModel.state.ingrident.length} Items',
                style: Fonts.smallerTextRegular.copyWith(
                  color: ColorStyles.gray3Color,
                )),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: ingridents.length,
            itemBuilder: (context, index) {
              final ingrident = ingridents[index];
              if (widget.viewModel.state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: IngridentItemWidget(ingrident: ingrident),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget proceduretList() {
    final procedures = widget.viewModel.state.procedure;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/ic_food.png'),
                const SizedBox(width: 5),
                Text('1 serve',
                    style: Fonts.smallerTextRegular.copyWith(
                      color: ColorStyles.gray3Color,
                    )),
              ],
            ),
            Text('${widget.viewModel.state.procedure.length} Steps',
                style: Fonts.smallerTextRegular.copyWith(
                  color: ColorStyles.gray3Color,
                )),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: procedures.length,
            itemBuilder: (context, index) {
              final procedure = procedures[index];
              if (widget.viewModel.state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ProcedureItemWidget(procedure: procedure),
              );
            },
          ),
        ),
      ],
    );
  }

  void showRecipeLinkDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
              child: RecipeLinkCardWidget(
            onCopyLink: () {
              widget.viewModel.copyLink(widget.recipe.foodName);
              SnackBarUtils.showLinkCopiedSnackBar(context, 'Link Copied');
              Navigator.pop(context);
            },
            onClose: () {
              Navigator.pop(context);
            },
            recipe: widget.recipe,
          ));
        });
  }
}
