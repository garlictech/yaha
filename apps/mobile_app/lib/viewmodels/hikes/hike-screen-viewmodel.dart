class HikeScreenViewModel {
  final List<String> imageUrls;

  HikeScreenViewModel(
      {this.imageUrls = const [HikeScreenViewModel.imagePlaceholder]});

  static const imagePlaceholder =
      'https://cdn2.iconfinder.com/data/icons/mountain-landscape-2/138/hiking_boots_hiking_logo_hiking_chair_hiking_drawing_hiking_day_hiking_flyer_hiking_in_winter-1024.png';
}
