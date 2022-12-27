//
//  Constants.swift
//  Ironbox User
//
//  Created by MAC on 08/11/22.
//

import Foundation
import UIKit
import SwiftUI


struct Constants {
    
    static let DeviceId = UIDevice().identifierForVendor?.uuidString ?? UUID().uuidString
    static let OsVersion = UIDevice.current.systemVersion
    static let ModelName = UIDevice.current.modelName
    static let OsName = UIDevice.current.systemName
    static let AppVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    static let BatteryLevel = UIDevice.current.batteryLevel
    static let demoScreenShown = "DemoScreenShown"
    static let environmentKey = "AppEnvironment"
    static let isTestingEnabled = false
    static let testUserNo = "8248350384"
    static let testPassword = "123456"
    static let isProduction = false
  //  static let mapApiKey = "AIzaSyBTCaJvEmhuhQ2Wf0hOfyGEv0H1JEmi0DU"
    
    static let mapApiKey = "AIzaSyDwHUKGXjsCNn-Oepw6L5t6Mn2HS7ucV3M"
    
    //MARK: - ContentKeys
  
    struct OnboardingKeys {
           static let splash1 = "Registration".localized
           static let splash1Description = "Registration your own by providing the basic details to apply UPI QR / Payment Getway".localized
           static let splash2 = "Select Product".localized
           static let splash2Description = "Select the required products (Max of 1 product from each category)".localized
           static let splash3 = "Make Payment".localized
           static let splash3Description = "Make payment and select the AMC/MMC payment type with payment mode for Selected Products".localized
           static let splash4 = "Product Activation".localized
           static let splash4Description = "Generate UPI QR or live API & Salt Keys for payment gateway after completing all the steps in activity board".localized
           static let splash5 = "Upload KYC & Bank Info".localized
           static let splash5Description = "Submit KYC Documents and provide the bank details for the settlement process. This can be approved/ rejected by the admin. status will be notified".localized
           
       }
       
       struct LoginKeys {
           static let header1 = "Let's get started".localized
           static let header2 = "Welcome".localized
           static let header3 = "to BasisPay Merchants".localized
           static let header4 = "Enter your mobile number".localized
           static let mobNumberPlaceholder = "Mobile Number".localized
           static let emailPlaceholder = "Email Address".localized
           static let passPlaceholder = "Password".localized
           static let forgotPassword = "Forgot Password".localized
           static let continueValue  = "Continue".localized
           static let signUp = "Signup"
           static let enterPassword = "Please enter Password"
       }
       
       struct OtpVerificationKeys {
           static let header1 = "OTP Verification".localized
           static let header2 = "Enter 6 digits code".localized
           static let description = "Note: We have sent 6 digits one-time verification code to your registered mobile number.".localized
           static let resendOTP = "Resend OTP".localized
           static let proceed = "Verify to proceed".localized
       }
       
       struct ForgotPasswordKeys {
           static let header1 = "Forgot Password?".localized
           static let header2 = "Enter Mobile Number".localized
           static let description = "Please enter your register mobile number to update password".localized
           static let placeholderText = "Mobile Number".localized
           static let generteOtp = "Generate OTP".localized
       }
       
       struct ForgotPasswordOtpVerificationKeys {
         static let header1 = "Forgot Password OTP Verification".localized
           static let header2 = "Enter 6 digits code".localized
           static let description = "Note: We have sent 6 digits one-time verification code to your registered mobile number.".localized
           static let resendOTP = "Resend OTP".localized
           static let resetPassword = "Reset Password".localized
       }
       
    struct NewPasswordScreenKeys {
        static let header1 = "New Password".localized
        static let header2 = "Enter New password".localized
        static let header3  = "Please update your new password"
        static let description = "Please enter your register mobile number to update password".localized
        static let placeholder1 = "Password".localized
        static let placeholder2 = "Confirm Password".localized
        static let savePassword = "Save Password".localized
        
    }
       
