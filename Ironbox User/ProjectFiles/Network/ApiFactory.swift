//
//  ApiFactory.swift
//  KFECinemas
//
//  Created by Naveen Kumar on 06/04/22.
//

import Foundation



class ApiFactory {
    static let instance = ApiFactory()
    
    func getLoginParams(mobileNumber:String,password:String,signInType:String)->[String:String]{
        return [
            "mble_num": mobileNumber,
            "password" : password,
            "sign_in_type" : signInType
          ]
    }
    
    func saveMovieBookings(movieId:String,userId:String,movieName:String,bookingData:String,showTime:String,theatreId:String,screenId:String,zoneinScreen:String,isSnacksOrdered:String,snacksPickup:String,noOfTicketsBooked:String,isFoodOrdered:String,foodPickup:String,seatNo:String,movieAmount:String,snacksOrderedAmt:String,foodOrderedTotalAmt:String,snacksItemId:String,snacksCategoryId:String,snacksQuantity:String,snacksPrice:String,snacksGst:String,totalAmount:String,promocodeId:String,isVipCardUsed:String,vipCardId:String,movieDiscountedAmt:String,noOfTicketsdiscounted:String,perMovieAmt:String,totalAmtDiscounted:String,totalAmtAfterDiscounted:String,snacksDeliveryAtBegInter:String,isSnacksDelivered:String,snacksDeliveryAmt:String)->[String:String]{
        return [
            "movieId": movieId,
            "user_id" : userId,
            "movie_name" : movieName,
            "booking_date": bookingData,
            "show_time" : showTime,
            "theatreId" : theatreId,
            "screenId": screenId,
            "zone_in_screen" : zoneinScreen,
            "is_snacks_ordered" : isSnacksOrdered,
            "snacks_pickup": snacksPickup,
            "no_of_tickets_booked" : noOfTicketsBooked,
            "is_food_ordered" : isFoodOrdered,
            "food_pickup": foodPickup,
            "seat_no" : seatNo,
            "movie_amount" : movieAmount,
            "snacks_ordered_amt": snacksOrderedAmt,
            "food_ordered_total_amt" : foodOrderedTotalAmt,
            "snacks_item_id" : snacksItemId,
            "snacks_categoryId": snacksCategoryId,
            "snacks_quantity" : snacksQuantity,
            "snacks_price" : snacksPrice,
            "snacks_gst" : snacksGst,
            "total_amount" : totalAmount,
            "promocode_id": promocodeId,
            "is_vip_card_used" : isVipCardUsed,
            "vip_card_id" : vipCardId,
            "movie_discounted_amt": movieDiscountedAmt,
            "no_of_tickets_discounted" : noOfTicketsdiscounted,
            "per_movie_amt" : perMovieAmt,
            "total_amt_discounted" : totalAmtDiscounted,
            "total_amt_after_discounted" : totalAmtAfterDiscounted,
            "snacks_delivery_at_beg_inter": snacksDeliveryAtBegInter,
            "is_snacks_delivered" : isSnacksDelivered,
            "snacks_delivery_amt" : snacksDeliveryAmt
          ]
    }
    
    
    func calculateDiscountPromo(promoId:String,orderTotalAmount:String)->[String:String]{
        
        return ["id":promoId,"order_total_amount":orderTotalAmount]
    }
    
    func insertOrderItem(userId:String,itemId:String,categoryId:String,subCategoryId:String,quantity:String,price:String,gst:String,paymentType:String,orderedDuring:String,orderTotalAmount:String,theatreId:String,screenId:String,seatNo:String,zone:String,showTime:String,deliverToSeatOrPickupAtCounter:String,orderDate:String,promocodeId:String,totalAmtDiscounted:String,totalAmtAfterDiscounted:String,isVipCardUsed:String,vipCardId:String)->[String:String]{
        
        return [
            "user_id": userId,
            "item_id" : userId,
            "categoryId" : categoryId,
            "sub_categoryId": subCategoryId,
            "quantity" : quantity,
            "price" : price,
            "gst": gst,
            "payment_type" : paymentType,
            "ordered_during" : orderedDuring,
            "order_total_amount": orderTotalAmount,
            "theatre_id" : theatreId,
            "screen_id" : screenId,
            "seat_no": seatNo,
            "zone" : zone,
            "show_time" : showTime,
            "deliver_to_seat_or_pickup_at_counter": deliverToSeatOrPickupAtCounter,
            "order_date" : orderDate,
            "promocode_id" : promocodeId,
            "total_amt_discounted": totalAmtDiscounted,
            "total_amt_after_discounted" : totalAmtAfterDiscounted,
            "is_vip_card_used" : isVipCardUsed,
            "vip_card_id" : vipCardId
        ]
    }
    
    func changePassword(newPassword:String,oldPassword:String,userId:String)->[String:String]{
        return [
            "new_password": newPassword,
            "old_password" : oldPassword,
            "user_id" : userId]
        
    }
    
    func snacksItemTheatreWise(theatreId:String)->[String:String]{
        return ["theatre_id":theatreId]
    }
    
    func forgotPasswordOtp(mobileNumber:String)->[String:String]{
        return ["mble_num":mobileNumber]
    }
    
    func updatePasswordMobile(mobileNumber:String,newPassword:String,otp:String)->[String:String]{
        return [
            "mble_num": mobileNumber,
            "new_password" : newPassword,
            "OTP" : otp]
    }
}
