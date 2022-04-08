

class ImgConstants {
  //Logos
  static const String splash = 'assets/images/splash.png';
  static const String splashLogo = 'assets/images/splash_logo.png';
  static const String coloredAppLogo = 'assets/images/colored_logo.png';
  static const String loginBkg = 'assets/images/login_bkg.png';
  static const String loginLogo = 'assets/images/login_logo.png';
  static const String forgotPwdLayer = 'assets/images/forgot_pwd_layer.png';
  static const String selectLocationLayer =
      'assets/images/select_location_layer.png';
  static const String orderSucess = 'assets/images/sucess_layer.png';
  static const String paymentFailed = 'assets/images/payment_fail_layer.png';
  static const String noItemlayer = 'assets/images/empty_cart_layer.png';

  //Intro
  static const String introOne = 'assets/images/intro_one.png';
  static const String introTwo = 'assets/images/intro_two.png';
  static const String introThree = 'assets/images/intro_three.png';

  //Icons
  static const String aerrowRight = 'assets/images/right-arrow.png';
  static const String aerrowdown = 'assets/images/down_arrow.png';
  static const String aerrowLeft = 'assets/images/back-arrow.png';
  static const String aerrowRightSmall = 'assets/images/right_arrow.png';
  static const String menu = 'assets/images/menu_icon.png';
  static const String notification = 'assets/images/notification_ic.png';
  static const String user = 'assets/images/user.png';
  static const String email = 'assets/images/email_ic.png';
  static const String mobile = 'assets/images/phone_ic.png';
  static const String password = 'assets/images/password_ic.png';
  static const String star = 'assets/images/star_white.png';
  static const String delete = 'assets/images/delete.png';
  static const String sort = 'assets/images/sort_ic.png';
  static const String filter = 'assets/images/filter_ic.png';
  static const String radioChecked = 'assets/images/radio_checked.png';
  static const String radioUnchecked = 'assets/images/radio_unchecked.png';
  static const String profileEdit = 'assets/images/profie_edit.png';
  static const String imgEdit = 'assets/images/photo_edit_ic.png';
  static const String logout = 'assets/images/logout_ic.png';
  static const String editLight = 'assets/images/edit.png';
  static const String share = 'assets/images/share_ic.png';
  static const String search = 'assets/images/search_ic.png';
  static const String starFill = 'assets/images/star_blank.png';
  static const String starBlank = 'assets/images/star_fill.png';
  static const String coupen = 'assets/images/promo_code.png';
  static const String close = 'assets/images/close.png';
  static const String orderPlaced = 'assets/images/order_placed.png';
  static const String orderShipped = 'assets/images/order_shipped.png';
  static const String orderOod = 'assets/images/order_ood.png';
  static const String orderDelivered = 'assets/images/order_delivered.png';
  static const String checkOutAddress = 'assets/images/checkout_address.png';
  static const String checkOutPayment = 'assets/images/checkout_card.png';
  static const String checkOutConfirm = 'assets/images/checkout_confirm.png';
  static const String langEn = 'assets/images/lang_en.png';
  static const String langAr = 'assets/images/lang_ar.png';
  static const String unSelectedLang = 'assets/images/unselected_lang.png';
  static const String selectedLang = 'assets/images/selected_lang.png';
  static const String storeLocationPin = 'assets/images/store_location_pin.png';

  //TabBar Icons
  static const String tabHome = 'assets/images/tab_home.png';
  static const String tabSearch = 'assets/images/tab_search.png';
  static const String tabCart = 'assets/images/tab_cart.png';
  static const String tabAccount = 'assets/images/tab_account.png';

  //Buttons
  static const String fbLogin = 'assets/images/facebook_btn.png';
  static const String googleLogin = 'assets/images/google_btn.png';
  static const String appleLogin = 'assets/images/apple_btn.png';
  static const String btnPlusActive = 'assets/images/btn_plus_filled.png';
  static const String btnPlus = 'assets/images/btn_plus.png';
  static const String btnMinus = 'assets/images/btn_minus.png';

  //Other
  static const String userPlaceholder = 'assets/images/user_placeholder.png';