       struct RegistrationKeys {
        static let termsToast = "Please accept the terms and condition.".localized
           static let header1 = "Registration".localized
           static let placeholder1 = "First Name".localized
           static let placeholder2 = "Last Name".localized
           static let header3 = "Business Category".localized
           static let placeholder3 = "Mobile Number".localized
           static let placeholder4 = "Email Address".localized
           static let placeholder5 = "New Password".localized
           static let placeholder6 = "Re-enter Password".localized
           static let agreeTerms = "I agree to the terms and condition".localized
           static let applyButton = "Apply"
       }
    
    struct HomeScreenKeys {
        static let title = "Home"
        static let header1 = "New Arrivals"
        static let header2 = "Offer Corner"
        static let header3 = "Our Features"
        static let header4 = "News Letter"
        static let featuresTab1 = "1000+ Products"
        static let featuresTab2 = "Quick Shipping"
        static let featuresTab3 = "Quick Order Delivery"
        static let featuresTab4 = "Cost effective pricing"
        static let featuresTab5 = "Smart delivery"
        static let featuresTab6 = "Easy returns"
        static let placeholder = "Enter your email address"
        static let footerLabel1 = "Subscribe to our newsletter to get all the latest fashion news and exclusive offers"
        static let footerLabel2 = "Copyrights 2020. Goldentexgroups.com. All rights reserved"
        
        
    }
    
    struct PersonalInfoKeys {
        
        static let header1 = "Registration"
        static let header2 = "Business Details"
        static let placeholder1 = "Full Name"
        static let placeholder2 = "Shop Name"
        static let header3 = "Business Category"
        static let placeholder3 = "Shop number & street name*"
        static let placeholder4 = "Area/Locality/Village*"
        static let placeholder5 = "legal Entity*"
        static let placeholder6 = "Name On CompanyPan*"
        static let placeholder7 = "Company Pan*"
        static let placeholder8 = "Aadhar Number*"
        static let placeholder9 = "Postal Code"
        
    }
       
       struct ProductScreenKeys {
           static let header = "Your account has been verified successfully!".localized
           static let description = "Dear Merchant Your Mobile Number has verified Successfully, Please click select product to proceed next".localized
           static let selectProduct = "Select Product".localized
       }
    
    
       
    struct SettingsScreenKeys {
        static let title1 = "PROFILE".localized
        static  let header1 = "Home"
        static  let header2 = "Apparels"
        static let header3 = "Ornaments"
        static let header4 = "Silk Sarees"
        static let header5 = "Accessories"
        static let header6 = "Toys"
        static let title2 = "My Account"
        static let header7 = "My Profile"
        static let header8 = "Order History"
        static let header9 = "Wishlist"
        static let header10 = "Address Book"
        static let header11 = "Reviews $ Ratings"
        static let title3 = "Help & Support"
        static let header12 = "About Store"
        static let header13 = "Contact us"
        static let header14 = "Settings"
    }
    
   
       
    
    
    struct SidePanelKeys {
        static  let header1 = "Groups"
        static  let header2 = "Add Locations"
        static let header3 = "My Devices"
        static let header4 = "Settings"
        static let header5 = "About Us"
        static let header6 = "InviteMembers"
       
    }
    
    struct SelectProductScreenKeys {
        static let title1 = "QR".localized
        static let header1 = "UPI QR".localized
        static let setupFee = "Setup Fee :".localized
        static let amcFee = "AMC Fee   :".localized
        static let mmcFee = "MMC Fee   :".localized
        static let quantity = "No of stands"
        static let amcHeader = "AMC / MMC".localized
        static let paymentHeader = "Payment Mode".localized
        static let title2 = "Payment Gateway".localized
        static let header2 = "PG Easy".localized
        static let header3 = "PG Economy".localized
        static let submit = "Submit".localized
        static let amcDropDown = ["Monthly".localized,"Quarterly".localized,"Half yearly".localized,"Yearly".localized]
        static let paymentDropDown = ["A/C Transfer".localized,"Enach".localized]
    }
    struct CheckoutKeys {
        static let selectDate = "Please select the Date"
        static let selectScreenName = "Please select screen Name"
        static let selectShowTime = "Please select show Time"
        static let selectSeatArea = "Please select seat area"
        static let seatNo = "Please Enter seat no"
        static let selectTheaterName = "Please Select Theater name"
        static let selectTakeAwayTime = "Please Select Takeaway time"


    }
    struct ErrorNotificationPopupScreenKeys {
        static let header = "Error Notification".localized
        static let description = "You can't select  two products from the same category".localized
        static let button1 = "OK".localized
    }
    
