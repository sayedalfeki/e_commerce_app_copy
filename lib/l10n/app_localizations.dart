import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @emailVerification.
  ///
  /// In en, this message translates to:
  /// **'Email verification'**
  String get emailVerification;

  /// No description provided for @enterOtp.
  ///
  /// In en, this message translates to:
  /// **'Please enter your code that send to your email address'**
  String get enterOtp;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @receiveCodeQuestion.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code?'**
  String get receiveCodeQuestion;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'resend'**
  String get resend;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forgetPassword;

  /// No description provided for @forgetPasswordQuote.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email associated to your account'**
  String get forgetPasswordQuote;

  /// No description provided for @continueTxt.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueTxt;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @resetPasswordQuote.
  ///
  /// In en, this message translates to:
  /// **'Password must not be empty and must contain 6 characters with upper case letter and one number at least '**
  String get resetPasswordQuote;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @enterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter you password'**
  String get enterYourPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberMe;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signup;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Have An Account'**
  String get dontHaveAnAccount;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get userName;

  /// No description provided for @enterUserName.
  ///
  /// In en, this message translates to:
  /// **'Enter User Name'**
  String get enterUserName;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @enterFirstName.
  ///
  /// In en, this message translates to:
  /// **'Enter Your First Name'**
  String get enterFirstName;

  /// No description provided for @enterLastName.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Last Name'**
  String get enterLastName;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @passwordConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Password Confirmation'**
  String get passwordConfirmation;

  /// No description provided for @enterPasswordConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirmation Password'**
  String get enterPasswordConfirm;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'phone Number'**
  String get phoneNumber;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Phone Number'**
  String get enterPhoneNumber;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Email'**
  String get enterEmail;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Password'**
  String get enterPassword;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login Success'**
  String get loginSuccess;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Email is invalid'**
  String get emailInvalid;

  /// No description provided for @passwordInvalid.
  ///
  /// In en, this message translates to:
  /// **'Password is invalid'**
  String get passwordInvalid;

  /// No description provided for @passwordConfirmationInvalid.
  ///
  /// In en, this message translates to:
  /// **'Password Confirmation is invalid'**
  String get passwordConfirmationInvalid;

  /// No description provided for @passwordConfirmationRequired.
  ///
  /// In en, this message translates to:
  /// **'Password Confirmation is required'**
  String get passwordConfirmationRequired;

  /// No description provided for @phoneNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone Number is required'**
  String get phoneNumberRequired;

  /// No description provided for @phoneNumberInvalid.
  ///
  /// In en, this message translates to:
  /// **'Phone Number is invalid'**
  String get phoneNumberInvalid;

  /// No description provided for @userNameRequired.
  ///
  /// In en, this message translates to:
  /// **'User Name is required'**
  String get userNameRequired;

  /// No description provided for @userNameInvalid.
  ///
  /// In en, this message translates to:
  /// **'User Name is invalid'**
  String get userNameInvalid;

  /// No description provided for @firstNameRequired.
  ///
  /// In en, this message translates to:
  /// **'First Name is required'**
  String get firstNameRequired;

  /// No description provided for @firstNameInvalid.
  ///
  /// In en, this message translates to:
  /// **'First Name is invalid'**
  String get firstNameInvalid;

  /// No description provided for @lastNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Last Name is required'**
  String get lastNameRequired;

  /// No description provided for @lastNameInvalid.
  ///
  /// In en, this message translates to:
  /// **'Last Name is invalid'**
  String get lastNameInvalid;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength;

  /// No description provided for @passwordUpperCase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one upper case letter'**
  String get passwordUpperCase;

  /// No description provided for @passwordLowerCase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one lower case letter'**
  String get passwordLowerCase;

  /// No description provided for @passwordNumber.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one number'**
  String get passwordNumber;

  /// No description provided for @passwordSpecialChar.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one special character'**
  String get passwordSpecialChar;

  /// No description provided for @passwordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Password not match'**
  String get passwordNotMatch;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Confirm password is required'**
  String get confirmPasswordRequired;

  /// No description provided for @successMessage.
  ///
  /// In en, this message translates to:
  /// **'Sign up is successful'**
  String get successMessage;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @accountcreatedsuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Account Created Successfully'**
  String get accountcreatedsuccessfully;

  /// No description provided for @creatinganaccountyouagreetoour.
  ///
  /// In en, this message translates to:
  /// **'Creating an account, you agree to our'**
  String get creatinganaccountyouagreetoour;

  /// No description provided for @termsandconditions.
  ///
  /// In en, this message translates to:
  /// **'Terms&Conditions'**
  String get termsandconditions;

  /// No description provided for @connectionFailed.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get connectionFailed;

  /// No description provided for @flowery.
  ///
  /// In en, this message translates to:
  /// **'Flowery'**
  String get flowery;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @deliveryLocation.
  ///
  /// In en, this message translates to:
  /// **'Deliver to 2XVP+XC - Sheikh Zayed '**
  String get deliveryLocation;

  /// No description provided for @empty_data.
  ///
  /// In en, this message translates to:
  /// **'No products to be shown'**
  String get empty_data;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get view_all;

  /// No description provided for @egyptianLivre.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egyptianLivre;

  /// No description provided for @occasion.
  ///
  /// In en, this message translates to:
  /// **'Occasion'**
  String get occasion;

  /// No description provided for @bestSeller.
  ///
  /// In en, this message translates to:
  /// **'Best Seller'**
  String get bestSeller;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'ok'**
  String get ok;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'confirm'**
  String get confirm;

  /// No description provided for @invalidOtp.
  ///
  /// In en, this message translates to:
  /// **'invalid code'**
  String get invalidOtp;

  /// No description provided for @continueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get continueAsGuest;

  /// No description provided for @account_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Account Created Successfully'**
  String get account_created_successfully;

  /// No description provided for @creating_an_account_you_agree_to_our.
  ///
  /// In en, this message translates to:
  /// **'Creating an account, you agree to our'**
  String get creating_an_account_you_agree_to_our;

  /// No description provided for @terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get terms_and_conditions;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'status'**
  String get status;

  /// No description provided for @all_prices_include_tax.
  ///
  /// In en, this message translates to:
  /// **'All prices include tax'**
  String get all_prices_include_tax;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @addtocart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get addtocart;

  /// No description provided for @outofstock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get outofstock;

  /// No description provided for @instock.
  ///
  /// In en, this message translates to:
  /// **'In Stock'**
  String get instock;

  /// No description provided for @bouquetinclude.
  ///
  /// In en, this message translates to:
  /// **'Bouquet include'**
  String get bouquetinclude;

  /// No description provided for @egp.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egp;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'items'**
  String get items;

  /// No description provided for @clearall.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearall;

  /// No description provided for @noitemsincart.
  ///
  /// In en, this message translates to:
  /// **'no items in cart'**
  String get noitemsincart;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @add_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get add_to_cart;

  /// No description provided for @out_of_stock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get out_of_stock;

  /// No description provided for @in_stock.
  ///
  /// In en, this message translates to:
  /// **'In Stock'**
  String get in_stock;

  /// No description provided for @bouquet_include.
  ///
  /// In en, this message translates to:
  /// **'Bouquet include'**
  String get bouquet_include;

  /// No description provided for @my_orders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get my_orders;

  /// No description provided for @saved_addresses.
  ///
  /// In en, this message translates to:
  /// **'Saved Addresses'**
  String get saved_addresses;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @about_us.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get about_us;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @current_password.
  ///
  /// In en, this message translates to:
  /// **'current password'**
  String get current_password;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'new password'**
  String get new_password;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'update'**
  String get update;

  /// No description provided for @password_changed.
  ///
  /// In en, this message translates to:
  /// **'password changed successfully'**
  String get password_changed;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @occasionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Bloom with our exquisite best sellers'**
  String get occasionSubtitle;

  /// No description provided for @wedding.
  ///
  /// In en, this message translates to:
  /// **'Wedding'**
  String get wedding;

  /// No description provided for @graduation.
  ///
  /// In en, this message translates to:
  /// **'Graduation'**
  String get graduation;

  /// No description provided for @birthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthday;

  /// No description provided for @katbKetab.
  ///
  /// In en, this message translates to:
  /// **'Katb Ketab'**
  String get katbKetab;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get addToCart;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get networkError;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again'**
  String get serverError;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @noProductsForOccasion.
  ///
  /// In en, this message translates to:
  /// **'No products available for this occasion'**
  String get noProductsForOccasion;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'change'**
  String get change;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'edit profile'**
  String get edit_profile;

  /// No description provided for @update_profile.
  ///
  /// In en, this message translates to:
  /// **'update profile'**
  String get update_profile;

  /// No description provided for @update_profile_error.
  ///
  /// In en, this message translates to:
  /// **'error in update profile'**
  String get update_profile_error;

  /// No description provided for @uploading_photo.
  ///
  /// In en, this message translates to:
  /// **'uploading photo'**
  String get uploading_photo;

  /// No description provided for @uploading_photo_error.
  ///
  /// In en, this message translates to:
  /// **'error in uploading photo'**
  String get uploading_photo_error;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