  //temporary
  static const String tempStore = 'assets/images/tempStorePic.png';
  // static const String tempCat = 'assets/images/tempCategory.png';
  static const String tempProduct = 'assets/images/tempProduct.png';
  static const String tempSliderOne = 'assets/images/temp_slider_one.png';
  static const String tempSliderTwo = 'assets/images/temp_slider_two.png';
  static const String tempSliderThree = 'assets/images/temp_slider_three.png';
  static const String tempAdvBanner = 'assets/images/temp_adv_banner.png';
  static const String tempProfile = 'assets/images/temp_profile.png';

  //placeholder
  static const String productPlaceHolder =
      'assets/images/product_placeholder.png';
  static const String catPlaceHolder = 'assets/images/category_placeholder.png';

  //card
  static const String payMaster = 'assets/images/pay_master.png';
  static const String payVisa = 'assets/images/pay_visa.png';
  static const String payCod = 'assets/images/pay_cod.png';
}

class LottieConstants {
  static const String loader = 'assets/lottie/8383-loader.json';
  static const String lock = 'assets/lottie/lock.json';
  static const String notification = 'assets/lottie/notification.json';
}

class APIConstant {


  static RequestKeys requestKeys = const RequestKeys();

  static String register = 'oauth/register';
  static String login = 'oauth/login';
  static String verifyOtp = 'oauth/farmerVerifyOtp';
  static String logout = 'userLogout';
  static String forgotPassword = 'forgotPassword';
  static String changePassword = 'changePassword';
  static String editUserProfile = 'editUserProfile';
  static String userInformation = 'users/';
  static String getMainModules = 'activities/activity';
  static String getOrchardAges = 'orchards/ages';
  static String getOrchardYields = 'orchards/yields';
  static String getOrchardStatus = 'orchards/status';
  static String getOrchardStages = 'orchards/stages';
  static String addOrchard = 'orchards';
  static String getOrchard = 'orchards';
  static String getUpdatedOrchards = 'orchards/updates';
  static String getSubscriptions = 'subscriptions';
  static String getMySubscriptions = 'subscriptions/mySubscriptions';
  static String getPaymentHistory = 'subscriptions/paymentHistory';
  static String ANDROID = 'android';

}

class RequestKeys {
  const RequestKeys();
  //Login
  String get email => 'email';
  String get password => 'password';

  //Register
  String get fullName => 'fullName';
  String get emailId => 'emailId';
  String get mobileNo => 'mobileNo';
  String get deviceToken => 'deviceToken';
  String get device => 'device';

  //Profile
  String get isNotification => 'isNotification';
  String get file => 'file';
  String get photo => 'photo';

  //Change Password
  String get oldPassword => 'oldPassword';
  String get newPassword => 'newPassword';

  //Add Address
  String get addressLine1 => 'addressLine1';
  String get addressLine2 => 'addressLine2';
  String get city => 'city';
  String get state => 'state';
  String get zipCode => 'zipCode';
  String get addressId => 'addressId';

  String get page => 'page';
  String get pagesize => 'pagesize';
  String get latitude => 'latitude';
  String get longitude => 'longitude';
  String get searchText => 'searchText';

  //Home
  String get vendorId => 'vendorId';

  //Categories
  String get parentCategory => 'parentCategory';

  //Product Listing
  String get key => 'key';
  String get salePrice => 'salePrice';
  String get sortingId => '_id';
  String get discount => 'discount';
  String get sort => 'sort';
  String get fromPriceRange => 'fromPriceRange';
  String get toPriceRange => 'toPriceRange';
  String get starRating => 'starRating';

  //Product details
  String get productId => 'productId';
  String get isRecommendeditems => 'isRecommendeditems';

  //Cart
  String get quantity => 'quantity';
  String get isRemoveCartProducts => 'isRemoveCartProducts';
  String get isInput => 'isInput';
  String get isIncrement => 'isIncrement';

  //Checkout
  String get shippingAddress => 'shippingAddress';
  String get isShipping => 'isShipping';
  String get isGettingTotals => 'isGettingTotals';
  String get orderId => 'orderId';
  String get isPayment => 'isPayment';
  String get promoCode => 'promoCode';
  String get paymentType => 'paymentType';
  String get isWallet => 'isWallet';

  //Rating
  String get rating => 'rating';
  String get productDetails => 'productDetails';
  String get sku => 'SKU';
  String get description => 'description';

}

class RegexConstants{
  static String emailValidator = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
}