    struct ProductSuccessScreenKeys {
        static let header = "Dear Merchant , Thank you for choosing Basispay".localized
        static let description = "Your Product has been added to your account".localized
        static let button1 = "Pay Now".localized
        static let button2 = "Skip & View Activity Board".localized
    }
    
    struct PGIntegrationKitScreenKeys {
        static let title = "PG Integration Kit".localized
        static let header1 = "Dear Merchant , Thank you for choosing Basispay PG".localized
        static let description1 = "Our team is working on your request to develop the test API & Salt Key. BasisPay will get back to you shortly in this regards If you have any queries please write us to support@basispay.in"
        static let header2 = "Dear Merchant, Greeting Basispay".localized
        static let description2 = "Please found below test API & Salt Key".localized
        static let parameterHeader1 = "Mode".localized
        static let parameterHeader2 = "API KEY".localized
        static let parameterHeader3 = "Salt KEY".localized
        static let disclaimer = "if you have any queries or difficulties in integration of above keys please write us to support@basispay:in".localized
        static let button1 = "Back to Activity Board".localized
        static let button2 = "Upgrade to live".localized
    }
    
    struct PGLiveInfoScreenScreenKeys {
        static let title = "PG Live Info".localized
        static let header1 = "Website Url".localized
        static let header2 = "Terms and condition Url".localized
        static let header3 = "Privacy Policy Url".localized
        static let header4 = "Developer Details".localized
        static let header5 = "About Business".localized
        static let screen2Header1 = "Approved Status:".localized
        static let screen2Header2 = "Remark:".localized
        static let button1 = "Update".localized
        static let button2 = "Resubmit".localized
    }
    
    struct SettlementBankScreenKeys {
        static let title = "Settlement Bank Details"
        static let header = "Bank Info"
        static let placeholder1 = "Account holder name *"
        static let placeholder2 = "Bank Name *"
        static let placeholder3 = "Account Number *"
        static let placeholder4 = "Confirmation Account Number *"
        static let placeholder5 = "IFSC Code *"
        static let placeholder6 = "Branch *"
        static let placeholder7 = "Account Type *"
        static let submit = "Submit"
        static let accountType = ["Savings Account","Current Account"]
    }
    
    struct BankInfoKeys {
        static let title = "Bank Info"
        static let approvedStatus = "Approved Status:"
        static let remarkStatus = "Remark:"
        static let bankDetails = "Bank Details"
        static let accountName = "Account Name"
        static let bankName = "Bank Name"
        static let accountNumber = "Account Number"
        static let ifscCode = "IFSC Code"
        static let branch = "Branch"
        static let addBankButton = "Add New Bank"
    }
    
    struct PaymentScreenKeys {
        static let title = "Payment Information"
        static let header1 = "Products"
        static let header2 = "Basispay Merchant app"
        static let setupFee = "Setup fee"
        static let qty = "QTY"
        static let name = "Name"
        static let amount = "Amount"
        static let total = "Total :"
        static let sgst = "SGST Charges (9%) :"
        static let cgst = "CGST Charges (9%) :"
        static let totalPay = "Total payable amount"
        static let paid = "Total paid amount"
        static let payNow = "Pay Now"
    }
    
    struct PaymentStatusScreenKeys {
        static let header1 = "Order Id"
        static let header2 = "Transaction Id"
        static let header3 = "Transaction Date&Time"
        static let header4 = "Payment Amount"
        static let header5 = "Payment Mode"
        static let header6 = "Payment Status"
    
    }
    
    
    struct DownloadQrScreenKeys {
        static let title = "Download QR"
        static let shopName = "SHOP NAME"
        static let downloadQR = "Download QR"
        static let shareQr = "Share Qr"
        static let note = "#note: Click on Download QR your Business QR image file downloaded for your device picture folder"
    }
    
    struct PersonalInfoEditScreenKeys {
        static let header1 = "Personal info".localized
        static let header2 = "Business Details".localized
        static let placeholder1 = "Full Name".localized
        static let placeholder2 = "Shop Name".localized
        static let header3 = "Business category"
        static let placeholder3 = "Shop number & street name*"
        static let placeholder4 = "Area/Locality/Village*"
        static let placeholder5 = "legal Entity*"
        static let placeholder6 = "Name On CompanyPan*"
        static let placeholder7 = "Company Pan*"
        static let placeholder8 = "Aadhar Number*"
        static let placeholder9 = "Postal Code"
        static let applyButton = "Save Changes"
    }
    
    struct AccountHistoryKeys {
        static let header1 = "Account History"
        static let applyButton = "Add User"
    }
    
    struct AddAccountKeys {
        static let placeholder1 = "Username"
        static let placeholder2 = "Mobile Number"
    }
    
    struct FormatKeys {
        static let amountSymbol = "₹ "
        static let quantity = "/ltr"
        static let quantity1 = "L"
        static let noDecimalPoint = "%0.0f"
        static let decimalPoint1 = "%.1f"
        static let decimalPoint2 = "%.2f"
        static let approximateTime = "Approximate delivery time - ".localized
        static let km = " km"
        static func getAmount(amount:String)->String{
           return amountSymbol + String(format: decimalPoint2, Float(amount)!)
        }
        
        static func getShippingPrice(amount:String)->String{
           return "+ " + amountSymbol + String(format: decimalPoint2, Float(amount)!) + " Shipping"
        }
    }
    
    struct ProfileKeys {
        static let title = "My Profile"
        static let name = "Name"
        static let mobileNumber = "Mobile Number"
        static let email = "Email"
        static let address = "Address"
        static let emergencyNumber = "Emergency Number"
        static let update = "Update"
       
    }
    
    
    //MARK: - ImageKeys
       struct ImageNames {
           
        struct SidePanelImageNames {
            static let image1 = UIImage(named: "sidebar1")!
            static let image2 = UIImage(named: "sidebar2")!
            static let image3 = UIImage(named: "sidebar3")!
            static let image4 = UIImage(named: "sidebar4")!
            static let image5 = UIImage(named: "sidebar5")!
            static let image6 = UIImage(named: "sidebar6")!
        }
        
           struct OnboardingImageNames {
               static let splash1 = "splash1"
               static let splash2 = "splash2"
               static let splash3 = "splash3"
               static let splash4 = "splash4"
               static let splash5 = "splash5"
           }
           struct LoginImageNames {
               static let checkBox = "checkbox"
               static let unCheckBox = "uncheckbox"
           }
          
           struct SettingsImageNames {
                  static let image1 = UIImage(named: "settingsIcon1")!
                  static let image2 = UIImage(named: "settingsIcon2")!
                  static let image3 = UIImage(named: "settingsIcon3")!
                  static let image4 = UIImage(named: "settingsIcon4")!
                  static let image5 = UIImage(named: "settingsIcon5")!
                  static let image6 = UIImage(named: "settingsIcon6")!
                  static let image7 = UIImage(named: "settingsIcon7")!
                  static let image8 = UIImage(named: "settingsIcon8")!
                  static let image9 = UIImage(named: "settingsIcon9")!
                  static let image10 = UIImage(named: "settingsIcon10")!
                  static let image11 = UIImage(named: "settingsIcon11")!
                  static let image12 = UIImage(named: "settingsIcon12")!
                  static let image13 = UIImage(named: "settingsIcon13")!
              }
        
        struct ActivityBoardImageNames {
            static let icon1 = UIImage(named: "ActivityIcon1")!
            static let icon2 = UIImage(named: "ActivityIcon2")!
            static let icon3 = UIImage(named: "ActivityIcon3")!
            static let icon4 = UIImage(named: "ActivityIcon4")!
            static let icon5 = UIImage(named: "ActivityIcon2")!
            static let icon6 = UIImage(named: "ActivityIcon6")!
            static let pending = UIImage(named: "info")!
            static let approved = UIImage(named: "approved")!
            static let rejected = UIImage(named: "rejected")!
        }
        static let blueCalendarIcon = UIImage(named: "blueCalender")!
           static let redCalendarIcon = UIImage(named: "redCalendar")!
           static let profilePicImage = UIImage(named: "ProfilePic")!
           static let userImage  = UIImage(named: "user")!
           static let deleteImage  = UIImage(named: "delete")!
          static let timeIcon  = UIImage(named: "time")!
           static let productImage = UIImage(named: "product")!
           static let otpImage = UIImage(named: "otp")!
           static let lockImage = UIImage(named: "lock")!
           static let SettlementsImage = "settlements.png"
           static let UploadImage = UIImage(named: "upload")!
           static let viewImage = UIImage(named: "view")
            static let flag = UIImage(named: "flag")!
           static let invisibleEye = UIImage(named: "Invisible")!
           static let visibleEye = UIImage(named: "visible")!
           static let backButton = UIImage(named: "back")!
       }
    struct FontName {
        static let Icomoon = "icomoon"
    }
    
    struct Authkeys{
        static let username2 = "admin"
        static let password2 = "TestVijay#2020"
    }
    
    struct BaseURL {
        static let ProductionUrl = "http://efm.basispay.in/"
        static let DevelopmentUrl = "http://192.168.0.104:8080/"
    }
    
    struct DecryptKeys {
        static let BasicAuthKey = "Basic VGVzdGluZzpUZXN0QDk4Nw=="
    }
    
    struct FileName {
        static let LocalStorage = "localStorage.plist"
    }
    
    
    
    struct UserDetailsKeys {
        static let accessToken = "accessToken"
        static let isGPSEnabled = "isGPSEnabled"
        static let mobileNumber = "mobileNumber"
        static let userId = "userId"
        static let userName = "userName"
    }
    
    struct ProfileDetailsKeys {
        static let merchantName = "merchantName"
        static let shopStreetName = "shopStreetName"
        static let shopName = "shopName"
        static let merchantEmailAddress = "merchantEmailAddress"
        static let merchantMobile = "merchantMobile"
        static let cityName = "cityName"
        static let stateName = "stateName"
        static let pinCode = "pinCode"
        static let shopAreaName = "shopAreaName"
        static let stateId = "stateId"
        static let cityId = "cityId"
        static let businessCategoryId = "businessCategoryId"
        static let businessCategory = "businessCategory"
        static let legalEntity = "legalEntity"
        static let companyPan = "companyPan"
        static let nameOnCompanyPan = "nameOnCompanyPan"
        static let aadharNumber = "aadharNumber"
    }
    
    struct ProductDetailsKeys {
        static let productName = "productName"
        static let productId = "id"
        static let mmcFee = "mmcFee"
        static let amcFee = "amcFee"
        static let setupFee = "setupFee"
        static let productCategoryId = "productCategoryId"
        static let paymentRefNo = "paymentRefNo"
        static let quantity = "quantity"
        static let productStandAmount = "productStandAmount"
    }
    
    struct PaymentGatewayKeys {

        static let apiKey = "79e111fb-098d-4730-8c3a-17fe0c30738a"
        static let saltKey = "69ecafcf78912a3f57a00f0e78ea4194efcd7d24"
        static let returnUrl = "http://159.65.148.139/rest/mcpayment/pgdetails"
    }
    
    struct FontSize {
        static let SmallIcon: CGFloat = 18
        static let MediumIcon: CGFloat = 22
        static let NormalIcon: CGFloat = 24
        static let RegularIcon: CGFloat = 28
        static let LargeIcon: CGFloat = 32
        static let VeryLargeIcon: CGFloat = 85
        static let SmallText: CGFloat = 14
        static let VerySmallText: CGFloat = 12
        static let VeryVerySmallText: CGFloat = 10
        static let GraphSmallestText: CGFloat = 8
        static let RegularText: CGFloat = 16
        static let LargeText: CGFloat = 18
        static let LargestText: CGFloat = 20
        static let VeryLargeText: CGFloat = 40
        static let ButtonTitleText: CGFloat = 20
        static let LargeButtonTitleText: CGFloat = 28
        static let BorderWidth : CGFloat = 1
    }
    struct FontNames {
        static let sanFransicoRegular = UIFont(name: "SFRegular" , size: 17)
        static let sanFransicoBold = UIFont(name: "SFBold" , size: 17)
        static let sanFransicoBlack = UIFont(name: "SFBlack" , size: 17)
        static let sanFransicoLight = UIFont(name: "SFThin" , size: 17)
        
        
        static let karlaTitleBold =  UIFont(name: "Karla-Bold", size: 38)
        static let karlaHeaderBold =  UIFont(name: "Karla-Bold", size: 25)
        static let karlaHeader2Bold =  UIFont(name: "Karla-Bold", size: 22)
        static let karlaHeader2BoldSmall =  UIFont(name: "Karla-Bold", size: 19)
        static let karlaHeader3Bold =  UIFont(name: "Karla-Bold", size: 16)
        static let karlaRegular = UIFont(name: "Karla-Regular", size: 16)
        static let karlaRegularHuge = UIFont(name: "Karla-Regular", size: 22)
        static let karlaRegularLarge = UIFont(name: "Karla-Regular", size: 19)
        static let karlaRegularSmall = UIFont(name: "Karla-Regular", size: 14)
        
    }
    
    
    struct CustomColors {
        static let colorAppGrey = Color("AppThemeColor")
        static let colorAppleBackground = Color("AppBackground")
        static let colorAppleLight = Color("AppWhiteCOlor")
        static let colorAppBlue = Color("AppCommonBlueColor")
        static let appBackGroundColor = Color("BackGroundApp")
        static let textBGColor = Color("TextBackGround")
        
        static let colorGradient = UIColor.hexStr(hexStr: "9AC2E9", alpha: 1)
        
        static let gradient1AColor = UIColor(named: "Gradient1AColor")!
        static let gradient1BColor = UIColor(named: "Gradient1BColor")!
        static let gradient2AColor = UIColor(named: "Gradient2AColor")!
        static let gradient2BColor = UIColor(named: "Gradient2BColor")!
        static let gradient3AColor = UIColor(named: "Gradient3AColor")!
        static let gradient3BColor = UIColor(named: "Gradient3BColor")!
        static let gradient4AColor = UIColor(named: "Gradient4AColor")!
        static let gradient4BColor = UIColor(named: "Gradient4BColor")!
        static let gradient5AColor = UIColor(named: "Gradient5AColor")!
        static let gradient5BColor = UIColor(named: "Gradient5BColor")!
        
    
    }
    
    
    
    struct Numerals {
        static let NotificationButtonHeight = 30
        static let NotificationButtonWidth = 45
        static let Spacing = 10
        static let MobileLength = 10
        static let OtpMaxLength = 6
        static let pinCodeLength = 6
        static let MaxTextFieldLength = 60
        static let DescriptionLength = 180
        static let PinCount = 6
        static let businessOwnerName = 30
        static let name = 80
        static let shopNumber = 50
        static let area = 50
        static let panLength = 10
        static let nameOnCompanyLength = 20
        static let aadhaarLength = 12
        static let passwordLength = 15
        static let accountHolderName = 30
        static let accountNumber = 18
        static let confirmAccountNumber = 18
        static let bankname = 30
        static let branchName = 30
        static let ifscCode = 11
        static let websiteUrlLength = 80
    }
    
    struct NetworkStatus {
        static let Online = "Online"
        static let Offline = "Offline"
    }
    
    struct Image {
        static let LoadingImage = "loadingImage.png"
        static let BasispayLogoImage = "logo.png"
        static let TransactionsImage = "transactions.png"
        static let SettlementsImage = "settlements.png"
        static let UploadImage = "upload.png"
    }
    
    struct UserDefaultkeys {
        static let merchantDetails = "merchantDetails"
        static let profileDetails = "profileDetails"
        static let userDetails = "userDetails"
        static let productDetails = "productDetails"
        static let pgRequestStatus = "pgRequestStatus"
        static let productkeyId = "keyId"
        static let stateId = "stateId"
        static let productType = "productType"
        static let qrEnabled = "qrEnabled"
        static let isDashboardEnabled = "isDashboardEnabled"
        static let isChildAccountEnabled = "isChildAccountEnabled"
        static let qrImage = "qrImage"
        static let productStandQuantity = "productStandQuantity"
        static let shippingCharges = "shippingCharges"
        static let pincode = "Pincode"
        static let userId = "userId"

    }
    
   
    
    struct Time {
        static let WebTimeInterval = 30
        static let OtpTimer = 180
    }
    
    struct Labels {
        static let Success = "SUCCESS"
        static let Failure = "FAILURE"
    }
    
    struct AlertTitle {
        static let Info = "Info"
        static let Alert = "Alert"
        static let Success = "Success"
        static let Logout = "Logout"
        static let Options = "Options"
        static let Failure = "Failure"
        static let Cancelled = "Cancelled"
    }
    
    struct AlertButton {
        static let Ok = "Ok"
        static let Yes = "Yes"
        static let No = "No"
        static let Cancel = "Cancel"
        static let Close = "Close"
        static let Confirm = "Confirm"
        static let Verify = "Verify"
        static let Continue = "Continue"
    }
    
    struct HudLabel {
        static let Loading = "Loading"
    }
    
    struct CharacterSet {
        static let Alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        static let AlphabetsWithSpace = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "
        static let MobileCharacters = "0123456789+-()"
        static let Decimals = "0123456789."
        static let Numbers = "0123456789"
    }
    

    struct ModalView{
        static let Month = "Month"
        static let Year = "Year"
    }
    
    struct DateFormat {
        static let ThreeLetterMonthFormat = "MMM"
        static let TwoLetterMonthFormat = "MM"
        static let YearFormat = "yyyy"
        static let LongDateTimeFormat = "yyyy-MM-dd'T'HH:mm:ss"
        static let UTCDateFormat = "yyyy-MM-dd HH:mm:ss.S"
        static let DateFormat = "dd MMMM, yyyy"
        static let normalDateFormat = "dd-MM-yyyy"
        static let TimeFormat = "hh:mm a"
        static let dateFormatReverse = "yyyy-MM-dd"
        static let TimeFormat2 = "HH:mm:ss"
    }
    
    struct WebViewType {
        static let TermsConditionsUrl = "http://167.71.229.193:8080/terms-conditions"
        static let PrivacyPolicy = "http://167.71.229.193:8080/complaint-policy"
        static let FAQ = "http://167.71.229.193:8080/faq-qr"
        static let appStore = "https://apps.apple.com/us/app/id1504454948"
        static let checkVersion = "https://apps.apple.com/in/app/basispay-qr/id"
    }
    
    
    struct StorageKeys {
        static let mobileNumber = "mobileNumber"
    }
    
}


struct NavigationUtil {
    static func popToRootView() {
        findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
            .popToRootViewController(animated: true)
    }

    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }

        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }

        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }

        return nil
    }
}
